<template>
  <div id="card-container">
    <div v-for="card of cards" v-bind:key="card.cardID" v-bind:card="card">
      {{card.cardName}}
      <card-detail :card= "card"/>
    </div>
  </div>
</template>

<script>
import CardDetail from './CardDetail.vue'

export default {
  components: {
    CardDetail
  },
  props: ['cards']
}
</script>

<style scoped>
#card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: space-around;
}
</style>