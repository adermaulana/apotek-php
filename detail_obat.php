<?php include 'partials/header.php'; ?>


<?php 

if(isset($_GET['hal'])){
    if($_GET['hal'] == "detail"){
        $tampil = mysqli_query($koneksi, "SELECT * FROM data_obat WHERE id_obat = '$_GET[id]'");
        $data = mysqli_fetch_array($tampil);
        if($data){
            $id = $data['id_obat'];
            $nama_obat = $data['nama_obat'];
            $deskripsi = $data['deskripsi_obat'];
            $harga = $data['harga_obat'];
            $stok = $data['stok_obat'];
            $gambar = $data['gambar_obat'];
        }
    }
}

?>
    <section class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class=" mb-4">
                    <img src="<?= $gambar; ?>" class="card-img-top" alt="Obat 1">
                </div>
            </div>
            <div class="col-md-7">
                <div class="mb-4 mt-5">
                    <div class="card-body ms-5">
                        <h1 class="card-title"><?= $nama_obat; ?></h1>
                        <p class="card-text mt-2"><?= $deskripsi; ?>
                        </p>
                        <p class="text-muted">
                        <?= $stok; ?>
                        </p>
                        <h3 class="mb-3"><?= $harga; ?></h3>
                        <form action="" method="post">
                            <input type="hidden" name="id_pelanggan">
                            <div class="mb-3 col-3">
                                <input type="number" class="form-control" id="jumlah" name="jumlah" required autofocus>
                            </div>
                            <button type="submit" class="btn btn-primary" name="simpan">Beli</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

<?php include 'partials/footer.php'; ?>