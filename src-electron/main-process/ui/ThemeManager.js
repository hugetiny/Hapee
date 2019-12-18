import { EventEmitter } from 'events'
import { nativeTheme, systemPreferences } from 'electron'
import os from 'os'

export default class ThemeManager extends EventEmitter {
  constructor (options = {}) {
    super()

    this.init()
  }

  init () {
    this.handleEvents()
  }

  getSystemTheme () {
    // let result = LIGHT_THEME
    // if (os.platform() !== 'darwin') {
    //   return result
    // }
    // 当前OS / Chromium是否正处于dark模式
    // let result = nativeTheme.shouldUseDarkColors ? 'dark' : 'light'
    let result = 'dark'
    return result
  }

  handleEvents () {
    if (os.platform() !== 'darwin') {
      return
    }
    systemPreferences.subscribeNotification(
      'AppleInterfaceThemeChangedNotification',
      () => {
        const theme = this.getSystemTheme()
        this.updateAppAppearance(theme)
        this.emit('system-theme-changed', theme)
      }
    )
  }

  updateAppAppearance (theme) {
    if (os.platform() !== 'darwin' || os.platform() !== 'win32') {
      return
    }
    nativeTheme.themeSource = theme
  }
}
