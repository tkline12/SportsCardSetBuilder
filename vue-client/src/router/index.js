// Router
import { createRouter as _createRouter, createWebHistory } from 'vue-router';
// Components
import HomeView from '../views/HomeView.vue';
import PlayersView from '../views/PlayersView.vue';
import TeamsView from '../views/TeamsView.vue';
import SportsView from '../views/SportsView.vue';
import SetsView from '../views/SetsView.vue';
import CardsView from '../views/CardsView.vue';


// Create routes
const routes = [
  {
    path: '/',
    name: 'HomeView',
    component: HomeView
  },
  {
    path: '/players',
    name: 'PlayersView',
    component: PlayersView
  },
  {
    path: '/teams',
    name: 'TeamsView',
    component: TeamsView
  },
  {
    path: '/sports',
    name: 'SportsView',
    component: SportsView
  },
  {
    path: '/sets',
    name: 'SetsView',
    component: SetsView
  },
  {
    path: '/cards',
    name: 'CardsView',
    component: CardsView
  },
];

export function createRouter () {
  return _createRouter({
    history: createWebHistory(),
    routes: routes
  })
}
