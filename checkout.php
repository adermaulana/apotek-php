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


?>


<?php include 'partials/footer.php'; ?>
