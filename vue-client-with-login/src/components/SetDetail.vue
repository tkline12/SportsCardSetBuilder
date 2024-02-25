<template>
  <div class="set-detail">
    <div class="set-image">
      <img v-bind:src="imageBaseUrl + set.setImage" v-bind:alt="set.title" />
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
}

img {
  border: 1px solid#c7c7c7;
  height: 100%;
}

</style>