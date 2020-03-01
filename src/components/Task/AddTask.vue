<template>
  <div>
    <q-list dark class="q-pa-sm">
      <q-item>
        <q-item-section>
          <q-uploader
            dark
            square
            :label="$t('By Torrents')"
            accept=".torrent"
            :max-file-size="8192000"
            hide-upload-btn
            @added="added"
            multiple
          >
            <template v-slot:list="scope">
              <q-input dark
                       ref="uri"
                       type="textarea"
                       auto-complete="off"
                       :placeholder="$t('uri-task-tips')"
                       @paste.native="handleUriPaste"
                       v-model="form.uris"
              ></q-input>
            </template>
          </q-uploader>
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-input dark
                   :placeholder="$t('task-out-tips')"
                   v-model="form.out"
                   :label="$t('task-out')">
          </q-input>
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-input dark
                   v-model="form.split"
                   @change="handleSplitChange"
                   controls-position="right"
                   :min="1"
                   :max="config.maxConnectionPerServer"
                   :value="config.split"
                   :label="$t('task-split')">
          </q-input>
          <select-directory></select-directory>
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-checkbox dark
                      :label="$t('show-advanced-options')"
                      v-model="showAdvanced">
          </q-checkbox>
          <div v-if="showAdvanced">
            <q-input dark
                     :label="$t('task-user-agent')"
                     :autosize="{ minRows: 2, maxRows: 3 }"
                     auto-complete="off"
                     :placeholder="$t('task-user-agent')"
                     v-model="form.userAgent">
            </q-input>
            <q-input dark
                     :label="`${$t('task-referer')}: `"
                     auto-complete="off"
                     :placeholder="$t('task-referer')"
                     v-model="form.referer">
            </q-input>
            <q-input dark
                     :label="`${$t('task-cookie')}: `"
                     auto-complete="off"
                     :placeholder="$t('task-cookie')"
                     v-model="form.cookie">
            </q-input>
          </div>
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-btn @click="handleCancel('taskForm')">{{$t('cancel')}}</q-btn>
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-btn color="primary" @click="submitForm('taskForm')">{{$t('submit')}}</q-btn>
        </q-item-section>
      </q-item>
    </q-list>
  </div>
</template>

<script>
import parseTorrent from 'parse-torrent'
import { mapState } from 'vuex'
import { isEmpty } from 'lodash'
import SelectDirectory from 'components/Native/SelectDirectory'
// import SelectTorrent from 'components/Task/SelectTorrent'
import TorrentDetail from 'components/Task/torrentDetail'
import {
  NONE_SELECTED_FILES,
  SELECTED_ALL_FILES
} from 'src/shared/constants'
import { buildOuts } from 'src/shared/rename'
import {
  bytesToSize,
  detectResource,
  splitTaskLinks,
  getAsBase64
} from 'src/shared/utils'

const initialForm = (state) => {
  const { addTaskUrl, addTaskOptions } = state.app
  const { dir, split, newTaskShowDownloading } = state.task.config
  const result = {
    uris: addTaskUrl,
    torrent: '',
    selectFile: 'none',
    out: '',
    userAgent: '',
    referer: '',
    cookie: '',
    dir,
    split,
    newTaskShowDownloading,
    ...addTaskOptions
  }
  return result
}

export default {
  name: 'add-task',
  created: function () {
    this.form = initialForm(this.$store.state)
    if (this.addTaskType === 'uri') {
      const content = this.$q.electron.clipboard.readText()
      const hasResource = detectResource(content)
      if (!hasResource) {
        return
      }
      if (isEmpty(this.form.uris)) {
        this.form.uris = content
      }
      setTimeout(() => {
        this.$refs.uri && this.$refs.uri.focus()
      }, 50)
    }
    this.detectThunderResource(this.form.uris)
  },
  beforeDestroy: function () {
    this.$store.dispatch('app/hideAddTaskDialog')
    this.$store.dispatch('app/updateAddTaskOptions', {})
    this.reset()
  },
  components: {
    [SelectDirectory.name]: SelectDirectory,
    // [SelectTorrent.name]: SelectTorrent
    [TorrentDetail.name]: TorrentDetail
  },
  props: {
    // visible: {
    //   type: Boolean,
    //   default: false
    // },
    type: {
      type: String,
      default: 'uri'
    }
  },
  data () {
    return {
      torrentsAmount: 0,
      showAdvanced: false,
      form: {},
      rules: {}
    }
  },
  computed: {
    addTaskVisible: {
      get () {
        return this.$store.state.app.addTaskVisible
      },
      set (value) {
        this.$store.commit('app/CHANGE_ADD_TASK_VISIBLE', value)
      }
    },
    addTaskType: {
      get () {
        return this.$store.state.app.addTaskType
      },
      set (value) {
        this.$store.commit('app/CHANGE_ADD_TASK_TYPE', value)
      }
    },

    ...mapState('app', {
      // addTaskVisible: state => state.addTaskVisible,
      taskList: state => state.taskList
    }),
    ...mapState('task', {
      config: state => state.config
    })
  },
  // watch: {
  //   taskType: function (current, previous) {
  //     if (this.visible && previous === 'uri') {
  //       return
  //     }
  //
  //     if (current === 'uri') {
  //       setTimeout(() => {
  //         this.$refs.uri && this.$refs.uri.focus()
  //       }, 50)
  //     }
  //   }
  // },
  methods: {
    added (torrents) {
      // TODO show dialog table,
      // console.log(torrents)

      if (torrents.length === 0) {
        // this.reset()
        console.log('no torrents')
        return
      }
      this.torrentsAmount = (torrents.length)
      console.log(this.torrentsAmount)
      console.log(torrents)
      torrents.forEach(torrent => {
        parseTorrent.remote(torrent.path, (err, parsedTorrent) => {
          if (err) throw err
          console.log(parsedTorrent)
          let exts = []
          const files = parsedTorrent.files.map(file => {
            const ext = file.name.replace(/.+\.(.+)/, '$1')
            exts.push(ext)
            return {
              name: file.name,
              ext: ext,
              sizeByte: file.length,
              size: bytesToSize(file.length)
            }
          })
          exts = Array.from(new Set(exts))
          getAsBase64(torrent, (base64) => {
            this.$q.dialog({
              component: TorrentDetail,
              position: 'top',
              parent: this, // becomes child of this Vue node
              // ("this" points to your Vue component)
              // (prop was called "root" in < 1.1.0)
              files: files,
              exts: exts,
              torrentBase64: base64
            }).onOk(() => {
              console.log('OK')
            }).onCancel(() => {
              console.log('Cancel')
            }).onDismiss(() => {
              console.log('Called on OK or Cancel')
            })
          })
        })
      })
    },
    handleUriPaste () {
      setImmediate(() => {
        const uris = this.$refs.uri.value
        this.detectThunderResource(uris)
      })
    },
    detectThunderResource (uris = '') {
      if (uris.match(/^\s*(?:thunder|flashget|qqdl|fs2you):\/\/([^'"\s]*)/i)) {
        console.log(this.$t('thunder-link-tips'))
      }
    },
    handleUriChange () {
      console.log('handleUriChange===>', this.form.uris)
    },
    handleTorrentChange (torrent, selectedFileIndex) {
      // this.torrent = torrent
      this.form.torrent = torrent
      this.form.selectFile = selectedFileIndex
      console.log(torrent)
      console.log(this.form)
    },
    handleSplitChange (value) {
      console.log('handleSplitChange===>', value)
    },
    onDirectorySelected (dir) {
      this.form.dir = dir
    },
    reset () {
      this.showAdvanced = false
      this.form = initialForm(this.$store.state)
    },
    handleCancel (formName) {
      this.torrentsAmount = this.torrentsAmount - 1
      this.$store.dispatch('app/hideAddTaskDialog')
    },
    buildHeader (form) {
      const {
        userAgent, referer, cookie
      } = form
      const result = []

      if (!isEmpty(userAgent)) {
        result.push(`User-Agent: ${userAgent}`)
      }
      if (!isEmpty(referer)) {
        result.push(`Referer: ${referer}`)
      }
      if (!isEmpty(cookie)) {
        result.push(`Cookie: ${cookie}`)
      }
      return result
    },
    buildOption (type, form) {
      const {
        dir,
        out,
        selectFile,
        split
      } = form
      const result = {}

      if (!isEmpty(dir)) {
        result.dir = dir
      }

      if (!isEmpty(out)) {
        result.out = out
      }

      if (type === 'torrent') {
        if (
          selectFile !== SELECTED_ALL_FILES &&
            selectFile !== NONE_SELECTED_FILES
        ) {
          result.selectFile = selectFile
        }
      }

      if (split > 0) {
        result.split = split
      }

      const header = this.buildHeader(form)
      if (!isEmpty(header)) {
        result.header = header
      }
      return result
    },
    buildUriPayload (form) {
      let { uris, out } = form
      if (isEmpty(uris)) {
        throw new Error(this.$t('new-task-uris-required'))
      }
      uris = splitTaskLinks(uris)
      const outs = buildOuts(uris, out)

      const options = this.buildOption('uri', form)
      const result = {
        uris,
        outs,
        options
      }
      return result
    },
    buildTorrentPayload (form) {
      const { torrent } = form
      console.log(torrent)
      if (isEmpty(torrent)) {
        throw new Error(this.$t('new-task-uris-required'))
      }
      const options = this.buildOption('torrent', form)
      const result = {
        torrent,
        options
      }
      return result
    },
    addTask (type, form) {
      let payload = null
      if (type === 'uri') {
        payload = this.buildUriPayload(form)
        this.$store.dispatch('task/addUri', payload)
          .catch((err) => {
            console.error(err.message)
          })
      } else if (type === 'torrent') {
        payload = this.buildTorrentPayload(form)
        this.$store.dispatch('task/addTorrent', payload)
          .catch((err) => {
            console.error(err.message)
          })
      } else if (type === 'metalink') {
        // @TODO addMetalink
      } else {
        console.error('addTask fail', form)
      }
    },
    dialogClose () {
      this.torrentsAmount = this.torrentsAmount - 1
      // console.log(this.torrentsAmount)
    },
    submitForm () {
      try {
        this.addTask(this.addTaskType, this.form)
        console.log(this.torrentsAmount)
        if (this.torrentsAmount === 0) {
          this.$router.push('/task')
        }
      } catch (err) {
        alert(err.message)
      }
    }
  }
}
</script>

<style lang="scss">
  .q-uploader {
    width: 100%;
    max-height: max-content
  }
</style>
