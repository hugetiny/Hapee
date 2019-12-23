<template>
  <div class="task" :key="task.gid"
       @click.exact.stop="singleSelect(index)"
       @click.shift.exact="shiftSelect(index)"
       @click.ctrl.exact="ctrlSelect(index)"
       @click.meta.exact="metaSelect(index)"
       @dblclick="onDbClick">
    <q-linear-progress :query="false" class="progress" :color="progressColor" :value="percent"/>
    <q-item  class="task-item"
            :class="{selected:selected}">
      <q-item-section avatar class="hidden-md-and-down">
        <q-icon name="folder" size="34px"/>
      </q-item-section>
      <q-item-section top>
        <q-item-label lines="1">
          <span>{{ taskFullName }}</span>
        </q-item-label>
        <q-item-label caption lines="1">
          <span>{{ task.status }}</span>
        </q-item-label>
        <!--      <q-item-label lines="1" class="q-mt-sm text-body2 text-weight-bold text-primary text-uppercase">-->
        <!--        <q-linear-progress style="height: 20px" :value="percent" />-->
        <!--      </q-item-label>-->
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
    <q-separator :spaced=false />
    <q-menu dark
            touch-position
            context-menu
    >

      <q-list dense style="min-width: 100px">
        <q-item clickable v-close-popup>
          <q-item-section>Open...</q-item-section>
        </q-item>
        <q-item clickable v-close-popup>
          <q-item-section>New</q-item-section>
        </q-item>
        <q-separator/>
        <q-item clickable>
          <q-item-section>Preferences</q-item-section>
          <q-item-section side>
            <q-icon name="keyboard_arrow_right"/>
          </q-item-section>

          <q-menu anchor="top right" self="top left">
            <q-list>
              <q-item
                v-for="n in 3"
                :key="n"
                dense
                clickable
              >
                <q-item-section>Submenu Label</q-item-section>
                <q-item-section side>
                  <q-icon name="keyboard_arrow_right"/>
                </q-item-section>
                <q-menu auto-close anchor="top right" self="top left">
                  <q-list>
                    <q-item
                      v-for="n in 3"
                      :key="n"
                      dense
                      clickable
                    >
                      <q-item-section>3rd level Label</q-item-section>
                    </q-item>
                  </q-list>
                </q-menu>
              </q-item>
            </q-list>
          </q-menu>

        </q-item>
        <q-separator/>
        <q-item clickable v-close-popup>
          <q-item-section>Quit</q-item-section>
        </q-item>
      </q-list>
    </q-menu>
  </div>
</template>

<script>
// import TaskItemActions from './TaskItemActions'

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
  // components: {
  //   [TaskItemActions.name]: TaskItemActions
  // [TaskProgress.name]: TaskProgress
  // },
  props: {
    task: {
      type: Object
    },
    index: {
      type: Number
    }
  },
  computed: {
    selected: function () {
      console.log(this.$store.state.task.selectedList)
      console.log(this.index)
      return this.$store.state.task.selectedList.includes(this.index)
    },
    progressColor: function () {
      switch (this.task.status) {
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
      console.log(this.task)
      if (status === 'complete') {
        this.openTask()
      } else if (status === 'waiting' || status === 'paused') {
        console.log(this.$store.dispatch('task/resumeTask', [this.task.gid]))
        return this.$store.dispatch('task/resumeTask', [this.task.gid])
      } else if (status === 'active') {
        return this.$store.dispatch('task/pauseTask', [this.task.gid])
      }
    },
    openTask () {
      const { taskName } = this
      console.info(this.$t('opening-task-message', { taskName }))
      const fullPath = getTaskFullPath(this.task)
      openItem(fullPath, {
        errorMsg: this.$t('file-not-exist')
      })
    }
  }
}
</script>

<style lang="scss">
  .task {
    height: 70px;

    hr.q-separator {
      transform: translateY(-70px);
    }

    .task-item {
      height: 70px;
      &.selected {
        background-color:$info;
      }
    }
  }

  .progress {
    height: 70px;
  }

  .task-item {
    transform: translateY(-70px);
  }
</style>
