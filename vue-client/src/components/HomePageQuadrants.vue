<template>
  <div class= "grid">
      <div class = "most-recent-set">Most Recent Set</div>
      <div class = "favorite-sets">Favorite Sets</div>
      <div class = "most-complete-set">Closest to Finishing</div>
      <div class = "some-fourth-thing">Some Fourth Thing</div>
    </div>
</template>

<script>
export default {

}
</script>

<style>
.grid {
  display: grid;
  grid-template-rows: 1fr 1fr;
                      
  grid-template-columns: 1fr 1fr;
  grid-template-areas: 
    "recent    favorite"
    "complete  fourth";
  align-items: center;
  height: 100%;
  grid-gap: 30px;
  background-color: rgb(142, 181, 197);
  width: 75%;
  
}

.most-recent-set {
  grid-area: recent;
  text-align: center;
  background-color: white;
  height: 50vh;
  border-radius: 40px;
  margin-left: 30px;
  font-size: 50px;
  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  margin-top: 20px;
}

.favorite-sets {
  grid-area: favorite;
  text-align: center;
  background-color: white;
  height: 50vh;
  border-radius: 40px;
  margin-right: 30px;
  font-size: 50px;
  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  margin-top: 20px;
}

.most-complete-set {
  grid-area: complete;
  text-align: center;
  background-color: white;
  height: 50vh;
  border-radius: 40px;
  margin-left: 30px;
  font-size: 50px;
  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  margin-bottom: 20px;
}

.some-fourth-thing {
  grid-area: fourth;
  text-align: center;
  background-color: white;
  height: 50vh;
  border-radius: 40px;
  margin-right: 30px;
  font-size: 50px;
  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  margin-bottom: 20px;
}
</style>