<template>
  <div id="app" class="container">
    <section class="hero">
      <div class="hero-body">
        <User :userData="soundcloud[0].user"/>
      </div>
    </section>
    <div class="title has-text-primary-light"> Reposted: {{soundcloud.length}} tracks </div>
    <div class="columns is-multiline" >
      <Card v-for="repost in soundcloud" :key="repost.uuid" :repost="repost"/>
    </div>
  </div>
</template>

<script>
import myData from './assets/dataset/sorted.json'
import Card from './components/Card.vue'
import User from './components/User.vue'

export default {
  name: 'App',
  components: {
    Card,
    User
  },
  data: function () {
    return {
      soundcloud: myData.list
    }
  }
}
</script>

<style>
@import '../node_modules/bulma/css/bulma.min.css';

body {
  background: hsl(0, 0%, 4%);
}
</style>
