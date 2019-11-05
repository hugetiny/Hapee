<template>
<q-drawer
  show-if-above
  content-class="bg-grey-10"
>
  <q-list dark padding>
    <q-item class="download" v-ripple clickable @click="() => nav('/task')">
      <q-item-section avatar>
        <q-icon name="play_arrow" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('task.active') }}</q-item-label>
      </q-item-section>
    </q-item>
    <q-item class="download" v-ripple clickable @click="() => nav('/task')">
      <q-item-section avatar>
        <q-icon name="pause" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('task.waiting') }}</q-item-label>
      </q-item-section>
    </q-item>
    <q-item class="download" v-ripple clickable @click="() => nav('/task')">
      <q-item-section avatar>
        <q-icon name="stop" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('task.stopped') }}</q-item-label>
      </q-item-section>
    </q-item>

    <q-separator inset class="q-my-sm" />

    <q-item class="preferences" v-ripple  clickable @click="() => nav('/preference')">
      <q-item-section avatar>
        <q-icon name="settings_applications" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('preferences.basic') }}</q-item-label>
      </q-item-section>
    </q-item>
    <q-separator inset class="q-my-sm" />

    <q-item class="preferences" v-ripple  clickable>
      <q-item-section avatar>
        <q-icon name="apps" />
      </q-item-section>
      <q-item-section>
        <q-item-label>市场</q-item-label>
      </q-item-section>
    </q-item>
    <q-separator inset class="q-my-sm" />

    <q-item class="preferences" v-ripple  clickable @click="() => nav('/preference')">
      <q-item-section avatar>
        <q-icon name="cloud_download" />
      </q-item-section>
      <q-item-section>
        <q-item-label>{{ $t('preferences.basic') }}</q-item-label>
      </q-item-section>
    </q-item>
  </q-list>
</q-drawer>
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
