<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const router = useRouter()

const games = ref([])
const page = ref(1)
const loading = ref(false)

const myGame = {
  id: "my-game",
  name: "Night Shift: Security",
  rating: 5,
  released: "2026",
  background_image: "https://img.itch.zone/aW1nLzIxNzcxMjE2LmdpZg==/original/LNP8ky.gif",
  custom: true
}

const fetchGames = async () => {
  loading.value = true

  try {
    const res = await axios.get(
      `https://api.rawg.io/api/games?key=69a34018911f481a8440207386627ff1&page=${page.value}&page_size=8`
    )

    games.value = [myGame, ...res.data.results.slice(0, 8)]

  } catch (err) {
    console.error("API ERROR:", err)
    games.value = [myGame]
  } finally {
    loading.value = false
  }
}

const nextPage = () => {
  page.value++
  fetchGames()
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

const prevPage = () => {
  if (page.value > 1) {
    page.value--
    fetchGames()
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }
}

const goDetail = (game) => {
  if (game.custom) {
    router.push('/my-game')
  } else {
    router.push(`/games/${game.id}`)
  }
}

onMounted(fetchGames)
</script>

<template>
  <div class="min-h-screen bg-gray-50">

    <div class="max-w-6xl mx-auto px-6 py-16">

      <!-- 🔥 BACK HOME -->
      <div class="mb-6">
        <router-link 
          to="/"
          class="text-sm text-gray-500 hover:text-black transition"
        >
          ← Back to Home
        </router-link>
      </div>

      <!-- HEADER -->
      <div class="mb-10">
        <h1 class="text-3xl font-semibold">Game Collection</h1>
        <p class="text-gray-400 text-sm mt-1">
          Page {{ page }} • 9 games
        </p>
      </div>

      <!-- LOADING -->
      <div v-if="loading" class="text-gray-500">
        Loading games...
      </div>

      <!-- GRID -->
      <div v-else class="grid sm:grid-cols-2 md:grid-cols-3 gap-6">

        <div
          v-for="game in games"
          :key="game.id"
          @click="goDetail(game)"
          class="group relative bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-xl transition duration-300 cursor-pointer"
        >
          <!-- 🔥 BADGE MY GAME -->
          <span
            v-if="game.custom"
            class="absolute top-2 left-2 bg-black text-white text-xs px-2 py-1 rounded z-10"
          >
            MY GAME
          </span>

          <img
            :src="game.background_image || 'https://via.placeholder.com/400x200'"
            class="w-full h-44 object-cover group-hover:scale-105 transition"
          />

          <div class="p-4">
            <h2 class="text-sm font-medium text-gray-900 line-clamp-1">
              {{ game.name }}
            </h2>

            <div class="flex justify-between text-xs text-gray-500 mt-2">
              <span>⭐ {{ game.rating || '-' }}</span>
              <span>{{ game.released || 'Unknown' }}</span>
            </div>
          </div>
        </div>

      </div>

      <!-- PAGINATION -->
      <div class="flex justify-center gap-4 mt-12">

        <button
          @click="prevPage"
          :disabled="page === 1"
          class="px-5 py-2 bg-gray-200 rounded-lg disabled:opacity-40"
        >
          Prev
        </button>

        <button
          @click="nextPage"
          class="px-5 py-2 bg-black text-white rounded-lg"
        >
          Next
        </button>

      </div>

    </div>

  </div>
</template>