<template>
  <q-table
    dark
    :loading="loading"
    :data="taskList"
    :columns="columns"
    row-key="name"
    :pagination.sync='pagination'
    :filter="filter"
    :no-data-label="$t('no-task')"
  >
    <template v-slot:top-left>
      <!--      <q-btn-group spread>-->
      <q-btn icon="add" @click.stop="showAddTask('uri')">
        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
          {{$t('new-task')}}
        </q-tooltip>
      </q-btn>
<!--      <q-btn  icon="arrow_downward" @click="onRemoveSelectedClick">-->
<!--        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">-->
<!--          {{$t('resume-task')}}-->
<!--        </q-tooltip>-->
<!--      </q-btn>-->
      <q-btn icon="pause" @click.stop="onPauseAllClick">
        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
          {{$t('pause-all-task')}}
        </q-tooltip>
      </q-btn>
      <q-btn icon="play_arrow" @click.stop="onResumeAllClick">
        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
          {{$t('resume-all-task')}}
        </q-tooltip>
      </q-btn>
      <q-btn icon="refresh" v-if="$route.path === '/task/stopped'" @click.stop="restartErrorTasks">
        <q-tooltip content-style="font-size: 12px" transition-show="scale"
                   transition-hide="scale">
          {{$t('restart-all')}}
        </q-tooltip>
      </q-btn>
<!--      <q-btn icon="delete" @click="onDeleteClick">-->
<!--        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">-->
<!--          {{$t('delete-task')}}-->
<!--        </q-tooltip>-->
<!--      </q-btn>-->
    </template>
    <template v-slot:top-right>
      <q-input dark dense debounce="300" v-model="filter" :placeholder="$t('Filter')">
        <template v-slot:append>
          <q-icon name="search" />
        </template>
      </q-input>
    </template>
    <template v-slot:body="props">
      <q-linear-progress :query="false" class="progress" :color="props.row.color" :value="props.row.percent"/>
      <q-tr class="task" :props="props" @dblclick="onDbClick(props.row.task,props.row.name)">
        <!--          <q-td auto-width>-->
        <!--            <q-toggle dense v-model="props.selected" />-->
        <!--          </q-td>-->
<!--        <q-td class="action" key="action" :props="props">-->
<!--          &lt;!&ndash;            <q-btn-group >&ndash;&gt;-->
<!--          &lt;!&ndash;              <q-btn size="md" dense color="primary" label="One" />&ndash;&gt;-->
<!--          &lt;!&ndash;              <q-btn size="md" dense color="primary" label="Two " />&ndash;&gt;-->
<!--          &lt;!&ndash;            </q-btn-group>&ndash;&gt;-->
<!--          &lt;!&ndash;            <div class="q-gutter-md" >&ndash;&gt;-->
<!--          <q-btn dense round flat icon="arrow_downward"/>-->
<!--          &lt;!&ndash;            <q-btn dense round flat icon="cloud"/>&ndash;&gt;-->
<!--          &lt;!&ndash;            </div>&ndash;&gt;-->
<!--        </q-td>-->
        <q-td key="name" class="name" :props="props">
<!--          <q-btn dense round flat :icon="props.expand ? 'arrow_drop_up' : 'arrow_drop_down'" @click="props.expand = !props.expand" />-->
          {{ props.row.name }}
          <!--            <q-popup-edit dark v-model="props.row.name">-->
          <!--              <q-input :placeholder="props.row.name" label="Local file name" autofocus counter />-->
          <!--            </q-popup-edit>-->
          <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
            {{ props.row.name }}
          </q-tooltip>
        </q-td>
        <q-td  key="size" class="size" :props="props">{{ props.row.size }}</q-td>
<!--        <q-td   key="popularity" :props="props">{{ props.row.popularity }}</q-td>-->
        <q-td v-if="$q.screen.gt.sm" key="remain"  class="remain" :props="props" >{{ props.row.remain }}</q-td>
        <q-td  key="speed"  class="speed" :props="props">{{ props.row.speed }}</q-td>
        <q-td key="actions" class="actions"  :props="props">
          <q-btn  v-if="props.row.task.status === 'active'" icon="pause" @click="pauseTask([props.row.task.gid])">
            <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
              {{$t('pause-task')}}
            </q-tooltip>
          </q-btn>
          <q-btn  v-else-if="props.row.task.status === 'paused' || props.row.task.status === 'waiting'" icon="play_arrow" @click="resumeTask([props.row.task.gid])">
            <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
              {{$t('resume-task')}}
            </q-tooltip>
          </q-btn>
          <q-btn  v-else-if="props.row.task.status === 'error' || props.row.task.status === 'complete'" icon="refresh" @click="restartTask(props.row.task,props.row.name)">
            <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
              {{$t('restart')}}
            </q-tooltip>
          </q-btn>
          <q-btn  icon="delete" @click="onDeleteClick([props.row.task],[props.row.name])">
            <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">
              {{$t('delete-task')}}
            </q-tooltip>
          </q-btn>
        </q-td>

      </q-tr>
    </template>
    <template v-slot:bottom>
<!--      <br/>-->
    </template>
  </q-table>
</template>

<script>
import { mapState, mapActions } from 'vuex'
// import TaskItem from './TaskItem'
import {
  getTaskName,
  getTaskFullPath,
  timeRemaining,
  bytesToSize,
  calcProgress,
  parseHeader,
  getTaskUri
} from 'src/shared/utils'
import {
  openItem,
  showItemInFolder,
  moveTaskFilesToTrash
} from 'components/Native/utils'
// import { date } from 'quasar'
// import suffix from 'src/shared/suffix'

export default {
  mounted () {
    this.loading = false
    console.log(this.currentList)
  },
  data () {
    return {
      filter: '',
      pagination: { rowsPerPage: 0 },
      loading: true
    }
  },
  name: 'task-list',
  computed: {
    ...mapState('task', {
      currentList: state => state.currentList
    }),
    columns: function () {
      let cols = [
        {
          name: 'name',
          label: this.$t('file-name'),
          align: 'left',
          field: 'name'
        },
        {
          name: 'size',
          label: this.$t('file-size'),
          align: 'left',
          field: 'size'
        },
        {
          name: 'speed',
          label: this.$t('Download Speed'),
          align: 'left',
          field: 'speed'
        },
        {
          name: 'actions',
          label: '',
          align: 'left',
          field: 'actions'
        }
      ]
      if (this.$q.screen.gt.sm) {
        cols.splice(2, 0, {
          name: 'remain',
          label: this.$t('Estimated time'),
          align: 'left',
          field: 'remain'
        })
      }
      return cols
    },
    taskList: function () {
      let tasklist
      if (this.$route.path !== '/task/stopped') {
        tasklist = this.$store.state.task.taskList.filter(task => task.totalLength === '0' ? true : task.completedLength !== task.totalLength)
      } else {
        tasklist = this.$store.state.task.taskList
      }
      return tasklist.map(
        task => {
          return {
            'name': getTaskName(task, {
              defaultName: this.$t('get-task-name')
            }),
            'size': `${bytesToSize(task.completedLength)}/${bytesToSize(task.totalLength)}`,
            'remain': task.status === 'active' ? timeRemaining(task.totalLength, task.completedLength, task.downloadSpeed, this.$t('gt1d')) : task.errorMessage,
            'speed': task.status === 'active' ? bytesToSize(task.downloadSpeed) + '/s' : '',
            'color': this.progressColor(task.status),
            'percent': this.percent(task.totalLength, task.completedLength),
            'isMedia': false,
            'task': task
          }
        })
    },
    selected: function () {
      console.log(this.$store.state.task.selectedList)
      console.log(this.index)
      return this.$store.state.task.selectedList.includes(this.index)
    }
  },

  methods: {
    // TODO context menu
    // SINGLE_SELECT (state, index) {
    //   if (state.selectedList.includes(index) && state.selectedList.length === 1) {
    //     state.selectedList = []
    //   } else {
    //     state.selectedList = [index]
    //   }
    // },
    // SHIFT_SELECT (state, index) {
    //   if (state.selectedList.length !== 0) {
    //     let min, max
    //     min = Math.min(Math.min(...state.selectedList), index)
    //     max = Math.max(Math.min(...state.selectedList), index)
    //
    //     state.selectedList = []
    //     for (let i = min; i <= max; i++) {
    //       state.selectedList.push(i)
    //     }
    //   } else {
    //     state.selectedList = [index]
    //   }
    // },
    // CTRL_SELECT (state, index) {
    //   if (state.selectedList.includes(index)) {
    //     state.selectedList.splice(state.selectedList.indexOf(index), 1)
    //   } else {
    //     state.selectedList.push(index)
    //   }
    //   // console.log(state.selectedList)
    // },
    // META_SELECT (state, index) {
    //   if (state.selectedList.includes(index)) {
    //     state.selectedList.splice(state.selectedList.indexOf(index), 1)
    //   } else {
    //     state.selectedList.push(index)
    //   }
    //   // console.log(state.selectedList)
    // },
    ...mapActions('task', [
      'resumeTask', 'pauseTask', 'removeTask'
    ]),
    progressColor: function (status) {
      switch (status) {
        case 'active':
          return 'positive'
        case 'complete':
          return 'positive'
        case 'error':
          return 'negative'
        case 'paused':
          return 'warning'
        case 'waiting':
          return 'warning'
        default:
          return 'positive'
      }
    },
    percent: function (totalLength, completedLength) {
      return calcProgress(totalLength, completedLength)
    },
    singleSelect () {
      // this.$store.dispatch('task/singleSelect', index)
    },
    shiftSelect (index) {
      this.$store.dispatch('task/shiftSelect', index)
    },
    ctrlSelect (index) {
      this.$store.dispatch('task/ctrlSelect', index)
    },
    metaSelect (index) {
      this.$store.dispatch('task/metaSelect', index)
    },
    onDbClick (task, taskName) {
      const { status, gid } = task
      console.log(task)
      if (status === 'complete') {
        const fullPath = getTaskFullPath(task)
        // TODO other types?
        if (task.bittorrent) {
          showItemInFolder(fullPath)
        } else {
          openItem(fullPath)
        }
      } else if (status === 'waiting' || status === 'paused') {
        return this.$store.dispatch('task/resumeTask', [gid])
          .catch(({ code }) => {
            console.error(this.$t('resume-task-fail', code))
          })
      } else if (status === 'active') {
        return this.$store.dispatch('task/pauseTask', [gid])
          .catch(({ code }) => {
            console.error(this.$t('pause-task-fail', code))
          })
      } else if (status === 'error' || status === 'removed') {
        return this.restartTask(task)
      }
    },
    // taskactions
    showAddTask (taskType = 'uri') {
      console.log('addtask')
      // this.$store.dispatch('app/showAddTaskDialog', taskType)
      this.$router.push('/addtask')
    },

    restartTask (task) {
      const { gid } = task
      const taskName = getTaskName(task)
      const uri = getTaskUri(task)
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

          if (task.status === 'complete') {
            this.showAddTaskDialog(uri, options)
          } else {
            this.directAddTask(uri, options)
            this.$store.dispatch('task/removeTaskRecord', [task.gid])
            this.$router.push('/task')
          }
        })
    },
    restartErrorTasks () {
      this.$store.state.task.taskList.forEach(task => {
        if (task.status === 'error') {
          this.restartTask(task)
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
    },
    // actions
    deleteTaskFiles (task) {
      moveTaskFilesToTrash(task, {
        pathErrorMsg: this.$t('file-path-error'),
        delFailMsg: this.$t('remove-task-file-fail'),
        delConfigFailMsg: this.$t('remove-task-config-file-fail')
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
      // this.$store.dispatch('app/showAddTaskDialog', 'uri')
      this.$router.push('/addtask')
    },
    onDeleteClick (tasks, taskNames) {
      // const self = this
      // const { task } = this
      console.log(taskNames)
      let r = confirm(this.$t('delete-task-confirm', { taskName: taskNames.toString() }))
      if (r === true) {
        let removeGids = [],
          removeGidRecords = []
        for (let i = 0; i < tasks.length; i++) {
          if (tasks[i].status === 'active' || tasks[i].status === 'paused' || tasks[i].status === 'waiting') {
            removeGids.push(tasks[i].gid)
          } else if (tasks[i].status === 'error' || tasks[i].status === 'complete' || tasks[i].status === 'removed') {
            removeGidRecords.push(tasks[i].gid)
          }
        }
        if (removeGids) {
          this.$store.dispatch('task/removeTask', removeGids)
            .then(() => {
              tasks.forEach(task =>
                this.deleteTaskFiles(task)
              )
              console.log(this.$t('delete-task-success'))
            })
            .catch(({ code }) => {
              console.error(this.$t('delete-task-fail'), code)
            })
        } else if (removeGidRecords) {
          this.$store.dispatch('task/removeTaskRecord', removeGidRecords)
            .then(() => {
              tasks.forEach(task =>
                this.deleteTaskFiles(task)
              )
              console.log(this.$t('task.remove-record-success'))
            })
            .catch(({ code }) => {
              console.error(this.$t('task.remove-record-fail'), code)
            })
        }
      }
    }
  }
}
</script>

<style lang="scss">
  table tr.task {
    td {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      /*max-width: 4vw;*/
      &.name {
        max-width: 20vw;
      }
      &.size {
        width: 12vw;
      }
      &.remain {
        width: 10vw;
      }
      &.speed {
        width: 6vw;
      }
      &.actions {
        width: 6vw;
      }
    }
  }
  .progress {
    height: 50px;
    position:absolute;
  }
</style>
