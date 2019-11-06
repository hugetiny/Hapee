import resources from '../../../src/shared/i18n'
import { LocaleManager } from '../../../src/shared/i18n/LocaleManager'

const localeManager = new LocaleManager({
  resources
})

// export function getLocaleManager () {
//   return localeManager
// }

export function setupLocaleManager (locale) {
  localeManager.changeLanguageByLocale(locale)
  return localeManager
}

export function getI18n () {
  return localeManager.getI18n()
}

// export function getI18nTranslator () {
//   return localeManager.getI18n().t
// }
