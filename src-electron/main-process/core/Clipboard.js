// // import {createWindow, mainWindow} from "../app";
//
// const base64 = require('js-base64').Base64
// const listeningType = {
//   video: {
//     name: 'Videos',
//     extensions: [
//       '.3g2',
//       '.3gp',
//       '.3gp2',
//       '.3gpp',
//       '.asf',
//       '.asx',
//       '.avi',
//       '.dat',
//       '.divx',
//       '.flv',
//       '.m1v',
//       '.m2ts',
//       '.m2v',
//       '.m4v',
//       '.mkv',
//       '.mov',
//       '.mp4',
//       '.mpe',
//       '.mpeg',
//       '.mpg',
//       '.mts',
//       '.ogv',
//       '.qt',
//       '.ram',
//       '.rm',
//       '.rmvb',
//       '.ts',
//       '.vob',
//       '.wmv'
//     ]
//   },
//   audio: {
//     name: 'Audios',
//     extensions: [
//       '.aac',
//       '.ac3',
//       '.adts',
//       '.amr',
//       '.ape',
//       '.eac3',
//       '.flac',
//       '.m1a',
//       '.m2a',
//       '.m4a',
//       '.mid',
//       '.mka',
//       '.mp2',
//       '.mp3',
//       '.mpa',
//       '.mpc',
//       '.ogg',
//       '.ra',
//       '.tak',
//       '.vqf',
//       '.wm',
//       '.wav',
//       '.wma',
//       '.wv'
//     ]
//   },
//   // picture: {
//   //   name: 'Pictures',
//   //   extensions: [
//   //     '.abr',
//   //     '.bmp',
//   //     '.emf',
//   //     '.gif',
//   //     '.j2c',
//   //     '.j2k',
//   //     '.jfif',
//   //     '.jif',
//   //     '.jp2',
//   //     '.jpc',
//   //     '.jpe',
//   //     '.jpeg',
//   //     '.jpf',
//   //     '.jpg',
//   //     '.jpk',
//   //     '.jpx',
//   //     '.pcx',
//   //     '.pct',
//   //     '.pic',
//   //     '.pict',
//   //     '.png',
//   //     '.pns',
//   //     '.psd',
//   //     '.psdx',
//   //     '.raw',
//   //     '.svg',
//   //     '.svgz',
//   //     '.tga',
//   //     '.tif',
//   //     '.tiff',
//   //     '.wbm',
//   //     '.wbmp',
//   //     '.webp',
//   //     '.wmf',
//   //     '.xif'
//   //   ]
//   // },
//   // document: {
//   //   name: 'Documents',
//   //   extensions: [
//   //     '.csv',
//   //     '.doc',
//   //     '.docm',
//   //     '.docx',
//   //     '.dot',
//   //     '.dotm',
//   //     '.dotx',
//   //     '.key',
//   //     '.mpp',
//   //     '.numbers',
//   //     '.odp',
//   //     '.ods',
//   //     '.odt',
//   //     '.pages',
//   //     '.pdf',
//   //     '.pot',
//   //     '.potm',
//   //     '.potx',
//   //     '.pps',
//   //     '.ppsm',
//   //     '.ppsx',
//   //     '.ppt',
//   //     '.pptm',
//   //     '.pptx',
//   //     '.rtf',
//   //     '.txt',
//   //     '.vsd',
//   //     '.vsdx',
//   //     '.wk1',
//   //     '.wk2',
//   //     '.wk3',
//   //     '.wk4',
//   //     '.wks',
//   //     '.wpd',
//   //     '.wps',
//   //     '.xla',
//   //     '.xlam',
//   //     '.xll',
//   //     '.xlm',
//   //     '.xls',
//   //     '.xlsb',
//   //     '.xlsm',
//   //     '.xlsx',
//   //     '.xlt',
//   //     '.xltx',
//   //     '.xlw',
//   //     '.xps'
//   //   ]
//   // },
//   application: {
//     name: 'Applications',
//     extensions: [
//       '.apk',
//       '.bat',
//       '.com',
//       '.deb',
//       '.dll',
//       '.dmg',
//       '.exe',
//       '.ipa',
//       '.jar',
//       '.msi',
//       '.rpm',
//       '.sh',
//       '.AppImage'
//     ]
//   },
//   archive: {
//     name: 'Archives',
//     extensions: [
//       '.001',
//       '.7z',
//       '.ace',
//       '.arj',
//       '.bz2',
//       '.cab',
//       '.cbr',
//       '.cbz',
//       '.gz',
//       '.img',
//       '.iso',
//       '.lzh',
//       '.qcow2',
//       '.r',
//       '.rar',
//       '.sef',
//       '.tar',
//       '.taz',
//       '.tbz',
//       '.tbz2',
//       '.uue',
//       '.vdi',
//       '.vhd',
//       '.vmdk',
//       '.wim',
//       '.xar',
//       '.xz',
//       '.z',
//       '.zip'
//     ]
//   }
// }
//
// const checkUrltoNew = function (readText) {
//   let httpLinkMatch = Object.values(listeningType).some(function (types) {
//     return types['extensions'].some(
//       function (extension) {
//         extension = RegExp(`^(http|https):\\/\\/.+\\${extension}(\\?.+)*$`)
//         return extension.test(readText)
//       })
//   })
//   // let httpLinkMatch = /^(http|https):\/\/.+$/.test(readText)
//   let otherLinkMatch = /^(ftp|sftp|magnet):\/\/.+$/.test(readText)
//   let chinaLinkMatch = /^\s*(?:thunder|flashget|qqdl|fs2you):\/\/([^'"\s]*)/i.test(readText)
//   if (otherLinkMatch || httpLinkMatch || chinaLinkMatch) {
//     if (mainWindow === null) {
//       createWindow()
//     }
//     if (mainWindow.isMinimized()) {
//       mainWindow.restore()
//     }
//     mainWindow.focus()
//     readText = base64.encodeURI(readText)
//     mainWindow.loadURL(`file://${__dirname}/negibox/index.html#!/new?clipboard=${readText}`)
//     return true
//   } else {
//     return false
//   }
// }
// export { checkUrltoNew }
