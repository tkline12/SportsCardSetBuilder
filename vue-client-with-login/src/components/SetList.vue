<template>
  <div>
    <h2>{{ title }}</h2>
    <div class="sets">
      <div class="set" v-for="set in sets" v-bind:key="set.setID" v-on:click="viewSetDetails(set)">
        <div class="header">
          <h3>{{ set.setName }} | {{set.year}}</h3>
          <!-- <img v-bind:src="set.avatar" class="avatar" /> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['title', 'sets'],
  methods: {
    viewsetDetails(set) {
 //     this.$router.push({ name: 'setView', params: {setId: set.setID} });
    },
  }
};
</script>

<style scoped>

.set {
  background: #fff;
  border-radius: 0.25rem;
  padding: 10px;
  border: 1px;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
  margin-bottom: 10px;
  cursor: pointer;
}

.set:last-child {
  margin-bottom: 0px;
}

.set h3 {
  margin-top: 0px;
  font-size: 0.875rem;
}

.set .header {
  display: flex;
  justify-content: space-between;
}

.set .header img {
  border-radius: 9999px;
  width: 32px;
  align-self: flex-start;
}

.set .footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin: 20px 0 10px 0;
  font-size: 0.75rem;
}

.pill {
  padding: 8px;
  border-radius: 20px;
  font-size: 0.7rem;
}

.design {
  background-color: #faf5ff;
  color: #6b46c1;
}

.qa {
  background-color: #f0fff4;
  color: #2c7a7b;
}

.feature {
  background-color: #e6fffa;
  color: #2c7a7b;
}
</style>
