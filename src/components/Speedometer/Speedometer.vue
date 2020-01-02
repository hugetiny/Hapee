<template>
  <div class="mo-speedometer" :class="{ stopped: stat.numActive === 0 }">
    <div
      class="mode"
      @click="toggleEngineMode"
    >
      <i>
        speedometer
      </i>
      <em>{{ engineMode }}</em>
    </div>
    <div class="value" v-if="stat.numActive > 0">
      <em >{{ stat.uploadSpeed | bytesToSize }}/s</em>
      <span>{{ stat.downloadSpeed | bytesToSize }}/s</span>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import {
  bytesToSize
} from 'src/shared/utils'

export default {
  name: 'speedometer',
  components: {
  },
  computed: {
    ...mapState('app', [
      'stat'
    ]),
    ...mapState('preference', [
      'engineMode'
    ])
  },
  filters: {
    bytesToSize
  },
  methods: {
    ...mapActions('preference', [
      'toggleEngineMode'
    ])
  }
}
</script>

<style lang="scss">
</style>
