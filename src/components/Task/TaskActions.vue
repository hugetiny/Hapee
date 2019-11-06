<template>
    <q-btn-group spread>
      <q-btn  icon="add" @click="showAddTask('uri')">
        <q-tooltip>
          {{$t('new-task')}}
        </q-tooltip>
      </q-btn>
      <q-btn  icon="refresh" @click="onRefreshClick">
        <q-tooltip>
          {{$t('refresh-list')}}
        </q-tooltip>
      </q-btn>
      <q-btn  icon="arrow_downward" @click="onRemoveSelectedClick">
        <q-tooltip>
          {{$t('resume-task')}}
        </q-tooltip>
      </q-btn>
      <q-btn  icon="pause" @click="onPauseSelectedClick">
        <q-tooltip>
          {{$t('pause-task')}}
        </q-tooltip>
      </q-btn>
      <q-btn icon="delete" @click="onRemoveSelectedClick">
        <q-tooltip>
          {{$t('delete-task')}}
        </q-tooltip>
      </q-btn>
    </q-btn-group>
</template>

<script>
import { mapState } from 'vuex'
import {
  bytesToSize,
  timeFormat
} from 'src/shared/utils'

export default {
  name: 'mo-task-actions',
  props: ['task'],
  data: function () {
    return {
      refreshing: false
    }
  },
  computed: {
    ...mapState('task', {
      currentList: state => state.currentList
    })
  },
  filters: {
    bytesToSize,
    timeFormat
  },
  methods: {
    showAddTask (taskType = 'uri') {
      console.log('addtask')
      // this.$store.dispatch('app/showAddTaskDialog', taskType)
      this.$router.replace('/addtask')
    },
    refreshSpin: function () {
      this.t && clearTimeout(this.t)

      this.refreshing = true
      this.t = setTimeout(() => {
        this.refreshing = false
      }, 500)
    },
    onRefreshClick: function () {
      this.refreshSpin()
      this.$store.dispatch('task/fetchList')
    },
    onRemoveSelectedClick: function () {
      let tasks = []
      this.$store.state.task.selectedList.forEach((i) => {
        tasks.push(this.$store.state.task.taskList[i].gid)
      })
      this.$store.dispatch('task/removeTask', tasks)
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('remove-selected-task-fail'))
          }
        })
    },
    onResumeSelectedClick: function () {
      let tasks = []
      this.$store.state.task.selectedList.forEach((i) => {
        tasks.push(this.$store.state.task.taskList[i].gid)
      })
      this.$store.dispatch('task/resumeTask', tasks)
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('resume-selected-task-fail'))
          }
        })
    },
    onPauseSelectedClick: function () {
      let tasks = []
      this.$store.state.task.selectedList.forEach((i) => {
        tasks.push(this.$store.state.task.taskList[i].gid)
      })
      this.$store.dispatch('task/pauseTask', tasks)
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('resume-selected-task-fail'))
          }
        })
    },
    onResumeAllClick: function () {
      this.$store.dispatch('task/resumeAllTask')
        .then(() => {
          console.log(this.$t('resume-all-task-success'))
        })
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('resume-all-task-fail'))
          }
        })
    },
    onPauseAllClick: function () {
      this.$store.dispatch('task/pauseAllTask')
        .then(() => {
          console.log(this.$t('pause-all-task-success'))
        })
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('pause-all-task-fail'))
          }
        })
    },
    onPurgeRecordClick: function () {
      this.$store.dispatch('task/purgeTaskRecord')
        .then(() => {
          console.log(this.$t('purge-record-success'))
        })
        .catch(({ code }) => {
          if (code === 1) {
            console.error(this.$t('purge-record-fail'))
          }
        })
    }
  }
}
</script>
