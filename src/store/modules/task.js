import api from 'src/api'

const state = {
  currentList: 'active',
  taskItemInfoVisible: false,
  currentTaskItem: null,
  taskList: [],
  finishedList: [],
  selectedList: []
}

const getters = {}

const mutations = {
  SINGLE_SELECT (state, index) {
    if (state.selectedList.includes(index) && state.selectedList.length === 1) {
      state.selectedList = []
    } else {
      state.selectedList = [index]
    }
  },
  SHIFT_SELECT (state, index) {
    if (state.selectedList.length !== 0) {
      let min, max
      min = Math.min(Math.min(...state.selectedList), index)
      max = Math.max(Math.min(...state.selectedList), index)

      state.selectedList = []
      for (let i = min; i <= max; i++) {
        state.selectedList.push(i)
      }
    } else {
      state.selectedList = [index]
    }
  },
  CTRL_SELECT (state, index) {
    if (state.selectedList.includes(index)) {
      state.selectedList.splice(state.selectedList.indexOf(index), 1)
    } else {
      state.selectedList.push(index)
    }
    // console.log(state.selectedList)
  },
  META_SELECT (state, index) {
    if (state.selectedList.includes(index)) {
      state.selectedList.splice(state.selectedList.indexOf(index), 1)
    } else {
      state.selectedList.push(index)
    }
    // console.log(state.selectedList)
  },
  UPDATE_TASK_LIST (state, taskList) {
    // console.log(taskList)
    // taskList.forEach(task => { task.selected = false })
    // eslint-disable-next-line standard/array-bracket-even-spacing
    state.taskList = [...new Set([...taskList, ...state.finishedList])]
  },
  CHANGE_CURRENT_LIST (state, currentList) {
    state.currentList = currentList
    state.selectedList = []
  },
  CHANGE_TASK_ITEM_INFO_VISIBLE (state, visible) {
    state.taskItemInfoVisible = visible
  },
  UPDATE_CURRENT_TASK_ITEM (state, task) {
    state.currentTaskItem = task
  }
}

const actions = {
  singleSelect ({ commit }, index) {
    commit('SINGLE_SELECT', index)
  },
  shiftSelect ({ commit }, index) {
    commit('SHIFT_SELECT', index)
  },
  ctrlSelect ({ commit }, index) {
    commit('CTRL_SELECT', index)
  },
  metaSelect ({ commit }, index) {
    commit('META_SELECT', index)
  },
  changeCurrentList ({ commit, dispatch }, currentList) {
    commit('CHANGE_CURRENT_LIST', currentList)
    if (currentList === 'active' || currentList === 'waiting' || currentList === 'stopped') {
      dispatch('fetchList')
    }
  },
  fetchList ({ state, commit }) {
    return api.fetchTaskList({ type: state.currentList })
      .then((data) => {
        // console.log(data)
        commit('UPDATE_TASK_LIST', data)
      })
  },
  fetchItem ({ dispatch }, gid) {
    return api.fetchTaskItem({ gid })
      .then((data) => {
        dispatch('updateCurrentTaskItem', data)
      })
  },
  showTaskItemInfoDialog ({ commit, dispatch }, task) {
    dispatch('updateCurrentTaskItem', task)
    commit('CHANGE_TASK_ITEM_INFO_VISIBLE', true)
  },
  hideTaskItemInfoDialog ({ commit }) {
    commit('CHANGE_TASK_ITEM_INFO_VISIBLE', false)
  },
  updateCurrentTaskItem ({ commit }, task) {
    commit('UPDATE_CURRENT_TASK_ITEM', task)
  },
  addUri ({ dispatch }, data) {
    const { uris, outs, options } = data
    return api.addUri({ uris, outs, options })
      .then(() => {
        dispatch('fetchList')
        dispatch('app/updateAddTaskOptions', {}, { root: true })
      })
  },
  addTorrent ({ dispatch }, data) {
    const { torrent, options } = data
    return api.addTorrent({ torrent, options })
      .then(() => {
        dispatch('fetchList')
        dispatch('app/updateAddTaskOptions', {}, { root: true })
      })
  },
  addMetalink ({ dispatch }, data) {
    const { metalink, options } = data
    return api.addMetalink({ metalink, options })
      .then(() => {
        dispatch('fetchList')
        dispatch('app/updateAddTaskOptions', {}, { root: true })
      })
  },
  getTaskOption (_, gid) {
    return new Promise((resolve) => {
      api.getOption({ gid })
        .then((data) => {
          resolve(data)
        })
    })
  },
  changeTaskOption (_, payload) {
    const { gid, options } = payload
    return api.changeOption({ gid, options })
  },
  removeTask ({ dispatch }, gids) {
    console.log(gids)
    return api.forcePauseTask(gids)
      .catch((e) => {
        console.log(`[negibox] removeTask.forcePauseTask#[${gids}] fail`, e.message)
      })
      .finally(() => {
        return api.removeTask(gids)
          .finally(() => {
            dispatch('fetchList')
            dispatch('saveSession')
          })
      })
  },
  pauseTask ({ dispatch }, gids) {
    return api.pauseTask(gids)
      .catch(() => {
        return api.forcePauseTask(gids)
      })
      .finally(() => {
        dispatch('fetchList')
        dispatch('saveSession')
      })
  },
  resumeTask ({ dispatch }, gids) {
    return api.resumeTask(gids)
      .finally(() => {
        dispatch('fetchList')
        dispatch('saveSession')
      })
  },
  pauseAllTask ({ dispatch }) {
    return api.pauseAllTask()
      .catch(() => {
        return api.forcePauseAllTask()
      })
      .finally(() => {
        dispatch('fetchList')
        dispatch('saveSession')
      })
  },
  resumeAllTask ({ dispatch }) {
    return api.resumeAllTask()
      .finally(() => {
        dispatch('fetchList')
        dispatch('saveSession')
      })
  },
  stopSeeding ({ dispatch }, task) {
    const { gid } = task
    const options = {
      seedTime: 0
    }
    return dispatch('changeTaskOption', { gid, options })
  },
  removeTaskRecord ({ dispatch }, task) {
    const { gid, status } = task
    if (['error', 'complete', 'removed'].indexOf(status) === -1) {
      return
    }
    return api.removeTaskRecord({ gid })
      .finally(() => dispatch('fetchList'))
  },
  saveSession () {
    api.saveSession()
  },
  purgeTaskRecord ({ dispatch }) {
    return api.purgeTaskRecord()
      .finally(() => dispatch('fetchList'))
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
