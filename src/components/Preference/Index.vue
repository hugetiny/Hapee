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
          v-model="form.locale"
          :options="locales"
          stack-label
          :label="$t('change-language')"
          :display-value="form.locale.label"
          @input="handleLocaleChange"
        >
          <template v-slot:append>
            <q-icon name="g_translate"/>
          </template>
        </q-select>
      </q-item-section>
    </q-item>
    <q-item v-ripple>
      <q-item-section>
        {{$t('appearance')}}
      </q-item-section>
      <q-item-section side>
        <q-btn-toggle
          v-model="form.theme"
          :options="[{label: $t('theme-light'), value: 'light'},
        {label: $t('theme-auto'), value: 'auto'},
        {label: $t('theme-dark'), value: 'dark'}]"
          @input ="handleThemeChange(form.theme)"
        />
      </q-item-section>
    </q-item>
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
        <q-toggle v-model="form.openAtLogin" @input="changeOpenAtLogin"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('keep-window-state') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.keepWindowState"  @input="changekeepWindowState"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('auto-resume-all') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.resumeAllWhenAppLaunched"/>
      </q-item-section>
    </q-item>
    <q-item-label header>{{ $t('advanced') }}</q-item-label>
    <q-item v-if="$q.platform.is.desktop" clickable v-ripple>
      <q-input dark
               v-if="$q.platform.is.desktop"
               v-model="downloadDir"
               :readonly="$q.platform.is.mac"
               :label="$t('default-dir')"
      />
        <template v-slot:append>
          <mo-select-directory
            @selected="onDirectorySelected"
          />
        </template>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{$t('transfer-speed-upload')}}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.isMaxOverallUploadLimit"/>
      </q-item-section>
    </q-item>
    <q-item v-if="form.isMaxOverallUploadLimit" tag="label" v-ripple>
      <q-item-section>
        <q-slider
          dark
          v-model="form.maxOverallUploadLimit"
          :min="1"
          :max="100"
          :label-value="form.maxOverallUploadLimit + 'M/s'"
          label-always
          @change="changeMaxOverallUploadLimit(form.maxOverallUploadLimit)"
        />
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{$t('transfer-speed-download')}}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.isMaxOverallDownloadLimit"/>
      </q-item-section>
    </q-item>
    <q-item v-if="form.isMaxOverallDownloadLimit" tag="label" v-ripple>
      <q-item-section>
        <q-slider
          dark
          v-model="form.maxOverallDownloadLimit"
          :min="1"
          :max="100"
          :label-value="form.maxOverallDownloadLimit + 'M/s'"
          label-always
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
          v-model="form.maxConcurrentDownloads"
          :min="1"
          :max="10"
          label
          label-always
        />
      </q-item-section>
      <q-item-section side>
        10
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
          v-model="form.split"
          :min="1"
          :max="form.maxConnectionPerServer"
          label
          label-always
        />
      </q-item-section>
      <q-item-section side>
        {{form.maxConnectionPerServer}}
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('continue') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.continue"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('new-task-show-downloading') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.newTaskShowDownloading"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('task-completed-notify') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.taskNotification"/>
      </q-item-section>
    </q-item>

    <q-item-label header>{{ $t('advanced') }}</q-item-label>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('auto-update') }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.autoCheckUpdate" val="$t('auto-check-update')"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-if="form.lastCheckUpdateTime !== 0" v-ripple>
      <q-item-section>
        <q-item-label>
          {{ $t('last-check-update-time') + ': ' + (form.lastCheckUpdateTime !== 0 ? new
          Date(form.lastCheckUpdateTime).toLocaleString() : new Date().toLocaleString()) }}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-btn class="gt-xs" size="12px" flat dense round icon="delete">
          {{ $t('check-updates-now') }}
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
        <q-toggle v-model="form.useProxy" @input="onUseProxyChange" val="$t('auto-check-update')"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-if="form.useProxy" v-ripple>
      <q-item-section>
        <q-input dark v-model="form.allProxyBackup" @input="onUseProxyChange"
                 placeholder="[http://][USER:PASSWORD@]HOST[:PORT]"/>
      </q-item-section>
    </q-item>
    <q-item tag="label" v-if="form.useProxy" v-ripple>
      <q-item-section>
        <q-input dark v-model="form.btTracker" @input="onUseProxyChange" auto-complete="off"
                 :placeholder="`${$t('preferences.bt-tracker-input-tips')}`"/>
      </q-item-section>
      <q-item-section side>
        <q-icon name="sync" @click="syncTrackerFromGitHub"/>
      </q-item-section>
    </q-item>

    <q-item-label header>{{ $t('download-protocol')}}</q-item-label>
    <q-item tag="label" v-ripple>
      <q-item-section>
        <q-item-label>
          {{$t('protocols-default-client')}}
        </q-item-label>
      </q-item-section>
      <q-item-section side>
        <q-toggle v-model="form.protocols.magnet" @change="(val) => onProtocolsChange('magnet', val)"
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
        <q-toggle dark v-model="form.protocols.thunder" @change="(val) => onProtocolsChange('thunder', val)"
        />
      </q-item-section>
    </q-item>
    <q-item-label header>{{ $t('security')}}</q-item-label>
    <q-item>
      <q-item-section>
        <q-input dark v-model="form.userAgent" @change="onUseProxyChange" auto-complete="off"
                 placeholder="User-Agent"/>
      </q-item-section>
    </q-item>
    <q-item>
      <q-item-section>
        <q-input
          dark
          :show-password="hideRpcSecret"
          placeholder="RPC Secret"
          :maxlength="24"
          v-model="form.rpcSecret"/>
      </q-item-section>
    </q-item>
  </q-list>
</template>

<script>
import { mapState } from 'vuex'
import { cloneDeep } from 'lodash'
import SelectDirectory from 'components/Native/SelectDirectory'
import ThemeSwitcher from 'components/Preference/ThemeSwitcher'
import { availableLanguages } from 'src/shared/i18n/LocaleManager'
import { prettifyDir } from 'components/Native/utils'
import {
  buildRpcUrl,
  convertCommaToLine,
  convertLineToComma,
  diffConfig
} from 'src/shared/utils'

import * as clipboard from 'clipboard-polyfill'
import ShowInFolder from 'components/Native/ShowInFolder'
import userAgentMap from 'src/shared/ua'
import { i18n } from 'boot/i18n'

export default {
  name: 'mo-content-preference',
  components: {
    [SelectDirectory.name]: SelectDirectory,
    [ThemeSwitcher.name]: ThemeSwitcher,
    [ShowInFolder.name]: ShowInFolder
  },
  data () {
    // const { locale } = this.$store.state.preference.config
    const {
      dir,
      // hideAppMenu,
      keepWindowState,
      locale,
      maxConcurrentDownloads,
      maxConnectionPerServer,
      isMaxOverallUploadLimit,
      maxOverallUploadLimit,
      isMaxOverallDownloadLimit,
      maxOverallDownloadLimit,
      newTaskShowDownloading,
      openAtLogin,
      resumeAllWhenAppLaunched,
      split,
      taskNotification,
      theme,
      allProxy,
      allProxyBackup,
      autoCheckUpdate,
      btTracker,
      lastCheckUpdateTime,
      protocols,
      rpcListenPort,
      rpcSecret,
      useProxy,
      userAgent
    } = this.$store.state.preference.config
    const form = {
      continue: this.$store.state.preference.config.continue,
      dir,
      // hideAppMenu: hideAppMenu,
      keepWindowState,
      locale: availableLanguages.filter(obj => obj.value.includes(locale.substr(0, 2))) ? availableLanguages.filter(obj => obj.value.includes(locale.substr(0, 2)))[0] : {
        value: 'en-US',
        label: 'English'
      },
      maxConcurrentDownloads,
      maxConnectionPerServer,
      isMaxOverallUploadLimit,
      maxOverallUploadLimit,
      isMaxOverallDownloadLimit,
      maxOverallDownloadLimit,
      newTaskShowDownloading,
      openAtLogin,
      resumeAllWhenAppLaunched,
      split,
      taskNotification,
      theme: theme,
      allProxy,
      allProxyBackup,
      autoCheckUpdate,
      btTracker: convertCommaToLine(btTracker),
      lastCheckUpdateTime,
      protocols: {
        ...protocols
      },
      rpcListenPort,
      rpcSecret,
      useProxy,
      userAgent
    }

    const formOriginal = cloneDeep(form)
    console.log(form)
    return {
      form,
      formLabelWidth: '28%',
      formOriginal,
      locales: availableLanguages,
      rules: {},
      hideRpcSecret: true,
      trackerSyncing: false
    }
  },
  computed: {
    title () {
      return this.$t('preference')
    },
    downloadDir () {
      return prettifyDir(this.form.dir)
    },
    ...mapState('preference', {
      config: state => state.config,
      logPath: state => state.config.logPath,
      sessionPath: state => state.config.sessionPath
    })
  },
  watch: {
    'form.rpcSecret' (val) {
      const url = buildRpcUrl({
        port: this.form.rpcListenPort,
        secret: val
      })
      clipboard.writeText(url)
    }
  },
  methods: {
    changeSingle (data = {}) {
      this.$store.dispatch('preference/save', data)
        .then(() => {
          this.$store.dispatch('app/fetchEngineOptions')
          this.syncFormConfig()
          console.log(this.$t('save-success-message'))
        })
        .catch((err) => {
          console.error(err)
        })
    },
    // 非引擎
    handleLocaleChange (locale) {
      console.log(locale)
      i18n.locale = locale.value
      this.$q.electron.ipcRenderer.send('command', 'application:change-locale', locale.value)
    },
    handleThemeChange (theme) {
      // this.form.theme = theme
      this.$q.electron.ipcRenderer.send('command', 'application:change-theme', theme)
    },
    changeOpenAtLogin () {
      if (this.$q.platform.is.desktop) {
        this.$q.electron.ipcRenderer.send('command', 'application:open-at-login', this.form.openAtLogin)
      }
    },
    changekeepWindowState () {
      this.changeSingle({ keepWindowState: !this.form.keepWindowState })
      this.$q.electron.ipcRenderer.send('command', 'application:relaunch')
    },
    // 引擎

    onDirectorySelected (dir) {
      this.form.dir = dir
    },
    syncFormConfig () {
      this.$store.dispatch('preference/fetchPreference')
        .then((config) => {
          // this.form = initialForm(config)
          this.formOriginal = cloneDeep(this.form)
        })
    },
    submitForm (formName) {
      // this.$refs[formName].validate((valid) => {
      //   if (!valid) {
      //     console.log('error submit!!')
      //     return false
      //   }
      const { openAtLogin } = this.form
      const changed = diffConfig(this.formOriginal, this.form)
      const data = {
        ...changed,
        btTracker: convertLineToComma(this.form.btTracker),
        protocols: {
          ...this.form.protocols
        }
      }
      console.log('changed====》', data)

      this.$store.dispatch('preference/save', data)
        .then(() => {
          this.$store.dispatch('app/fetchEngineOptions')
          this.syncFormConfig()
          console.log(this.$t('save-success-message'))
        })
        .catch(() => {
          console.log(this.$t('save-fail-message'))
        })

      this.$q.electron.ipcRenderer.send('command', 'application:setup-protocols-client', data.protocols)
      if (this.$q.platform.is.desktop) {
        this.$q.electron.ipcRenderer.send('command', 'application:open-at-login', openAtLogin)
      }
      // }
      // )
    },
    resetForm (formName) {
      this.syncFormConfig()
    },
    onCheckUpdateClick () {
      this.$q.electron.ipcRenderer.send('command', 'application:check-for-updates')
      console.info(this.$t('checking-for-updates'))
      this.$store.dispatch('preference/fetchPreference')
        .then((config) => {
          const { lastCheckUpdateTime } = config
          this.form.lastCheckUpdateTime = lastCheckUpdateTime
        })
    },
    syncTrackerFromGitHub () {
      this.trackerSyncing = true
      this.$store.dispatch('preference/fetchBtTracker')
        .then((data) => {
          console.log('syncTrackerFromGitHub data====>', data)
          this.form.btTracker = data
        })
        .finally(() => {
          this.trackerSyncing = false
        })
    },
    onProtocolsChange (protocol, enabled) {
      const { protocols } = this.form
      this.form.protocols = {
        ...protocols,
        [protocol]: enabled
      }
    },
    onUseProxyChange (flag) {
      this.form.allProxy = flag ? this.form.allProxyBackup : ''
    },
    onAllProxyBackupChange (value) {
      this.form.allProxy = value
    },
    changeUA (type) {
      const ua = userAgentMap[type]
      if (!ua) {
        return
      }
      this.form.userAgent = ua
    },
    onFactoryResetClick () {
      let r = confirm(this.$t('factory-reset-confirm'))
      if (r === true) {
        this.$q.electron.ipcRenderer.send('command', 'application:reset')
      }
    }
  }
}
</script>
