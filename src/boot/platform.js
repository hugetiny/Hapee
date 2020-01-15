// get config form aria2
import { Platform } from 'quasar'
import store from 'src/store'
import Vue from 'vue'
import i18next from 'i18next'
import VueI18Next from '@panter/vue-i18next'
import resources from 'src/shared/i18n'
import { LocaleManager } from 'src/shared/i18n/LocaleManager'

Vue.use(VueI18Next)
const localeManager = new LocaleManager({
  resources
})
export function getLocaleManager () {
  return localeManager
}
const i18n = new VueI18Next(i18next);

if (Platform.is.desktop) {
  store.dispatch('task/fetchPreference')
    .then((config) => {
      console.info('[negibox] fetchPreference===>', config)
      localeManager.changeLanguageByLocale(config.locale)
    })
    .catch((err) => {
      console.error(err)
    })
}
export default ({ app }) => {
  // Set i18n instance on app
  app.i18n = i18n
}
