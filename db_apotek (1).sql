-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2024 pada 11.54
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apotek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_admin`
--

CREATE TABLE `data_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username_admin` varchar(20) NOT NULL,
  `password_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_admin`
--

INSERT INTO `data_admin` (`id_admin`, `nama_admin`, `username_admin`, `password_admin`) VALUES
(1, 'wandi', 'wandi', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'udin', 'udin', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_keranjang`
--

CREATE TABLE `data_keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `jumlah_keranjang` int(10) NOT NULL,
  `harga_keranjang` varchar(255) NOT NULL,
  `total_keranjang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_keranjang`
--

INSERT INTO `data_keranjang` (`id_keranjang`, `id_obat`, `id_pelanggan`, `jumlah_keranjang`, `harga_keranjang`, `total_keranjang`) VALUES
(18, 21, 4, 2, '3000', '6000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_obat`
--

CREATE TABLE `data_obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `deskripsi_obat` varchar(255) NOT NULL,
  `harga_obat` int(20) NOT NULL,
  `stok_obat` int(20) NOT NULL,
  `gambar_obat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_obat`
--

INSERT INTO `data_obat` (`id_obat`, `nama_obat`, `deskripsi_obat`, `harga_obat`, `stok_obat`, `gambar_obat`) VALUES
(19, 'Panadol', '    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea doloremque quisquam reiciendis consectetur qui odit illo tenetur unde pariatur fugiat quibusdam dolor, alias omnis iste esse placeat earum at assumenda! Ipsum asperiores quod, sed eligendi u', 12000, 115, 'uploads/panadol.jpg'),
(20, 'antimo', '        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae veritatis labore quas asperiores rerum excepturi quibusdam tenetur ipsa corrupti vero, consequuntur accusamus omnis exercitationem soluta quaerat ducimus commodi eius aliquam quos. Susc', 2000, 0, 'uploads/antimo.jpg'),
(21, 'Mixagrip', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae veritatis labore quas asperiores rerum excepturi quibusdam tenetur ipsa corrupti vero, consequuntur accusamus omnis exercitationem soluta quaerat ducimus commodi eius aliquam quos. Suscipit, ea', 3000, 3, 'uploads/mixagrip.jpg'),
(22, 'Paratusin', 'Paratusin untuk apa? Paratusin adalah obat untuk meringankan gejala flu seperti demam, sakit kepala, hidung tersumbat dan bersin-bersin yang disertain batuk. Obat ini masuk dalam golongan obat bebas terbatas.', 3000, 0, 'uploads/paratusin.jpeg'),
(23, 'Decolgen', 'Decolgen cold & flu berbentuk tablet yang diproduksi oleh PT. Medifarma Laboratories dan telah terdaftar pada BPOM. Setiap tablet Decolgen mengandung 400mg paracetamol yang berfungsi sebagai pereda demam dan meringankan sakit kepala yang di sebabkan oleh ', 5600, 0, 'uploads/decolgen.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_order`
--

CREATE TABLE `data_order` (
  `id_order` int(11) NOT NULL,
  `nama_order` varchar(255) NOT NULL,
  `email_order` varchar(50) NOT NULL,
  `alamat_order` varchar(255) NOT NULL,
  `telepon_order` varchar(255) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `total_order` varchar(255) NOT NULL,
  `status_order` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_order`
--

INSERT INTO `data_order` (`id_order`, `nama_order`, `email_order`, `alamat_order`, `telepon_order`, `id_pelanggan`, `total_order`, `status_order`) VALUES
(1, 'martin', 'martin@gmail.com', 'martina', '3920392', 2, '42000', 'Belum Bayar'),
(2, 'udin', 'udin@gmail.com', 'udin', '1212', 2, '24000', 'Proses'),
(3, 'udin', 'udin@gmail.com', 'udin', '1212', 2, '24000', 'Proses'),
(4, 'udin', 'udin@gmail.com', 'udin', '1212', 2, '24000', 'Ditolak'),
(5, 'udin', 'udin@gmail.com', 'udin', '1212', 2, '24000', 'Sudah Bayar'),
(6, 'kjcing', 'kucing@gmail.com', 'kucing', '121221', 2, '15000', 'Sudah Bayar'),
(7, 'wakwau', 'kwau@gmail.com', 'kwauw', '121212', 2, '15000', 'Ditolak'),
(8, 'udin', 'duin@fgmail.com', 'udin', '21212', 2, '12000', 'Ditolak'),
(9, 'wakwu', 'wakw@gmail.com', 'wakwu', '2112', 2, '15000', 'Proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_order_item`
--

CREATE TABLE `data_order_item` (
  `id_order_item` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `jumlah_order_item` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_order_item`
--

INSERT INTO `data_order_item` (`id_order_item`, `id_pelanggan`, `id_obat`, `id_order`, `jumlah_order_item`) VALUES
(1, 2, 19, 5, 2),
(2, 2, 21, 6, 1),
(3, 2, 19, 6, 1),
(4, 2, 19, 7, 1),
(5, 2, 21, 7, 1),
(6, 2, 19, 8, 1),
(7, 2, 19, 9, 1),
(8, 2, 21, 9, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pelanggan`
--

CREATE TABLE `data_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `username_pelanggan` varchar(50) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` varchar(255) NOT NULL,
  `email_pelanggan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_pelanggan`
--

INSERT INTO `data_pelanggan` (`id_pelanggan`, `username_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `email_pelanggan`) VALUES
(1, 'udin', '827ccb0eea8a706c4c34a16891f84e7b', 'udin', 'udin', 'udin@gmail.com'),
(2, 'martin', '925d7518fc597af0e43f5606f9a51512', 'martin', 'martin', 'martin@gmail.com'),
(3, 'mak', '827ccb0eea8a706c4c34a16891f84e7b', 'makrunyil', 'makru', 'makru@gmail.com'),
(4, 'ade', '827ccb0eea8a706c4c34a16891f84e7b', 'ndan', 'ndan', 'ndan@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pemasok`
--

CREATE TABLE `data_pemasok` (
  `id_pemasok` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL DEFAULT 1,
  `nama_pemasok` varchar(50) NOT NULL,
  `alamat_pemasok` varchar(255) NOT NULL,
  `telepon_pemasok` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_pemasok`
--

INSERT INTO `data_pemasok` (`id_pemasok`, `id_admin`, `nama_pemasok`, `alamat_pemasok`, `telepon_pemasok`) VALUES
(20, 1, 'Kimia Farma', 'Jalanan', '0854');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pembayaran`
--

CREATE TABLE `data_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `total_pembayaran` varchar(255) NOT NULL,
  `foto_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_pembayaran`
--

INSERT INTO `data_pembayaran` (`id_pembayaran`, `id_order`, `total_pembayaran`, `foto_pembayaran`) VALUES
(17, 7, 'Rp. 15.000', 'uploads/domain.jpg'),
(18, 9, 'Rp. 15.000', 'uploads/domain.jpg'),
(19, 8, 'Rp. 12.000', 'uploads/panritamart.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pembelian`
--

CREATE TABLE `data_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pemasok` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL DEFAULT 1,
  `harga_pembelian` int(20) NOT NULL,
  `jumlah_pembelian` int(20) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_pembelian`
--

INSERT INTO `data_pembelian` (`id_pembelian`, `id_pemasok`, `id_obat`, `id_admin`, `harga_pembelian`, `jumlah_pembelian`, `tanggal_pembelian`, `total_pembelian`) VALUES
(8, 20, 19, 1, 12000, 100, '2023-12-10', 1200000),
(9, 20, 19, 1, 12000, 100, '2023-12-13', 1200000),
(12, 20, 19, 1, 12000, 12, '2023-12-13', 144000),
(13, 20, 21, 1, 3000, 10, '2024-01-06', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_penjualan`
--

CREATE TABLE `data_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `jumlah_penjualan` int(20) NOT NULL,
  `harga_penjualan` int(20) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `harga_total_penjualan` int(50) NOT NULL,
  `status_penjualan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_penjualan`
--

INSERT INTO `data_penjualan` (`id_penjualan`, `id_obat`, `id_pelanggan`, `jumlah_penjualan`, `harga_penjualan`, `tanggal_penjualan`, `harga_total_penjualan`, `status_penjualan`) VALUES
(14, 19, 2, 2, 12000, '2023-12-10', 24000, 'Sudah Bayar'),
(15, 19, 2, 94, 12000, '2023-12-10', 1128000, 'Sudah Bayar'),
(17, 19, 2, 1, 12000, '2023-12-21', 12000, 'Belum Bayar');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_admin`
--
ALTER TABLE `data_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `data_keranjang`
--
ALTER TABLE `data_keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_obat` (`id_obat`,`id_pelanggan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `data_obat`
--
ALTER TABLE `data_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `data_order`
--
ALTER TABLE `data_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `data_order_item`
--
ALTER TABLE `data_order_item`
  ADD PRIMARY KEY (`id_order_item`),
  ADD KEY `id_pelanggan` (`id_pelanggan`,`id_obat`,`id_order`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `data_pemasok`
--
ALTER TABLE `data_pemasok`
  ADD PRIMARY KEY (`id_pemasok`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_penjualan` (`id_order`),
  ADD KEY `id_order` (`id_order`);

--
-- Indeks untuk tabel `data_pembelian`
--
ALTER TABLE `data_pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pemasok` (`id_pemasok`,`id_obat`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `data_penjualan`
--
ALTER TABLE `data_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_admin`
--
ALTER TABLE `data_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_keranjang`
--
ALTER TABLE `data_keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `data_obat`
--
ALTER TABLE `data_obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `data_order`
--
ALTER TABLE `data_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `data_order_item`
--
ALTER TABLE `data_order_item`
  MODIFY `id_order_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `data_pemasok`
--
ALTER TABLE `data_pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `data_pembelian`
--
ALTER TABLE `data_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `data_penjualan`
--
ALTER TABLE `data_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_keranjang`
--
ALTER TABLE `data_keranjang`
  ADD CONSTRAINT `data_keranjang_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `data_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_keranjang_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `data_obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_order`
--
ALTER TABLE `data_order`
  ADD CONSTRAINT `data_order_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `data_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_order_item`
--
ALTER TABLE `data_order_item`
  ADD CONSTRAINT `data_order_item_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `data_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_order_item_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `data_obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_order_item_ibfk_3` FOREIGN KEY (`id_order`) REFERENCES `data_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pemasok`
--
ALTER TABLE `data_pemasok`
  ADD CONSTRAINT `data_pemasok_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `data_admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD CONSTRAINT `data_pembayaran_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `data_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pembelian`
--
ALTER TABLE `data_pembelian`
  ADD CONSTRAINT `data_pembelian_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `data_obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pembelian_ibfk_2` FOREIGN KEY (`id_pemasok`) REFERENCES `data_pemasok` (`id_pemasok`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pembelian_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `data_admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_penjualan`
--
ALTER TABLE `data_penjualan`
  ADD CONSTRAINT `data_penjualan_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `data_obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `data_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
