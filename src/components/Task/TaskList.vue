<template>
  <q-list dark v-if="taskList.length > 0">
    <mo-task-item v-for="(task,index) in taskList" :key="task.gid" :task="task" :index="index" :class="{selected: selectedList.includes(index)}"/>
  </q-list>
  <div class="no-task" v-else>
    <div class="no-task-inner">
      {{ $t('no-task') }}
    </div>
  </div>

</template>

<script>
import { mapState } from 'vuex'
import TaskItem from './TaskItem'

export default {
  name: 'mo-task-list',
  components: {
    [TaskItem.name]: TaskItem
  },
  computed: {
    ...mapState('task', {
      taskList: state => state.taskList,
      selectedList: state => state.selectedList
    })
  },
  methods: {}
}
</script>

<style lang="scss">
</style>
