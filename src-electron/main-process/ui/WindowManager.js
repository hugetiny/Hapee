import { join } from 'path'
import { EventEmitter } from 'events'
import { app, shell, screen, BrowserWindow } from 'electron'
import os from 'os'
import logger from '../core/Logger'
import { debounce } from 'lodash'
// import suffix from 'src/shared/suffix'

export default class WindowManager extends EventEmitter {
  constructor (options = {}) {
    console.log('init windowmanager')
    super()
    this.userConfig = options.userConfig || {}

    this.windows = {}

    this.willQuit = false

    app.on('before-quit', () => {
      this.setWillQuit(true)
    })

    app.on('window-all-closed', (event) => {
      event.preventDefault()
    })

    // handle copyToClipboard only app,archive,video will trigger the window
    // TODO Linux not tested
    // if (process.platform === 'win32' || process.platform === 'darwin') {
    //   const clipboard = require('./clipboard')
    //   clipboard.startWatching()
    //   clipboard.on('text-changed', () => {
    //     const watchingSuffixs = [...suffix.video, ...suffix.application, ...suffix.archive]
    //     let readText = clipboard.readText()
    //     const httpLinkMatch = watchingSuffixs.some(function (suffix){
    //       const reg =  RegExp(`^(http|https):\\/\\/.+\\${suffix}(\\?.+)*$`)
    //       return reg.test(readText)
    //     }
    //     const archiveMatch = /^(ftp|sftp|magnet):\/\/.+$/.test(readText)
    //     const chinaLinkMatch = /^\s*(?:thunder|flashget|qqdl|fs2you):\/\/([^'"\s]*)/i.test(readText)
    //     if (archiveMatch || httpLinkMatch || chinaLinkMatch) {
    //       const win = this.getWindow(page)
    //       // if (win === null) {
    //       //   global.application.show('index', {
    //       //     openedAtLogin
    //       //   })
    //       // }
    //       if (win.isMinimized()) {
    //         win.restore()
    //       }
    //       mainWindow.focus()
    //       readText = base64.encodeURI(readText)
    //       mainWindow.loadURL(`file://${__dirname}/negibox/index.html#!/new?clipboard=${readText}`)
    //     }
    //   })
    // }
  }

  setWillQuit (flag) {
    this.willQuit = flag
  }

  getPageOptions (page) {
    // const result = pageConfig[page] || {}
    console.log('getPageOptions')
    const result = {
      index: {
        attrs: {
          title: 'Negibox',
          width: 1024,
          height: 768,
          minWidth: 840,
          minHeight: 420,
          // backgroundColor: '#FFFFFF',
          // transparent: os.platform() !== 'win32',
          autoHideMenuBar: true
        },
        bindCloseToHide: true,
        url: process.env.DEV ? `http://localhost:8080` : `file://${__dirname}/index.html`
      }
    }[page] || {}
    // const hideAppMenu = this.userConfig['hide-app-menu']
    // if (hideAppMenu) {
    //   result.attrs.frame = false
    // }

    // Optimized for small screen users
    const { width, height } = screen.getPrimaryDisplay().workAreaSize
    const widthScale = width >= 1280 ? 1 : 0.875
    const heightScale = height >= 800 ? 1 : 0.875
    result.attrs.width *= widthScale
    result.attrs.height *= heightScale

    // fix AppImage Dock Icon Missing
    // https://github.com/AppImage/AppImageKit/wiki/Bundling-Electron-apps
    if (os.platform() !== 'win32' && os.platform() !== 'darwin') {
      result.attrs.icon = join(__statics, './512x512.png')
    }

    return result
  }

  getPageBounds (page) {
    const enabled = this.userConfig['keep-window-state']
    const windowStateMap = this.userConfig['window-state'] || {}
    let result = null
    if (enabled) {
      result = windowStateMap[page]
    }

    return result
  }

  openWindow (page, options = {}) {
    console.log('open')
    const pageOptions = this.getPageOptions(page)
    // const { hidden } = options

    let window = this.windows[page] || null
    if (window) {
      window.show()
      window.focus()
      return window
    }

    window = new BrowserWindow({
      ...{
        // titleBarStyle: 'hiddenInset',
        show: true,
        width: 1024,
        height: 768,
        webPreferences: {
          // Macos bounce
          scrollBounce: true,
          nodeIntegration: true
        }
      },
      ...pageOptions.attrs
    })

    const bounds = this.getPageBounds(page)
    console.log('bounds ====>', bounds)
    if (bounds) {
      window.setBounds(bounds)
    }

    window.webContents.on('new-window', (e, url) => {
      e.preventDefault()
      shell.openExternal(url)
    })

    if (pageOptions.url) {
      window.loadURL(pageOptions.url)
    }

    window.once('ready-to-show', () => {
      // if (!hidden) {
      window.show()
      // }
    })

    this.handleWindowState(page, window)

    this.handleWindowClose(pageOptions, page, window)

    this.bindAfterClosed(page, window)

    this.addWindow(page, window)
    return window
  }

  getWindow (page) {
    console.log(this.windows)
    return this.windows[page]
  }

  // getWindows () {
  //   return this.windows || {}
  // }
  //
  // getWindowList () {
  //   return Object.values(this.getWindows())
  // }

  addWindow (page, window) {
    this.windows[page] = window
  }

  destroyWindow (page) {
    const win = this.getWindow(page)
    this.removeWindow(page)
    win.removeListener('closed')
    win.removeListener('move')
    win.removeListener('resize')
    win.destroy()
  }

  removeWindow (page) {
    this.windows[page] = null
  }

  bindAfterClosed (page, window) {
    window.on('closed', (event) => {
      this.removeWindow(page)
    })
  }

  handleWindowState (page, window) {
    window.on('resize', debounce(() => {
      const bounds = window.getBounds()
      this.emit('window-resized', { page, bounds })
    }, 500))

    window.on('move', debounce(() => {
      const bounds = window.getBounds()
      this.emit('window-moved', { page, bounds })
    }, 500))
  }

  handleWindowClose (pageOptions, page, window) {
    window.on('close', (event) => {
      if (pageOptions.bindCloseToHide && !this.willQuit) {
        event.preventDefault()
        window.hide()
      }
      const bounds = window.getBounds()
      this.emit('window-closed', { page, bounds })
    })
  }

  showWindow (page) {
    const window = this.getWindow(page)
    if (!window) {
      return
    }
    window.show()
  }

  hideWindow (page) {
    const window = this.getWindow(page)
    if (!window) {
      return
    }
    window.hide()
  }

  // hideAllWindow () {
  //   this.getWindowList().forEach((window) => {
  //     window.hide()
  //   })
  // }

  toggleWindow (page) {
    const window = this.getWindow(page)
    if (!window) {
      return
    }
    if (window.isVisible()) {
      window.hide()
    } else {
      window.show()
    }
  }

  getFocusedWindow () {
    return BrowserWindow.getFocusedWindow()
  }

  sendCommandTo (window, command, ...args) {
    if (!window) {
      return
    }
    logger.info('[negibox] sendCommandTo===>', command, ...args)
    window.webContents.send('command', command, ...args)
  }

  sendMessageTo (window, channel, ...args) {
    if (!window) {
      return
    }
    window.webContents.send(channel, ...args)
  }
  // FROM NEGIBOX
  setProgressBar (args) {
    window.setProgressBar(1)
  }
}
