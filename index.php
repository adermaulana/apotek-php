<?php include 'partials/header.php'; ?>

<section class="jumbotron text-center mt-5">
        <div class="container">
            <h1>Selamat Datang di Apotek Kami</h1>
            <p>Temukan obat-obatan berkualitas dan pelayanan terbaik di sini.</p>
            <a href="obat.php" class="btn btn-success btn-lg">Lihat Obat-obatan</a>
        </div>
    </section>

    <section class="container mt-5">
        <h2 class="text-center mb-4">Daftar Obat Terbaru</h2>
        <div class="row">
                <?php
                $tampil = mysqli_query($koneksi, "SELECT * FROM data_obat ORDER BY id_obat DESC LIMIT 3");
                while ($data = mysqli_fetch_array($tampil)) :
                ?>
            <div class="col-lg-4 mb-3">
                <div class="card mb-4" style="height: 100%;">
                    <img style="height: 250px; object-fit: cover;" src="<?= $data['gambar_obat']; ?>" class="card-img-top" alt="Obat 1">
                    <div class="card-body">
                        <h5 class="card-title"><?= $data['nama_obat'] ?></h5>
                        <p class="card-text"><?= $data['deskripsi_obat'] ?></p>
                    </div>
                </div>
            </div>
            <?php endwhile;  ?>
        </div>
    </section>

<?php include 'partials/footer.php'; ?>