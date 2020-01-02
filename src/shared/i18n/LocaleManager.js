import i18next from 'i18next'
export const locales = [
  {
    value: 'ca',
    label: 'Català'
  },
  {
    value: 'cs',
    label: 'Česky'
  },
  {
    value: 'de-DE',
    label: 'Deutsch'
  },
  {
    value: 'en-US',
    label: 'English'
  },
  {
    value: 'es',
    label: 'Español'
  },
  {
    value: 'fa',
    label: 'فارسی'
  },
  {
    value: 'fr-FR',
    label: 'Français'
  },
  {
    value: 'id',
    label: 'Indonesia'
  },
  {
    value: 'it-IT',
    label: 'Italia'
  },
  {
    value: 'ja',
    label: '日本語'
  },
  {
    value: 'ko',
    label: '한국어'
  },
  {
    value: 'nl',
    label: 'Nederlands'
  },
  {
    value: 'pl',
    label: 'Polski'
  },
  {
    value: 'pt-BR',
    label: 'Português (Brasil)'
  },
  {
    value: 'ru',
    label: 'Русский'
  },
  {
    value: 'th',
    label: 'ไทย'
  },
  {
    value: 'tr',
    label: 'Türkçe'
  },
  {
    value: 'uk',
    label: 'Українська'
  },
  {
    value: 'zh-CN',
    label: '简体中文'
  },
  {
    value: 'zh-TW',
    label: '繁體中文'
  }
]
// export const locale = require('../../../src/store').state.preference.config.locale || getLocale(navigator.language)
// function getLocaleLabel () {
//   for (let l of locales) {
//     if (l.value === locale) {
//       return l.label
//     }
//   }
// }
// export const localeLabel = getLocaleLabel()

export function fixLocale (locale = 'en-US') {
  /**
   * getLanguage
   * @param { String } locale
   * https://electronjs.org/docs/api/locales
   *
   * Need your help!
   *
   * de, de-AT, de-CH, de-DE
   * en, en-AU, en-CA, en-GB, en-NZ, en-US, en-ZA
   * es, es-419
   * fr, fr-CA, fr-CH, fr-FR
   * it, it-CH, it-IT
   * pt, pt-BR, pt-PT
   * zh, zh-CN, zh-TW
   */
  if (locales.some(availableLanguage => availableLanguage.value === locale)) {
    return locale
  }

  if (locale.startsWith('de')) {
    return 'de-DE'
  }

  if (locale.startsWith('en')) {
    return 'en-US'
  }

  if (locale.startsWith('es')) {
    return 'es'
  }
  if (locale.startsWith('it')) {
    return 'it-IT'
  }
  // If there is a pt-PT translation in the future,
  // here will fallback to pt-PT.
  if (locale.startsWith('pt')) {
    return 'pt-BR'
  }

  if (locale.startsWith('fr')) {
    return 'fr-FR'
  }

  if (locale === 'zh') {
    return 'zh-CN'
  }
}

export class LocaleManager {
  constructor (options = {}) {
    this.options = options

    i18next.init({
      fallbackLng: 'en-US',
      resources: options.resources
    })
  }

  changeLanguage (lng) {
    return i18next.changeLanguage(lng)
  }

  changeLanguageByLocale (locale) {
    const lng = fixLocale(locale)
    return this.changeLanguage(lng)
  }
  getI18n () {
    return i18next
  }
}
