<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const games = ref([])

onMounted(async () => {
  const res = await axios.get('https://api.rawg.io/api/games?key=69a34018911f481a8440207386627ff1')
  games.value = res.data.results
})
</script>

<template>
  <div>
    <h1>Game List</h1>

    <div v-for="game in games" :key="game.id">
      <router-link :to="'/games/' + game.id">
        {{ game.name }}
      </router-link>
    </div>
  </div>
</template>