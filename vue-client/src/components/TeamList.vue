<template>
  <div>
    <h2>{{ title }}</h2>
    <div class="teams">
      <div class="team" v-for="team in teams" v-bind:key="team.teamID" v-on:click="viewTeamDetails(team)">
        <div class="header">
          <h3>{{ team.teamName }}</h3>
          <!-- <img v-bind:src="team.avatar" class="avatar" /> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    props: ['title', 'teams'],
    methods: {
    viewTeamDetails(team) {
 //     this.$router.push({ name: 'TeamView', params: {teamId: team.teamID} });
    },
  }
};
</script>

<style>
.team {
  background: #fff;
  border-radius: 0.25rem;
  padding: 10px;
  border: 1px;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
  margin-bottom: 10px;
  cursor: pointer;
}

.team:last-child {
  margin-bottom: 0px;
}

.team h3 {
  margin-top: 0px;
  font-size: 0.875rem;
}

.team .header {
  display: flex;
  justify-content: space-between;
}

.team .header img {
  border-radius: 9999px;
  width: 32px;
  align-self: flex-start;
}

.team .footer {
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
