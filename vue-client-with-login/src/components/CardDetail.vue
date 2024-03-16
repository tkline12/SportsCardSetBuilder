<template>
  <div class="card-detail">
    <div class="card-image" :class="{ 'not-owned': !isOwned }">
      <img :src="imageBaseUrl + card.image" :alt="card.title" />
    </div>
    <div class="card-info">
      <div class="player-name">
        <p v-for="player in card.players" :key="player.playerId">{{ player.playerName }}</p>
      </div>
      <div class="card-name">{{ card.setName }} {{ card.cardName }}</div>
      <div class="card-number">#{{ card.cardNumber }}</div>
      <input type="checkbox" v-model="isOwned"> Owned
    </div>
  </div>
</template>

<script>
export default {
  props: ["card"],
  data() {
    return {
      imageBaseUrl: "../../images/card-images/",
      isOwned: false
    };
  },
};
</script>

<style>
.genre-container {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  justify-content: center;
}

.card-detail {
  display: flex;
  justify-content: space-evenly;
  width: 350px;
}

.card-title {
  font-size: 1.3rem;
  font-weight: bold;
  margin-bottom: 1.5rem;
}

.card-image {
  height: 300px;
  margin-bottom: 2rem;
}

img {
  border: 1px solid#c7c7c7;
  height: 100%;
}

.genre {
  background-color: #b60220;
  border: 1px solid #51010f;
  border-radius: 1rem;
  color: #f9f6f0;
  padding: 0.5rem 0.75rem;
}

.card-number{ 
  margin-bottom: 30px;
}

.card-image {
  height: 300px;
  margin-bottom: 2rem;
  transition: opacity 0.3s ease;
}

.card-image img {
  border: 1px solid #c7c7c7;
  height: 100%;
}

.not-owned img {
  opacity: 0.3; 
}
</style>