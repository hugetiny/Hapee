// // for when you don't specify quasar.conf.js > framework: 'all'
// import { Quasar } from 'quasar'
// // OTHERWISE:
// // import Quasar from 'quasar'
//
// export default async () => {
//   try {
//     await import(
//       /* webpackInclude: /(de|en-us)\.js$/ */
//       // `quasar/lang/${langIso}`
//       // webpackInclude: /(de|en-us)\.js$/
//       `quasar/lang/zh-hans`
//       // `quasar/lang/de`
//       // `quasar/lang/es`,
//       // `quasar/lang/fa`,
//       // `quasar/lang/fr`,
//       // `quasar/lang/id`,
//       // `quasar/lang/it`,
//       // `quasar/lang/ja`,
//       // `quasar/lang/ko`,
//       // `quasar/lang/nl`,
//       // `quasar/lang/pl`,
//       // `quasar/lang/pt`,
//       // `quasar/lang/ru`,
//       // `quasar/lang/th`,
//       // `quasar/lang/tr`,
//       // `quasar/lang/uk`,
//       // `quasar/lang/zh-CN`,
//       // `quasar/lang/zh-TW`
//     )
//       .then(lang => {
//         Quasar.lang.set(lang.default)
//       })
//   } catch (err) {
//     console.err(err)
//   }
// }
