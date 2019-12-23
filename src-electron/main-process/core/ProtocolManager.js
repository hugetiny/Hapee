import { EventEmitter } from 'events'
import { app } from 'electron'
import logger from './Logger'

export default class ProtocolManager extends EventEmitter {
  constructor (options = {}) {
    super()
    this.options = options

    // package.json:build.protocols[].schemes[]
    // options.protocols: { 'magnet': true, 'thunder': false }
    this.protocols = {
      ...options.protocols
    }

    this.init()
  }

  init () {
    const { protocols } = this
    this.setup(protocols)
  }

  setup (protocols) {
    Object.keys(protocols).forEach((protocol) => {
      const enabled = protocols[protocol]
      if (enabled) {
        if (!app.isDefaultProtocolClient(protocol)) {
          app.setAsDefaultProtocolClient(protocol)
        }
      } else {
        app.removeAsDefaultProtocolClient(protocol)
      }
    })
  }

  handle (url) {
    logger.info(`[negibox] protocol url: ${url}`)

    if (
      url.toLowerCase().startsWith('magnet:') ||
      url.toLowerCase().startsWith('thunder:')
    ) {
      return this.handleMagnetAndThunderProtocol(url)
    }
  }

  handleMagnetAndThunderProtocol (url) {
    if (!url) {
      return
    }

    global.application.sendCommandToAll('application:new-task', 'uri', url)
  }

  handleMoProtocol (url) {
    const parsed = new URL(url)
    const { host } = parsed
    logger.info('[negibox] protocol parsed:', parsed, host)

    const command = {
      'task-list': 'application:task-list',
      'new-task': 'application:new-task',
      'new-bt-task': 'application:new-bt-task',
      'pause-all-task': 'application:pause-all-task',
      'resume-all-task': 'application:resume-all-task',
      'preferences': 'application:preferences',
      'about': 'application:about'
    }[host]
    if (!command) {
      return
    }

    // @TODO 没想明白怎么传参数好
    // 如果按顺序传递，那 url 的 query string 就要求有序的了
    // const query = queryString.parse(parsed.query)
    const args = []
    global.application.sendCommandToAll(command, ...args)
  }
}
