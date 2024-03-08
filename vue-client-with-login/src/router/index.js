import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components
import HomeView from '../views/HomeView.vue';
import PlayersView from '../views/PlayersView.vue';
import TeamsView from '../views/TeamsView.vue';
import SportsView from '../views/SportsView.vue';
import SetsView from '../views/SetsView.vue';
import CardsView from '../views/CardsView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import PlayerCardView from '../views/PlayerCardView.vue';
import SetCardView from '../views/SetCardView.vue';

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {
      requiresAuth: false
    }
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
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: {
      requiresAuth: false
    }
  }, 
  {
    path: "/cards/players/:playerId",
    name: "Player-Cards",
    component: PlayerCardView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/cards/sets/:setId",
    name: "Set-Cards",
    component: SetCardView,
    meta: {
      requiresAuth: false
    }
  }
];

// Create the router
const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

router.beforeEach((to) => {

  // Get the Vuex store
  const store = useStore();

  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    return {name: "login"};
  }
  // Otherwise, do nothing and they'll go to their next destination
});

export default router;
