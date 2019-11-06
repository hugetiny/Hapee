<h1 align="center">
    <img src="https://github.com/hugetiny/negibox/blob/master/docs/imgs/icon-gif.gif" alt="Negibox" width="256">
  <br>
  Negibox
  <br>
  <br>
</h1>
<h4 align="center">A Multi-protocol cross-platform downloader</h4>
<p align="center">
  <a href="https://gitter.im/negibox/community"><img src="https://img.shields.io/badge/gitter-join%20chat%20%E2%86%92-brightgreen.svg" alt="gitter"></a>
  <a href="https://github.com/hugetiny/negibox/releases"><img src="https://img.shields.io/github/release/hugetiny/negibox.svg" alt="github release version"></a>
  <a href="https://github.com/hugetiny/negibox/releases"><img src="https://img.shields.io/github/downloads/hugetiny/negibox/total.svg" alt="github release downloads"></a>
</p>

# Negibox is open source now!
The only one multi-protocol downloader(http,https,ftp,sftp,ftps,magnet,BitTorrent,MetaLink) you need for all platforms(Mac,Windows,Linux,Android,iOS)

## How to run?
New Negibox is still in developing
1. Add your own firebase config file in src/boot/firebase.js  
```
// Firebase App (the core Firebase SDK) is always required and must be listed first
import * as firebase from 'firebase/app'

// Add the Firebase products that you want to use
import 'firebase/auth'
import 'firebase/database'

// PUT YOUR OWN FIREBASE CONFIGURATION HERE
var firebaseConfig = {
  apiKey: 'xxxx',
  authDomain: 'xxxx',
  databaseURL: 'xxxx',
  projectId: 'xxxx',
  storageBucket: 'xxxx',
  messagingSenderId: xxxx',
  appId: 'xxxx',
  measurementId: 'xxxx'
}
// Initialize Firebase
let firebaseApp = firebase.initializeApp(firebaseConfig)
let firebaseAuth = firebaseApp.auth()
let firebaseDb = firebaseApp.database()

export { firebaseAuth, firebaseDb }

```
2. yarn
3. quasar dev
>[Please feel free to submit issue](https://github.com/hugetiny/negibox/issues/new)

## Supported Platform

- [ ] Web Chrome/Firefox/Safari/IE11
- [ ] macOS 10.10 ↑
- [ ] Windows 7 ↑
- [ ] Linux  (App is packaged in AppImage and requires FUSE to run.GNOME is recommended.)
- [ ] iOS -- 9.0 ↑
- [ ] Android -- 7.0 ↑

## Engines
- [ ] aria2
- [ ] thunder

## Browser Extension
- [ ] chrome/chromium
- [ ] firefox
- [ ] safari

## Protocol

- [ ] IPFS
- [ ] http
- [ ] https
- [ ] ftp
- [ ] sftp
- [ ] ftps
- [ ] magnet
- [ ] BitTorrent
- [ ] WebTorrent (for web version only)
- [ ] MetaLink

## cloud & service

- [ ] cloud files router/NAS remote control
- [ ] cloud videos player with danmaku
- [ ] cloud music
- [ ] cloud cross-platform apps

## crowdfunding & sponsor
<img src="https://raw.githubusercontent.com/hugetiny/quit-smoking/master/alipaysponse.jpeg" width="200px" /> 
<img src="https://github.com/hugetiny/quit-smoking/blob/master/wechatsponse.jpeg" width="200px" />

## Special Thanks
[quasar](https://github.com/quasarframework/quasar)

[webtorrent](https://github.com/webtorrent/webtorrent)

[aria2](https://github.com/aria2/aria2)

[webui-aria2](https://github.com/ziahamza/webui-aria2)

<a href="http://s04.flagcounter.com/more/Hb"><img src="https://s04.flagcounter.com/countxl/Hb/bg_141414/txt_EBEBEB/border_141414/columns_8/maxflags_32/viewers_Negibox/labels_0/pageviews_1/flags_0/percent_0/" alt="Flag Counter" border="0"></a>

