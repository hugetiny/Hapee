<template>
  <q-page
  ref="pageChat"
  class="page-chat flex column">
  <q-banner
  v-if="!otherUserDetails.online"
  class="bg-grey-4 text-center fixed-top">
      {{ otherUserDetails.name }} is offline.
    </q-banner>
  <div
  :class="{ 'invisible' : !showMessages }"
  class="q-pa-md column col justify-end">
  <q-chat-message
  v-for="(message, key) in messages"
  :key="key"
    :name="message.from == 'me' ? userDetails.name : otherUserDetails.name"
    :text="[message.text]"
    :sent="message.from == 'me' ? true : false"
    :bg-color="message.from == 'me' ? 'white' : 'light-green-2'"
  />
  </div>
  <q-footer elevated>
    <q-toolbar>
    <q-form
    @submit="sendMessage"
    class="full-width">
      <q-input
      v-model="newMessage"
      @blur="scrollToBottom"
      ref="newMessage"
      bg-color="white"
      outlined
      placeholder="Message"
      dense>
        <template v-slot:after>
          <q-btn
          round
          dense
          flat
          type="submit"
          color="white"
          icon="send" />
        </template>
      </q-input>
    </q-form>
    </q-toolbar>
  </q-footer>
  </q-page>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import mixinOtherUserDetails from 'src/mixins/mixin-other-user-details.js'

export default {
  mixins: [mixinOtherUserDetails],
  data () {
    return {
      newMessage: '',
      showMessages: false
    }
  },
  computed: {
    ...mapState('store', ['messages', 'userDetails'])
  },
  methods: {
    ...mapActions('store', ['firebaseGetMessages', 'firebaseStopGettingMessages', 'firebaseSendMessage']),
    sendMessage () {
      console.log(this.newMessage)
      this.firebaseSendMessage({
        message: {
          text: this.newMessage,
          from: 'me'
        },
        otherUserId: this.$route.params.otherUserId
      })
      this.clearMessage()
    },
    clearMessage () {
      this.newMessage = ''
      this.$refs.newMessage.focus()
    },
    scrollToBottom () {
      let pageChat = this.$refs.pageChat.$el
      setTimeout(() => {
        window.scrollTo(0, pageChat.scrollHeight)
      }, 20)
    }
  },
  watch: {
    messages: function (val) {
      if (Object.keys(val).length) {
        this.scrollToBottom()
        setTimeout(() => {
          this.showMessages = true
        }, 200)
      }
    }
  },
  mounted () {
    this.firebaseGetMessages(this.$route.params.otherUserId)
  },
  destroyed () {
    this.firebaseStopGettingMessages()
  }
}
</script>

<style lang="stylus">
  .page-chat
    background #e2dfd5
    &:after
      content ''
      display block
      position fixed
      left 0
      right 0
      top 0
      bottom 0
      z-index 0
      opacity 0.1
      background-image radial-gradient(circle at 100% 150%, silver 24%, white 25%, white 28%, silver 29%, silver 36%, white 36%, white 40%, transparent 40%, transparent), radial-gradient(circle at 0    150%, silver 24%, white 25%, white 28%, silver 29%, silver 36%, white 36%, white 40%, transparent 40%, transparent), radial-gradient(circle at 50%  100%, white 10%, silver 11%, silver 23%, white 24%, white 30%, silver 31%, silver 43%, white 44%, white 50%, silver 51%, silver 63%, white 64%, white 71%, transparent 71%, transparent), radial-gradient(circle at 100% 50%, white 5%, silver 6%, silver 15%, white 16%, white 20%, silver 21%, silver 30%, white 31%, white 35%, silver 36%, silver 45%, white 46%, white 49%, transparent 50%, transparent), radial-gradient(circle at 0    50%, white 5%, silver 6%, silver 15%, white 16%, white 20%, silver 21%, silver 30%, white 31%, white 35%, silver 36%, silver 45%, white 46%, white 49%, transparent 50%, transparent)
      background-size 100px 50px
  .q-banner
    top 50px
    z-index 2
    opacity 0.8
  .q-message
    z-index 1
</style>
