<template>
  <div class="card-detail">
    <div class="card-image" :class="{ 'not-checked': !checked }">
      <img :src="imageBaseUrl + card.image" :alt="card.title" />
    </div>
    <div class="card-info">
      <div class="player-name">
        <p v-for="player in card.players" :key="player.playerId">{{ player.playerName }}</p>
      </div>
      <div class="card-name">{{ card.setName }} {{ card.subsetName }}</div>
      <div class="card-number">#{{ card.cardNumber }}</div>
      <input type="checkbox" v-model="checked" @change="checkCard()"> Owned
    </div>
  </div>
</template>

<script>
import SportsCardService from '../services/SportsCardService';
export default {
  props: ["card", "owned"],
  data() {
    return {
      imageBaseUrl: "../../images/card-images/",
      checked: this.owned
    };
  },
  methods: {
    checkCard(){
      console.log("This card is checked" + this.checked)
      console.log("Something" + this.$store.state.user)
      console.log("Something" + this.$store.state.token)
      if(this.checked){
        SportsCardService.addCardToUser(this.$store.state.user.id, this.card.cardId).then( response => 
        console.log(response))
      } else {  
        SportsCardService.deleteCardFromUser(this.$store.state.user.id, this.card.cardId).then( response => 
        console.log(response))
      }
    }
  }
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

.not-checked img {
  opacity: 0.3; 
}
</style>