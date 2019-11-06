// 我们如果在一个动作中多次去改变 mutation 那么往往会封装一个 action

// state
import { playMode } from 'src/basic/common/js/config'
import { loadSearch, loadPlay, loadFavorite, saveSearch, deleteSearch, clearSearch, savePlay, saveFavorite, deleteFavorite } from 'src/basic/common/js/cache'
// action
import { shuffle } from 'src/basic/common/js/utl'

// getters
import { getSong } from 'src/basic/api/song'

const state = {
  musicList: {},
  singer: {},
  // 播放
  playing: false,
  // 全屏
  fullScreen: false,
  playlist: [],
  // 顺序列表
  sequenceList: [],
  // 播放模式
  mode: playMode.sequence,
  // 当前播放索引
  currentIndex: -1,
  disc: {},
  topList: {},
  searchHistory: loadSearch(),
  playHistory: loadPlay(),
  favoriteList: loadFavorite()
}
const mutations = {
  SET_MUSIC_LIST (state, musicList) {
    state.musicList = musicList
  },
  SET_SINGER (state, singer) {
    state.singer = singer
  },
  SET_PLAYING_STATE (state, flag) {
    state.playing = flag
  },
  SET_FULL_SCREEN (state, flag) {
    state.fullScreen = flag
  },
  SET_PLAYLIST (state, list) {
    state.playlist = list
  },
  SET_SEQUENCE_LIST (state, list) {
    state.sequenceList = list
  },
  SET_PLAY_MODE (state, mode) {
    state.mode = mode
  },
  SET_CURRENT_INDEX (state, index) {
    state.currentIndex = index
  },
  SET_DISC (state, disc) {
    state.disc = disc
  },
  SET_TOP_LIST (state, topList) {
    state.topList = topList
  },
  SET_SEARCH_HISTORY (state, history) {
    state.searchHistory = history
  },
  SET_PLAY_HISTORY (state, history) {
    state.playHistory = history
  },
  SET_FAVORITE_LIST (state, list) {
    state.favoriteList = list
  },
  findSongInList (state, payload) {
    return payload.list.findIndex((item) => {
      return item.id === payload.song.id
    })
  }
}
const actions = {
  selectPlay ({ commit, state }, { list, index }) {
    commit('SET_SEQUENCE_LIST', list)
    // 如果播放模式为随机
    // if (state.mode === playMode.random) {
    //   let randomList = shuffle(list)
    //   commit('SET_PLAYLIST', randomList)
    //   index = commit('findIndex',{
    //     randomList,
    //     list[index]
    //   })
    // } else {
    commit('SET_PLAYLIST', list)
    // }
    commit('SET_CURRENT_INDEX', index)
    commit('SET_FULL_SCREEN', true)
    commit('SET_PLAYING_STATE', true)
  },

  randomPlay ({ commit }, { list }) {
    commit('SET_PLAY_MODE', playMode.random)
    commit('SET_SEQUENCE_LIST', list)
    let randomList = shuffle(list)
    commit('SET_PLAYLIST', randomList)
    commit('SET_CURRENT_INDEX', 0)
    commit('SET_FULL_SCREEN', true)
    commit('SET_PLAYING_STATE', true)
  },

  sequencePlay ({ commit }, { list }) {
    commit('SET_PLAY_MODE', playMode.sequence)
    commit('SET_SEQUENCE_LIST', list)
    commit('SET_PLAYLIST', list)
    commit('SET_CURRENT_INDEX', 0)
    commit('SET_FULL_SCREEN', true)
    commit('SET_PLAYING_STATE', true)
  },

  insertSong ({ commit, state }, song) {
    let playlist = state.playlist.slice()
    let sequenceList = state.sequenceList.slice()
    let currentIndex = state.currentIndex
    // 记录当前歌曲
    let currentSong = playlist[currentIndex]
    // 查找当前列表中是否有带插入的歌曲，并返回银锁
    let fpIndex = commit('findSongInList', { list: playlist, song })
    // 因为是插入歌曲，所以索引+1
    currentIndex++
    // 插入歌曲
    playlist.splice(currentIndex, 0, song)
    // 如果已经包含这首歌
    if (fpIndex > -1) {
      // 如果当前插入的序号大于列列表中的序号
      if (currentIndex > fpIndex) {
        // 删掉
        playlist.splice(fpIndex, 1)
        // 因为删除后数组前移，所以 Index--
        currentIndex--
      } else {
        playlist.splice(fpIndex + 1, 1)
      }
    }

    let currentSIndex = commit('findSongInList', { list: sequenceList, song: currentSong }) + 1
    let fsIndex = commit('findSongInList', { list: sequenceList, song })

    sequenceList.splice(currentSIndex, 0, song)
    if (fsIndex > -1) {
      if (currentSIndex > fsIndex) {
        sequenceList.splice(fpIndex, 1)
      } else {
        sequenceList.splice(fpIndex + 1, 1)
      }
    }
    commit('SET_PLAYLIST', playlist)
    commit('SET_SEQUENCE_LIST', sequenceList)
    commit('SET_CURRENT_INDEX', currentIndex)
    commit('SET_FULL_SCREEN', true)
    commit('SET_PLAYING_STATE', true)
  },

  deleteSong ({ commit, state }, song) {
    let playlist = state.playlist.slice()
    let sequenceList = state.sequenceList.slice()
    let currentIndex = state.currentIndex
    let pIndex = commit('findSongInList', { list: playlist, song })
    playlist.splice(pIndex, 1)
    let sIndex = commit('findSongInList', { list: sequenceList, song })
    sequenceList.splice(sIndex, 1)

    if (currentIndex > pIndex || currentIndex === playlist.length) {
      currentIndex--
    }

    commit('SET_PLAYLIST', playlist)
    commit('SET_SEQUENCE_LIST', sequenceList)
    commit('SET_CURRENT_INDEX', currentIndex)

    const playingState = playlist.length > 0
    // 如果歌曲删除完毕，那么 播放停止
    commit('SET_PLAYING_STATE', playingState)
  },

  saveSearchHistory ({ commit }, query) {
    commit('SET_SEARCH_HISTORY', saveSearch(query))
  },

  deleteSearchHistory ({ commit }, query) {
    commit('SET_SEARCH_HISTORY', deleteSearch(query))
  },

  clearSearchHistory ({ commit }) {
    commit('SET_SEARCH_HISTORY', clearSearch())
  },

  deleteSongList ({ commit }) {
    commit('SET_PLAYLIST', [])
    commit('SET_SEQUENCE_LIST', [])
    commit('SET_CURRENT_INDEX', -1)
    commit('SET_PLAYING_STATE', false)
  },

  savePlayHistory ({ commit }, song) {
    commit('SET_PLAY_HISTORY', savePlay(song))
  },

  saveFavoriteList ({ commit }, song) {
    commit('SET_FAVORITE_LIST', saveFavorite(song))
  },

  deleteFavoriteList ({ commit }, song) {
    commit('SET_FAVORITE_LIST', deleteFavorite(song))
  }
}
const getters = {
  musicList: state => {
    return state.musicList
  },
  singer: state => {
    return state.singer
  },
  playing: state => {
    return state.playing
  },
  fullScreen: state => {
    return state.fullScreen
  },
  playlist: state => {
    return state.playlist
  },
  sequenceList: state => {
    return state.sequenceList
  },
  mode: state => {
    return state.mode
  },
  currentIndex: state => {
    return state.currentIndex
  },
  disc: state => {
    return state.disc
  },
  topList: state => {
    return state.topList
  },
  searchHistory: state => {
    return state.searchHistory
  },
  playHistory: state => {
    return state.playHistory
  },
  favoriteList: state => {
    return state.favoriteList
  },
  currentSong: state => {
    return state.playlist[state.currentIndex] || {}
  },
  currentSongUrl: state => {
    getSong(state.playlist[state.currentIndex]).then((res) => {
      return res.data.data ? res.data.data.url : ''
    })
  }

}

export default {
  // namespaced: false,
  state,
  mutations,
  actions,
  getters
}
