<template>
  <div class="columns">
    <div class="column is-2">
      <figure class="image is-128x128 cover-art">
        <NwImg class="is-rounded" alt="logo" :src="userData.avatar_url" />
      </figure>
    </div>
    <div class="column is-10 is-align-self-center">
      <a :href="userData.permalink_url" class="has-text-link-light" target="_blank"> {{ userData.first_name }} </a> <br/>
      {{ userData.full_name }} <br/>
      {{ userData.city }}
    </div>
  </div>
</template>

<script>
export default {
  name: 'User',
  props: {
    userData: Object
  }
}
</script>

