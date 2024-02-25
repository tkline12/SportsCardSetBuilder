<template>
  <div class="home-page">
    <h1 class="page-title">Sports Card Set Builder</h1>
    <nav class="lists">
      <router-link class = "search-by-player" :to='{name: "PlayersView"}'>Search By Player</router-link>
      <router-link class = "search-by-team" :to='{name: "TeamsView"}'>Search By Team</router-link>
      <router-link class = "search-by-sport" :to='{name: "SportsView"}'>Search By Sport</router-link>
      <router-link class = "search-by-set" :to='{name: "SetsView"}'>Search By Set</router-link>
      <router-link class = "my-cards" :to='{name: "CardsView"}'>My Cards</router-link>
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
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 20px;
  border: 1px solid black;
  background-color: white;
  padding: 3px;
  border-radius: 5px;
  color: black;
}

.search-by-team{
  text-decoration: none;
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 20px;
  border: 1px solid black;
  background-color: white;
  padding: 3px;
  border-radius: 5px;
  color: black;
}

.search-by-sport{
  text-decoration: none;
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 20px;
  border: 1px solid black;
  background-color: white;
  padding: 3px;
  border-radius: 5px;
  color: black;
}

.search-by-set{
  text-decoration: none;
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 20px;
  border: 1px solid black;
  background-color: white;
  padding: 3px;
  border-radius: 5px;
  color: black;
}

.my-cards{
  text-decoration: none;
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 20px;
  border: 1px solid black;
  background-color: white;
  padding: 3px;
  border-radius: 5px;
  color: black;
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