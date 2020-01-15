<template>
  <q-uploader
    dark
    v-if="isTorrentsEmpty"
    :label="$t('select-torrent')"
    accept=".torrent"
    :max-file-size="8192000"
    hide-upload-btn
    @added="added"
  >
    <template v-if="files.length" v-slot:list="scope">
      <q-table
        flat
        dark
        :data="files"
        :columns="cols"
        row-key="name"
        :pagination.sync='pagination'
        :filter="filter"
        :no-data-label="$t('no-task')"
        selection="multiple"
        :selected.sync="selected">
<!--        <template v-slot:top>-->
<!--          11-->
<!--        </template>-->
        <template v-slot:top-left>
          <div @click="dialog">1111111111</div>
          <div>{{selectedRowsLabel}}</div>
          <q-toggle v-for="ext in exts" @input="filterExt(value,ext)" value="true" :label="ext" />
        </template>
        <template v-slot:top-right>
          <q-input dark dense debounce="300" v-model="filter" :placeholder="$t('Filter')">
            <template v-slot:append>
              <q-icon name="search" />
            </template>
          </q-input>
        </template>
        <template v-slot:bottom>
        <!--      <br/>-->
        </template>
      </q-table>
    </template>
  </q-uploader>

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
  bytesToSize,
  // filterVideoFiles,
  // filterAudioFiles,
  // filterImageFiles,
  // getAsBase64,
  removeExtensionDot
} from 'src/shared/utils'

export default {
  name: 'select-torrent',
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
      selected: [],
      filter: '',
      pagination: { rowsPerPage: 0 },
      cols: [
        {
          name: 'name',
          label: this.$t('file-name'),
          align: 'left',
          field: 'name'
        },
        {
          name: 'ext',
          label: this.$t('file-extension'),
          align: 'left',
          field: 'ext'
        },
        {
          name: 'size',
          label: this.$t('file-size'),
          align: 'left',
          field: 'size'
        }
      ],
      files: [],
      exts: []
      // name: '',
      // currentTorrent: '',
      // files: []
    }
  },
  computed: {
    ...mapState('task', {
      config: state => state.config
    }),
    ...mapState('app', {
      torrents: state => state.addTaskTorrents
    }),
    // filterExt: {
    //   get: function (ext) {
    //     console.log(ext)
    //     return true
    //   },
    //   set: function (ext) {
    //     this.updateAll({ protocols: { magnet: this.config.protocols.magnet, thunder: value } })
    //   }
    // },
    selectedRowsLabel: function () {
      if (this.selected.length) {
        console.log(this.selected)
        return this.$t('selected-files-sum', { selectedFilesCount: this.selected.length, selectedFilesTotalSize: this.selectedFilesTotalSize })
      } else {
        return ''
      }
    },
    isTorrentsEmpty: function () {
      return this.torrents.length === 0
    },

    selectedFilesTotalSize: function () {
      return bytesToSize(this.selected.reduce((total, file) => {
        return total + file.sizeByte
      }, 0))
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
  methods: {
    dialog () {
      this.$q.dialog({

        title: 'Alert',
        message: 'Some message'
      }).onOk(() => {
        console.log('OK')
      }).onCancel(() => {
        console.log('Cancel')
      }).onDismiss(() => {
        console.log('I am triggered on both OK and Cancel')
      })
      this.$q.dialog({

        title: 'Alert',
        message: 'Some message'
      }).onOk(() => {
        console.log('OK')
      }).onCancel(() => {
        console.log('Cancel')
      }).onDismiss(() => {
        console.log('I am triggered on both OK and Cancel')
      })
    },
    // reset () {
    //   this.name = ''
    //   this.currentTorrent = ''
    //   this.files = []
    //   if (this.$refs.torrentTable) {
    //     this.$refs.torrentTable.clearSelection()
    //   }
    //   this.$emit('change', '', NONE_SELECTED_FILES)
    // },
    added (torrents) {
      // this.$store.dispatch('app/addTaskAddTorrents', { fileList })
      if (torrents.length === 0) {
        // this.reset()
        return
      }
      console.log(torrents)
      const file = torrents[0]

      parseTorrent.remote(file.path, (err, parsedTorrent) => {
        if (err) throw err
        console.log(parsedTorrent)
        this.files = parsedTorrent.files.map(file => {
          const ext = file.name.replace(/.+\.(.+)/, '$1')
          this.exts.push(ext)
          return {
            name: file.name,
            ext: ext,
            sizeByte: file.length,
            size: bytesToSize(file.length)
          }
        })
        this.exts = Array.from(new Set(this.exts))
        this.selected = [...this.files]
        // this.selectedFilesTotalSize = bytesToSize(parsedTorrent.length)
        // this.$refs.torrentTable.toggleAllSelection()

        // getAsBase64(file.path, (torrent) => {
        //   console.log(torrent)
        //   this.name = file.name
        //   // this.currentTorrent = torrent
        //   // this.$emit('change', torrent, 'all')
        // })
      })
    },
    filterExt (value, ext) {
      console.log(value)
      console.log(ext)
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
    // TODO filtering file exts

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
  .q-uploader{
    width:100%;
    max-height:max-content
  }
</style>
