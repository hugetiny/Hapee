<template>
    <q-list dark class="q-pa-sm">
<!--      <q-item-label header>{{$t('preferences.language')}}</q-item-label>-->
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>{{$t('preferences.language')}}</q-item-label>
          <q-item-label caption>
           {{$t('preferences.change-language')}}
          </q-item-label>
        </q-item-section>
        <q-item-section side top>
          <q-select dark
            filled
            v-model="model"
            :options="options"
          />
        </q-item-section>
      </q-item>
      <q-separator spaced />
<!--      <q-item-label header>{{$t('preferences.appearance')}}</q-item-label>-->
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>{{$t('preferences.appearance')}}</q-item-label>
          <q-item-label caption>
            color mode
          </q-item-label>
        </q-item-section>
        <q-item-section side top>
          <q-select dark
            filled
            v-model="model"
            :options="options"
          />
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>{{ $t('preferences.hide-app-menu') }}</q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-separator spaced />
<!--      <q-item-label header>{{$t('preferences.startup')}}</q-item-label>-->
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.open-at-login') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>

      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.keep-window-state') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>

      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.auto-resume-all') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
<!--      <q-item-label header>path</q-item-label>-->
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{$t('preferences.default-dir')}}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
         <q-input></q-input>
        </q-item-section>
      </q-item>

<!--      <q-item-label header>speed limit</q-item-label>-->
      <q-item>
        <q-item-section>
          <q-item-label>Upload limit</q-item-label>
          <q-item-label caption>
            {{ $t('preferences.transfer-speed-upload') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side>
          0
        </q-item-section>
        <q-item-section>
          <q-slider
            v-model="volume"
            :min="0"
            :max="10"
            label
            color="teal"
          />
        </q-item-section>
        <q-item-section side>
          Unlimited
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.transfer-speed-download') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side>
          0
        </q-item-section>
        <q-item-section>
          <q-slider
            v-model="volume"
            :min="0"
            :max="10"
            label
            color="teal"
          />
        </q-item-section>
        <q-item-section side>
          Unlimited
        </q-item-section>
      </q-item>
      <q-separator spaced />
<!--      <q-item-label header>Task Management</q-item-label>-->
      <q-item>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.max-concurrent-downloads') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side>
          1
        </q-item-section>
        <q-item-section>
          <q-slider
            v-model="volume"
            :min="0"
            :max="10"
            label
            color="teal"
          />
        </q-item-section>
        <q-item-section side>
          10
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.max-connection-per-server') }}
          </q-item-label>
          <q-item-label caption>
            Upload limit
          </q-item-label>
        </q-item-section>
        <q-item-section side>
          1
        </q-item-section>
        <q-item-section>
          <q-slider
            v-model="volume"
            :min="0"
            :max="10"
            label
            color="teal"
          />
        </q-item-section>
        <q-item-section side>
          16
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.continue') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.new-task-show-downloading') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.task-completed-notify') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{ $t('preferences.auto-check-update') }}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{$t('preferences.proxy')}}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-input></q-input>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-item tag="label" v-ripple>
        <q-item-section>
          <q-item-label>
            {{$t('preferences.bt-tracker')}}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
<!--          @new-value="createValue"-->
<!--          :options="filterOptions"-->
<!--          @filter="filterFn"-->
          <q-select
            filled
            v-model="model"
            use-input
            use-chips
            multiple
            input-debounce="0"
          />
        </q-item-section>
      </q-item>
      <q-separator spaced />
<!--      <q-item-label header>{{$t('preferences.download-protocol')}}</q-item-label>-->
      <q-item>
        <q-item-section>
          <q-item-label>
           {{$t('preferences.protocols-magnet')}}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-input></q-input>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>
      <q-item>
        <q-item-section>
          <q-item-label>
            {{$t('preferences.protocols-thunder')}}
          </q-item-label>
        </q-item-section>
        <q-item-section side >
          <q-input></q-input>
        </q-item-section>
        <q-item-section side >
          <q-toggle v-model="notif1" val="battery" />
        </q-item-section>
      </q-item>

    </q-list>
</template>
<script>
export default {
  data () {
    return {
      model: 'auto',
      options: ['auto', 'light', 'dark'],

      check1: true,
      check2: false,
      check3: false,

      notif1: true,
      notif2: true,
      notif3: false,

      volume: 6,
      brightness: 3,
      mic: 8
    }
  }
}
</script>
