<?php
include '../../config/koneksi.php';

if (isset($_POST['id_penjualan'])) {
    $idPenjualan = $_POST['id_penjualan'];

    // Lakukan update status penjualan menjadi "Sudah Bayar"
    $updateStatus = mysqli_query($koneksi, "UPDATE data_penjualan SET status_penjualan = 'Sudah Bayar' WHERE id_penjualan = '$idPenjualan'");

    if ($updateStatus) {
        echo 'success'; // Berhasil melakukan konfirmasi
    } else {
        echo 'error'; // Gagal melakukan konfirmasi
    }
}
?>
