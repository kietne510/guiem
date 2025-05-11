<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Gửi Em</title>
  <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Quicksand&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0; padding: 0; box-sizing: border-box;
    }
    body {
      font-family: 'Quicksand', sans-serif;
      background: linear-gradient(180deg, #ffe5ec 0%, #ffc2d1 100%);
      overflow-x: hidden;
    }
    header {
      text-align: center;
      padding: 3rem 1rem 2rem;
    }
    header h1 {
      font-family: 'Pacifico', cursive;
      font-size: 3rem;
      color: #d63384;
    }
    .heart-canvas {
      position: fixed;
      top: 0; left: 0;
      width: 100vw; height: 100vh;
      z-index: -1;
    }
    section {
      padding: 3rem 1rem;
      max-width: 800px;
      margin: auto;
    }
    .letter {
      background: #fff0f6;
      border-radius: 20px;
      padding: 2rem;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 1rem;
      margin-top: 2rem;
    }
    .gallery img {
      width: 100%;
      border-radius: 1rem;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .music-toggle {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #ff80ab;
      color: white;
      border: none;
      padding: 0.8rem 1.2rem;
      border-radius: 30px;
      cursor: pointer;
      box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
  </style>
</head>
<body>
  <canvas class="heart-canvas"></canvas>

  <header>
    <h1>Gửi Em</h1>
    <p>Trang web nhỏ này là dành cho em 💖</p>
  </header>

  <section>
    <div class="letter">
      <h2>Thư gửi em</h2>
      <p id="typed"></p>
    </div>
  </section>

  <section>
    <h2 style="text-align:center; color:#d63384; margin-bottom: 1rem;">Bộ ảnh chibi dễ thương</h2>
    <div class="gallery">
      <img src="https://i.imgur.com/Ofy8qVH.png" alt="chibi 1">
      <img src="https://i.imgur.com/J8jvGoT.png" alt="chibi 2">
      <img src="https://i.imgur.com/N0gH3Cy.png" alt="chibi 3">
      <img src="https://i.imgur.com/V3gyGcJ.png" alt="chibi 4">
    </div>
  </section>

  <button class="music-toggle" onclick="toggleMusic()">🎵 Bật/Tắt Nhạc</button>
  <audio id="bgMusic" loop>
    <source src="https://cdn.pixabay.com/audio/2022/11/16/audio_7abdd9db33.mp3" type="audio/mpeg">
  </audio>

  <script>
    // Typed letter effect
    const text = `Em à, đây chỉ là một góc nhỏ anh dành riêng cho em. Dù là những dòng chữ đơn giản, nhưng tất cả đều là từ trái tim anh. Mong rằng mỗi lần em ghé thăm nơi này, em sẽ mỉm cười 💕`;
    let i = 0;
    function typeLetter() {
      if (i < text.length) {
        document.getElementById("typed").innerHTML += text.charAt(i);
        i++;
        setTimeout(typeLetter, 40);
      }
    }
    window.onload = typeLetter;

    // Music toggle
    const music = document.getElementById("bgMusic");
    function toggleMusic() {
      if (music.paused) music.play();
      else music.pause();
    }

    // Canvas heart effect
    const canvas = document.querySelector(".heart-canvas");
    const ctx = canvas.getContext("2d");
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    const hearts = [];
    for (let i = 0; i < 60; i++) {
      hearts.push({
        x: Math.random() * canvas.width,
        y: Math.random() * canvas.height,
        size: Math.random() * 10 + 5,
        speed: Math.random() * 1 + 0.5,
        dx: (Math.random() - 0.5) * 2,
      });
    }
    function drawHeart(x, y, size) {
      ctx.save();
      ctx.translate(x, y);
      ctx.beginPath();
      ctx.moveTo(0, 0);
      ctx.bezierCurveTo(0, -size / 2, -size, -size / 2, -size, 0);
      ctx.bezierCurveTo(-size, size / 2, 0, size, 0, size * 1.5);
      ctx.bezierCurveTo(0, size, size, size / 2, size, 0);
      ctx.bezierCurveTo(size, -size / 2, 0, -size / 2, 0, 0);
      ctx.closePath();
      ctx.fillStyle = 'rgba(255, 105, 180, 0.7)';
      ctx.fill();
      ctx.restore();
    }
    function animate() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      for (let heart of hearts) {
        drawHeart(heart.x, heart.y, heart.size);
        heart.y -= heart.speed;
        heart.x += heart.dx;
        if (heart.y < -20) {
          heart.y = canvas.height + 20;
          heart.x = Math.random() * canvas.width;
        }
      }
      requestAnimationFrame(animate);
    }
    animate();
    window.onresize = () => {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    }
  </script>
</body>
</html>
