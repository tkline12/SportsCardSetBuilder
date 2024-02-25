<template>
  <div>
    <h1>Players</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <button class = "player-search-button">Search</button>
      <input type="text" class="player-input">
      <player-list v-bind:players="players" title="Players"/>
    </div>
  </div>
</template>

<script>
import PlayerList from '../components/PlayerList.vue';
import SportsCardService from '../services/SportsCardService';

export default {
  components: {
    PlayerList
  },
  data() {
    return {
      players: [],
      isLoading: true,
    };
  },
  methods: {
    retrievePlayers() {
      SportsCardService.getPlayers().then(response => {
        this.players = response.data;
        this.isLoading = false;
      })
        .catch(error => {
          this.isLoading = false;
          if (error.response) {
            this.$store.commit('SET_NOTIFICATION',
              "Error getting players list. Response received was '" + error.response.statusText + "'.");
          } else if (error.request) {
            this.$store.commit('SET_NOTIFICATION', "Error getting players list. Server could not be reached.");
          } else {
            this.$store.commit('SET_NOTIFICATION', "Error getting players list. Request could not be created.");
          }
        });
    },
  },
  created() {
    this.retrievePlayers();
  }
};
</script>
<style scoped>

.loading {
  flex: 3;
}

.player-search-button{
  margin-bottom: 20px;
}
</style>
