import { remote } from 'electron'
import { isEmpty } from 'lodash'
import Aria2 from 'aria2'
import { Platform } from 'quasar'
import {
  separateConfig,
  compactUndefined,
  formatOptionsForEngine,
  mergeTaskResult,
  changeKeysToCamelCase,
  changeKeysToKebabCase
} from 'src/shared/utils'

let application
if (Platform.is.desktop) {
  application = remote.getGlobal('application')
}

export default class Api {
  constructor (options = {}) {
    this.options = options

    this.client = null
    this.loadStorage()
    const {
      rpcListenPort: port,
      rpcSecret: secret
    } = this.config
    const host = '127.0.0.1'
    this.client = new Aria2({
      host,
      port,
      secret
    })
    this.client.open()
  }

  loadConfigFromLocalStorage () {
    // TODO
    const result = {}
    return result
  }

  loadConfigFromNativeStore () {
    const systemConfig = application.configManager.getSystemConfig()
    const userConfig = application.configManager.getUserConfig()

    const result = { ...systemConfig, ...userConfig }
    return result
  }

  loadStorage () {
    let result = Platform.is.desktop
      ? this.loadConfigFromNativeStore()
      : this.loadConfigFromLocalStorage()

    result = changeKeysToCamelCase(result)
    this.config = result
  }

  closeClient () {
    this.client.close()
      .then(() => {
        this.client = null
      })
      .catch(err => {
        console.log('engine client close fail', err)
      })
  }

  fetchPreference () {
    return new Promise((resolve) => {
      this.loadStorage()
      resolve(this.config)
    })
  }

  saveToLocal (params = {}) {
    const kebabParams = changeKeysToKebabCase(params)
    if (Platform.is.desktop) {
      return this.savePreferenceToNativeStore(kebabParams)
    }
    return this.savePreferenceToLocalStorage(kebabParams)
  }

  savePreferenceToLocalStorage () {
    // TODO
  }

  savePreferenceToNativeStore (params = {}) {
    const { user, system, others } = separateConfig(params)
    if (!isEmpty(system)) {
      console.info('[negibox] save system config: ', system)
      application.configManager.setSystemConfig(system)
      this.changeGlobalOption(system)
    }

    if (!isEmpty(user)) {
      console.info('[negibox] save user config: ', user)
      application.configManager.setUserConfig(user)
    }

    if (!isEmpty(others)) {
      console.info('[negibox] save config found iillegal key: ', others)
    }
  }

  getVersion () {
    return this.client.call('getVersion')
  }

  changeGlobalOption (options) {
    const args = formatOptionsForEngine(options)

    return this.client.call('changeGlobalOption', args)
  }

  getGlobalOption () {
    return new Promise((resolve) => {
      this.client.call('getGlobalOption')
        .then((data) => {
          resolve(changeKeysToCamelCase(data))
        })
    })
  }

  getOption (params = {}) {
    const { gid } = params
    const args = compactUndefined([gid])

    return new Promise((resolve) => {
      this.client.call('getOption', ...args)
        .then((data) => {
          resolve(changeKeysToCamelCase(data))
        })
    })
  }

  changeOption (params = {}) {
    let { gid, options = {} } = params
    options = formatOptionsForEngine(options)

    const kebabOptions = changeKeysToKebabCase(options)
    const args = compactUndefined([gid, kebabOptions])

    return this.client.call('changeOption', ...args)
  }

  getGlobalStat () {
    return this.client.call('getGlobalStat')
  }

  addUri (params) {
    const {
      uris,
      outs,
      options
    } = params
    const tasks = uris.map((uri, index) => {
      const kebabOptions = changeKeysToKebabCase(options)
      if (outs && outs[index]) {
        kebabOptions['out'] = outs[index]
      }
      const args = compactUndefined([[uri], kebabOptions])
      return [ 'aria2.addUri', ...args ]
    })
    return this.client.multicall(tasks)
  }

  addTorrent (params) {
    const {
      torrent,
      options
    } = params
    const kebabOptions = changeKeysToKebabCase(options)
    const args = compactUndefined([torrent, [], kebabOptions])
    return this.client.call('addTorrent', ...args)
  }

  addMetalink (params) {
    const {
      metalink,
      options
    } = params
    const kebabOptions = changeKeysToKebabCase(options)
    const args = compactUndefined([metalink, kebabOptions])
    return this.client.call('addMetalink', ...args)
  }

  fetchDownloadingTaskList (params = {}) {
    // console.log(params)
    const { offset = 0, num = 20, keys } = params
    const activeArgs = compactUndefined([keys])
    const waitingArgs = compactUndefined([offset, num, keys])
    return new Promise((resolve, reject) => {
      this.client.multicall([
        [ 'aria2.tellActive', ...activeArgs ],
        [ 'aria2.tellWaiting', ...waitingArgs ]
      ]).then((data) => {
        // console.log('fetchDownloadingTaskList data', data)
        const result = mergeTaskResult(data)
        resolve(result)
      }).catch((err) => {
        console.log('fetchDownloadingTaskList fail===>', err)
        reject(err)
      })
    })
  }

  fetchWaitingTaskList (params = {}) {
    const { offset = 0, num = 20, keys } = params
    const args = compactUndefined([offset, num, keys])
    return this.client.call('tellWaiting', ...args)
  }

  fetchStoppedTaskList (params = {}) {
    const { offset = 0, num = 20, keys } = params
    const args = compactUndefined([offset, num, keys])
    return this.client.call('tellStopped', ...args)
  }
  fetchAllTaskList (params = {}) {
    const { offset = 0, num = 20, keys } = params
    const args = compactUndefined([offset, num, keys])
    return this.client.call('tellStopped', ...args)
  }

  fetchTaskList (params = {}) {
    const { type } = params
    switch (type) {
      case 'active':
        return this.fetchDownloadingTaskList(params)
      case 'waiting':
        return this.fetchWaitingTaskList(params)
      case 'stopped':
        return this.fetchStoppedTaskList(params)
      default:
        return this.fetchDownloadingTaskList(params)
    }
  }

  fetchTaskItem (params = {}) {
    const { gid, keys } = params
    const args = compactUndefined([gid, keys])
    return this.client.call('tellStatus', ...args)
  }

  pauseTask (gids = []) {
    let multicall = []
    gids.forEach((gid) => {
      multicall.push(['pause', gid])
    })
    return this.client.multicall(multicall)
  }

  pauseAllTask () {
    return this.client.call('pauseAll')
  }

  forcePauseTask (gids) {
    let multicall = []
    gids.forEach((gid) => {
      multicall.push(['forcePause', gid])
    })
    return this.client.multicall(multicall)
  }

  forcePauseAllTask () {
    return this.client.call('forcePauseAll')
  }

  resumeTask (gids = []) {
    const args = compactUndefined(gids)
    return this.client.call('unpause', ...args)
  }

  resumeAllTask () {
    return this.client.call('unpauseAll')
  }

  removeTask (gids = []) {
    let multicall = []
    compactUndefined(gids).forEach((gid) => {
      multicall.push(['remove', gid])
    })
    return this.client.multicall(multicall)
  }

  // forceRemoveTask (gids = []) {
  //   const args = compactUndefined(gids)
  //   return this.client.call('forceRemove', ...args)
  // }

  saveSession () {
    return this.client.call('saveSession')
  }

  purgeTaskRecord () {
    return this.client.call('purgeDownloadResult')
  }

  removeTaskRecord (gids = []) {
    let multicall = []
    gids.forEach((gid) => {
      multicall.push(['removeDownloadResult', gid])
    })
    return this.client.multicall(multicall)
  }

  startPowerSaveBlocker () {
    application.energyManager.startPowerSaveBlocker()
  }

  stopPowerSaveBlocker () {
    application.energyManager.stopPowerSaveBlocker()
  }

  async fetchBtTrackerFromGitHub (source) {
    if (isEmpty(source)) {
      return ''
    }

    const now = Date.now()
    const promises = source.map((url) => {
      return fetch(`${url}?t=${now}`).then((res) => res.text())
    })

    const values = await Promise.all(promises)
    let result = values.join('\r\n').replace(/^\s*[\r\n]/gm, '')
    return result
  }
}
