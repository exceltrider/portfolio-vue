<template>
  <div class="wrapper">
    <div class="about">
      <div class="content">
        <img src="../assets/profile.jpeg" class="avatar" />

        <div class="text">
          <h1 class="text-3xl font-semibold tracking-tight">
  Excel Tri Dermawan
</h1>
          <p class="role">Graphic Designer • Game Developer • Music Producer</p>

          <p class="desc">
            An <strong>Informatics Engineering</strong> student who explores creativity across digital and artistic fields. My work spans game design, music production, and content creation, where technology becomes a medium to express emotion and storytelling.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.wrapper {
  padding: 80px 20px;
  display: flex;
  justify-content: center;
}

.about {
  max-width: 900px;
  margin: 60px auto;
  padding: 35px 40px;
  border-radius: 25px;

  background: rgba(255,255,255,0.75);
  backdrop-filter: blur(12px);

  display: flex;
  align-items: center;
  gap: 30px;

  position: relative;
  transition: 0.3s;
}

.content {
  display: flex;
  align-items: center;
  gap: 40px;
}

.avatar {
  width: 140px;
  height: 140px;
  border-radius: 50%;
  object-fit: cover;
  box-shadow: 0 10px 30px rgba(0,0,0,0.15);
  border: 4px solid white;
}

.text h1 {
  margin: 0 0 10px 0; /* ini nambah jarak bawah */
  font-size: 32px;
}

.role {
  color: #777;
  margin-bottom: 15px;
}

.desc {
  color: #444;
  line-height: 1.7;
  max-width: 500px;
}

.details {
  margin-top: 15px;
  display: flex;
  gap: 20px;
  color: #777;
  font-size: 14px;
}
</style>