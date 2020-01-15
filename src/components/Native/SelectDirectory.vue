<template>
  <q-input dark
           v-model="dir"
           :readonly="$q.platform.is.mac"
           :label="$t('default-dir')"
  >
    <template v-slot:append>
      <q-icon
        name="folder"
        @click.stop="onFolderClick"/>
    </template>
  </q-input>
</template>

<script>
export default {
  name: 'select-directory',
  computed: {
    dir: {
      get: function () {
        console.log(this.$store.state.task.config.dir)
        return this.$store.state.task.config.dir
      },
      set: function (dir) {
        console.log(dir)
        this.$store.commit('task/UPDATE_LOCAL', { dir: dir })
        this.$store.dispatch('task/save', { dir: dir })
      }
    }
  },
  methods: {
    onFolderClick: function () {
      this.$q.electron.remote.dialog.showOpenDialog({
        properties: ['openDirectory']
      }, (directory) => {
        if (!directory) {
          return
        }
        this.$store.commit('task/UPDATE_LOCAL', { dir: directory })
      })
    }
  }
}
</script>

<style lang="scss">
</style>
