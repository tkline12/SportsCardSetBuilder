<template>
  <div class="set-detail">
    <div class="set-image" @click="viewSetCards(set)">
      <img :src="imageBaseUrl + set.setImage" :alt="set.title" />
    </div>
    <div class="set-info">
      </div>
      <div class="set-name">{{set.year}} {{set.setName}}</div>
    </div>
</template>

<script>
export default {
  props: ["set"],
  data() {
    return {
      imageBaseUrl: "images/set-images/",
    };
  },
  methods: {
    viewSetCards(set) {
      this.$router.push({ name: 'Set-Cards', params: {setId: set.setId} });
    },
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

.set-detail {
  display: flex;
  justify-content: space-evenly;
  width: 300px;
  flex-direction: column;
}

.set-title {
  font-size: 1.3rem;
  font-weight: bold;
  margin-bottom: 1.5rem;
}

.set-image {
  height: 300px;
  margin-bottom: 2rem;
  cursor: pointer;
}

img {
  border: 1px solid#c7c7c7;
  height: 100%;
}

</style>