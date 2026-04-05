<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const game = ref(null)

onMounted(async () => {
  const id = route.params.id
  const res = await axios.get(`https://api.rawg.io/api/games/${id}?key=69a34018911f481a8440207386627ff1`)
  game.value = res.data
})
</script>

<template>
  <div v-if="game">
    <h1>{{ game.name }}</h1>
    <img :src="game.background_image" width="300" />
    <p>Rating: {{ game.rating }}</p>
    <p v-html="game.description"></p>
  </div>
</template>