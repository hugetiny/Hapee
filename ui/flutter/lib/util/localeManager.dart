import 'package:flutter/material.dart';

Locale toLocale(String key) {
  final arr = key.split('_');
  return Locale(arr[0], arr[1]);
}

String getLocaleKey(Locale locale) {
  return '${locale.languageCode}_${locale.countryCode}';
}

const Map availableLanguages = {
  'ar': 'عربي',
  'bg': 'Българският език',
  'ca': 'Català',
  'de': 'Deutsch',
  'el': 'Ελληνικά',
  'en': 'English',
  'es': 'Español',
  'fa': 'فارسی',
  'fr': 'Français',
  'hu': 'Hungarian',
  'id': 'Indonesia',
  'it': 'Italiano',
  'ja': '日本語',
  'ko': '한국어',
  'nb': 'Norsk Bokmål',
  'nl': 'Nederlands',
  'pl': 'Polski',
  'pt': 'Português',
  'ro': 'Română',
  'ru': 'Русский',
  'tr': 'Türkçe',
  'uk': 'Українська',
  'vi': 'Tiếng Việt',
  'zh': '简体中文',
  'zhTW': '繁體中文',
};
