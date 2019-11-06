<template>
<div>
  <q-item :key="task.gid" class="task-item" @click.exact="singleSelect(index)"  @click.shift.exact="shiftSelect(index)" @click.ctrl.exact="ctrlSelect(index)"  @click.meta.exact="metaSelect(index)"  @dblclick="onDbClick"  >
    <q-item-section avatar class="hidden-md-and-down">
      <q-icon name="info" size="34px" />
    </q-item-section>
    <q-item-section top>
      <q-item-label lines="1">
        <span>{{ taskFullName }}</span>
      </q-item-label>
      <q-item-label caption lines="1">
        <span>{{ task.status }}</span>
      </q-item-label>
      <q-item-label lines="1" class="q-mt-sm text-body2 text-weight-bold text-primary text-uppercase">
        <q-linear-progress :value="percent" />
      </q-item-label>
      <q-item-label lines="1" class="q-mt-xs text-body2 text-weight-bold text-primary text-uppercase">
                  <span v-if="task.totalLength > 0">
                    {{ task.completedLength | bytesToSize }} / {{ task.totalLength | bytesToSize }}
                  </span>
                  <span v-else>
                    {{ task.errorMessage }}
                  </span>
                  <span v-if="task.status ==='active'">-->
                      {{ task.downloadSpeed | bytesToSize }}/s
                        {{
                          remaining | timeFormat({
                            prefix: $t('remaining-prefix'),
                            i18n: {
                              'gt1d': $t('gt1d'),
                              'hour': $t('hour'),
                              'minute': $t('minute'),
                              'second': $t('second')
                            }
                          })
                        }}
                  </span>
      </q-item-label>
    </q-item-section>
  </q-item>
  <q-separator spaced />
</div>
</template>

<script>
import TaskItemActions from './TaskItemActions'
// import TaskProgress from './TaskProgress'
import {
  getTaskName,
  getTaskFullPath,
  timeRemaining,
  bytesToSize,
  timeFormat,
  calcProgress
} from 'src/shared/utils'
import {
  openItem
} from 'components/Native/utils'

export default {
  name: 'mo-task-item',
  components: {
    [TaskItemActions.name]: TaskItemActions
    // [TaskProgress.name]: TaskProgress
  },
  props: {
    task: {
      type: Object
    },
    index: {
      type: Number
    }
  },
  computed: {
    // selected: function () {
    //   return this.$store.state.task.selected
    // },
    percent: function () {
      // Number(task.completedLength/task.totalLength)
      // console.log(this.task.totalLength)
      // console.log(this.task.completedLength)
      return calcProgress(this.task.totalLength, this.task.completedLength)
    },
    taskFullName: function () {
      return getTaskName(this.task, {
        defaultName: this.$t('get-task-name'),
        maxLen: -1
      })
    },
    taskName: function () {
      return getTaskName(this.task, {
        defaultName: this.$t('get-task-name')
      })
    },
    remaining: function () {
      const { totalLength, completedLength, downloadSpeed } = this.task
      return timeRemaining(totalLength, completedLength, downloadSpeed)
    }
  },
  filters: {
    bytesToSize,
    timeFormat
  },
  methods: {
    singleSelect (index) {
      this.$store.dispatch('task/singleSelect', index)
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
    onDbClick () {
      const { status } = this.task
      if (status === 'complete') {
        this.openTask()
      } else if (['waiting', 'paused'].includes(status) !== -1) {
        this.toggleTask()
      }
    },
    openTask () {
      const { taskName } = this
      console.info(this.$t('opening-task-message', { taskName }))
      const fullPath = getTaskFullPath(this.task)
      openItem(fullPath, {
        errorMsg: this.$t('file-not-exist')
      })
    },
    toggleTask () {
      this.$store.dispatch('task/toggleTask', this.task)
    }
  }
}
</script>

<style lang="scss">
</style>
