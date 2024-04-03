<template>
    <div>
    <h1>Cards</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <card-images :cards="cards" title="Cards" :userCards="userCards"/>
    </div>
  </div>
</template>

<script>
import CardImages from '../components/CardImages.vue';
import SportsCardService from '../services/SportsCardService';

export default{
    components: {
        CardImages
    }, 
    data(){
        return {
            cards:[], 
            isLoading: true,
            userCards:[],
            userCardIsLoading: true
        }
    }, 

    methods: {
    retrieveCardsBySet() {
     SportsCardService.getCardsBySetId(this.$route.params.setId).then(response => {
        this.cards = response.data;
        this.isLoading = false;
      })
        .catch(error => {
          this.isLoading = false;
          if (error.response) {
            this.$store.commit('SET_NOTIFICATION',
              "Error getting cards list. Response received was '" + error.response.statusText + "'.");
          } else if (error.request) {
            this.$store.commit('SET_NOTIFICATION', "Error getting cards list. Server could not be reached.");
          } else {
            this.$store.commit('SET_NOTIFICATION', "Error getting cards list. Request could not be created.");
          }
        });
    },

    retrieveUserCards(){
      SportsCardService.getUserCardsByUserId(this.$store.state.user.id).then(response=> {
        this.userCards = response.data;
        this.userCardIsLoading = false;
      })
        .catch(error => {
          this.userCardIsLoading = false;
          if (error.response) {
            this.$store.commit('SET_NOTIFICATION',
              "Error getting userCards list. Response received was '" + error.response.statusText + "'.");
          } else if (error.request) {
            this.$store.commit('SET_NOTIFICATION', "Error getting userCards list. Server could not be reached.");
          } else {
            this.$store.commit('SET_NOTIFICATION', "Error getting userCards list. Request could not be created.");
          }
        });
    }
  },
  created() {
    this.retrieveCardsBySet();
    this.retrieveUserCards();
  }
};
</script>

<style>

</style>