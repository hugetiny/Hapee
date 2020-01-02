// get config form aria2
import { Platform } from 'quasar'
import store from 'src/store'
import Vue from 'vue'
import VueI18n from 'vue-i18n'
import messages from 'src/shared/i18n'
import { fixLocale } from 'src/shared/i18n/LocaleManager'

Vue.use(VueI18n)
let locale = fixLocale(navigator.language)

// vue-i18n
const i18n = new VueI18n({
  locale: locale,
  fallbackLocale: 'en-US',
  messages
})

if (Platform.is.desktop) {
  store.dispatch('preference/fetchPreference')
    .then((config) => {
      console.info('[negibox] fetchPreference===>', config)
      i18n.locale = config.locale
    })
    .catch((err) => {
      console.error(err)
    })
}

export default ({ app }) => {
  // Set i18n instance on app
  app.i18n = i18n
}
export { i18n }
