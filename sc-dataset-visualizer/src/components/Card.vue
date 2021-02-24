<template>
  <div class="column is-2" >
    <a :href="repost.track.permalink_url" target="_blank"  v-if="repost.track"> 
      <figure class="image is-square cover-art">
        <div class="my-tag">   
            {{ repost.track.title }} <br/>
            @{{repost.track.user.permalink}} <br/>
            <time datetime="2016-1-1">{{ repost.created_at }}</time>
        </div>
        <NwImg alt="logo" :src="repost.track.artwork_url" />
      </figure>
    </a>
  </div>
</template>

<script>
export default {
  name: 'Card',
  props: {
    repost: Object
  }
}
</script>

<style scoped>
.my-tag {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  font-size: 0.8em;
  font-weight: bold;
  z-index: 10;
  background-color: black;
  color: white;
  padding-left: .75em;
  padding-right: .75em;
  padding-bottom: .75em;
  opacity: 0;
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
  transition: 0.3s ease;
}

.image {
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

.cover-art:hover .my-tag {
  opacity: 0.9;
}

</style>
