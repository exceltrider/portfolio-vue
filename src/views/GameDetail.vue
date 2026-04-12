<script setup>
import { useRoute, useRouter } from 'vue-router'
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'

const route = useRoute()
const router = useRouter()

const game = ref(null)
const screenshots = ref([])
const currentIndex = ref(0)
const loading = ref(true)

// 🇮🇩 FORMAT TANGGAL
const formatDate = (date) => {
  if (!date) return 'Unknown'
  return new Date(date).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric'
  })
}

// 🔥 FORMAT PARAGRAF
const formattedDescription = computed(() => {
  if (!game.value?.description_raw) return []
  return game.value.description_raw
    .split('\n')
    .filter(p => p.trim() !== '')
})

// 👉 NEXT IMAGE
const nextImage = () => {
  if (screenshots.value.length === 0) return
  currentIndex.value = (currentIndex.value + 1) % screenshots.value.length
}

// 👉 PREV IMAGE
const prevImage = () => {
  if (screenshots.value.length === 0) return
  currentIndex.value =
    (currentIndex.value - 1 + screenshots.value.length) % screenshots.value.length
}

onMounted(async () => {
  try {
    // 🔥 FETCH DETAIL
    const res = await axios.get(
      `https://api.rawg.io/api/games/${route.params.id}?key=69a34018911f481a8440207386627ff1`
    )

    if (!res.data || !res.data.name) {
      router.replace('/not-found')
      return
    }

    game.value = res.data

    // 🔥 FETCH SCREENSHOTS
    const shotRes = await axios.get(
      `https://api.rawg.io/api/games/${route.params.id}/screenshots?key=69a34018911f481a8440207386627ff1`
    )

    screenshots.value = shotRes.data.results || []

  } catch (err) {
    router.replace('/not-found')
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="min-h-screen bg-gray-50">

    <!-- NAV -->
    <div class="max-w-4xl mx-auto px-6 pt-10">
      <button 
        @click="$router.back()"
        class="text-sm text-gray-500 hover:text-black transition"
      >
        ← Back
      </button>
    </div>

    <!-- LOADING -->
    <div v-if="loading" class="text-center mt-20 text-gray-500">
      Loading...
    </div>

    <!-- CONTENT -->
    <div v-else-if="game" class="max-w-4xl mx-auto px-6 py-10">

      <!-- 🔥 CAROUSEL -->
      <div class="relative rounded-2xl overflow-hidden shadow mb-8">

        <img
          v-if="screenshots.length > 0"
          :src="screenshots[currentIndex]?.image"
          class="w-full h-[260px] md:h-[360px] object-cover transition"
        />

        <!-- fallback kalau ga ada screenshot -->
        <img
          v-else
          :src="game.background_image"
          class="w-full h-[260px] md:h-[360px] object-cover"
        />

        <!-- BUTTON LEFT -->
        <button
          @click="prevImage"
          class="absolute left-3 top-1/2 -translate-y-1/2 bg-black/50 text-white px-3 py-1 rounded-full"
        >
          ‹
        </button>

        <!-- BUTTON RIGHT -->
        <button
          @click="nextImage"
          class="absolute right-3 top-1/2 -translate-y-1/2 bg-black/50 text-white px-3 py-1 rounded-full"
        >
          ›
        </button>

      </div>

      <!-- TITLE -->
      <h1 class="text-2xl md:text-3xl font-semibold mb-2 text-center">
        {{ game.name }}
      </h1>

      <!-- META -->
      <div class="flex flex-wrap justify-center gap-4 text-sm text-gray-500 mb-6">
        <span>⭐ {{ game.rating }}</span>
        <span>📅 {{ formatDate(game.released) }}</span>
        <span v-if="game.metacritic">🎯 {{ game.metacritic }}</span>
        <span v-if="game.playtime">⏱ {{ game.playtime }} jam</span>
      </div>

      <!-- GENRES -->
      <div class="flex flex-wrap justify-center gap-2 mb-6">
        <span
          v-for="genre in game.genres"
          :key="genre.id"
          class="px-3 py-1 text-xs bg-gray-200 rounded-full"
        >
          {{ genre.name }}
        </span>
      </div>

      <!-- DESCRIPTION -->
      <div class="max-w-2xl mx-auto text-gray-700 leading-relaxed space-y-4 text-justify mb-10">
        <p
          v-for="(paragraph, index) in formattedDescription"
          :key="index"
        >
          {{ paragraph }}
        </p>
      </div>

      <!-- INFO -->
      <div class="grid md:grid-cols-2 gap-8 max-w-2xl mx-auto text-center md:text-left">

        <div>
          <h2 class="font-semibold mb-1">Platforms</h2>
          <p class="text-gray-600 text-sm">
            {{ game.platforms?.map(p => p.platform.name).join(', ') }}
          </p>
        </div>

        <div>
          <h2 class="font-semibold mb-1">Website</h2>
          <a 
            :href="game.website" 
            target="_blank"
            class="text-blue-600 text-sm hover:underline"
          >
            {{ game.website || 'Tidak tersedia' }}
          </a>
        </div>

      </div>

    </div>

  </div>
</template>