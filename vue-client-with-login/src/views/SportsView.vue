<template>
  <div>
    <h1>Sports</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <button class = "sport-search-button">Search</button>
      <input type="text" class="sport-input" v-model="searchTerm"> 
      <sport-list :sports="filteredSports" title="Sports"/>
    </div>
  </div>
</template>

<script>
import SportList from '../components/SportList.vue';
import SportsCardService from '../services/SportsCardService';
export default {
components: {
    SportList
  },
  data() {
    return {
      sports: [],
      isLoading: true,
      searchTerm: ""
    };
  },

  computed: {
    filteredSports(){
      return this.sports.filter(sport => {
        let sportName = sport.sportName.toLowerCase();
        let lowerCaseSearch = this.searchTerm.toLowerCase();
        return sportName.includes(lowerCaseSearch);
      })
    }
  },

  methods: {
    retrieveSports() {
      SportsCardService.getSports().then(response => {
        this.sports = response.data;
        this.isLoading = false;
      })
        .catch(error => {
          this.isLoading = false;
          if (error.response) {
            this.$store.commit('SET_NOTIFICATION',
              "Error getting sports list. Response received was '" + error.response.statusText + "'.");
          } else if (error.request) {
            this.$store.commit('SET_NOTIFICATION', "Error getting sports list. Server could not be reached.");
          } else {
            this.$store.commit('SET_NOTIFICATION', "Error getting sports list. Request could not be created.");
          }
        });
    },
  },
  created() {
    this.retrieveSports();
  }
};
</script>
<style scoped>

.loading {
  flex: 3;
}

.sport-search-button{
  margin-bottom: 20px;
}
</style>
