<template>
  <div class="card-card" v-on:click="$router.push(`/cardss/${card.cardID}`);">
    <div class="card-img">
      <img v-bind:src="imageBaseUrl + movie.posterImage" v-bind:alt="movie.title" />
    </div>
    <div class="player-info">
      <h1 class=player-name>{{player.name}}</h1>
      <div class="team-name">
        <span class="team" v-for="genre of movie.genres" v-bind:key="genre.id">
          {{genre.name}}
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    props: ['card'],
    data(){
        return{
            // imageBaseUrl: import.meta.env.VITE_APP_REMOTE_API
        }
    }
}
</script>

<style>

</style>