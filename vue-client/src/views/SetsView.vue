<template>
  <div>
    <h1>Sets</h1>
    <div v-if="isLoading">
      <div class="loading">
        <img src="../assets/ball_loading_gif.gif" />
      </div>
    </div>
    <div v-else>
      <set-list v-bind:sets="sets" title="Sets"/>
    </div>
  </div>
</template>

<script>
import SetList from '../components/SetList.vue';
import SportsCardService from '../services/SportsCardService';

export default {
 components: {
    SetList
  },
  data() {
    return {
      sets: [],
      isLoading: true,
    };
  },
  methods: {
    retrieveSets() {
      SportsCardService.getSets().then(response => {
        this.sets = response.data;
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
    this.retrieveSets();
  }
};
</script>
<style scoped>

.loading {
  flex: 3;
}
</style>
