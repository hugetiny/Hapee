<template>
  <q-dialog ref="dialog" @hide="onDialogHide">
<q-table
  class="q-dialog-plugin"
  dense
  flat
  dark
  :data="files"
  :columns="cols"
  row-key="name"
  :pagination.sync='pagination'
  :no-data-label="$t('no-task')"
  selection="multiple"
  :selected.sync="selected">
  <!--        <template v-slot:top>-->
  <!--          11-->
  <!--        </template>-->
  <template v-slot:top>
    <div>
      {{selectedRowsLabel}}
    </div>
    <q-toggle v-for="ext in exts" @input="filterExt(ext)" v-model="selectedExt" :val="ext" :label="ext" :key="ext" />
  </template>
<!--  TODO click line to toggle select-->
  <template v-slot:bottom>
    <q-btn label="OK" @click="onOKClick" />
    <q-btn label="Cancel" @click="onCancelClick" />
  </template>
</q-table>
  </q-dialog>
</template>
<script>
// import suffix from 'src/shared/suffix'
import {
  bytesToSize
  // filterVideoFiles,
  // filterAudioFiles,
  // filterImageFiles,
  // getAsBase64
} from 'src/shared/utils'
export default {
  name: 'torrent-detail',
  components: {},
  filters: {
    bytesToSize
  },
  props: {
    files: {
      type: Array
    },
    exts: {
      type: Array
    },
    torrentBase64: {
      type: String,
      default: ''
    }
  },
  data () {
    // const defaultExts = [...suffix.video, ...suffix.caption, ...suffix.application, ...suffix.archive]
    // const selected = this.files
    return {
      // defaultExts: defaultExts,
      pagination: { rowsPerPage: 0 },
      selected: this.files,
      selectedExt: this.exts,
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
      ]
    }
  },
  computed: {
    // selected:{
    //   get () {
    //     return this.files
    //   },
    //   set (value) {
    //     this.$store.commit('app/CHANGE_ADD_TASK_VISIBLE', value)
    //   }
    // }
    selectedFilesTotalSize: function () {
      return bytesToSize(this.selected.reduce((total, file) => {
        return total + file.sizeByte
      }, 0))
    },
    selectedRowsLabel: function () {
      if (this.selected.length) {
        console.log(this.selected)
        return this.$t('selected-files-sum', { selectedFilesCount: this.selected.length, selectedFilesTotalSize: this.selectedFilesTotalSize })
      } else {
        return ''
      }
    }
  },
  methods: {
    filterExt (ext) {
      console.log(this.selectedExt)
      if (this.selectedExt.includes(ext)) {
        this.selected = [...this.selected, ...this.files.filter(file => ext === file.ext)]
      } else {
        this.selected = this.selected.filter(file => ext !== file.ext)
      }
    },
    // following method is REQUIRED
    // (don't change its name --> "show")
    show () {
      this.$refs.dialog.show()
    },

    // following method is REQUIRED
    // (don't change its name --> "hide")
    hide () {
      this.$refs.dialog.hide()
    },

    onDialogHide () {
      // required to be emitted
      // when QDialog emits "hide" event
      this.$emit('hide')
    },
    selectedFileIndex () {
      if (this.selected.length === 0) {
        return 'none'
      }
      if (this.files.length === this.selected.length) {
        return 'all'
      }
      const indexArr = this.selected.map(file => this.files.indexOf(file))
      const result = indexArr.join(',')
      return result
    },
    onOKClick () {
      console.log(this.torrentBase64)
      this.$store.commit('app/CHANGE_ADD_TASK_TYPE', 'torrent')
      this.$parent.$parent.handleTorrentChange(this.torrentBase64, this.selectedFileIndex)
      this.$parent.$parent.submitForm()
      // this.$parent.submitForm()
      // on OK, it is REQUIRED to
      // emit "ok" event (with optional payload)
      // before hiding the QDialog
      this.$emit('ok')

      // getAsBase64(this.path, (torrent) => {
      //   this.$parent.handleTorrentChange(torrent, this.selectedFileIndex)
      //   this.$parent.submitForm()
      // })
      // or with payload: this.$emit('ok', { ... })

      // then hiding dialog
      this.hide()
    },

    onCancelClick () {
      // we just need to hide dialog
      this.hide()
    }
  }
}
</script>
