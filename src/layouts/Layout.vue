<template>
  <q-layout view="hHh lpR fFf" class="bg-grey-9 text-white">
    <Topbar></Topbar>
    <Subnav></Subnav>
    <q-page-container>
      <router-view />
    </q-page-container>
    <q-footer elevated class="bg-grey-9" mobile-only>
    <q-tabs
      v-model="tab"
      dense
      class="shadow-2"
      active-color="primary"
      align="justify"
    >
      <q-tab name="mails" icon="play" :label="$t('subnav.task-list')">
<!--        <q-badge color="primary" text-color="white" floating>2</q-badge>-->
      </q-tab>
      <q-tab name="alarms" icon="cloud_download" label="云端">

<!--        <q-badge color="purple" text-color="white" floating>10+</q-badge>-->
      </q-tab>
      <q-tab  name="stop" icon="market" label="应用市场" />
    </q-tabs>
    </q-footer>
  </q-layout>
</template>

<script>
import Subnav from 'components/Subnav/Subnav'
import Topbar from 'components/Subnav/Topbar'
export default {
  name: 'Layout',
  components: {
    Subnav, Topbar
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
