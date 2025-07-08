<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Leaderboard - Playlogue</title>
  <link rel="stylesheet" href="leaderboard.css" />
</head>
<body>
  <header class="navbar">
    <h1>PLAYLOGUE</h1>
    <nav>
      <ul class="navtitle">
        <li><a href="#">Inicio</a></li>
        <li><a href="#">Reviews</a></li>
        <li><a href="#">Leaderboard</a></li>
        <li><a href="#">Juegos</a></li>
      </ul>
    </nav>
    <div class="user-profile">
      <img src="img/profile.avif" alt="Usuario" />
      <span>NeoJok</span>
    </div>
  </header>

  <main>
    <div class="banner">
      <img src="img/gris_1.jpg" alt="Banner">
    </div>

    <table class="leaderboard">
      <thead>
        <tr>
          <th>Juego</th>
          <th>Plataforma</th>
          <th>Género</th>
          <th>Nota Media</th>
          <th>Lanzamiento</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $games = [
          ['Balatro', 'PC/Switch/PS5', 'Roguelike, Deckbuilder', 89, 2024, 'border-violet'],
          ['Hades II', 'PC', 'Roguelike, Acción', 93, 2024, 'border-pink'],
          ['Stellar Blade', 'PS5', 'Acción, Aventura', 81, 2024, 'border-green'],
          ['Elden Ring', 'PC/PS5/Xbox', 'RPG, Mundo Abierto', 95, 2022, 'border-yellow'],
          ['Tunic', 'PC/Xbox/PS/Switch', 'Aventura, Acción, Indie', 85, 2022, 'border-orange'],
          ['Gris', 'PC/Switch/iOS', 'Plataforma, Aventura', 84, 2018, 'border-blue'],
        ];

        foreach ($games as $game) {
          echo "<tr class='{$game[5]}'>";
          echo "<td><strong>{$game[0]}</strong></td>";
          echo "<td>{$game[1]}</td>";
          echo "<td>{$game[2]}</td>";
          echo "<td>{$game[3]}</td>";
          echo "<td>{$game[4]}</td>";
          echo "</tr>";
        }
        ?>
      </tbody>
    </table>
  </main>
</body>
</html>
