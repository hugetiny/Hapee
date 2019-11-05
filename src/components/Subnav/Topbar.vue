<template>
  <q-header elevated class="bg-grey-9" height-hint="64">
    <q-toolbar class="GNL__toolbar text-white">
      <q-btn
        flat
        dense
        round
        aria-label="Menu"
        icon="menu"
        class="q-mr-sm"
      />

      <!--        <q-toolbar-title>-->
      <!--          <img src="https://cdn.quasar.dev/img/layout-gallery/logo-google.svg">-->
      <!--        </q-toolbar-title>-->

      <q-space />

      <q-input class="GNL__toolbar-input text-white fit" outlined dense v-model="search" bg-color="grey" @input="nav('/search')">
        <!--          <template v-slot:after>-->
        <!--&lt;!&ndash;            <q-icon name="search" />&ndash;&gt;-->
        <!--            <q-icon name="clear" class="cursor-pointer" />-->
        <!--          </template>-->
        <template v-slot:append>
          <!--            <q-icon name="search" />-->
          <q-icon name="search" class="cursor-pointer" />
        </template>
      </q-input>

      <q-space />

      <div class="q-gutter-sm row items-center no-wrap">
        <!--          <q-btn v-if="$q.screen.gt.sm" round dense flat color="text-grey-7" icon="apps">-->
        <!--            <q-tooltip>Market</q-tooltip>-->
        <!--          </q-btn>-->
        <q-btn round dense flat color="text-grey-7" icon="notifications">
          <q-badge color="red" text-color="white" floating>
            2
          </q-badge>
          <q-tooltip>Notifications</q-tooltip>
        </q-btn>
        <q-btn round flat>
          <q-icon name="account_box"></q-icon>
          <!--            <q-avatar size="26px">-->
          <!--              <img src="https://cdn.quasar.dev/img/boy-avatar.png">-->
          <!--            </q-avatar>-->
          <q-tooltip>Account</q-tooltip>
        </q-btn>
      </div>
    </q-toolbar>
  </q-header>

</template>
<script>
export default {
  name: 'Subnav',
  methods: {
    nav: function (path) {
      this.$router.replace(path)
    }
  }
}
</script>
