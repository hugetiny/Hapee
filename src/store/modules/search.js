import axios from 'axios'

const state = {
  keywords: '',
  loading: false
}
const mutations = {
  addSearchResults (state, payload) {
    state.userDetails = payload
  }
}
const actions = {
  search (store, keyword) {
    console.log(keyword)
    axios({
      method: 'get',
      url: '/src/api/search',
      params: {
        source: '%E7%A7%8D%E5%AD%90%E6%90%9C&',
        keyword: keyword,
        page: 1,
        sort: 'hot'
      }
    }).then((response) => {
      console.log(response.data)
    }).catch((err) => {
      console.error(err)
    })
  }
}
const getters = {
  keywords: state => {
    return state.keywords
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
}
