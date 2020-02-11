import { app } from 'electron'
import os from 'os'
// import pjson from 'package.json'
import Launcher from './Launcher'
// import registerIPC from './search'
/**
 * Set `__staticss` path to static files in production;
 * The reason we are setting it here is that the path needs to be evaluated at runtime
 */

if (process.env.PROD) {
  global.__statics = require('path').join(__dirname, 'statics').replace(/\\/g, '\\\\')
  // global.__static = require('path').join(__dirname, '/static').replace(/\\/g, '\\\\')
} else {
  // global.__statics = require('path').join(__dirname, '../../src/statics')
  // console.log(global)
  // global.__statics = __statics
  app.commandLine.appendSwitch('remote-debugging-port', '9222')
}

// let mainWindow
//
// function createWindow () {
//   /**
//    * Initial window options
//    */
//   mainWindow = new BrowserWindow({
//     width: 1000,
//     height: 600,
//     useContentSize: true,
//     webPreferences: {
//       nodeIntegration: true
//     }
//   })
//
//   mainWindow.loadURL(process.env.APP_URL)
//
//   mainWindow.on('closed', () => {
//     mainWindow = null
//   })
// }
//
// app.on('ready', createWindow)
//
// app.on('window-all-closed', () => {
//   if (process.platform !== 'darwin') {
//     app.quit()
//   }
// })
//
// app.on('activate', () => {
//   if (mainWindow === null) {
//     createWindow()
//   }
// })

/**
 * Fix Windows notification func
 * appId defined in .electron-vue/webpack.main.config.js
 */
if (os.platform() === 'win32') {
  app.setAppUserModelId('com.negibox.app')
}

global.launcher = new Launcher()
// registerIPC()
// // console.log(global)
