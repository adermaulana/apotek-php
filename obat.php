<?php include 'partials/header.php'; ?>


<?php 



?>

    <section class="container mt-5">
        <h2 class="mb-4">Daftar Obat-obatan</h2>
        <div class="row">
        <?php
                $no = 1;
                $tampil = mysqli_query($koneksi, "SELECT * FROM data_obat");
                while($data = mysqli_fetch_array($tampil)):
                ?>
            <div class="col-md-3">
                <div class="card mb-4">
                    <img src="img/antimo.jpg" class="card-img-top" alt="Obat 1">
                    <div class="card-body">
                        <h3 class="card-title"><?= $data['nama_obat'] ?></h3>
                        <h5><?= "Rp " . number_format($data['harga_obat'], 0, ',', '.') ?></h5>
                        <a class="btn btn-success" href="detail_obat.php?hal=detail&id=<?= $data['id_obat'] ?>">Detail</a>
                    </div>
                </div>
            </div>
            <?php endwhile ; ?>
        </div>
    </section>

<?php include 'partials/footer.php'; ?>