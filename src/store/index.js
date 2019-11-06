import Vue from 'vue'
import Vuex from 'vuex'

import modules from './modules'

Vue.use(Vuex)

/*
 * If not building with SSR mode, you can
 * directly export the Store instantiation
 */

// export default function (/* { ssrContext } */) {
//   const Store = new Vuex.Store({
//     modules,
//
//     // enable strict mode (adds overhead!)
//     // for dev mode only
//     strict: process.env.DEV
//   })
//
//   return Store
// }
export default new Vuex.Store({
  modules,
  // enable strict mode (adds overhead!)
  // for dev mode only，use v-model to change vuex state
  strict: process.env.DEV
})
