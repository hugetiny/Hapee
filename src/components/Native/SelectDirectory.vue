<template>
  <q-icon
    name="folder"
    @click.stop="onFolderClick"/>
</template>

<script>

export default {
  name: 'mo-select-directory',
  props: {
  },
  methods: {
    onFolderClick: function () {
      const self = this
      this.$q.electron.remote.dialog.showOpenDialog({
        properties: ['openDirectory']
      }, (filePaths) => {
        if (!filePaths) {
          return
        }
        const [path] = filePaths
        self.$emit('selected', path)
      })
    }
  }
}
</script>

<style lang="scss">
</style>
