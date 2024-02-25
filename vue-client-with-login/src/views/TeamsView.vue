<template>
  <div>
    <h1>Teams</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <button class = "team-search-button">Search</button>
      <input type="text" class="team-input">
      <team-list v-bind:teams="teams" title="Teams"/>
    </div>
  </div>
</template>

<script>
import TeamList from '../components/TeamList.vue';
import SportsCardService from '../services/SportsCardService';

export default {
  components: {
    TeamList
  },
  data(){
    return {
      teams: [],
      isLoading: true,
    };
  }, 
  methods: {
    retrieveTeams() {
      SportsCardService.getTeams().then(response => {
        this.teams = response.data;
        this.isLoading = false;
      })
        .catch(error => {
          this.isLoading = false;
          if (error.response) {
            this.$store.commit('SET_NOTIFICATION',
              "Error getting teams list. Response received was '" + error.response.statusText + "'.");
          } else if (error.request) {
            this.$store.commit('SET_NOTIFICATION', "Error getting teams list. Server could not be reached.");
          } else {
            this.$store.commit('SET_NOTIFICATION', "Error getting teams list. Request could not be created.");
          }
        });
    },
  },
  created() {
    this.retrieveTeams();
  }
};
</script>

<style>
.team-search-button{
  margin-bottom: 20px;
}
</style>