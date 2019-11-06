<template>
  <q-tabs
    dense
    class="shadow-2"
    active-color="primary"
    align="justify"
  >
    <q-route-tab icon="view_list" :label="$t('list')" to="/recommend">
      <!--        <q-badge color="primary" text-color="white" floating>2</q-badge>-->
    </q-route-tab>
    <q-route-tab icon="video_library" :label="$t('album')" to="/album">

      <!--        <q-badge color="purple" text-color="white" floating>10+</q-badge>-->
    </q-route-tab>
    <q-route-tab icon="settings_applications" :label="$t('artist')" to="/artist" />
  </q-tabs>
</template>
<script>

export default {
  data () {
    return { keyword: '' }
  },
  name: 'Subnav',
  methods: {
    searchSource: function (payload) {
      // if (this.search !== this.$route.params.search) {
      //   this.$router.replace(`/search/${this.search}`)
      console.log(this.keyword)
      this.$store.dispatch('search/search', this.keyword)
      // }
    }
  }
}
</script>
