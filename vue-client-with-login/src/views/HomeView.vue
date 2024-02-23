<template>
  <div class="home-page">
    <h1 class="page-title">Sports Card Set Builder</h1>
    <nav class="lists">
      <router-link :to='{name: "PlayersView"}'>Player List</router-link>
      <router-link :to='{name: "TeamsView"}'>Team List</router-link>
      <router-link :to='{name: "SportsView"}'>Sport List</router-link>
      <router-link :to='{name: "SetsView"}'>My Sets</router-link>
      <router-link :to='{name: "CardsView"}'>Card List</router-link>
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