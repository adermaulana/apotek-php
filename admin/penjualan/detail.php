<?php

include '../../config/koneksi.php';

session_start();

if($_SESSION['status'] != 'login'){

    session_unset();
    session_destroy();

    header("location:../");
}

if(isset($_GET['hal'])){
    if($_GET['hal'] == "detail"){
        $tampil = mysqli_query($koneksi, "SELECT * FROM data_order WHERE id_order = '$_GET[id]'");
        $data = mysqli_fetch_array($tampil);
        if($data){
            $id = $data['id_order'];
            $nama = $data['nama_order'];
            $email = $data['email_order'];
            $alamat = $data['alamat_order'];
            $telepon = $data['telepon_order'];
            $harga_total = $data['total_order'];
        }

        $query_produk = mysqli_query($koneksi, "SELECT doi.*, dobat.nama_obat, dobat.harga_obat
                                      FROM data_order_item doi
                                      JOIN data_obat dobat ON doi.id_obat = dobat.id_obat
                                      WHERE doi.id_order = '$id'");
        
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../assets/dashboard.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

</head>
<body>

<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">Apotek</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="../hapusSession.php">Sign out</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="../index.php">
              <span data-feather="home" class="align-text-bottom"></span>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../obat/index.php">
              <span data-feather="users" class="align-text-bottom"></span>
              Obat
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link  <?php if ($_SERVER['REQUEST_URI'] === '/apotek-php/admin/penjualan/tambah.php') echo 'active'; ?>" href="../penjualan/index.php">
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              Penjualan
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../pembelian/index.php">
              <span data-feather="shopping-bag" class="align-text-bottom"></span>
              Pembelian
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../pemasok/index.php">
              <span data-feather="users" class="align-text-bottom"></span>
              Pemasok
            </a>
          </li>
        </ul>
      </div>
    </nav>

   <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="col-lg-12">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h2>Detail Penjualan</h2>
    </div>
    <a class="btn btn-success mb-3" href="index.php">Kembali</a>
    <div class="card mb-3 col-md-6">
    <div class="card-body">

    <div>
        <h6>Data Diri Pelanggan:</h6>
        <span>Nama: <?= $nama ?></span><br>
        <span>Alamat: <?= $alamat ?></span><br>
        <span>Email: <?= $email ?></span><br>
        <p>Telepon: <?= $telepon ?></p>
    </div>

        <h5 class="card-title">Order ID: <?php echo $data['id_order']; ?></h5>

        <table class="table">
            <thead>
                <tr>
                    <th>Nama Obat</th>
                    <th>Jumlah</th>
                    <th>Total Harga</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $totalHarga = 0; // Variable to store total price
                while ($produk = mysqli_fetch_array($query_produk)) :
                    $hargaSatuan = $produk['harga_obat'];
                    $totalHargaProduk = $hargaSatuan * $produk['jumlah_order_item'];
                    $totalHarga += $totalHargaProduk;
                ?>
                    <tr>
                        <td><?= $produk['nama_obat'] ?></td>
                        <td><?= $produk['jumlah_order_item'] ?></td>
                        <td>Rp <?= number_format($totalHargaProduk, 0, ',', '.') ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>

        <div class="mt-3">
            <h5>Grand Total: Rp <?= number_format($totalHarga, 0, ',', '.') ?></h5>
        </div>
    </div>
</div>

    </div>
    </main>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">



<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  <script src="../../assets/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="../../assets/dashboard.js"></script>
</body>
</html>