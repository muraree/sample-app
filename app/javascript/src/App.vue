<template>
  <div id="app">
    <layout />
  </div>
</template>

<script>
import Layout from './components/layouts/Layout.vue';

export default {
  name: 'HelloWorld',
  components: { Layout },
  created() {
    this.setUser(gon.user)
  },
  methods: {
    setUser(user) {
      this.$store.dispatch('user/setUser', user)
    }
  }
}
</script>
