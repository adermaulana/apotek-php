<?php include 'partials/header.php'; ?>

    <section class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class=" mb-4">
                    <img src="img/antimo.jpg" class="card-img-top" alt="Obat 1">
                </div>
            </div>
            <div class="col-md-7">
                <div class="mb-4 mt-5">
                    <div class="card-body ms-5">
                        <h1 class="card-title">Mixagrip</h1>
                        <p class="card-text mt-2">Deskripsi
                        </p>
                        <p class="text-muted">
                            Stok 
                        </p>
                        <h3 class="mb-3">Harga</h3>
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