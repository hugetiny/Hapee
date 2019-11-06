import { app } from 'electron'
import os from 'os'
import Store from 'electron-store'
import {
  getDhtPath,
  getLogPath,
  getSessionPath,
  getUserDownloadsPath
} from '../utils/index'
import {
  TRACKERS_ALL_URL,
  TRACKERS_ALL_IP_URL
} from '../../../src/shared/constants'

export default class ConfigManager {
  constructor () {
    this.systemConfig = {}
    this.userConfig = {}

    this.init()
  }

  init () {
    this.initSystemConfig()
    this.initUserConfig()
  }

  /**
   * Some aria2 conf
   * https://aria2.github.io/manual/en/html/aria2c.html
   *
   * Best bt trackers
   * https://github.com/ngosang/trackerslist
   */
  initSystemConfig () {
    this.systemConfig = new Store({
      name: 'system',
      defaults: {
        'all-proxy': '',
        'allow-overwrite': true,
        'auto-file-renaming': true,
        'bt-tracker': [
          'udp://62.138.0.158:6969/announce',
          'udp://93.158.213.92:1337/announce',
          'udp://185.225.17.100:1337/announce',
          'udp://151.80.120.112:2710/announce',
          'udp://151.80.120.114:2710/announce',
          'udp://185.19.107.254:80/announce',
          'udp://208.83.20.20:6969/announce',
          'udp://5.206.27.172:6969/announce',
          'udp://176.31.241.153:80/announce',
          'udp://37.235.174.46:2710/announce',
          'udp://95.211.168.204:2710/announce',
          'udp://159.100.245.181:6969/announce',
          'http://51.68.122.172:80/announce',
          'udp://89.234.156.205:451/announce',
          'udp://184.105.151.164:6969/announce',
          'udp://51.15.40.114:80/announce',
          'http://82.209.230.66:80/announce',
          'udp://185.83.215.123:6969/announce',
          'udp://195.154.52.99:80/announce',
          'http://51.38.230.101:80/announce',
          'udp://tracker.coppersurfer.tk:6969/announce',
          'udp://tracker.opentrackr.org:1337/announce',
          'udp://tracker.internetwarriors.net:1337/announce',
          'udp://9.rarbg.to:2710/announce',
          'udp://9.rarbg.me:2710/announce',
          'udp://tracker.openbittorrent.com:80/announce',
          'udp://exodus.desync.com:6969/announce',
          'udp://tracker.tiny-vps.com:6969/announce',
          'udp://thetracker.org:80/announce',
          'udp://retracker.lanta-net.ru:2710/announce',
          'udp://bt.xxx-tracker.com:2710/announce',
          'udp://tracker.cyberia.is:6969/announce',
          'http://open.acgnxtracker.com:80/announce',
          'udp://tracker.torrent.eu.org:451/announce',
          'udp://explodie.org:6969/announce',
          'udp://ipv4.tracker.harry.lu:80/announce',
          'http://retracker.mgts.by:80/announce',
          'udp://tracker.uw0.xyz:6969/announce',
          'udp://open.stealth.si:80/announce',
          'http://t.nyaatracker.com:80/announce'
        ].join(','),
        'continue': true,
        'dht-file-path': getDhtPath(4),
        'dht-file-path6': getDhtPath(6),
        'dir': getUserDownloadsPath(),
        'max-concurrent-downloads': 5,
        'max-connection-per-server': os.platform() === 'darwin' ? 64 : 16,
        'max-download-limit': 0,
        'max-overall-download-limit': 0,
        'max-overall-upload-limit': '128K',
        'min-split-size': '1M',
        'pause': true,
        'rpc-listen-port': 16800,
        'rpc-secret': '',
        'seed-time': 60,
        'split': 16,
        'user-agent': 'Transmission/2.94'
      }
    })
  }

  initUserConfig () {
    this.userConfig = new Store({
      name: 'user',
      // Schema need electron-store upgrade to 3.x.x,
      // but it will cause the application build to fail.
      // schema: {
      //   theme: {
      //     type: 'string',
      //     enum: ['auto', 'light', 'dark']
      //   }
      // },
      defaults: {
        'all-proxy-backup': '',
        'auto-check-update': os.platform() === 'darwin',
        'hide-app-menu': os.platform() !== 'darwin',
        'last-check-update-time': 0,
        'locale': app.getLocale(),
        'log-path': getLogPath(),
        'new-task-show-downloading': true,
        'open-at-login': false,
        'protocols': { 'magnet': true, 'thunder': false },
        'resume-all-when-app-launched': false,
        'keep-window-state': false,
        'session-path': getSessionPath(),
        'task-notification': true,
        'theme': 'auto',
        'tracker-source': [
          TRACKERS_ALL_IP_URL,
          TRACKERS_ALL_URL
        ],
        'update-channel': 'latest',
        'use-proxy': false,
        'window-state': {}
      }
    })
    this.fixUserConfig()
  }

  fixUserConfig () {
    // Fix the value of open-at-login when the user delete
    // the Motrix self-starting item through startup management.
    const openAtLogin = app.getLoginItemSettings().openAtLogin
    if (this.getUserConfig('open-at-login') !== openAtLogin) {
      this.setUserConfig('open-at-login', openAtLogin)
    }

    if (this.getUserConfig('tracker-source').length === 0) {
      this.setUserConfig('tracker-source', [
        TRACKERS_ALL_IP_URL,
        TRACKERS_ALL_URL
      ])
    }
  }

  getSystemConfig (key, defaultValue) {
    if (typeof key === 'undefined' &&
        typeof defaultValue === 'undefined') {
      return this.systemConfig.store
    }

    return this.systemConfig.get(key, defaultValue)
  }

  getUserConfig (key, defaultValue) {
    if (typeof key === 'undefined' &&
        typeof defaultValue === 'undefined') {
      return this.userConfig.store
    }

    return this.userConfig.get(key, defaultValue)
  }

  getLocale () {
    return this.getUserConfig('locale') || app.getLocale()
  }

  setSystemConfig (...args) {
    this.systemConfig.set(...args)
  }

  setUserConfig (...args) {
    this.userConfig.set(...args)
  }

  reset () {
    this.systemConfig.clear()
    this.userConfig.clear()
  }
}
