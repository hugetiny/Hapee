import Vue from 'vue'
import VueI18n from 'vue-i18n'
import messages from 'src/shared/i18n'
import { Platform } from 'quasar'
import store from 'src/store'
import { getLocale } from 'src/shared/i18n/LocaleManager'

Vue.use(VueI18n)
let qlocale = getLocale(navigator.language)

// vue-i18n
const i18n = new VueI18n({
  locale: qlocale,
  fallbackLocale: 'en',
  messages
})
// quasar
// function qlocalefix (locale) {
//   switch (locale) {
//     case 'en':return 'en-us'
//     case 'zh-CN':return 'zh-hans'
//     case 'zh-TW':return 'zh-hant'
//     case 'ko':return 'ko-kr'
//     case 'pt':return 'pt-br'
//     default: return qlocale
//   }
// }
// try {
//   // TODO need require all supported lang?
//   const fixedQlocale = qlocalefix(qlocale)
//   Quasar.lang.set(require(`quasar/lang/${fixedQlocale}`).default)
// } catch (err) {
//   console.error(err)
// }

// get locale form aria2
if (Platform.is.desktop) {
  store.dispatch('preference/fetchPreference')
    .then((config) => {
      console.info('[negibox] fetchPreference===>', config)
      // qlocale = store.state.preference.config.locale
    })
    .catch((err) => {
      console.error(err)
    })
}

export default ({ app }) => {
  // Set i18n instance on app
  app.i18n = i18n
}

export { qlocale, i18n }
