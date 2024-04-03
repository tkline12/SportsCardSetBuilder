<template>
  <div id="card-container">
    <div class="card-box" v-for="card of cards" v-bind:key="card.cardId" v-bind:card="card">
      <card-detail :card= "card" :owned = "isOwned(card.cardId)"/>
    </div>
  </div>
</template>

<script>
import CardDetail from './CardDetail.vue'

export default {
  components: {
    CardDetail
  },
  props: ['cards', 'userCards'],
  methods: {
    isOwned(cardId){
      return this.userCards.some(element => element.cardId === cardId)
    }
  }
    
}
</script>

<style scoped>
#card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 100px;
  justify-content: space-around;
}

</style>