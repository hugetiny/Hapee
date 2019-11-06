'use strict'

import { app } from 'electron'
import { existsSync } from 'fs'
import { resolve, join } from 'path'
import forever from 'forever-monitor'
import logger from './Logger'
import { getI18n } from '../ui/Locale'
import {
  getEngineBin,
  getSessionPath,
  transformConfig
} from '../utils/index'

export default class Engine {
  static instance = null

  constructor (options = {}) {
    this.options = options

    this.i18n = getI18n()
    this.systemConfig = options.systemConfig
    this.userConfig = options.userConfig
  }

  getStartSh () {
    const { platform } = process
    let basePath = resolve(app.getAppPath(), '..')

    if (process.env.DEV) {
      basePath = resolve(__dirname, `../extra/${platform}`)
    }

    const binName = getEngineBin(platform)
    if (!binName) {
      throw new Error(this.i18n.t('engine-damaged-message'))
    }

    let binPath = join(basePath, `/engine/${binName}`)
    const binIsExist = existsSync(binPath)
    if (!binIsExist) {
      logger.error('[negibox] engine bin is not exist===>', binPath)
      throw new Error(this.i18n.t('engine-missing-message'))
    }

    let confPath = join(basePath, '/engine/aria2.conf')

    let sessionPath = this.userConfig['session-path'] || getSessionPath()
    const sessionIsExist = existsSync(sessionPath)

    let result = [`${binPath}`, `--conf-path=${confPath}`, `--save-session=${sessionPath}`]
    if (sessionIsExist) {
      result = [...result, `--input-file=${sessionPath}`]
    }

    const extraConfig = transformConfig(this.systemConfig)
    result = [...result, ...extraConfig]

    return result
  }

  start () {
    const sh = this.getStartSh()
    logger.info('[negibox] Engine start sh===>', sh)
    this.instance = forever.start(sh, {
      max: 100,
      parser: function (command, args) {
        return {
          command: command,
          args: args
        }
      },
      silent: !process.env.DEV
    })

    const { child } = this.instance
    logger.info('[negibox] Engine pid===>', child.pid)

    this.instance.on('error', (err) => {
      logger.info(`[negibox] Engine error===> ${err}`)
    })

    this.instance.on('start', function (process, data) {
      logger.info(`[negibox] Engine started===>`)
    })

    this.instance.on('stop', function (process) {
      logger.info(`[negibox] Engine stopped===>`)
    })

    this.instance.on('restart', function (forever) {
      logger.info(`[negibox] Engine exit===>`)
    })

    this.instance.on('exit:code', function (code) {
      logger.info(`[negibox] Engine exit===> ${code}`)
    })

    // this.instance.on('stderr', (data) => {
    //   logger.info(`[negibox] Engine stderr===> ${data}`)
    // })
  }

  isRunning (pid) {
    try {
      return process.kill(pid, 0)
    } catch (e) {
      return e.code === 'EPERM'
    }
  }

  stop () {
    const { pid } = this.instance.child
    try {
      logger.info('[negibox] Engine stopping===>')
      this.instance.stop()
    } catch (err) {
      logger.error('[negibox] Engine stop fail===>', err.message)
      this.forceStop(pid)
    } finally {
    }
  }

  forceStop (pid) {
    try {
      if (pid && this.isRunning(pid)) {
        process.kill(pid)
      }
    } catch (err) {
      logger.warn('[negibox] Engine forceStop fail===>', err)
    }
  }

  restart () {
    this.stop()
    this.start()
  }
}
