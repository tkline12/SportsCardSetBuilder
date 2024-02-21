<template>
  <div>
    <h1>Sports</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <sport-list v-bind:sports="sports" title="Sports"/>
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
    };
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
</style>
