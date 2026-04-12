<script setup>
import { ref, computed } from 'vue'

const game = {
  name: "Night Shift: Security",
  rating: 5,
  released: "2025-06-21",
  playtime: 2,
  genres: [
    { id: 1, name: "Horror" },
    { id: 2, name: "Psychological" }
  ],
  platforms: [
    { platform: { name: "PC" } }
  ],
  website: "https://bitexstudios.itch.io/night-shift-security",
  description: `
Step into the forgotten dark with Night Shift: Security, a chilling psychological horror experience from Bite X Studios.

You play as a night security guard assigned to an abandoned office building with a disturbing past. What starts as a routine shift quickly turns into a descent into fear, paranoia, and the unknown.

Explore eerie corridors, uncover hidden secrets, and survive entities that lurk beyond human understanding.

Every decision matters. Every sound could be your last.
  `,
  images: [
    "https://img.itch.zone/aW1hZ2UvMzU4NDI4Mi8yMTc2OTg3Ni5qcGVn/original/4dHDIC.jpeg",
    "https://img.itch.zone/aW1hZ2UvMzU4NDI4Mi8yMTc2OTg3Mi5qcGVn/original/fbY2mU.jpeg",
    "https://img.itch.zone/aW1hZ2UvMzU4NDI4Mi8yMTc2OTg3NC5qcGVn/original/f%2Fwf8b.jpeg",
    "https://img.itch.zone/aW1hZ2UvMzU4NDI4Mi8yMTc2OTg3Ny5qcGVn/original/cW7RPF.jpeg",
    "https://img.itch.zone/aW1hZ2UvMzU4NDI4Mi8yMTc2OTg3NS5qcGVn/original/VpszLR.jpeg",
    "https://img.itch.zone/aW1hZ2UvMzU4NDI4Mi8yMTc2OTg3My5qcGVn/original/UX05Zw.jpeg"
  ]
}

const currentIndex = ref(0)

const formatDate = (date) => {
  return new Date(date).toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric'
  })
}

const formattedDescription = computed(() => {
  return game.description.split('\n').filter(p => p.trim() !== '')
})

const nextImage = () => {
  currentIndex.value = (currentIndex.value + 1) % game.images.length
}

const prevImage = () => {
  currentIndex.value =
    (currentIndex.value - 1 + game.images.length) % game.images.length
}
</script>

<template>
  <div class="min-h-screen bg-gray-50">

    <div class="max-w-4xl mx-auto px-6 pt-10">
      <button 
        @click="$router.back()"
        class="text-sm text-gray-500 hover:text-black transition"
      >
        ← Back
      </button>
    </div>

    <div class="max-w-4xl mx-auto px-6 py-10">

      <div class="relative rounded-2xl overflow-hidden shadow mb-8 bg-black flex items-center justify-center">
        <img
          :src="game.images[currentIndex]"
          class="max-h-[400px] w-auto object-contain"
        />

        <button
          @click="prevImage"
          class="absolute left-3 top-1/2 -translate-y-1/2 bg-black/60 text-white px-3 py-1 rounded-full"
        >
          ‹
        </button>

        <button
          @click="nextImage"
          class="absolute right-3 top-1/2 -translate-y-1/2 bg-black/60 text-white px-3 py-1 rounded-full"
        >
          ›
        </button>
      </div>

      <h1 class="text-2xl md:text-3xl font-semibold mb-2 text-center">
        {{ game.name }}
      </h1>

      <div class="flex flex-wrap justify-center gap-4 text-sm text-gray-500 mb-6">
        <span>⭐ {{ game.rating }}</span>
        <span>📅 {{ formatDate(game.released) }}</span>
        <span>⏱ {{ game.playtime }} hours</span>
      </div>

      <div class="flex flex-wrap justify-center gap-2 mb-6">
        <span
          v-for="genre in game.genres"
          :key="genre.id"
          class="px-3 py-1 text-xs bg-gray-200 rounded-full"
        >
          {{ genre.name }}
        </span>
      </div>

      <div class="max-w-2xl mx-auto text-gray-700 leading-relaxed space-y-4 text-justify mb-10">
        <p
          v-for="(paragraph, index) in formattedDescription"
          :key="index"
        >
          {{ paragraph }}
        </p>
      </div>

      <div class="grid md:grid-cols-2 gap-8 max-w-2xl mx-auto text-center md:text-left">

        <div>
          <h2 class="font-semibold mb-1">Platforms</h2>
          <p class="text-gray-600 text-sm">
            {{ game.platforms.map(p => p.platform.name).join(', ') }}
          </p>
        </div>

        <div>
          <h2 class="font-semibold mb-1">Website</h2>
          <a 
            :href="game.website"
            target="_blank"
            class="text-blue-600 text-sm hover:underline break-all"
          >
            {{ game.website }}
          </a>
        </div>

      </div>

    </div>

  </div>
</template>