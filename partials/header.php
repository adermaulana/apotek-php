<?php

  session_start();

  // Cek apakah pengguna sudah login
  if(isset($_SESSION['username'])) {
      $isLoggedIn = true;
      $userName = $_SESSION['username']; // Ambil nama user dari session
  } else {
      $isLoggedIn = false;
  }

?>

<!DOCTYPE html>
<html>
<head>
    <title>Apotek Website</title>
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="index.php">Apotek</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link <?php if ($_SERVER['REQUEST_URI'] === '/apotek_sp/index.php') echo 'active'; ?>" aria-current="page" href="index.php">Halaman Utama</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <?php if ($_SERVER['REQUEST_URI'] === '/apotek_sp/obat.php') echo 'active'; ?>" href="obat.php">Produk</a>
              </li>
            </ul>

            <?php if($isLoggedIn): ?>
                <!-- Tampilkan elemen navigasi setelah login -->
                <ul class="navbar-nav ms-auto me-5">
                <li class="nav-item">
                    <a class="btn btn-light" href="admin/index.php">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-light" href="admin/hapusSession.php">Logout</a>
                </li>
                </ul>
            <?php else: ?>
            <!-- Start Tombol Button -->
            <ul class="navbar-nav ms-auto me-5">
                <li class="nav-item">
                    <a class="btn btn-light" href="admin/login.php">Login</a>
                </li>
            </ul>
            <!-- End Tombol Button -->
            <?php endif; ?>

          </div>
        </div>
      </nav>
    </header>
    <main>
