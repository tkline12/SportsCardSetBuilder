<template>
  <div class="card-detail">
    <div class="card-image">
      <img v-bind:src="imageBaseUrl + card.image" v-bind:alt="card.title" />
    </div>
    <div class="card-info">
      <h1 class="player-name">{{card.title}}</h1>
    </div>
  </div>
</template>

<script>
export default {
  props: ['card'],
    data() {
    return {
      imageBaseUrl: "../assets/"
    }
  },
}
</script>

<style>
.genre-container {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  justify-content: center;
}

.card-detail {
  background-color: #F9F6F0;
  border: 1px solid #FF9000;
  padding: 1.5rem 0.5rem;
  text-align: center;
  width: 325px;
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
  background-color: #B60220;
  border: 1px solid #51010F;
  border-radius: 1rem;
  color: #F9F6F0;
  padding: 0.5rem 0.75rem;
}
</style>