<template>
  <nav class="subnav-inner">
    <h3>$t('subnav.task-list')</h3>
    <ul>
      <li
        @click="() => nav('active')"
        :class="[ current === 'active' ? 'active' : '' ]"
      >
        <i class="subnav-icon">
          <mo-icon name="task-start" width="20" height="20" />
        </i>
        <span>{{ $t('task.active') }}</span>
      </li>
      <li
        @click="() => nav('waiting')"
        :class="[ current === 'waiting' ? 'active' : '' ]"
      >
        <i class="subnav-icon">
          <mo-icon name="task-pause" width="20" height="20" />
        </i>
        <span>{{ $t('task.waiting') }}</span>
      </li>
      <li
        @click="() => nav('stopped')"
        :class="[ current === 'stopped' ? 'active' : '' ]"
      >
        <i class="subnav-icon">
          <mo-icon name="task-stop" width="20" height="20" />
        </i>
        <span>{{ $t('task.stopped') }}</span>
      </li>
    </ul>
  </nav>
  <nav class="subnav-inner">
    <h3>$t('subnav.preferences')</h3>
    <ul>
      <li
        @click="() => nav('basic')"
        :class="[ current === 'basic' ? 'active' : '' ]"
      >
        <i class="subnav-icon">
          <mo-icon name='preference-basic' width="20" height="20" />
        </i>
        <span>{{ $t('preferences.basic') }}</span>
      </li>
      <li
        @click="() => nav('advanced')"
        :class="[ current === 'advanced' ? 'active' : '' ]"
      >
        <i class="subnav-icon">
          <mo-icon name='preference-advanced' width="20" height="20" />
        </i>
        <span>{{ $t('preferences.advanced') }}</span>
      </li>
      <li
        @click="() => nav('lab')"
        :class="[ current === 'lab' ? 'active' : '' ]"
      >
        <i class="subnav-icon">
          <mo-icon name='preference-lab' width="20" height="20" />
        </i>
        <span>{{ $t('preferences.lab') }}</span>
      </li>
    </ul>
  </nav>
</template>

<script>
  import '@/components/Icons/task-start'
  import '@/components/Icons/task-pause'
  import '@/components/Icons/task-stop'
  import '@/components/Icons/preference-basic'
  import '@/components/Icons/preference-advanced'
  import '@/components/Icons/preference-lab'

  export default {
    name: 'mo-task-subnav',
    props: {
      current: {
        type: String,
        default: 'active'
      }
    },
    // computed: {
    //   title: function () {
    //     return this.$t('subnav.task-list')
    //   }
    // },
    methods: {
      nav: function (status = 'active') {
        this.$router.push({
          path: `/task/${status}`
        })
      }
    }
  }
</script>

<style lang="scss">
</style>
