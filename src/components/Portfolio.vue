<script setup>
import { ref } from 'vue'

import img1 from '../assets/1.png'
import img2 from '../assets/2.jpg'
import img3 from '../assets/3.png'
import img4 from '../assets/4.jpg'
import img5 from '../assets/5.jpg'
import img6 from '../assets/6.png'
import img7 from '../assets/7.png'

const images = [img1, img2, img3, img4, img5, img6, img7]

const selectedImage = ref(null)

const openImage = (img) => {
  selectedImage.value = img
}

const closeImage = () => {
  selectedImage.value = null
}
</script>

<template>
  <div id="portfolio" class="wrapper">

    <h1 class="text-2xl font-semibold mb-4">
  Portfolio
</h1>

    <div class="video-wrapper">
      <iframe
        src="https://www.youtube.com/embed/watch?v=OWQNCNZVpok"
        frameborder="0"
        allowfullscreen
      ></iframe>
    </div>
   <div class="desc-box">
  <h3>exceltrider - Riau De Janeiro</h3>
  <p class="meta">Premiered Mar 7, 2026 • On YouTube</p>

  <p class="desc">
    "Riau de Janeiro" is my original song who inspired by the vibe, history, and culture of Riau. 
    Especially from where I'm from, Air Molek. The lyrics reflect the spirit 
    of the people, unity, and the beauty of Malay (Melayu) culture.
  </p>
</div>

    <div class="links-card">

  <a href="https://bitexstudios.itch.io/night-shift-security" target="_blank" class="card">
    <h3>Night Shift: Security</h3>
    <p>My 2nd Game on Itch.io</p>
  </a>

  <a href="https://www.youtube.com/watch?v=MDXJhbcoJyk&t=3971s" target="_blank" class="card">
    <h3>YouTuber Gameplay
    </h3>
    <p>Windah Basudara</p>
  </a>

</div>
<h3 class="section-title">My Graphic Design</h3>
    <div class="gallery">
  <img 
    v-for="img in images" 
    :key="img"
    :src="img" 
    @click="openImage(img)"
  />
</div>
<div v-if="selectedImage" class="modal" @click="closeImage">
  <img :src="selectedImage" class="modal-img" />
</div>

  </div>
</template>

<style scoped>

.gallery img {
  cursor: pointer;
  transition: 0.3s;
}

.gallery img:hover {
  transform: scale(1.05);
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
}

.modal-img {
  max-width: 90%;
  max-height: 90%;
  border-radius: 15px;
}

.wrapper {
  padding: 80px 20px;
}

.section-title {
  margin-top: 50px;
  margin-bottom: 20px;
  font-size: 20px;
  text-align: center;
}

.desc-box {
  max-width: 600px;
  margin: 20px auto;
  margin-bottom: 50px;
  text-align: left;
}

.desc-box h3 {
  margin: 0;
  font-size: 20px;
}

.meta {
  color: #888;
  font-size: 13px;
  margin: 6px 0 12px;
}

.desc {
  color: #444;
  font-size: 14px;
  line-height: 1.7;
  margin-bottom: 10px;
}

.links-card {
  display: flex;
  justify-content: center;
  gap: 25px;
  margin: 50px 0;
  flex-wrap: wrap;
}

.card {
  position: relative;
  width: 230px;
  padding: 28px;
  border-radius: 25px;
  text-decoration: none;
  color: #111;

  background: rgba(255,255,255,0.7);
  backdrop-filter: blur(10px);

  box-shadow: 0 10px 30px rgba(0,0,0,0.08);
  overflow: hidden;

  transition: all 0.35s ease;
}

.card:hover {
  transform: translateY(-10px) scale(1.04);
  box-shadow: 0 25px 60px rgba(124, 58, 237, 0.25);
}

.card::before {
  content: "";
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;

  background: linear-gradient(
    120deg,
    transparent,
    rgba(255,255,255,0.6),
    transparent
  );

  transition: 0.6s;
}

.card:hover::before {
  left: 100%;
}

.card h3 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.card p {
  margin-top: 8px;
  font-size: 14px;
  color: #777;
}

.card::after {
  content: "";
  position: absolute;
  top: 0;
  left: 20px;
  width: 40px;
  height: 3px;
  border-radius: 10px;
  background: #000000;
}

.wrapper {
  padding: 80px 20px;
  text-align: center;
}

.video {
  max-width: 700px;
  margin: 20px auto;
  position: relative;
  padding-bottom: 56.25%;
}

.video iframe {
  position: absolute;
  width: 100%;
  height: 100%;
}

.links {
  margin: 20px;
  display: flex;
  justify-content: center;
  gap: 20px;
}

.links a {
  text-decoration: none;
  color: black;
  font-weight: 500;
}

.gallery {
  margin-top: 30px;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px,1fr));
  gap: 15px;
}

.gallery img {
  width: 100%;
  border-radius: 15px;
}
</style>