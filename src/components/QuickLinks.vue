<template>
  <div class="wrapper">
    <div class="grid">

      <a href="#contact" class="card">
        <h2>Contact</h2>
        <p>Get in touch</p>
      </a>

      <a href="#portfolio" class="card">
        <h2>Portfolio</h2>
        <p>See my works</p>
      </a>

    </div>
  </div>
</template>

<style scoped>
.wrapper {
  padding: 40px 20px;
  display: flex;
  justify-content: center;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  max-width: 600px;
  margin: auto;
}

.card {
  position: relative;
  padding: 30px;
  border-radius: 25px;
  text-align: center;
  text-decoration: none;
  color: #111;

  background: rgba(255,255,255,0.6);
  backdrop-filter: blur(8px);

  border: 1px solid transparent;

  transition: all 0.3s ease;
}

.card:hover {
  transform: translateY(-6px);
  background: rgba(255,255,255,0.9);
  border: 1px solid #e5e5e5;
}

.card::after {
  content: "";
  position: absolute;
  bottom: 12px;
  left: 50%;
  width: 0;
  height: 2px;
  background: #111;
  transition: 0.3s;
  transform: translateX(-50%);
}

.card:hover::after {
  width: 40%;
}

.card:active {
  transform: scale(0.97);
}

.card h2 {
  margin: 0;
  font-size: 18px;
  font-weight: 600;
}

.card p {
  margin-top: 8px;
  font-size: 14px;
  color: #777;
}

h2 { margin: 0; }
p { color: #777; }
</style>