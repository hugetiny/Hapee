<template>
  <i @click.stop="onFolderClick">
    folder
  </i>
</template>

<script>
export default {
  name: 'show-in-folder',
  props: {
    path: {
      type: String
    }
  },
  computed: {
  },
  methods: {
    onFolderClick: function () {
      if (!this.path) {
        return
      }
      this.$q.electron.shell.showItemInFolder(this.path, {
        errorMsg: this.$t('file-not-exist')
      })
    }
  }
}
</script>

<style lang="scss">
</style>
