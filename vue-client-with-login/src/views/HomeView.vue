<template>
  <div class="home-page">
    <h1 class="page-title">Sports Card Set Builder</h1>
    <nav class="lists">
      <router-link class = "search-by-player" :to='{name: "PlayersView"}'>Search By Player</router-link>
      <router-link :to='{name: "TeamsView"}'>Search By Team</router-link>
      <router-link :to='{name: "SportsView"}'>Search By Sport</router-link>
      <router-link :to='{name: "SetsView"}'>Search By Sets</router-link>
      <router-link :to='{name: "CardsView"}'>My Cards</router-link>
    </nav>
    <div id="quadrants">
      <home-page-quadrants/>
    </div>
  </div>
  
</template>

<script>
import HomePageQuadrants from '../components/HomePageQuadrants.vue'
export default {
  components: {
    HomePageQuadrants
  }
}
</script>

<style>

.lists {
  display: flex;
  justify-content: space-between;
  margin: 100px;
}

.search-by-player{
  text-decoration: none;
}

.page-title {
  font-family: fantasy;
  font-size: 75px;
  text-align: center;
  background-color: rgb(21, 159, 201);
}

#quadrants{
  display: flex;
  justify-content: center;
}
</style>