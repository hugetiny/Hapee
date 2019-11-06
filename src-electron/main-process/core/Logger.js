import logger from 'electron-log'

logger.transports.file.level = process.env.PROC ? 'warn' : 'silly'
logger.info('Logger init')
logger.warn('[negibox] Logger init')

export default logger
