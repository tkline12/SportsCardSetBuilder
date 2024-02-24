<template>
  <div class= "grid">
      <button class = "most-recent-set">Most Recent Set</button>
      <button class = "favorite-sets">Favorite Sets</button>
      <button class = "most-complete-set">Closest to Finishing</button>
      <button class = "some-fourth-thing">Some Fourth Thing</button>
    </div>
</template>

<script>
export default {
  
};
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
  display: flex;
  grid-area: recent;
  justify-content: center;
  background-color: white;
  height: 50vh;
  border-radius: 40px;
  margin-left: 30px;
  font-size: 50px;
  font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  margin-top: 20px;
}

.most-recent-set:hover {
  transform: scale(1.05);
}

.favorite-sets {
  display: flex;
  justify-content: center;
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

.favorite-sets:hover {
  transform: scale(1.05);
}

.most-complete-set {
  display: flex;
  justify-content: center;
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

.most-complete-set:hover {
  transform: scale(1.05);
}

.some-fourth-thing {
  display: flex;
  justify-content: center;
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

.some-fourth-thing:hover{
  transform: scale(1.05);
}
</style>