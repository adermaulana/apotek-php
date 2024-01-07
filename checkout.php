<?php include 'partials/header.php';

// Cek apakah pengguna sudah login
if (!isset($_SESSION['username_pelanggan'])) {
    // Jika tidak, redirect ke halaman login dengan pesan alert
    echo "<script>
    alert('Anda harus login terlebih dahulu!');
    document.location='login_pelanggan.php';
    </script>";
    exit;
}

$id_pelanggan = $_SESSION['id_pelanggan'];

if(isset($_POST['simpan'])){
    // Simpan data ke tabel data_order
    $simpan_order = mysqli_query($koneksi, "INSERT INTO data_order (nama_order, email_order, alamat_order, telepon_order, id_pelanggan, total_order, status_order ) VALUES ('$_POST[nama]','$_POST[email]','$_POST[alamat]','$_POST[telepon]','$id_pelanggan','$_POST[total_order]','$_POST[status_order]')");

    if($simpan_order){
        // Ambil ID order yang baru dibuat
        $id_order = mysqli_insert_id($koneksi);

        // Ambil data dari keranjang
        $query_cart = mysqli_query($koneksi, "SELECT * FROM data_keranjang WHERE id_pelanggan = '$id_pelanggan'");
        
        // Simpan data ke tabel data_order_item
        while($cart_data = mysqli_fetch_assoc($query_cart)) {
            $obat_id = $cart_data['id_obat'];
            $banyak = $cart_data['jumlah_keranjang'];
            
            $simpan_order_item = mysqli_query($koneksi, "INSERT INTO data_order_item (id_pelanggan,id_order, id_obat, jumlah_order_item) VALUES ('$id_pelanggan','$id_order', '$obat_id', '$banyak')");
            
            if(!$simpan_order_item) {
                echo "<script>
                        alert('Simpan data order item Gagal!');
                        document.location='index.php';
                    </script>";
                exit;
            }
        }

        // Hapus data dari keranjang setelah simpan ke data_order_item
        $hapus_cart = mysqli_query($koneksi, "DELETE FROM data_keranjang WHERE id_pelanggan = '$id_pelanggan'");
        
        if($hapus_cart) {
            echo "<script>
                    alert('Simpan data sukses!');
                    document.location='index.php';
                </script>";
        } else {
            echo "<script>
                    alert('Simpan data sukses, tetapi hapus data keranjang Gagal!');
                    document.location='index.php';
                </script>";
        }
    } else {
        echo "<script>
                alert('Simpan data Gagal!');
                document.location='index.php';
            </script>";
    }
}


?>

<div class="container mt-5">
    <h2 class="mb-4">Checkout</h2>
    <form action="" method="post">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Detail</h5>
                        <input type="hidden" name="pelanggan_id" value="<?= $id_pelanggan ?>">
                            <div class="mb-3 col-md-8">
                                <label class="form-label">Nama<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="nama" required>
                            </div>
                            <div class="mb-3 col-md-8">
                                <label class="form-label">Alamat<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="alamat" required>
                            </div>
                            <div class="mb-3 col-md-8">
                                <label class="form-label">Email<span class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                            <div class="mb-3 col-md-8">
                                <label class="form-label">Telepon<span class="text-danger">*</span></label>
                                <input type="nujmber" class="form-control" name="telepon" required>
                            </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pesanan</h5>
                        <table class="table mt-3">
                            <thead>
                                <tr>
                                    <th>Produk</th>
                                    <th>Harga</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                                $tampil = mysqli_query($koneksi, "SELECT k.*, o.nama_obat, o.gambar_obat
                                FROM data_keranjang k
                                JOIN data_obat o ON k.id_obat = o.id_obat
                                WHERE id_pelanggan = $id_pelanggan ORDER BY id_keranjang DESC");

                                while($data = mysqli_fetch_array($tampil)):
                            ?>
                                <tr>
                                    <td><?= $data['nama_obat'] ?> x <?= $data['jumlah_keranjang'] ?></td>
                                    <td>Rp. <?= number_format($data['total_keranjang'],0,',','.'); ?></td>
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                            <tfoot>
                                <?php 
                                $keranjang = "SELECT SUM(total_keranjang) as total_harga_keranjang FROM data_keranjang WHERE id_pelanggan = $id_pelanggan";

                                $resultkeranjang = $koneksi->query($keranjang);
                                $rowkeranjang = $resultkeranjang->fetch_assoc();
                                $total_keranjang = $rowkeranjang["total_harga_keranjang"];
                                ?>
                                <tr>
                                    <th>Total Harga</th>
                                    <td>Rp. <?= number_format($total_keranjang,0,',','.'); ?></td>
                                </tr>
                            </tfoot>
                        </table>        
                    </div>
                </div>
                <input type="hidden" name="total_order" value="<?= $total_keranjang ?>">
                <input type="hidden" name="status_order" value="Belum Bayar">
                <button type="submit" name="simpan" class="btn btn-primary mt-3">Order</button>
            </div>
        </div>
    </form>
</div>


<?php include 'partials/footer.php'; ?>
