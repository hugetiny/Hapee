<template>
 <div>todo</div>
</template>

<script>
import { mapState } from 'vuex'
import { isEmpty } from 'lodash'
import parseTorrent from 'parse-torrent'
import {
  NONE_SELECTED_FILES,
  SELECTED_ALL_FILES
} from 'src/shared/constants'
import {
  buildFileList,
  listTorrentFiles,
  bytesToSize,
  filterVideoFiles,
  filterAudioFiles,
  filterImageFiles,
  getAsBase64,
  removeExtensionDot
} from 'src/shared/utils'

export default {
  name: 'mo-select-torrent',
  components: {
  },
  filters: {
    bytesToSize,
    removeExtensionDot
  },
  props: {
  },
  data () {
    return {
      name: '',
      currentTorrent: '',
      files: [],
      selectedFiles: []
    }
  },
  computed: {
    ...mapState('preference', {
      config: state => state.config
    }),
    ...mapState('app', {
      torrents: state => state.addTaskTorrents
    }),
    isTorrentsEmpty: function () {
      return this.torrents.length === 0
    },
    selectedFilesCount: function () {
      return this.selectedFiles.length
    },
    selectedFilesTotalSize: function () {
      const result = this.selectedFiles.reduce((acc, cur) => {
        return acc + cur.length
      }, 0)
      return bytesToSize(result)
    },
    selectedFileIndex: function () {
      const { files, selectedFiles } = this
      if (files.length === 0 || selectedFiles.length === 0) {
        return NONE_SELECTED_FILES
      }
      if (files.length === selectedFiles.length) {
        return SELECTED_ALL_FILES
      }
      const indexArr = this.selectedFiles.map((item) => item.idx)
      const result = indexArr.join(',')
      return result
    }
  },
  watch: {
    torrents (fileList) {
      if (fileList.length === 0) {
        this.reset()
        return
      }

      const file = fileList[0]
      if (!file.raw) {
        return
      }

      parseTorrent.remote(file.raw, (err, parsedTorrent) => {
        if (err) throw err
        console.log(parsedTorrent)
        this.files = listTorrentFiles(parsedTorrent.files)
        this.$refs.torrentTable.toggleAllSelection()

        getAsBase64(file.raw, (torrent) => {
          this.name = file.name
          this.currentTorrent = torrent
          this.$emit('change', torrent, SELECTED_ALL_FILES)
        })
      })
    },
    selectedFileIndex () {
      const { currentTorrent, selectedFileIndex } = this
      this.$emit('change', currentTorrent, selectedFileIndex)
    }
  },
  methods: {
    reset () {
      this.name = ''
      this.currentTorrent = ''
      this.files = []
      if (this.$refs.torrentTable) {
        this.$refs.torrentTable.clearSelection()
      }
      this.$emit('change', '', NONE_SELECTED_FILES)
    },
    handleChange (file, fileList) {
      this.$store.dispatch('app/addTaskAddTorrents', { fileList })
    },
    handleExceed (files) {
      const fileList = buildFileList(files[0])
      this.$store.dispatch('app/addTaskAddTorrents', { fileList })
    },
    handleTrashClick () {
      this.$store.dispatch('app/addTaskAddTorrents', { fileList: [] })
    },
    toggleSelection (rows) {
      if (isEmpty(rows)) {
        this.$refs.torrentTable.clearSelection()
      } else {
        this.$refs.torrentTable.clearSelection()
        rows.forEach(row => {
          this.$refs.torrentTable.toggleRowSelection(row)
        })
      }
    },
    toggleVideoSelection () {
      const filtered = filterVideoFiles(this.files)
      this.toggleSelection(filtered)
    },
    toggleAudioSelection () {
      const filtered = filterAudioFiles(this.files)
      this.toggleSelection(filtered)
    },
    toggleImageSelection () {
      const filtered = filterImageFiles(this.files)
      this.toggleSelection(filtered)
    },
    handleRowDbClick (row, column, event) {
      this.$refs.torrentTable.toggleRowSelection(row)
    },
    handleSelectionChange (val) {
      this.selectedFiles = val
    }
  }
}
</script>

<style lang="scss">
</style>
