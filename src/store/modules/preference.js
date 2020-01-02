import api from 'src/api'
import { isEmpty } from 'lodash'

const state = {
  engineMode: 'MAX',
  config: {}
}

const mutations = {
  UPDATE_PREFERENCE_LOCAL (state, config) {
    state.config = { ...state.config, ...config }
  }
}

const actions = {
  async fetchPreference ({ commit }) {
    const config = await api.fetchPreference()
    commit('UPDATE_PREFERENCE_LOCAL', config)
    return config
  },
  updateLocal ({ commit }, config) {
    commit('UPDATE_PREFERENCE_LOCAL', { config })
  },
  fetchBtTracker ({ state }) {
    return api.fetchBtTrackerFromGitHub(state.config.trackerSource)
  },
  // save ({ commit, dispatch }, config) {
  //   dispatch('task/saveSession', null, { root: true })
  //   if (isEmpty(config)) {
  //     return
  //   }
  //   return api.savePreference(config)
  // },
  save ({ commit, dispatch }, config) {
    dispatch('task/saveSession', null, { root: true })
    if (isEmpty(config)) {
      return
    }
    return api.savePreference(config)
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
