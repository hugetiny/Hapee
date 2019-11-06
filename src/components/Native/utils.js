import {
  isMagnetTask,
  getTaskFullPath,
  bytesToSize
} from 'src/shared/utils'
import { LIGHT_THEME, DARK_THEME } from 'src/shared/constants'
import { Platform } from 'quasar'

const remote = Platform.is.desktop ? require('electron').remote : {}

export function prettifyDir (dir) {
  const downloads = remote.app.getPath('downloads')
  const result = dir === downloads ? 'Downloads' : dir
  return result
}

export function showItemInFolder (fullPath, { errorMsg }) {
  if (!fullPath) {
    return
  }
  const result = remote.shell.showItemInFolder(fullPath)
  if (!result && errorMsg) {
    console.error(errorMsg)
  }
  return result
}

export function openItem (fullPath, { errorMsg }) {
  if (!fullPath) {
    return
  }
  const result = remote.shell.openItem(fullPath)
  if (!result && errorMsg) {
    console.error(errorMsg)
  }
  return result
}

export function moveTaskFilesToTrash (task, messages = {}) {
  /**
   * 磁力链接任务，有 bittorrent，但没有 bittorrent.info ，
   * 在没下完变成BT任务之前 path 不是一个完整路径，
   * 未避免误删所在目录，所以删除时直接返回 true
   */
  if (isMagnetTask(task)) {
    return true
  }

  const { pathErrorMsg, delFailMsg, delConfigFailMsg } = messages
  const { dir } = task
  const path = getTaskFullPath(task)
  if (!path || dir === path) {
    if (pathErrorMsg) {
      console.error(pathErrorMsg)
    }
    return false
  }

  let deleteResult1 = true
  // const isFileExist = existsSync(path)
  // if (isFileExist) {
  deleteResult1 = remote.shell.moveItemToTrash(path)
  if (!deleteResult1 && delFailMsg) {
    console.error(delFailMsg)
    // }
  }

  let deleteResult2 = true
  const extraFilePath = `${path}.aria2`
  // const isExtraExist = existsSync(extraFilePath)
  // if (isExtraExist) {
  deleteResult2 = remote.shell.moveItemToTrash(extraFilePath)
  if (!deleteResult2 && delConfigFailMsg) {
    console.error(delConfigFailMsg)
    // }
  }

  return deleteResult1 && deleteResult2
}

export function openDownloadDock (path) {
  if (!Platform.is.mac) {
    return
  }
  remote.app.dock.downloadFinished(path)
}

export function updateDockBadge (text) {
  if (!Platform.is.mac) {
    return
  }
  remote.app.dock.setBadge(text)
}

export function showDownloadSpeedInDock (downloadSpeed) {
  if (!Platform.is.mac) {
    return
  }
  const text = downloadSpeed > 0 ? `${bytesToSize(downloadSpeed)}/s` : ''
  updateDockBadge(text)
}

export function addToRecentTask (task) {
  if (Platform.is.linux) {
    return
  }
  const path = getTaskFullPath(task)
  remote.app.addRecentDocument(path)
}

export function addToRecentTaskByPath (path) {
  if (Platform.is.linux) {
    return
  }
  remote.app.addRecentDocument(path)
}

export function clearRecentTasks () {
  if (Platform.is.linux) {
    return
  }
  remote.app.clearRecentDocuments()
}

export function getSystemTheme () {
  let result = LIGHT_THEME
  if (!Platform.is.mac) {
    return result
  }
  result = remote.systemPreferences.isDarkMode() ? DARK_THEME : LIGHT_THEME
  return result
}
