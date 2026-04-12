<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100 px-4">

    <div class="text-center">

      <h1 class="text-2xl md:text-3xl font-semibold mb-2">
        404 - Not Found in The System
      </h1>

      <p class="text-gray-500 mb-6">
        404 A new error...error...
      </p>

      <div class="max-w-sm mx-auto rounded-xl overflow-hidden mb-6">
        <iframe 
          src="https://open.spotify.com/embed/track/24rDDbSlFY9OHrlJb48CRh"
          class="w-full h-[152px]"
          frameborder="0"
          allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
          loading="lazy">
        </iframe>
      </div>

      <router-link
        to="/"
        class="inline-block px-5 py-2 rounded-lg bg-white/70 backdrop-blur hover:bg-white transition shadow-sm hover:shadow-md"
      >
        ← Back to Home
      </router-link>

    </div>

  </div>
</template>