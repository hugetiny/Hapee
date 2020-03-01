<template>
  <q-header elevated class="bg-grey-9" height-hint="64">
    <q-toolbar>
      <q-btn round flat class="q-mr-sm">
        <q-icon name="account_box"></q-icon>
<!--        <q-badge color="red" text-color="white" floating>-->
<!--          2-->
<!--        </q-badge>-->
        <!--            <q-avatar size="26px">-->
        <!--              <img src="https://cdn.quasar.dev/img/boy-avatar.png">-->
        <!--            </q-avatar>-->
        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">Account</q-tooltip>
      </q-btn>

      <!--        <q-toolbar-title>-->
      <!--          <img src="https://cdn.quasar.dev/img/layout-gallery/logo-google.svg">-->
      <!--        </q-toolbar-title>-->

      <q-space />
      <q-input class="fit" outlined dense v-model="keyword" bg-color="grey" @keyup.enter="searchSource">
        <!--          <template v-slot:after>-->
        <!--&lt;!&ndash;            <q-icon name="search" />&ndash;&gt;-->
        <!--            <q-icon name="clear" class="cursor-pointer" />-->
        <!--          </template>-->
        <template v-slot:append>
          <!--            <q-icon name="search" />-->
          <q-icon name="search" class="cursor-pointer"  @click="searchSource"/>
        </template>
      </q-input>

      <q-space />

      <!--          <q-btn v-if="$q.screen.gt.sm" round dense flat color="text-grey-7" icon="apps">-->
      <!--            <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">Market</q-tooltip>-->
      <!--          </q-btn>-->
      <q-btn round flat icon="g_translate" class="q-ml-sm" @click="toPreference">
        <q-tooltip content-style="font-size: 12px" transition-show="scale"
          transition-hide="scale">{{$t('change-language')}}</q-tooltip>
      </q-btn>

    </q-toolbar>
  </q-header>

</template>
<script>
import { ipcRenderer } from 'electron'
export default {
  data () {
    return { keyword: '' }
  },
  name: 'Topbar',
  created () {
    ipcRenderer.on('on-search-response', (event, rsp) => {
      this.loading.table = false
      if (rsp.success) {
        this.page = rsp.data
      } else {
        console.err(rsp)
      }
    })
  },

  methods: {
    toPreference: function () {
      this.$router.push('/preference')
    },
    searchSource: function () {
      // if (this.search !== this.$route.params.search) {
      //   this.$router.push(`/search/${this.search}`)
      // console.log(this.keyword)
      // this.$store.dispatch('search/search', this.keyword)
      this.$router.push(`/search/${this.keyword}`)
      // }
    },

    handleSearch () {
      if (this.keyword) {
        this.loading.table = true
        console.info('搜索', JSON.stringify(this.page.current, '/t', 2))
        ipcRenderer.send('search', this.page.current, this.settings.getLocal())

      }
    }
  }
}
</script>
