export default {
  computed: {
    otherUserDetails () {
      if (this.$store.state.store.users[this.$route.params.otherUserId]) {
        return this.$store.state.store.users[this.$route.params.otherUserId]
      }
      return {}
    }
  }
}
