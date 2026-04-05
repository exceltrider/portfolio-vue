<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const games = ref([])

const customGame = {
  id: 'my-game',
  name: 'Night Shift: Security',
  custom: true,
  image: 'https://img.itch.zone/aW1nLzIxNzcxMjE2LmdpZg==/original/LNP8ky.gif'
}

onMounted(async () => {
  const res = await axios.get('https://api.rawg.io/api/games?key=69a34018911f481a8440207386627ff1')
  games.value = [customGame, ...res.data.results]
})
</script>

<template>
  <div class="container">

    <router-link to="/" class="back-btn">
      ← Back to Home
    </router-link>

    <h1 class="title">Game Collection</h1>

    <div class="grid">
      <div v-for="game in games" :key="game.id" class="card">

        <router-link v-if="game.custom" to="/my-game">
          <img :src="game.image" class="image" />
          <h2>{{ game.name }}</h2>
        </router-link>

        <router-link v-else :to="'/games/' + game.id">
          <img 
            :src="game.background_image || 'https://via.placeholder.com/600x300?text=No+Image'" 
            class="image" 
          />
          <h2>{{ game.name }}</h2>
        </router-link>

      </div>
    </div>

  </div>
</template>

<style scoped>

a {
  text-decoration: none;
  color: inherit;
}

a:visited {
  color: inherit;
}

.container {
  padding: 40px 20px;
  max-width: 1000px;
  margin: auto;
}

.title {
  text-align: center;
  font-size: 28px;
  margin-bottom: 30px;
  font-weight: 600;
  color: #111;
}

/* BACK BUTTON */
.back-btn {
  display: inline-block;
  margin-bottom: 20px;
  padding: 8px 14px;
  border-radius: 12px;
  font-size: 14px;

  background: rgba(255,255,255,0.6);
  backdrop-filter: blur(6px);

  transition: 0.2s;
}

.back-btn:hover {
  transform: translateX(-4px);
  background: rgba(255,255,255,0.9);
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 20px;
}

.card {
  border-radius: 20px;
  overflow: hidden;
  background: rgba(255,255,255,0.6);
  backdrop-filter: blur(8px);
  transition: 0.3s;
}

.card:hover {
  transform: translateY(-6px);
}

.image {
  width: 100%;
  height: 140px;
  object-fit: cover;
}

.card h2 {
  font-size: 14px;
  padding: 12px;
  color: #111;
  font-weight: 500;
}
</style>