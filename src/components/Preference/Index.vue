<template>
  <q-list dark class="q-pa-sm">
    <!--  web-->
    <q-item-label header>{{ $t('basic') }}</q-item-label>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-select
          dark
          borderless
          hide-dropdown-icon
          behavior="dialog"
          v-model="locale"
          :options="locales"
          stack-label
          :label="$t('change-language')"
          :display-value="locale.label"
        >
          <template v-slot:append>
            <q-icon name="g_translate"/>
          </template>
        </q-select>
      </q-item-section>
    </q-item>
    <!--    TODO waiting for Quasar electron7 fix-->
<!--    <q-item v-ripple>-->
<!--      <q-item-section>-->
<!--        {{$t('appearance')}}-->
<!--      </q-item-section>-->
<!--      <q-item-section side>-->
<!--        <q-btn-toggle-->
<!--          v-model="form.theme"-->
<!--          :options="[{label: $t('theme-light'), value: 'light'},-->
<!--        {label: $t('theme-auto'), value: 'auto'},-->
<!--        {label: $t('theme-dark'), value: 'dark'}]"-->
<!--        />-->
<!--      </q-item-section>-->
<!--    </q-item>-->
<!--    desktop-->
<!--    <q-item v-if="$q.platform.is.win || $q.platform.is.linux" tag="label" v-ripple>-->
<!--      <q-item-section>-->
<!--        <q-item-label>-->
<!--          {{ $t('hide-app-menu') }}-->
<!--        </q-item-label>-->
<!--      </q-item-section>-->
<!--      <q-item-section side>-->
<!--        <q-toggle v-model="form.hideAppMenu" />-->
<!--      </q-item-section>-->
<!--    </q-item>-->
    <q-item v-if="$q.platform.is.win || $q.platform.is.mac" tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('open-at-login') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="openAtLogin"/>
      </q-item-section>
    </q-item>
<!--    <q-item tag="label" v-ripple>-->
<!--      <q-item-section>-->
<!--        <q-item-label>-->
<!--          {{ $t('keep-window-state') }}-->
<!--        </q-item-label>-->
<!--      </q-item-section>-->
<!--      <q-item-section side>-->
<!--        <q-toggle v-model="keepWindowState"/>-->
<!--      </q-item-section>-->
<!--    </q-item>-->
<!--    <q-item tag="label" v-ripple>-->
<!--      <q-item-section>-->
<!--        <q-item-label>-->
<!--          {{ $t('auto-resume-all') }}-->
<!--        </q-item-label>-->
<!--      </q-item-section>-->
<!--      <q-item-section side>-->
<!--        <q-toggle v-model="form.resumeAllWhenAppLaunched"/>-->
<!--      </q-item-section>-->
<!--    </q-item>-->
    <q-item-label header>{{ $t('advanced') }}</q-item-label>
    <q-item v-if="$q.platform.is.desktop" clickable v-ripple>
      <q-item-section>
       <select-directory/>
      </q-item-section>
    </q-item>
<!--    <q-item tag="label" v-ripple>-->
<!--      <q-item-section>-->
<!--        <q-item-label>-->
<!--          {{$t('transfer-speed-upload')}}-->
<!--        </q-item-label>-->
<!--      </q-item-section>-->
<!--      <q-item-section side>-->
<!--        <q-toggle v-model="isMaxOverallUploadLimit"/>-->
<!--      </q-item-section>-->
<!--    </q-item>-->
<!--    <q-item v-if="config.maxOverallUploadLimit !== 0" tag="label" v-ripple>-->
<!--      <q-item-section>-->
<!--        <q-slider-->
<!--          dark-->
<!--          v-model="form.maxOverallUploadLimit"-->
<!--          :min="1"-->
<!--          :max="100"-->
<!--          :label-value="form.maxOverallUploadLimit + 'M/s'"-->
<!--          label-always-->
<!--          @change="changeMaxOverallUploadLimit(form.maxOverallUploadLimit)"-->
<!--        />-->
<!--      </q-item-section>-->
<!--    </q-item>-->
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{$t('transfer-speed-download')}}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="isMaxOverallDownloadLimit"/>
      </q-item-section>
    </q-item>
    <q-item v-if="isMaxOverallDownloadLimit" tag="label" v-ripple>
      <q-item-section>
        <q-slider
          dark
          v-model="maxOverallDownloadLimit"
          :min="1"
          :max="100"
          :label-value="maxOverallDownloadLimit + 'MB/s'"
          label-always
          @change="maxOverallDownloadLimit=>updateDownloadLimit(maxOverallDownloadLimit)"
        />
      </q-item-section>
    </q-item>
    <q-item-label header>
      {{$t('max-concurrent-downloads')}}
    </q-item-label>
    <q-item>
      <q-item-section side>
        1
      </q-item-section>
      <q-item-section>
        <q-slider
          dark
          v-model="maxConcurrentDownloads"
          :min="1"
          :max="100"
          label
          label-always
          @change="val=>lazyUpdate({maxConcurrentDownloads:val})"
        />
      </q-item-section>
      <q-item-section side>
        100
      </q-item-section>
    </q-item>
    <q-item-label header>
      {{$t('max-connection-per-server')}}
    </q-item-label>
    <q-item>
      <q-item-section side>
        1
      </q-item-section>
      <q-item-section>
        <q-slider
          dark
          v-model="split"
          :min="1"
          :max="64"
          label
          label-always
          @change="val=>lazyUpdate({split:val})"
        />
      </q-item-section>
      <q-item-section side>
        64
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('continue') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="continueFlag"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('task-completed-notify') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="taskNotification"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('auto-update') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="autoCheckUpdate"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-if="config.lastCheckUpdateTime !== 0" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('last-check-update-time') + ': ' + (config.lastCheckUpdateTime !== 0 ? new
          Date(config.lastCheckUpdateTime).toLocaleString() : new Date().toLocaleString()) }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-btn icon="system_update_alt" @click.stop="onCheckUpdateClick" :label="$t('check-updates-now')">
        </q-btn>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('proxy') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="useProxy"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-if="useProxy" v-ripple>
      <q-item-section>
        <q-input dark v-model="allProxyBackup"
                 placeholder="http(s)://(USER:PASSWORD@)HOST:PORT"
        />
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-input dark v-model="btTracker"
                 :placeholder="$t('bt-tracker-input-tips')">
        <template v-slot:append>
          <q-icon
            name="refresh"
            @click.stop="syncTrackerFromGitHub">
            <q-tooltip content-style="font-size: 12px" transition-show="scale"
                       transition-hide="scale">
              {{$t('sync-tracker-tips')}}
            </q-tooltip>
          </q-icon>
        </template>
        </q-input>
      </q-item-section>
    </q-item>

    <q-item-label header>{{ $t('download-protocol')}}</q-item-label>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{$t('protocols-magnet')}}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="protocolMagnet"
        />
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{$t('protocols-thunder')}}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle dark v-model="protocolThunder"
        />
      </q-item-section>
    </q-item>

    <q-item>
      <q-item-section>
        <q-input dark v-model="userAgent" placeholder="User-Agent"/>
      </q-item-section>
    </q-item>

    <q-item-label header>{{ $t('security')}}</q-item-label>

    <q-item>
      <q-item-section>
        <q-input
          dark
          placeholder="RPC Secret"
          :maxlength="24"
          v-model="rpcSecret"/>
      </q-item-section>
    </q-item>
  </q-list>
</template>

<script>
import { mapState } from 'vuex'
// import { cloneDeep } from 'lodash'
import ThemeSwitcher from 'components/Preference/ThemeSwitcher'
import { locales } from 'src/shared/i18n/LocaleManager'
// import {
//   buildRpcUrl,
//   convertLineToComma,
//   diffConfig
// } from 'src/shared/utils'

// import * as clipboard from 'clipboard-polyfill'
import ShowInFolder from 'components/Native/ShowInFolder'
// import userAgentMap from 'src/shared/ua'
import { getLocaleManager } from 'boot/platform'
import SelectDirectory from 'components/Native/SelectDirectory.vue'

export default {
  name: 'content-preference',
  components: {
    [SelectDirectory.name]: SelectDirectory,
    [ThemeSwitcher.name]: ThemeSwitcher,
    [ShowInFolder.name]: ShowInFolder
  },
  data () {
    return {
      locales: locales,
      trackerSyncing: false
    }
  },
  computed: {
    ...mapState('preference', {
      config: state => state.config,
      logPath: state => state.config.logPath,
      sessionPath: state => state.config.sessionPath
    }),
    locale: {
      // eslint-disable-next-line vue/return-in-computed-property
      get: function () {
        // if (this.config.locale === 'en') {
        //   this.config.locale = 'en-US'
        // }
        for (let l of locales) {
          if (l.value === this.config.locale) {
            console.log(l)
            return { value: this.config.locale, label: l.label }
          }
        }
      },
      set: function (locale) {
        this.updateAll({ locale: locale.value })
        getLocaleManager().changeLanguage(locale.value)
        if (this.$q.platform.is.desktop) {
          this.$q.electron.ipcRenderer.send('command', 'application:change-locale', locale.value)
        }
      }
    },
    theme: {
      get: function () {
        return this.config.theme
      },
      set: function (theme) {
        this.updateAll({ theme: theme })
        if (this.$q.platform.is.desktop) {
          this.$q.electron.ipcRenderer.send('command', 'application:change-theme', theme)
        }
      }
    },
    openAtLogin: {
      get: function () {
        return this.config.openAtLogin
      },
      set: function (openAtLogin) {
        this.updateAll({ openAtLogin: openAtLogin })
        if (this.$q.platform.is.desktop) {
          this.$q.electron.ipcRenderer.send('command', 'application:open-at-login', openAtLogin)
        }
      }
    },
    // keepWindowState: {
    //   get: function () {
    //     return this.config.keepWindowState
    //   },
    //   set: function (openAtLogin) {
    //     this.updateLocal({ keepWindowState: keepWindowState })
    //     if (this.$q.platform.is.desktop) {
    //       this.$q.electron.ipcRenderer.send('command', 'application:open-at-login', openAtLogin)
    //     }
    //   }
    // },
    // electron
    isMaxOverallDownloadLimit: {
      get: function () {
        if (this.config.maxOverallDownloadLimit === 0) {
          return false
        } else {
          return true
        }
      },
      set: function (value) {
        this.updateAll({ maxOverallDownloadLimit: value ? '1M' : 0 })
      }
    },
    maxOverallDownloadLimit: {
      get: function () {
        let limit = this.config.maxOverallDownloadLimit
        return parseInt(limit.substring(0, limit.length - 1))
      },
      set: function (value) {
        this.$store.commit('preference/UPDATE_PREFERENCE_LOCAL', { maxOverallDownloadLimit: value + 'M' })
      }
    },
    maxConcurrentDownloads: {
      get: function () {
        return this.config.maxConcurrentDownloads
      },
      set: function (value) {
        this.$store.commit('preference/UPDATE_PREFERENCE_LOCAL', { maxConcurrentDownloads: value })
      }
    },
    split: {
      get: function () {
        return this.config.split
      },
      set: function (value) {
        this.$store.commit('preference/UPDATE_PREFERENCE_LOCAL', { split: value })
      }
    },
    continueFlag: {
      get: function () {
        return this.config.continue
      },
      set: function (value) {
        this.updateAll({ continue: value })
      }
    },
    taskNotification: {
      get: function () {
        return this.config.taskNotification
      },
      set: function (value) {
        this.updateAll({ taskNotification: value })
      }
    },
    autoCheckUpdate: {
      get: function () {
        return this.config.autoCheckUpdate
      },
      set: function (value) {
        this.updateAll({ autoCheckUpdate: value })
      }
    },
    useProxy: {
      get: function () {
        return this.config.useProxy
      },
      set: function (value) {
        this.updateAll({ useProxy: value })
      }
    },
    allProxyBackup: {
      get: function () {
        return this.config.allProxyBackup
      },
      set: function (value) {
        this.updateAll({ allProxyBackup: value })
      }
    },
    btTracker: {
      get: function () {
        return this.config.btTracker
      },
      set: function (value) {
        this.updateAll({ btTracker: value })
      }
    },
    protocolMagnet: {
      get: function () {
        return this.config.protocols.magnet
      },
      set: function (value) {
        this.updateAll({ protocols: { magnet: value, thunder: this.config.protocols.thunder } })
      }
    },
    protocolThunder: {
      get: function () {
        return this.config.protocols.thunder
      },
      set: function (value) {
        this.updateAll({ protocols: { magnet: this.config.protocols.magnet, thunder: value } })
      }
    },
    userAgent: {
      get: function () {
        return this.config.userAgent
      },
      set: function (value) {
        this.updateAll({ userAgent: value })
      }
    },
    rpcSecret: {
      get: function () {
        return this.config.rpcSecret
      },
      set: function (value) {
        this.updateAll({ rpcSecret: value })
      }
    }

  },
  // watch: {
  //   'form.rpcSecret' (val) {
  //     const url = buildRpcUrl({
  //       port: this.form.rpcListenPort,
  //       secret: val
  //     })
  //     clipboard.writeText(url)
  //   }
  // },
  methods: {
    updateLocal (config = {}) {
      this.$store.commit('preference/UPDATE_PREFERENCE_LOCAL', config)
    },

    // 引擎
    updateAll (config = {}) {
      this.updateLocal(config)
      this.$store.dispatch('preference/save', config)
    },
    updateDownloadLimit (value) {
      // this.$store.commit('preference/UPDATE_PREFERENCE_LOCAL', { maxOverallDownloadLimit: value + 'K' })
      this.$store.dispatch('preference/save', { maxOverallDownloadLimit: value + 'M' })
    },
    lazyUpdate (config = {}) {
      // this.$store.commit('preference/UPDATE_PREFERENCE_LOCAL', config)
      this.$store.dispatch('preference/save', config)
    },
    onDirectorySelected (dir) {
      this.form.dir = dir
    },

    onCheckUpdateClick () {
      this.$q.electron.ipcRenderer.send('command', 'application:check-for-updates')
    },
    syncTrackerFromGitHub () {
      this.trackerSyncing = true
      this.$store.dispatch('preference/fetchBtTracker')
        .then((data) => {
          console.log('syncTrackerFromGitHub data====>', data)
          if (data.indexOf('!DOCTYPE') === -1) {
            this.updateAll({ btTracker: data })
          } else {
            alert(this.$t('download-fail-message'))
          }
        }).catch(err => {
          console.error(err)
        })
        .finally(() => {
          this.trackerSyncing = false
        })
    }
  }
}
</script>
