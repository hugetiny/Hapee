import axios from 'axios'
import { HOST } from '../../basic/common/js/config'
import { newSong } from '../../basic/common/js/song'
const state = {
  banners: [],
  yunTopList: [],
  playList: [],
  recommendMusic: [],
  recommendList: []
}
const mutations = {
  setBanner (state, payload) {
    state.banners = payload
  },
  setTopList (state, payload) {
    payload.top = payload.tracks.slice(0, 3)
    console.log(payload)
    state.yunTopList.push(payload)
  },
  setPersonalized (state, payload) {
    state.recommendList = []
    payload.data.list.forEach(list => {
      state.recommendList.push({ name: list.album.name, picUrl: list.album.cover })
    })
  },
  setPersonalizedNewsong (state, payload) {
    let list = payload.map((item) => {
      return newSong(item)
    })
    list.splice(9)
    state.recommendMusic = list
  }
}
const actions = {
  async banner ({ commit }) {
    const url = HOST + '/banner'
    const res = await axios.get(url)
    // imageUrl,encodeId,url,targetId
    commit('setBanner', res.data.banners)
  },
  async getTop ({ commit }, id) {
    const url = HOST + `/top/list?idx=${id}`
    const res = await axios.get(url)
    // id,coverImgUrl
    commit('setTopList', res.data.playlist)
  },
  async personalized ({ commit }, page) {
    const url = 'http://localhost:3001/?method=getTopList&params=[2]'
    const res = await axios.get(url)
    console.log(res)
    commit('setPersonalized', res.data)
  },

  async personalizedNewsong  ({ commit }) {
    const url = HOST + '/personalized/newsong'
    const res = await axios.get(url)
    commit('setPersonalizedNewsong', res.data.result)
  },

  async playlistDetail ({ commit }, id) {
    const url = HOST + `/playlist/detail?id=${id}`
    return axios.get(url)
  },
  async getSearchSinger ({ commit }, name) {
    const url = HOST + `/search?keywords=${name}&type=100`
    return axios.get(url)
  },
  async getSearchSongs (store, { name, page }) {
    console.log(name)
    console.log(page)
    // const url = HOST + `/search?keywords=${name}&offset=${page}`
    const url = `api?method=searchSong&params=["${name}",${page}]`
    return axios.get(url)
  },
  async getSearchSuggest ({ commit }, name) {
    const url = HOST + `/search/suggest?keywords=${name}`
    return axios.get(url)
  },
  async getSongDetail ({ commit }, id) {
    const url = HOST + `/song/detail?ids=${id}`
    return axios.get(url)
  },
  async getSearchHot ({ commit }, id) {
    const url = HOST + `/search/hot`
    return axios.get(url)
  },
  async getSingers ({ commit }) {
    const url = HOST + '/top/artists?limit=100'
    return axios.get(url)
  },
  async getSingerDetail ({ commit }, singerId) {
    const url = HOST + `/artists?id=${singerId}`
    return axios.get(url)
  },
  async getSong ({ commit }, id) {
    const url = HOST + `/song/url?id=${id}`

    return axios.get(url)
  },
  async getLyric ({ commit }, id) {
    const url = HOST + `/lyric?id=${id}`

    return axios.get(url)
  }
}
export default {
  // namespaced: false,
  state,
  mutations,
  actions
}
