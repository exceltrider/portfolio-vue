<template>
  <div style="text-align:center; margin-top:50px;">
    <h1>Night Shift: Security</h1>

    <p>Psychological horror game set in an abandoned building.</p>

    <div class="video-container">
      <iframe 
        src="https://www.youtube.com/embed/Gn7k8ocM7R4"
        frameborder="0"
        allowfullscreen>
      </iframe>
    </div>

    <p style="margin-top:20px;">
      Step into the forgotten dark with Night Shift: Security, a chilling psychological horror experience from Bite X Studios.
    </p>

    <router-link to="/games">Back to Games</router-link>
  </div>
</template>

<style>
.video-container {
  position: relative;
  width: 100%;
  max-width: 700px;
  margin: auto;
  aspect-ratio: 16 / 9;
}

.video-container iframe {
  width: 100%;
  height: 100%;
  border-radius: 12px;
}
</style>