import api from 'src/api'
import { isEmpty } from 'lodash'

const state = {
  currentList: 'active',
  taskItemInfoVisible: false,
  currentTaskItem: null,
  taskList: [],
  selectedList: [],
  engineMode: 'MAX',
  config: {}
}

const getters = {}

const mutations = {
  UPDATE_LOCAL (state, config = {}) {
    state.config = { ...state.config, ...config }
  },
  UPDATE_TASK_LIST (state, taskList) {
    // console.log(taskList)
    // taskList.forEach(task => { task.selected = false })
    // eslint-disable-next-line standard/array-bracket-even-spacing
    state.taskList = [...new Set([...taskList, ...state.config.finishedList])]
  },
  ADD_FINISHED_TASK (state, task = {}) {
    // console.log(taskList)
    // taskList.forEach(task => { task.selected = false })
    // eslint-disable-next-line standard/array-bracket-even-spacing
    state.config.finishedList = [...state.config.finishedList, task]

    return api.saveToLocal({ finishedList: state.config.finishedList })
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
  async fetchPreference ({ commit }) {
    const config = await api.fetchPreference()
    commit('UPDATE_LOCAL', config)
    return config
  },
  fetchBtTracker ({ state }) {
    const trackerSource = [
      'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt',
      'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt'
    ]
    return api.fetchBtTrackerFromGitHub(trackerSource)
  },
  save ({ commit, dispatch }, config) {
    dispatch('task/saveSession', null, { root: true })
    if (isEmpty(config)) {
      return
    }
    return api.saveToLocal(config)
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
    // console.log(gids)
    // return api.forcePauseTask(gids)
    //   .catch((e) => {
    //     console.log(`[negibox] removeTask.forcePauseTask#[${gids}] fail`, e.message)
    //   })
    //   .finally(() => {
    return api.removeTask(gids)
      .finally(() => {
        dispatch('fetchList')
        dispatch('saveSession')
      })
      // })
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
  removeTaskRecord ({ dispatch }, gids) {
    return api.removeTaskRecord(gids)
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
