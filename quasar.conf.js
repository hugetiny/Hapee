// Configuration for your app
// https://quasar.dev/quasar-cli/quasar-conf-js
const path = require('path')
module.exports = function (ctx) {
  return {
    // app boot file (/src/boot)
    // --> boot files are part of "main.js"
    // https://quasar.dev/quasar-cli/cli-documentation/boot-files
    boot: [
      'i18n',
      'axios',
      'platform'
      // 'firebase',
      // 'quasar-lang-pack'
    ],

    // https://quasar.dev/quasar-cli/quasar-conf-js#Property%3A-css
    css: [
      'app.sass'
    ],

    // https://github.com/quasarframework/quasar/tree/dev/extras
    extras: [
      // 'ionicons-v4',
      // 'mdi-v4',
      // 'fontawesome-v5',
      // 'eva-icons',
      // 'themify',
      // 'roboto-font-latin-ext', // this or either 'roboto-font', NEVER both!

      // 'roboto-font', // optional, you are not bound to it
      'material-icons' // optional, you are not bound to it
    ],

    // https://quasar.dev/quasar-cli/quasar-conf-js#Property%3A-framework
    framework: {
      // iconSet: 'ionicons-v4', // Quasar icon set
      // lang: 'de', // Quasar language pack

      // Possible values for "all":
      // * 'auto' - Auto-import needed Quasar components & directives
      //            (slightly higher compile time; next to minimum bundle size; most convenient)
      // * false  - Manually specify what to import
      //            (fastest compile time; minimum bundle size; most tedious)
      // * true   - Import everything from Quasar
      //            (not treeshaking Quasar; biggest bundle size; convenient)
      all: 'auto',

      components: [],
      directives: [],

      // Quasar plugins
      plugins: [
        'LocalStorage',
        'Dialog'
      ]
    },

    // https://quasar.dev/quasar-cli/cli-documentation/supporting-ie
    // need WEBRTC
    supportIE: false,

    // https://quasar.dev/quasar-cli/quasar-conf-js#Property%3A-build
    build: {
      rtl: true,
      scopeHoisting: true,
      // vueRouterMode: 'history',
      // showProgress: false,
      // gzip: true,
      // analyze: true,
      // preloadChunks: false,
      // extractCSS: false,

      // https://quasar.dev/quasar-cli/cli-documentation/handling-webpack
      extendWebpack (cfg) {
        // cfg.module.rules.push({
        //   enforce: 'pre',
        //   test: /\.(js|vue)$/,
        //   loader: 'eslint-loader',
        //   exclude: /node_modules/,
        //   options: {
        //     formatter: require('eslint').CLIEngine.getFormatter('stylish')
        //   }
        // })
      }
      //   cfg.resolve.alias = {
      //     ...cfg.resolve.alias, // This adds the existing alias
      //
      //     // Add your own alias like this
      //     'src': path.resolve(__dirname, './src')
      //   }
      // }
    },

    // https://quasar.dev/quasar-cli/quasar-conf-js#Property%3A-devServer
    devServer: {
      https: ctx.mode.pwa === true,
      port: 8080,
      open: true // opens browser window automatically
      // proxy: {
      //   '/ngosang': {
      //     target: ['https://github.com'],
      //     secure: false,
      //     changeOrigin: true
      //   }
      // }
      // proxy: {
      //   // proxy all requests starting with /api to jsonplaceholder
      //   '/api': {
      //     target: 'http://some.api.target.com:7070',
      //     changeOrigin: true,
      //     pathRewrite: {
      //       '^/api': ''
      //     }
      //   }
      // }
    },

    // animations: 'all', // --- includes all animations
    // https://quasar.dev/options/animations
    animations: [],

    // https://quasar.dev/quasar-cli/developing-ssr/configuring-ssr
    ssr: {
      pwa: false
    },

    // https://quasar.dev/quasar-cli/developing-pwa/configuring-pwa
    pwa: {
      // workboxPluginMode: 'InjectManifest',
      // workboxOptions: {}, // only for NON InjectManifest
      manifest: {
        name: 'negibox',
        short_name: 'negibox',
        description: 'cross-platform downloader',
        display: 'standalone',
        orientation: 'portrait',
        background_color: '#ffffff',
        theme_color: '#027be3',
        icons: [
          {
            'src': 'statics/icons/icon-128x128.png',
            'sizes': '128x128',
            'type': 'image/png'
          },
          {
            'src': 'statics/icons/icon-192x192.png',
            'sizes': '192x192',
            'type': 'image/png'
          },
          {
            'src': 'statics/icons/icon-256x256.png',
            'sizes': '256x256',
            'type': 'image/png'
          },
          {
            'src': 'statics/icons/icon-384x384.png',
            'sizes': '384x384',
            'type': 'image/png'
          },
          {
            'src': 'statics/icons/icon-512x512.png',
            'sizes': '512x512',
            'type': 'image/png'
          }
        ]
      }
    },

    // https://quasar.dev/quasar-cli/developing-cordova-apps/configuring-cordova
    cordova: {
      // id: 'com.downloadbox',
      // noIosLegacyBuildFlag: true, // uncomment only if you know what you are doing
    },

    // https://quasar.dev/quasar-cli/developing-electron-apps/configuring-electron
    electron: {
      bundler: 'builder',
      builder: {
        'productName': 'Negibox',
        'appId': 'com.wefrees.Negibox',
        'fileAssociations': [
          {
            'ext': 'torrent',
            'mimeType': 'application/x-bittorrent',
            'name': 'Torrent',
            // macOS-only
            'role': 'Viewer'
          }
        ],
        // 'asar': false,
        // 'directories': {
        //   'output': 'release'
        // },
        // 'files': [
        //   // './dist/electron/**/*'
        //   './src-electron/main-process/electron-main.js'
        // ],
        'protocols': [
          {
            'name': 'Magnet Protocol',
            'schemes': [
              'magnet'
            ]
          },
          {
            'name': 'Thunder Protocol',
            'schemes': [
              'thunder'
            ]
          }
        ],
        'mac': {
          'target': [
            'dmg'
          ],
          'type': 'distribution',
          'darkModeSupport': true,
          'extraResources': {
            'from': './src-electron/main-process/extra/darwin',
            'to': './',
            'filter': [
              '**/*'
            ]
          },
          'binaries': [
            './release/mac/Negibox.app/Contents/Resources/engine/aria2c'
          ],
          'category': 'public.app-category.utilities'
        },
        'win': {
          'target': [
            {
              'target': 'nsis',
              'arch': [
                'x64',
                'ia32'
              ]
            }
          ],
          'extraResources': {
            'from': './src-electron/main-process/extra/win32',
            'to': './',
            'filter': [
              '**/*'
            ]
          }
        },
        'nsis': {
          'oneClick': false,
          'allowToChangeInstallationDirectory': true
        },
        'linux': {
          'category': 'Network',
          'target': [
            'AppImage'
          ],
          'extraResources': {
            'from': './src-electron/main-process/extra/linux',
            'to': './',
            'filter': [
              '**/*'
            ]
          }
        },
        'appImage': {
          'desktop': {
            'Name': 'Negibox',
            'Encoding': 'UTF-8',
            'Icon': 'build/icon_256x256.png',
            'Comment': 'The only downloader you need',
            'Terminal': 'false',
            'Categories': 'Utility'
          }
        },
        'publish': [
          {
            'provider': 'github',
            'owner': 'hugetiny',
            'repo': 'negibox'
          }
        ]
      },

      // unPackagedInstallParams: [],

      // Requires: @quasar/app v1.3.0+
      // Keep in sync with /src-electron/main-process/electron-main
      // > BrowserWindow > webPreferences > nodeIntegration
      // More info: https://quasar.dev/quasar-cli/developing-electron-apps/node-integration
      // nodeIntegration: true
      extendWebpack (cfg) {
        // cfg.module.rules.push({
        //   enforce: 'pre',
        //   test: /\.(js|vue)$/,
        //   loader: 'eslint-loader',
        //   exclude: /node_modules/,
        //   options: {
        //     formatter: require('eslint').CLIEngine.getFormatter('stylish')
        //   }
        // })
        cfg.resolve.alias = {
          ...cfg.resolve.alias, // This adds the existing alias

          // Add your own alias like this
          'src': path.resolve(__dirname, './src')
        }
      }
    }
  }
}
