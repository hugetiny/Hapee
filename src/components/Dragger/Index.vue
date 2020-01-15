<template>
  <div v-if="false"></div>
</template>

<script>
export default {
  name: 'dragger',
  mounted () {
    this.preventDefault = ev => ev.preventDefault()
    let count = 0
    this.onDragEnter = (ev) => {
      if (count === 0) {
        // this.$store.dispatch('app/showAddTaskDialog', 'torrent')
        console.log(ev)
        this.$router.push('/addTask')
      }
      count++
    }

    this.onDragLeave = (ev) => {
      count--
      if (count === 0) {
        // this.$store.dispatch('app/hideAddTaskDialog')
        console.log('dont add file')
      }
    }

    this.onDrop = (ev) => {
      count = 0

      const fileList = [...ev.dataTransfer.files]
        .map(item => ({ raw: item, name: item.name }))
        .filter(item => /\.torrent$/.test(item.name))
      if (!fileList.length) {
        console.error(this.$t('select-torrent'))
      }
    }

    document.addEventListener('dragover', this.preventDefault)
    document.body.addEventListener('dragenter', this.onDragEnter)
    document.body.addEventListener('dragleave', this.onDragLeave)
    document.body.addEventListener('drop', this.onDrop)
  },
  destroyed () {
    document.removeEventListener('dragover', this.preventDefault)
    document.body.removeEventListener('dragenter', this.onDragEnter)
    document.body.removeEventListener('dragleave', this.onDragLeave)
    document.body.removeEventListener('drop', this.onDrop)
  }
}
</script>
