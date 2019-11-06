import { app, dialog } from 'electron'
import logger from './Logger'

const defaults = {
  showDialog: !process.env.DEV
}
export default class ExceptionHandler {
  constructor (options) {
    this.options = {
      ...defaults,
      ...options
    }

    this.setup()
  }

  setup () {
    if (process.env.DEV) {
      return
    }
    const { showDialog } = this.options
    process.on('uncaughtException', (err) => {
      const { message, stack } = err
      logger.error(`[negibox] Uncaught exception: ${message}`)
      logger.error(stack)

      if (showDialog && app.isReady()) {
        dialog.showErrorBox('Error: ', message)
      }
    })
  }
}
