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

if(isset($_POST['simpan'])){

    // Periksa apakah ada permintaan obat_id dan jumlah_obat dari AJAX
    if (isset($_POST["id_obat"]) && isset($_POST["jumlah"])) {
        $obatId = $_POST["id_obat"];
        $jumlahPembelian = $_POST["jumlah"]; // Jumlah obat yang dibeli

        // Query database untuk mendapatkan stok obat berdasarkan obat_id
        $query = "SELECT stok_obat FROM data_obat WHERE id_obat = $obatId";
        $result = $koneksi->query($query);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $stokObat = $row["stok_obat"];

            // Periksa apakah jumlah obat yang dibeli tidak melebihi stok yang tersedia
            if ($jumlahPembelian <= $stokObat) {
                // Kurangkan stok obat yang tersedia
                $stokObat -= $jumlahPembelian;

                // Update stok obat dalam database
                $updateQuery = "UPDATE data_obat SET stok_obat = $stokObat WHERE id_obat = $obatId";
                if ($koneksi->query($updateQuery) === TRUE) {
                    echo "Stok obat berhasil diperbarui.";
                    $simpan = mysqli_query($koneksi, "INSERT INTO data_penjualan (id_obat,harga_penjualan ,jumlah_penjualan, tanggal_penjualan, harga_total_penjualan, id_pelanggan) VALUES ('$_POST[id_obat]','$_POST[harga]','$_POST[jumlah]','$_POST[tanggal]','$_POST[total]','$_POST[id_pelanggan]')");
                } else {
                    echo "Gagal mengupdate stok obat.";
                }
            } else {
                echo "<script>
                        alert('Jumlah obat yang dibeli melebihi stok yang tersedia.');
                        window.location.href='detail_obat.php?hal=detail&id=" . $data['id_obat'] . "';
                    </script>";
            }
        } else {
            echo "Obat tidak ditemukan.";
        }
    }

    if($simpan){
        echo "<script>
                alert('Berhasil Membeli Produk!');
                document.location='pembayaran.php';
            </script>";
    } else {
        echo "<script>
                alert('Simpan data Gagal!');
                document.location='index.php';
            </script>";
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
                        Stok <?= $stok; ?>
                        </p>
                        <h3 class="mb-3"><?= $harga; ?></h3>
                        <form action="" method="post" onsubmit="return checkLoginStatus()">
                         <input type="hidden" name="id_obat" value="<?= $id ?>">   
                         <input type="hidden" id="harga" name="harga" value="<?= $harga ?>">   
                         <input type="hidden" name="tanggal" value="<?= date('Y-m-d', strtotime('+8 hours')); ?>">   
               
                        <input type="hidden" name="id_pelanggan" value="<?= isset($_SESSION['id_pelanggan']) ? $_SESSION['id_pelanggan'] : '' ?>">
                            <div class="mb-3 col-3">
                                <input type="number" class="form-control" id="jumlah" name="jumlah" oninput="validasiInput(this)" required autofocus>
                            </div>
                            <div class="mb-3 col-3">
                                <label for="">Total</label>
                                <input type="number" class="form-control" id="total" name="total" readonly>
                            </div>
                            <button type="submit" class="btn btn-primary" name="simpan">Beli</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">

function checkLoginStatus() {
        // Check if the user is logged in
        var isLoggedIn = <?php echo isset($_SESSION['id_pelanggan']) ? 'true' : 'false'; ?>;
        
        if (!isLoggedIn) {
            alert('Anda harus login untuk melakukan pembelian.');
            return false; // Prevent form submission
        }

        return true; // Allow form submission
    }


function validasiInput(input) {
            // Menghapus karakter "e" dari nilai input
            input.value = input.value.replace(/e/g, '');

            // Pembersihan karakter selain angka
            input.value = input.value.replace(/[^0-9]/g, '');
        }

    $('#jumlah').on('change', function () {
        const harga = $('#harga').val();
        const banyak = $('#jumlah').val();

        const total4 = banyak * harga;

        $('#total').val(`${total4}`);

    })
</script>

<?php include 'partials/footer.php'; ?>