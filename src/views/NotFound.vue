<template>
  <div class="container">
    <h1>404 - Not Found in The System</h1>
    <p class="subtitle">404 A new error...error...</p>

    <div class="player">
      <iframe 
        src="https://open.spotify.com/embed/track/24rDDbSlFY9OHrlJb48CRh"
        width="100%" 
        height="152"
        frameborder="0"
        allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
        loading="lazy">
      </iframe>
    </div>

    <router-link to="/" class="back-btn">
      ← Back to Home
    </router-link>
  </div>
</template>

<style scoped>
.container {
  text-align: center;
  margin-top: 100px;
}

h1 {
  font-size: 28px;
  margin-bottom: 10px;
}

.subtitle {
  color: #777;
  margin-bottom: 30px;
}


.player {
  max-width: 400px;
  margin: auto;
  border-radius: 12px;
  overflow: hidden;
}

.back-btn {
  display: inline-block;
  margin-top: 30px;
  padding: 8px 14px;
  border-radius: 12px;
  background: rgba(255,255,255,0.6);
  text-decoration: none;
  color: #111;
  transition: 0.2s;
}

.back-btn:hover {
  transform: translateX(-4px);
  background: rgba(255,255,255,0.9);
}
</style>