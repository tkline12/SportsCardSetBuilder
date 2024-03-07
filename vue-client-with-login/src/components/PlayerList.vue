<template>
  <div>
    <h2>{{ title }}</h2>
    <div class="players">
      <div class="player" v-for="player in players" :key="player.playerId" @click="viewPlayerCards(player)">
        <div class="header">
          <h3>{{ player.playerName }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['title', 'players'],
  methods: {
    viewPlayerCards(player) {
    this.$router.push({ name: 'Player-Cards', params: {playerId: player.playerId} });
    },
  }
};
</script>

<style scoped>

.player {
  background: #fff;
  border-radius: 0.25rem;
  padding: 10px;
  border: 1px;
  width: 10%;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
  margin-bottom: 10px;
  cursor: pointer;
}

.player:last-child {
  margin-bottom: 0px;
}

.player h3 {
  margin-top: 0px;
  font-size: 0.875rem;
}

.player .header {
  display: flex;
  justify-content: space-between;
}

.player .header img {
  border-radius: 9999px;
  width: 32px;
  align-self: flex-start;
}

.player .footer {
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
