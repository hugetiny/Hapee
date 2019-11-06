<template>
  <q-layout view="hHh LpR fFf" class="bg-grey-9 text-white">
    <Topbar></Topbar>
    <Nav></Nav>
    <q-page-container>
      <Subnav></Subnav>
      <router-view/>
    </q-page-container>
    <Footer></Footer>
  </q-layout>
</template>

<script>
import Topbar from './Topbar'
import Nav from './Nav'
import Footer from './Footer'
import Subnav from './Subnav'

export default {
  name: 'Layout',
  components: {
    Topbar, Nav, Footer, Subnav
  },
  data () {
    return {
      tab: 'mails',
      leftDrawerOpen: false,
      search: '',
      showAdvanced: false,
      showDateOptions: false,
      exactPhrase: '',
      hasWords: '',
      excludeWords: '',
      byWebsite: '',
      byDate: 'Any time',
      Download: [
        { icon: 'play_arrow', text: 'Downloading' },
        { icon: 'pause', text: 'Waiting' },
        { icon: 'stop', text: 'Stopped' }
      ],
      Cloud: [
        { icon: 'cloud_download', text: 'Sync' }
      ],
      Setting: [
        { icon: 'settings_applications', text: 'setting' }
      ]
    }
  },

  methods: {
    // changeCurrentList (status) {
    //   // console.log(status)
    //   this.$store.dispatch('task/changeCurrentList', status)
    // },
    // onClear () {
    //   this.exactPhrase = ''
    //   this.hasWords = ''
    //   this.excludeWords = ''
    //   this.byWebsite = ''
    //   this.byDate = 'Any time'
    // },
    //
    // changeDate (option) {
    //   this.byDate = option
    //   this.showDateOptions = false
    // }
  }
}
</script>
