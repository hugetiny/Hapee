<template>
<q-form @submit="submitForm">
<q-input
v-if="tab == 'register'"
v-model="formData.name"
      :rules="[
      val => val.length >= 5 || 'Please use maximum 5 characters' ,
      val => val.length >= 6 || 'Please use maximum 6 characters'
      ]"
class="q-mb-md"
outlined
label="Name" />
<q-input
v-model="formData.email"
      error-message="Please input the right email address"
class="q-mb-md"
outlined
type="email"
label="Email" />
<q-input
v-model="formData.password"
      :rules="[
      val => val.length >= 8 || 'At least 8 characters'
      ]"
class="q-mb-md"
outlined
type="password"
label="Password" />
<div class="row">
<q-space />
<q-btn
color="primary"
type="submit"
:label="tab" />
</div>
</q-form>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  props: ['tab'],
  data () {
    return {
      formData: {
        name: '',
        email: 'your email',
        password: 'password'
      }
    }
  },
  methods: {
    ...mapActions('store', ['registerUser', 'loginUser']),
    submitForm () {
      if (this.tab === 'login') {
        this.loginUser(this.formData)
      } else {
        this.registerUser(this.formData)
      }
    }
  }
}
</script>
