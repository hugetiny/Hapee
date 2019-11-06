<template>
  <ul :key="task.gid" class="task-item-actions" v-on:dblclick.stop="() => null">
    <li v-for="action in taskActions" :key="action" class="task-item-action">
      <i v-if="action ==='PAUSE'" @click.stop="onPauseClick">
        task-pause-line
      </i>
      <i v-if="action ==='STOP'" @click.stop="onStopClick">
        task-stop-line
      </i>
      <i v-if="action === 'RESUME'" @click.stop="onResumeClick">
        task-start-line
      </i>
      <i v-if="action === 'RESTART'" @click="onRestartClick">
        task-restart
      </i>
      <i v-if="action === 'DELETE'" @click.stop="onDeleteClick">
        delete
      </i>
      <i v-if="action === 'TRASH'" @click.stop="onTrashClick">
        trash
      </i>
      <i v-if="action ==='FOLDER'" @click.stop="onFolderClick">
        folder
      </i>
      <i v-if="action ==='LINK'" @click.stop="onLinkClick">
        link
      </i>
<!--      <i v-if="action ==='INFO'" @click.stop="onInfoClick">-->
<!--        info-circle-->
<!--      </i>-->
      <i v-if="action ==='MORE'" @click.stop="onMoreClick">
        more
      </i>
    </li>
  </ul>
</template>

<script>
import * as clipboard from 'clipboard-polyfill'
import {
  showItemInFolder,
  moveTaskFilesToTrash
} from 'components/Native/utils'
import {
  checkTaskIsSeeder,
  getTaskFullPath,
  getTaskName,
  getTaskUri,
  parseHeader
} from 'src/shared/utils'

const taskActionsMap = {
  active: ['PAUSE', 'DELETE'],
  paused: ['RESUME', 'DELETE'],
  waiting: ['RESUME', 'DELETE'],
  error: ['RESTART', 'TRASH'],
  complete: ['RESTART', 'TRASH'],
  removed: ['RESTART', 'TRASH'],
  seeding: ['STOP', 'DELETE']
}

export default {
  name: 'mo-task-item-actions',
  props: {
    mode: {
      type: String,
      default: 'LIST'
    },
    task: {
      type: Object,
      required: true
    }
  },
  computed: {
    taskName () {
      return getTaskName(this.task)
    },
    path () {
      return getTaskFullPath(this.task)
    },
    isSeeder () {
      return checkTaskIsSeeder(this.task)
    },
    taskStatus () {
      const { task, isSeeder } = this
      if (isSeeder) {
        return 'seeding'
      } else {
        return task.status
      }
    },
    taskCommonActions () {
      let result = this.$q.platform.is.desktop ? ['FOLDER'] : []
      result = (this.mode === 'LIST')
        ? [...result, 'LINK', 'INFO']
        : [...result, 'LINK']

      return result
    },
    taskActions () {
      const { taskStatus, taskCommonActions } = this
      const actions = taskActionsMap[taskStatus] || []
      const result = [...actions, ...taskCommonActions].reverse()
      return result
    }
  },
  methods: {
    deleteTaskFiles (task) {
      moveTaskFilesToTrash(task, {
        pathErrorMsg: this.$t('file-path-error'),
        delFailMsg: this.$t('remove-task-file-fail'),
        delConfigFailMsg: this.$t('remove-task-config-file-fail')
      })
    },
    removeTaskItem (task, isRemoveWithFiles) {
      this.$store.dispatch('task/removeTask', [this.task.gid])
        .then(() => {
          if (isRemoveWithFiles) {
            this.deleteTaskFiles(task)
          }
          console.log(this.$t('delete-task-success', {
            taskName: this.taskName
          }))
        })
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('delete-task-fail', {
              taskName: this.taskName
            }))
          }
        })
    },
    removeTaskRecord (task, isRemoveWithFiles) {
      this.$store.dispatch('task/removeTaskRecord', this.task)
        .then(() => {
          if (isRemoveWithFiles) {
            this.deleteTaskFiles(task)
          }
          console.log(this.$t('remove-record-success', {
            taskName: this.taskName
          }))
        })
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('remove-record-fail', {
              taskName: this.taskName
            }))
          }
        })
    },
    onResumeClick () {
      this.$store.dispatch('task/resumeTask', [this.task.gid])
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('resume-task-fail', {
              taskName: this.taskName
            }))
          }
        })
    },
    onRestartClick (event) {
      const { task, taskName } = this
      const { gid, status } = task
      const uri = getTaskUri(task)
      const isNeedShowDialog = status === 'complete' || !!event.altKey
      this.$store.dispatch('task/getTaskOption', gid)
        .then((data) => {
          console.log('getTaskOption===>', data)
          const { dir, header, split } = data
          const options = {
            dir,
            header,
            split,
            out: taskName
          }

          if (isNeedShowDialog) {
            this.showAddTaskDialog(uri, options)
          } else {
            this.directAddTask(uri, options)
            this.$store.dispatch('task/removeTaskRecord', task)
          }
        })
    },
    directAddTask (uri, options = {}) {
      const uris = [uri]
      const payload = {
        uris,
        options: {
          ...options
        }
      }
      this.$store.dispatch('task/addUri', payload)
        .catch((err) => {
          console.error(err.message)
        })
    },
    showAddTaskDialog (uri, options = {}) {
      const {
        header,
        ...rest
      } = options

      const headers = parseHeader(header)
      const newOptions = {
        ...rest,
        ...headers
      }

      this.$store.dispatch('app/updateAddTaskUrl', uri)
      this.$store.dispatch('app/updateAddTaskOptions', newOptions)
      this.$store.dispatch('app/showAddTaskDialog', 'uri')
    },
    onPauseClick () {
      this.pauseTask()
    },
    onStopClick () {
      this.stopSeeding()
    },
    stopSeeding () {
      if (!this.isSeeder) {
        return
      }
      this.$store.dispatch('task/stopSeeding', this.task)
    },
    pauseTask () {
      const { taskName } = this
      console.info(this.$t('download-pause-message', { taskName }))
      this.$store.dispatch('task/pauseTask', [this.task.gid])
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('pause-task-fail', { taskName }))
          }
        })
    },
    onDeleteClick () {
      // const self = this
      // const { task } = this
      let r = confirm(this.$t('delete-task-confirm', { taskName: this.taskName }))
      if (r === true) {
        this.removeTaskItem(this.task, true)
      }
    },
    onTrashClick () {
      // const self = this
      // const { task } = this
      let r = confirm(this.$t('remove-record-confirm', { taskName: this.taskName }))
      if (r === true) {
        this.removeTaskRecord(this.task, true)
      }
    },
    onFolderClick () {
      showItemInFolder(this.path, {
        errorMsg: this.$t('file-not-exist')
      })
    },
    onLinkClick () {
      this.$store.dispatch('app/fetchEngineOptions')
        .then((data) => {
          const { btTracker } = data
          const uri = getTaskUri(this.task, btTracker)
          clipboard.writeText(uri)
            .then(() => {
              console.log(this.$t('copy-link-success'))
            })
        })
    },
    onInfoClick () {
      this.$store.dispatch('task/showTaskItemInfoDialog', this.task)
    },
    onMoreClick () {
      console.log('onMoreClick===>')
    }
  }
}
</script>

<style lang="scss">
</style>
