<template>
<div>
        <q-tabs
          dark
          dense
          narrow-indicator
          v-model="addTaskType"
        >
          <q-tab name="uri" :label="$t('uri-task')"/>
          <q-tab name="torrent" :label="$t('torrent-task')" />
        </q-tabs>
        <q-separator/>
        <q-tab-panels dark v-model="addTaskType" animated>
          <q-tab-panel name="uri">
            <q-input dark
              ref="uri"
              type="textarea"
              auto-complete="off"
              :placeholder="$t('uri-task-tips')"
              @change="handleUriChange"
              @paste.native="handleUriPaste"
              v-model="form.uris"
            ></q-input>
            <q-input dark
              :placeholder="$t('task-out-tips')"
              v-model="form.out"
              :label="$t('task-out')">
            </q-input>
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
          </q-tab-panel>
          <q-tab-panel name="torrent">
                    <select-torrent
                      v-on:change="handleTorrentChange"
                    />
          </q-tab-panel>
        </q-tab-panels>
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
        <q-btn @click="handleCancel('taskForm')">{{$t('cancel')}}</q-btn>
        <q-btn @click="submitForm('taskForm')">{{$t('submit')}}</q-btn>
</div>
</template>

<script>
import { mapState } from 'vuex'
import { isEmpty } from 'lodash'
import SelectDirectory from 'components/Native/SelectDirectory'
import SelectTorrent from 'components/Task/SelectTorrent'
import {
  NONE_SELECTED_FILES,
  SELECTED_ALL_FILES
} from 'src/shared/constants'
import { buildOuts } from 'src/shared/rename'
import {
  detectResource,
  splitTaskLinks
} from 'src/shared/utils'

const initialForm = (state) => {
  const { addTaskUrl, addTaskOptions } = state.app
  const { dir, split, newTaskShowDownloading } = state.preference.config
  const result = {
    uris: addTaskUrl,
    torrent: '',
    selectFile: NONE_SELECTED_FILES,
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
    [SelectTorrent.name]: SelectTorrent
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
      formLabelWidth: '100px',
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
    ...mapState('preference', {
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
    handleTabClick (tab, event) {
      this.$store.dispatch('app/changeAddTaskType', tab.name)
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
      this.form.torrent = torrent
      this.form.selectFile = selectedFileIndex
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
      if (isEmpty(torrent)) {
        throw new Error(this.$t('new-task-torrent-required'))
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
    submitForm (formName) {
      // this.$refs[formName].validate((valid) => {
      //   if (!valid) {
      //     return false
      //   }

      try {
        this.addTask(this.addTaskType, this.form)

        // this.$store.dispatch('app/hideAddTaskDialog')
        if (this.form.newTaskShowDownloading) {
          // this.$router.push({
          //   path: '/task/active'
          // })
          this.$router.push('/task')
        }
      } catch (err) {
        console.error(err.message)
      }
      // }
      // )
    }
  }
}
</script>

<style lang="scss">
</style>
