import i18next from 'i18next'
export const availableLanguages = [
  {
    value: 'ca',
    label: 'Català'
  },
  {
    value: 'cs',
    label: 'Česky'
  },
  {
    value: 'de',
    label: 'Deutsch'
  },
  {
    value: 'en',
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
    value: 'fr',
    label: 'Français'
  },
  {
    value: 'id',
    label: 'Indonesia'
  },
  {
    value: 'it',
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
    value: 'pt',
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
  },
  {
    value: 'uk',
    label: 'Українська'
  }
]
export function getLocale (locale = 'en-US') {
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
  if (availableLanguages.some(availableLanguage => availableLanguage.value === locale)) {
    return locale
  }

  if (locale.startsWith('de')) {
    return 'de'
  }

  if (locale.startsWith('en')) {
    return 'en'
  }

  if (locale.startsWith('es')) {
    return 'es'
  }

  // If there is a pt-PT translation in the future,
  // here will fallback to pt-PT.
  if (locale.startsWith('pt')) {
    return 'pt'
  }

  if (locale.startsWith('fr')) {
    return 'fr'
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
    const lng = getLocale(locale)
    return this.changeLanguage(lng)
  }
  getI18n () {
    return i18next
  }
}
