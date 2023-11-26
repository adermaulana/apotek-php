-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2023 pada 13.39
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
(1, 'wandi', 'wandi', '827ccb0eea8a706c4c34a16891f84e7b');

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
  `id_pemasok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_obat`
--

INSERT INTO `data_obat` (`id_obat`, `nama_obat`, `deskripsi_obat`, `harga_obat`, `stok_obat`, `id_pemasok`) VALUES
(2, 'Baginda', 'sakit', 2000, 211, 9);

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
(1, 'udin', '827ccb0eea8a706c4c34a16891f84e7b', 'udin', 'udin', 'udin@gmail.com');

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
(4, 1, 'Kimia Farma', 'Jalanan', '0853'),
(9, 1, 'tes', 'tes', '344'),
(16, 1, 'Kimia Farma', 'kue', '1212');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pembayaran`
--

CREATE TABLE `data_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `total_pembayaran` int(50) NOT NULL,
  `foto_pembayaran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(1, 4, 2, 1, 2000, 100, '2023-11-26', 200000),
(2, 16, 2, 1, 2000, 10, '2023-11-26', 20000);

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
(3, 2, 1, 2, 2000, '2023-11-25', 4000, ''),
(4, 2, 1, 4, 2000, '2023-11-25', 8000, ''),
(5, 2, 1, 1, 2000, '2023-11-26', 2000, '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_admin`
--
ALTER TABLE `data_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `data_obat`
--
ALTER TABLE `data_obat`
  ADD PRIMARY KEY (`id_obat`),
  ADD KEY `id_pemasok` (`id_pemasok`);

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
  ADD KEY `id_penjualan` (`id_penjualan`);

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
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_obat`
--
ALTER TABLE `data_obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_pelanggan`
--
ALTER TABLE `data_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_pemasok`
--
ALTER TABLE `data_pemasok`
  MODIFY `id_pemasok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_pembelian`
--
ALTER TABLE `data_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_penjualan`
--
ALTER TABLE `data_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_obat`
--
ALTER TABLE `data_obat`
  ADD CONSTRAINT `data_obat_ibfk_1` FOREIGN KEY (`id_pemasok`) REFERENCES `data_pemasok` (`id_pemasok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pemasok`
--
ALTER TABLE `data_pemasok`
  ADD CONSTRAINT `data_pemasok_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `data_admin` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD CONSTRAINT `data_pembayaran_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `data_penjualan` (`id_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

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
