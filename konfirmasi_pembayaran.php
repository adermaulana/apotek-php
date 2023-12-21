<?php include 'partials/header.php';

if(isset($_GET['hal'])){
    if($_GET['hal'] == "konfirmasi"){
        $tampil = mysqli_query($koneksi, "SELECT * FROM data_penjualan WHERE id_penjualan = '$_GET[id]'");
        $data = mysqli_fetch_array($tampil);
        if($data){
            $id = $data['id_penjualan'];
            $harga_total = $data['harga_total_penjualan'];
        }
    }
}

if(isset($_POST['simpan'])){

      // File upload handling
  $gambar_konfirmasi = $_FILES['bukti_pembayaran']['name'];
  $gambar_temp = $_FILES['bukti_pembayaran']['tmp_name'];
  $upload_dir = 'uploads/'; // Specify your upload directory

  $lokasi_foto="uploads/" . $gambar_konfirmasi;
  // Move uploaded file to the specified directory
  move_uploaded_file($gambar_temp, $upload_dir . $gambar_konfirmasi);

  $update_status = mysqli_query($koneksi, "UPDATE data_penjualan SET status_penjualan = 'Proses' WHERE id_penjualan = '$_POST[id_penjualan]'");

  if ($update_status) {
      // Insert into data_pembayaran
      $simpan = mysqli_query($koneksi, "INSERT INTO data_pembayaran (id_penjualan, total_pembayaran, foto_pembayaran) VALUES ('$_POST[id_penjualan]', '$_POST[total_bayar]','$lokasi_foto')");

      if ($simpan) {
          echo "<script>
              alert('Simpan data sukses!');
              document.location='index.php';
          </script>";
      } else {
          echo "<script>
              alert('Simpan data Gagal!');
              document.location='index.php';
          </script>";
      }
  } else {
      echo "<script>
              alert('Update status Gagal!');
              document.location='index.php';
          </script>";
  }
}

?>

<div class="row">
    <div class="col-lg-4 col-md-12 col-xs-12">
        <div class="card">
            <div class="card-body">
                <h4>Data Diri</h4>
                <span>Nama : <b><?= $_SESSION['nama_pelanggan'] ?></b></span><br>
                <span>Alamat : <b><?= $_SESSION['alamat_pelanggan'] ?></b></span><br>
                <span>Email : <b><?= $_SESSION['email_pelanggan'] ?></b></span><br>
                <hr>
                <span>Terima Kasih Telah Registrasi</span>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card">
            <div class="card-body col-lg-10">
                <form action="" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id_penjualan" value="<?= $id ?>">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Total Bayar</label>
                    <input type="text" name="total_bayar" value="Rp. <?= number_format($harga_total, 0, ',', '.') ?>" class="form-control"readonly>
                </div>
                <div class="mb-3">
                    <label for="bukti_pembayaran"  class="form-label">Bukti Pembayaran</label>
                    <input type="file" class="form-control" name="bukti_pembayaran">
                </div>
                <button  type="submit" name="simpan" class="btn btn-primary">Kirim</button>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'partials/footer.php'; ?>

