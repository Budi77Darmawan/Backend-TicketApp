-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2020 pada 12.21
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket_apps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`id_account`, `full_name`, `email`, `password`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wahyu Kurniawan', 'wahyukurniawaan@gmail.com', '', '+6289630033462', 'activated', '2020-10-16 05:56:54', '2020-10-16 05:56:54'),
(2, 'test', 'test', '', '089630033462', 'not activated', '2020-10-16 09:44:58', '2020-10-16 09:44:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `destination`
--

CREATE TABLE `destination` (
  `id_destination` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_price` int(11) NOT NULL,
  `order_name` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`id_order`, `id_account`, `id_price`, `order_name`, `created_at`, `update_at`) VALUES
(1, 1, 0, '', '2020-10-17 15:14:54', '2020-10-17 15:14:54'),
(2, 1, 0, 'sri', '2020-10-17 15:24:08', '2020-10-17 15:24:08'),
(3, 1, 0, 'sutris', '2020-10-17 15:25:03', '2020-10-17 15:25:03'),
(4, 1, 0, 'bagio', '2020-10-17 15:25:12', '2020-10-17 15:25:12'),
(5, 1, 10, 'bagio', '2020-10-18 05:52:43', '2020-10-18 05:52:43'),
(6, 1, 10, 'bagio', '2020-10-18 05:56:43', '2020-10-18 05:56:43'),
(7, 1, 10, 'bagio', '2020-10-18 05:57:38', '2020-10-18 05:57:38'),
(8, 1, 10, 'bagio', '2020-10-18 06:00:09', '2020-10-18 06:00:09'),
(9, 1, 10, 'bagio', '2020-10-18 06:00:50', '2020-10-18 06:00:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `status_payment` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`id_payment`, `total_price`, `id_account`, `status_payment`, `created_at`, `update_at`) VALUES
(1, 1800, 1, 'belum dibayar', '2020-10-17 16:25:12', '2020-10-17 16:25:12'),
(2, 1400, 1, 'belum dibayar', '2020-10-18 05:49:47', '2020-10-18 05:49:47'),
(3, 1400, 1, 'belum dibayar', '2020-10-18 05:52:43', '2020-10-18 05:52:43'),
(4, 1400, 1, 'belum dibayar', '2020-10-18 05:56:43', '2020-10-18 05:56:43'),
(5, 1400, 1, 'belum dibayar', '2020-10-18 05:57:38', '2020-10-18 05:57:38'),
(6, 1400, 1, 'belum dibayar', '2020-10-18 06:00:09', '2020-10-18 06:00:09'),
(7, 1400, 1, 'belum dibayar', '2020-10-18 06:00:50', '2020-10-18 06:00:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `plane`
--

CREATE TABLE `plane` (
  `id_plane` int(11) NOT NULL,
  `plane_name` varchar(50) NOT NULL,
  `plane_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `plane`
--

INSERT INTO `plane` (`id_plane`, `plane_name`, `plane_image`) VALUES
(1, 'Air Asia', 'air-asia.png'),
(2, 'CitiLink', 'citilink.png'),
(3, 'Garuda Indonesia', 'garuda-indonesia.png'),
(4, 'Lion Air', 'lion-air.png'),
(5, 'Sriwijaya Air', 'sriwijaya-air.png'),
(6, 'Wings Air', 'wings-air.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `price`
--

CREATE TABLE `price` (
  `id_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_plane` int(11) NOT NULL,
  `order_class` varchar(20) NOT NULL,
  `passangger` varchar(20) NOT NULL,
  `city_destination` varchar(20) NOT NULL,
  `city_depature` varchar(20) NOT NULL,
  `times_flight` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `price`
--

INSERT INTO `price` (`id_price`, `price`, `id_plane`, `order_class`, `passangger`, `city_destination`, `city_depature`, `times_flight`) VALUES
(1, 300, 1, 'economy', 'adult', 'jakarta', 'surabaya', 'pagi'),
(2, 150, 1, 'economy', 'child', 'jakarta', 'surabaya', 'pagi'),
(3, 500, 1, 'business', 'adult', 'jakarta', 'surabaya', 'pagi'),
(4, 250, 1, 'business', 'child', 'jakarta', 'surabaya', 'pagi'),
(5, 700, 1, 'first class', 'adult', 'jakarta', 'surabaya', 'pagi'),
(6, 350, 1, 'first class', 'child', 'jakarta', 'surabaya', 'pagi'),
(7, 200, 1, 'economy', 'adult', 'bali', 'surabaya', 'pagi'),
(8, 100, 1, 'economy', 'child', 'bali', 'surabaya', 'pagi'),
(9, 400, 1, 'business', 'adult', 'bali', 'surabaya', 'pagi'),
(10, 200, 1, 'business', 'child', 'bali', 'surabaya', 'pagi'),
(11, 600, 1, 'first class', 'adult', 'bali', 'surabaya', 'pagi'),
(12, 300, 1, 'first class', 'child', 'bali', 'surabaya', 'pagi'),
(13, 350, 2, 'economy', 'adult', 'jakarta', 'surabaya', 'pagi'),
(14, 175, 2, 'economy', 'child', 'jakarta', 'surabaya', 'pagi'),
(15, 550, 2, 'business', 'adult', 'jakarta', 'surabaya', 'pagi'),
(16, 275, 2, 'business', 'child', 'jakarta', 'surabaya', 'pagi'),
(17, 750, 2, 'first class', 'adult', 'jakarta', 'surabaya', 'pagi'),
(18, 375, 2, 'first class', 'child', 'jakarta', 'surabaya', 'pagi'),
(19, 450, 2, 'economy', 'adult', 'bali', 'surabaya', 'pagi'),
(20, 225, 2, 'economy', 'child', 'bali', 'surabaya', 'pagi'),
(21, 650, 2, 'business', 'adult', 'bali', 'surabaya', 'pagi'),
(22, 325, 2, 'business', 'child', 'bali', 'surabaya', 'pagi'),
(23, 850, 2, 'first class', 'adult', 'bali', 'surabaya', 'pagi'),
(24, 425, 2, 'first class', 'child', 'bali', 'surabaya', 'pagi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile`
--

CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `profile`
--

INSERT INTO `profile` (`id_profile`, `id_account`, `profile_image`, `city`, `address`) VALUES
(1, 1, 'image-1602870241152.jpg', 'Jakarta', 'South Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Indeks untuk tabel `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`id_destination`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indeks untuk tabel `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`id_plane`);

--
-- Indeks untuk tabel `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id_price`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`),
  ADD KEY `constraint_id_user` (`id_account`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `destination`
--
ALTER TABLE `destination`
  MODIFY `id_destination` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `plane`
--
ALTER TABLE `plane`
  MODIFY `id_plane` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `profile`
--
ALTER TABLE `profile`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `constraint_id_user` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
