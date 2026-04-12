import { createRouter, createWebHistory } from 'vue-router'

import Home from '../views/Home.vue'
import GameList from '../views/GameList.vue'
import GameDetail from '../views/GameDetail.vue'
import MyGame from '../views/MyGame.vue'
import NotFound from '../views/NotFound.vue'

const routes = [
  { path: '/', component: Home },

  { path: '/games', component: GameList },

  { path: '/games/:id', component: GameDetail },

  { path: '/my-game', component: MyGame },

  { path: '/not-found', component: NotFound },

  { path: '/:pathMatch(.*)*', redirect: '/not-found' }
]

export default createRouter({
  history: createWebHistory(),
  routes
})