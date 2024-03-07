<template>
  <div id="set-container">
    <div class="set-box" v-for="set of sets" :key="set.setId" :set="set" @click="viewSetCards(set)">
      <set-detail :set= "set"/>
    </div>
  </div>
</template>

<script>
import SetDetail from './SetDetail.vue'

export default {
  components: {
    SetDetail
  },
  props: ['sets']
}
</script>

<style scoped>
#set-container {
  display: flex;
  flex-wrap: wrap;
  gap: 100px;
  justify-content: space-around;
}

.setbox {
  background-color: black;
}
</style>