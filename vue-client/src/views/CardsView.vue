<template>
  <div>
    <h1>Cards</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <card-list v-bind:cards="cards" title="Cards"/>
    </div>
  </div>
</template>

<script>
import CardList from '../components/CardList.vue';
import SportsCardService from '../services/SportsCardService';

export default {
    components: {
        CardList
    },
  data() {
    return {
      cards: [],
      isLoading: true,
    };
  },
  methods: {
    retrieveCards() {
      SportsCardService.getCards().then(response => {
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
  },
  created() {
    this.retrieveCards();
  }
};
</script>
<style scoped>

.loading {
  flex: 3;
}
</style>
