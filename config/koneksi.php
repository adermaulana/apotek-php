<?php
    $server = "localhost";
    $user = "root";
    $pass = "";
    $database = "apotek_sp";

    $koneksi = mysqli_connect($server,$user,$pass,$database) or die(mysqli_error($koneksi));
?>