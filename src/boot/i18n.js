import Vue from 'vue'
import VueI18n from 'vue-i18n'
import messages from 'src/shared/i18n'
import { Platform } from 'quasar'
import store from 'src/store'
import { getLocale } from 'src/shared/i18n/LocaleManager'

Vue.use(VueI18n)
let qlocale = getLocale(navigator.language)

const i18n = new VueI18n({
  locale: qlocale,
  fallbackLocale: 'en',
  messages
})
// get locale form aria2
if (Platform.is.desktop) {
  store.dispatch('preference/fetchPreference')
    .then((config) => {
      console.info('[negibox] fetchPreference===>', config)
      qlocale = store.state.preference.config.locale
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
