<template>
  <div class="bg">
    <About />
    <QuickLinks />
    <Portfolio />
    <Contact />
  </div>
</template>

<script setup>
import About from '../components/About.vue'
import QuickLinks from '../components/QuickLinks.vue'
import Portfolio from '../components/Portfolio.vue'
import Contact from '../components/Contact.vue'
</script>

<style>
.bg {
  min-height: 100vh;
  background: linear-gradient(135deg, #f5f7ff, #e9ecff);
}
</style>