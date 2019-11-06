<template>
  <div>
    <mo-task-actions />
    <mo-task-list />
  </div>
</template>

<script>
// import TaskSubnav from 'components/Subnav/TaskSubnav'
import TaskActions from 'components/Task/TaskActions'
import TaskList from 'components/Task/TaskList'

export default {
  name: 'mo-content-task',
  components: {
    // [TaskSubnav.name]: TaskSubnav,
    [TaskActions.name]: TaskActions,
    [TaskList.name]: TaskList
  },
  props: {
    status: {
      type: String,
      default: 'active'
    }
  },
  computed: {
    title: function () {
      const titles = {
        'active': this.$t('active'),
        'waiting': this.$t('waiting'),
        'stopped': this.$t('stopped')
      }
      return titles[this.status]
    }
  },
  watch: {
    'status': 'onStatusChange'
  },
  methods: {
    onStatusChange () {
      this.changeCurrentList()
    },
    changeCurrentList () {
      this.$store.dispatch('task/changeCurrentList', this.status)
    }
  },
  created: function () {
    this.changeCurrentList()
  }
}
</script>

<style lang="scss">
</style>
