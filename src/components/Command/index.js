import router from 'src/router'
import store from 'src/store/index'
import CommandManager from './CommandManager'

import { base64StringToBlob } from 'blob-util'
import { buildFileList } from 'src/shared/utils'

const commands = new CommandManager()

function updateSystemTheme (theme) {
  store.dispatch('updateSystemTheme', theme)
}

function updateTheme (theme) {
  store.dispatch('preference/changeThemeConfig', theme)
}

function showAboutPanel () {
  store.dispatch('app/showAboutPanel')
}

function showAddTask (taskType = 'uri', task = '') {
  if (taskType === 'uri' && task) {
    store.dispatch('app/updateAddTaskUrl', task)
  }
  store.dispatch('app/showAddTaskDialog', taskType)
}

function showAddBtTask () {
  store.dispatch('app/showAddTaskDialog', 'torrent')
}

function showAddBtTaskWithFile (fileName, base64Data = '') {
  const blob = base64StringToBlob(base64Data, 'application/x-bittorrent')
  const file = new File([blob], fileName, { type: 'application/x-bittorrent' })
  const fileList = buildFileList(file)
  store.dispatch('app/showAddTaskDialog', 'torrent')
  setTimeout(() => {
    store.dispatch('app/addTaskAddTorrents', { fileList })
  }, 200)
}

function navigateTaskList (status = 'active') {
  router.push({ path: `/task/${status}` })
}

function navigatePreferences () {
  router.push({ path: '/preference' })
}

function showUnderDevelopmentMessage () {
  console.info('under-development!!!')
}

function pauseTask () {
  showUnderDevelopmentMessage()
}

function resumeTask () {
  showUnderDevelopmentMessage()
}

function deleteTask () {
  showUnderDevelopmentMessage()
}

function moveTaskUp () {
  showUnderDevelopmentMessage()
}

function moveTaskDown () {
  showUnderDevelopmentMessage()
}

function pauseAllTask () {
  store.dispatch('task/pauseAllTask')
}

function resumeAllTask () {
  store.dispatch('task/resumeAllTask')
}

commands.register('application:system-theme', updateSystemTheme)
commands.register('application:theme', updateTheme)
commands.register('application:about', showAboutPanel)
commands.register('application:new-task', showAddTask)
commands.register('application:new-bt-task', showAddBtTask)
commands.register('application:new-bt-task-with-file', showAddBtTaskWithFile)
commands.register('application:task-list', navigateTaskList)
commands.register('application:preferences', navigatePreferences)

commands.register('application:pause-task', pauseTask)
commands.register('application:resume-task', resumeTask)
commands.register('application:delete-task', deleteTask)
commands.register('application:move-task-up', moveTaskUp)
commands.register('application:move-task-down', moveTaskDown)
commands.register('application:pause-all-task', pauseAllTask)
commands.register('application:resume-all-task', resumeAllTask)

export {
  commands
}
