<template>
<q-drawer
  show-if-above
  content-class="bg-grey-10"
  :width="200"
  :breakpoint="700"
  elevated
  side="left"
>
  <q-scroll-area class="fit">
  <q-list dark padding>
    <q-item class="download" v-ripple clickable to="/task/active" replace>
      <q-item-section avatar>
        <q-icon name="view_list" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('active') }}</q-item-label>
      </q-item-section>
    </q-item>
<!--    <q-item class="download" v-ripple clickable to="/task/waiting" replace>-->
<!--      <q-item-section avatar>-->
<!--        <q-icon name="pause" />-->
<!--      </q-item-section>-->
<!--      <q-item-section>-->
<!--        <q-item-label>{{ $t('waiting') }}</q-item-label>-->
<!--      </q-item-section>-->
<!--    </q-item>-->
    <q-item class="download" v-ripple clickable to="/task/stopped" replace>
      <q-item-section avatar>
        <q-icon name="stop" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('stopped') }}</q-item-label>
      </q-item-section>
    </q-item>

<!--    <q-separator inset class="q-my-sm" />-->

<!--    <q-item class="download" v-ripple clickable to="/recommend" replace>-->
<!--      <q-item-section avatar>-->
<!--        <q-icon name="library_music" />-->
<!--      </q-item-section>-->
<!--      <q-item-section>-->
<!--        <q-item-label>{{ $t('music') }}</q-item-label>-->
<!--      </q-item-section>-->
<!--    </q-item>-->

<!--    <q-item class="download" v-ripple clickable to="/videolist" replace>-->
<!--      <q-item-section avatar>-->
<!--        <q-icon name="video_library" />-->
<!--      </q-item-section>-->
<!--      <q-item-section>-->
<!--        <q-item-label>{{ $t('video') }}</q-item-label>-->
<!--      </q-item-section>-->
<!--    </q-item>-->
    <q-separator inset class="q-my-sm" />
    <q-item class="preferences" v-ripple  clickable to="/preference" replace>
      <q-item-section avatar>
        <q-icon name="settings_applications" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('Settings') }}</q-item-label>
      </q-item-section>
    </q-item>
    <q-item class="preferences" v-ripple  clickable to="/about" replace>
      <q-item-section avatar>
        <q-icon name="settings_ethernet" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('about') }}</q-item-label>
      </q-item-section>
    </q-item>
    <q-separator inset class="q-my-sm" />

<!--    <q-item  to="market" replace v-ripple  clickable>-->
<!--      <q-item-section avatar>-->
<!--        <q-icon name="apps" />-->
<!--      </q-item-section>-->
<!--      <q-item-section>-->
<!--        <q-item-label>市场</q-item-label>-->
<!--      </q-item-section>-->
<!--    </q-item>-->
<!--    <q-separator inset class="q-my-sm" />-->

  </q-list>
  </q-scroll-area>
</q-drawer>
</template>
<script>
export default {
  name: 'Nav',
  methods: {
    nav: function (path) {
      this.$router.push(path)
    }
  }
}
</script>
