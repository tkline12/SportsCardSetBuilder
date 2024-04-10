<template>
    <div>
      <h1>Subsets</h1>
      <div v-if="isLoading">
        <div class="loading">
          <img src="../assets/ball_loading_gif.gif" />
        </div>
      </div>
      <div v-else>
        <button class = "subset-search-button">Search</button>
        <input type="text" class="subset-input" v-model="searchTerm">
        <subset-list v-bind:subsets="filteredSubsets" title="Subsets"/>
      </div>
    </div>
  </template>
  
  <script>
  import SubsetList from '../components/SubsetList.vue';
  import SportsCardService from '../services/SportsCardService';
  
  export default {
    components: {
      SubsetList
    },
    data() {
      return {
        subsets: [],
        isLoading: true,
        searchTerm: "",
      };
    },
  
    computed: {
      filteredSubsets(){
        return this.subsets.filter(subset => {
          let subsetName = subset.subsetName.toLowerCase();
          let lowerCaseSearch = this.searchTerm.toLowerCase();
          return subsetName.includes(lowerCaseSearch);
        })
      }
    },
  
    methods: {
      retrieveSubsets() {
        SportsCardService.getSubsets().then(response => {
          this.subsets = response.data;
          this.isLoading = false;
        })
          .catch(error => {
            this.isLoading = false;
            if (error.response) {
              this.$store.commit('SET_NOTIFICATION',
                "Error getting subsets list. Response received was '" + error.response.statusText + "'.");
            } else if (error.request) {
              this.$store.commit('SET_NOTIFICATION', "Error getting subsets list. Server could not be reached.");
            } else {
              this.$store.commit('SET_NOTIFICATION', "Error getting subsets list. Request could not be created.");
            }
          });
      },
    },
    created() {
      this.retrieveSubsets();
    }
  };
  </script>
  <style scoped>
  
  .loading {
    flex: 3;
  }
  
  .subset-search-button{
    margin-bottom: 20px;
  }
  </style>
  