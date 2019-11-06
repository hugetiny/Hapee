<template>
  <div v-if="false"></div>
</template>

<script>
import { mapState } from 'vuex'
import api from 'src/api'
import {
  showItemInFolder,
  addToRecentTask,
  openDownloadDock,
  showDownloadSpeedInDock
} from 'components/Native/utils'
import {
  getTaskName,
  getTaskFullPath
} from 'src/shared/utils'

export default {
  name: 'mo-engine-client',
  data: function () {
    return {
      downloading: false
    }
  },
  computed: {
    ...mapState('app', {
      downloadSpeed: state => state.stat.downloadSpeed,
      interval: state => state.interval,
      numActive: state => state.stat.numActive
    }),
    ...mapState('task', {
      taskItemInfoVisible: state => state.taskItemInfoVisible,
      currentTaskItem: state => state.currentTaskItem
    }),
    ...mapState('preference', {
      taskNotification: state => state.config.taskNotification
    })
  },
  watch: {
    downloadSpeed (val, oldVal) {
      showDownloadSpeedInDock(val)
    },
    numActive (val, oldVal) {
      this.downloading = val > 0
    },
    downloading (val, oldVal) {
      if (val !== oldVal && this.$q.platform.is.desktop) {
        this.$q.electron.ipcRenderer.send('download-status-change', val)
      }
    }
  },
  methods: {
    fetchTaskItem ({ gid }) {
      return api.fetchTaskItem({ gid })
        .catch((e) => {
          console.warn(`fetchTaskItem fail: ${e.message}`)
        })
    },
    onDownloadStart (event) {
      this.$store.dispatch('task/fetchList')
      this.$store.dispatch('app/resetInterval')
      console.log('aria2 onDownloadStart', event)
      const [{ gid }] = event
      this.fetchTaskItem({ gid })
        .then((task) => {
          const taskName = getTaskName(task)
          const message = this.$t('download-start-message', { taskName })
          console.info(message)
        })
    },
    onDownloadPause (event) {
      console.log('aria2 onDownloadPause')
      const [{ gid }] = event
      this.fetchTaskItem({ gid })
        .then((task) => {
          const taskName = getTaskName(task)
          const message = this.$t('download-pause-message', { taskName })
          console.info(message)
        })
    },
    onDownloadStop (event) {
      console.log('aria2 onDownloadStop')
      const [{ gid }] = event
      this.fetchTaskItem({ gid })
        .then((task) => {
          const taskName = getTaskName(task)
          const message = this.$t('download-stop-message', { taskName })
          console.info(message)
        })
    },
    onDownloadError (event) {
      const [{ gid }] = event
      this.fetchTaskItem({ gid })
        .then((task) => {
          const taskName = getTaskName(task)
          const { errorCode, errorMessage } = task
          console.error(`[negibox] download error===> Gid: ${gid}, #${errorCode}, ${errorMessage}`)
          const message = this.$t('download-error-message', { taskName })
          const link = `<a target="_blank" href="https://github.com/agalwood/Motrix/wiki/Error#${errorCode}" rel="noopener noreferrer">#${errorCode}</a>`
          alert(`${message} ${link}`)
          // this.$msg({
          //   type: 'error',
          //   showClose: true,
          //   duration: 5000,
          //   dangerouslyUseHTMLString: true,
          //   message: `${message} ${link}`
          // })
        })
    },
    onDownloadComplete (event) {
      console.log('aria2 onDownloadComplete')
      this.$store.dispatch('task/fetchList')
      const [{ gid }] = event
      this.fetchTaskItem({ gid })
        .then((task) => {
          this.handleDownloadComplete(task, false)
        })
    },
    onBtDownloadComplete (event) {
      console.log('aria2 onBtDownloadComplete')
      this.$store.dispatch('task/fetchList')
      const [{ gid }] = event
      this.fetchTaskItem({ gid })
        .then((task) => {
          this.handleDownloadComplete(task, true)
        })
    },
    handleDownloadComplete (task, isBT) {
      const path = getTaskFullPath(task)

      addToRecentTask(task)
      openDownloadDock(path)

      this.showTaskCompleteNotify(task, isBT, path)
    },
    showTaskCompleteNotify (task, isBT, path) {
      const taskName = getTaskName(task)
      const message = isBT
        ? this.$t('bt-download-complete-message', { taskName })
        : this.$t('download-complete-message', { taskName })
      const tips = isBT
        ? '\n' + this.$t('bt-download-complete-tips')
        : ''

      console.log(`${message}${tips}`)

      if (!this.taskNotification) {
        return
      }

      /* eslint-disable no-new */
      const notifyMessage = isBT
        ? this.$t('bt-download-complete-notify')
        : this.$t('download-complete-notify')

      const notify = new Notification(notifyMessage, {
        body: `${taskName}${tips}`
      })
      notify.onclick = () => {
        showItemInFolder(path, {
          errorMsg: this.$t('file-not-exist')
        })
      }
    },
    showTaskErrorNotify (task) {
      const taskName = getTaskName(task)

      const message = this.$t('download-fail-message', { taskName })
      console.log(message)

      if (!this.taskNotification) {
        return
      }

      /* eslint-disable no-new */
      new Notification(this.$t('download-fail-notify'), {
        body: taskName
      })
    },
    bindEngineEvents () {
      api.client.on('onDownloadStart', this.onDownloadStart)
      // api.client.on('onDownloadPause', this.onDownloadPause)
      api.client.on('onDownloadStop', this.onDownloadStop)
      api.client.on('onDownloadComplete', this.onDownloadComplete)
      api.client.on('onDownloadError', this.onDownloadError)
      api.client.on('onBtDownloadComplete', this.onBtDownloadComplete)
    },
    unbindEngineEvents () {
      api.client.removeListener('onDownloadStart', this.onDownloadStart)
      // api.client.removeListener('onDownloadPause', this.onDownloadPause)
      api.client.removeListener('onDownloadStop', this.onDownloadStop)
      api.client.removeListener('onDownloadComplete', this.onDownloadComplete)
      api.client.removeListener('onDownloadError', this.onDownloadError)
      api.client.removeListener('onBtDownloadComplete', this.onBtDownloadComplete)
    },
    startPolling () {
      this.timer = setTimeout(() => {
        this.polling()
        this.startPolling()
      }, this.interval)
    },
    polling () {
      this.$store.dispatch('app/fetchGlobalStat')
      this.$store.dispatch('task/fetchList')

      if (this.taskItemInfoVisible && this.currentTaskItem) {
        this.$store.dispatch('task/fetchItem', this.currentTaskItem.gid)
      }
    },
    stopPolling () {
      clearTimeout(this.timer)
      this.timer = null
    }
  },
  created () {
    this.bindEngineEvents()
  },
  mounted () {
    setTimeout(() => {
      this.$store.dispatch('app/fetchEngineInfo')
      this.$store.dispatch('app/fetchEngineOptions')

      this.startPolling()
    }, 100)
  },
  destroyed () {
    this.$store.dispatch('task/saveSession')

    this.unbindEngineEvents()

    this.stopPolling()
  }
}
</script>
