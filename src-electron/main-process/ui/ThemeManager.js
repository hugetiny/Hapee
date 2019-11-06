import { EventEmitter } from 'events'
import { systemPreferences } from 'electron'
import os from 'os'
import { LIGHT_THEME, DARK_THEME } from '../../../src/shared/constants'

export default class ThemeManager extends EventEmitter {
  constructor (options = {}) {
    super()

    this.init()
  }

  init () {
    this.handleEvents()
  }

  getSystemTheme () {
    let result = LIGHT_THEME
    if (os.platform() !== 'darwin') {
      return result
    }
    result = systemPreferences.isDarkMode() ? DARK_THEME : LIGHT_THEME
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
    if (os.platform() !== 'darwin' || theme !== LIGHT_THEME || theme !== DARK_THEME) {
      return
    }
    systemPreferences.setAppLevelAppearance(theme)
  }
}
