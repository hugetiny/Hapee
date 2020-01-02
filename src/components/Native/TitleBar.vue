<template>
  <div class="title-bar">
    <div class="title-bar-dragger"></div>
    <ul v-if="showActions" class="window-actions">
      <li @click="handleMinimize">
        minimize
      </li>
      <li @click="handleMaximize">
        maximize
      </li>
      <li @click="handleClose" class="win-close-btn">
        close
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'title-bar',
  props: {
    showActions: {
      type: Boolean
    }
  },
  computed: {
    win: function () {
      return this.$q.electron.remote.getCurrentWindow()
    }
  },
  methods: {
    handleMinimize: function () {
      this.win.minimize()
    },
    handleMaximize: function () {
      if (this.win.isMaximized()) {
        this.win.unmaximize()
      } else {
        this.win.maximize()
      }
    },
    handleClose: function () {
      this.win.close()
    }
  }
}
</script>
