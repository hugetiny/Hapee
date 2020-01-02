<template>
  <div>
    <ul class="theme-switcher">
      <li
        class="theme-item theme-item-auto"
        :class="{ active: currentValue === 'auto' }"
        @click.prevent="() => handleChange('auto')"
      >
        <div class="theme-thumb"></div>
        <span>{{ $t('theme-auto') }}</span>
      </li>
      <li
        class="theme-item theme-item-light"
        :class="{ active: currentValue === 'light' }"
        @click.prevent="() => handleChange('light')"
      >
        <div class="theme-thumb"></div>
        <span>{{ $t('theme-light') }}</span>
      </li>
      <li
        class="theme-item theme-item-dark"
        :class="{ active: currentValue === 'dark' }"
        @click.prevent="() => handleChange('dark')"
      >
        <div class="theme-thumb"></div>
        <span>{{ $t('theme-dark') }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'theme-switcher',
  components: {
  },
  props: {
    value: {
      type: String,
      default: 'auto'
    }
  },
  data: function () {
    return {
      currentValue: this.value
    }
  },
  watch: {
    currentValue: function (val) {
      this.$emit('change', val)
    }
  },
  methods: {
    handleChange (theme) {
      this.currentValue = theme
    }
  }
}
</script>

<style lang="scss">
</style>
