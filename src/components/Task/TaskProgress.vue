<template>
  <el-progress
    v-if="status === 'active'"
    :percentage="percent"
    :show-text="false"
    status="success"
    :color="color">
  </el-progress>
  <el-progress
    v-else
    :percentage="percent"
    :show-text="false"
    :color="color">
  </el-progress>
</template>

<script>
  import { calcProgress } from '@/utils'
  import colors from '@/colors'

  export default {
    name: 'mo-task-progress',
    props: {
      total: {
        type: Number
      },
      completed: {
        type: Number
      },
      status: {
        type: String,
        default: 'active'
      }
    },
    computed: {
      percent: function () {
        return calcProgress(this.total, this.completed)
      },
      color: function () {
        return colors[this.status]
      }
    },
    methods: {
    }
  }
</script>

<style lang="scss">
  .el-progress-bar__outer{
    border-radius:0 !important;
    height: 3px !important;
  }
</style>
