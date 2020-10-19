-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2020 at 06:13 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

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
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `status` enum('activated','not active') NOT NULL DEFAULT 'activated',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id_account`, `full_name`, `email`, `password`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wahyu Kurniawan', 'wahyukurniawaan@gmail.com', '$2b$12$3x96FpUTPy/SnrS62KWyo.q1Iyc/cHJmfBqsV8NnaoXH04bU9Ct9m', '+6289630033462', 'activated', '2020-10-16 05:56:54', '2020-10-16 05:56:54'),
(10, 'Budi Darmawan', 'budi@gmail.com', '12345', '082292500000', 'activated', '2020-10-17 10:26:57', '2020-10-17 10:26:57'),
(11, 'ihsan', 'san@gmail.com', '$2b$12$3x96FpUTPy/SnrS62KWyo.q1Iyc/cHJmfBqsV8NnaoXH04bU9Ct9m', '12345', 'activated', '2020-10-18 04:28:52', '2020-10-18 04:28:52'),
(12, 'asas', 'as@gmal.com', '$2b$12$QQ4EGhuDopJEwS5K.7DmBu9TsQfkPfyRQF4vwSdZX8n/kneZ8GVUC', '111', 'activated', '2020-10-18 04:43:52', '2020-10-18 04:43:52'),
(13, 'Wahyu Kurniawan', 'wahyu@gmail.com', '$2b$12$gkzjonJCsUSawm5SDM557eCpdfLGRrOtun91q1TZ7RjChotPqd8ma', '089630033462', 'activated', '2020-10-19 16:03:45', '2020-10-19 16:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `code_city` varchar(100) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `code_country` varchar(100) NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`code_city`, `city_name`, `code_country`, `country_name`) VALUES
('BDO', 'Bandung', 'IDN', 'Indonesia'),
('CGK', 'Jakarta', 'IDN', 'Indonesia'),
('BPN', 'Balikpapan', 'IDN', 'Indonesia'),
('PLW', 'Kota Palu', 'IDN', 'Indonesia'),
('SUB', 'Surabaya', 'IDN', 'Indonesia'),
('JFK', 'New York', 'USA', 'United States'),
('MIA', 'Miami', 'USA', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `order`
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
-- Dumping data for table `order`
--

INSERT INTO `order` (`id_order`, `id_account`, `id_price`, `order_name`, `created_at`, `update_at`) VALUES
(10, 11, 9, 'Ikhsan', '2020-10-19 02:37:14', '2020-10-19 02:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_order` int(100) NOT NULL,
  `total_price` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `status_payment` enum('paid','not paid') NOT NULL DEFAULT 'not paid',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `id_order`, `total_price`, `id_account`, `status_payment`, `created_at`, `update_at`) VALUES
(9, 10, 700, 11, 'paid', '2020-10-19 02:39:45', '2020-10-19 02:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `id_plane` int(11) NOT NULL,
  `plane_name` varchar(50) NOT NULL,
  `plane_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plane`
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
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_plane` int(11) NOT NULL,
  `order_class` varchar(20) NOT NULL,
  `passengger` varchar(20) NOT NULL,
  `city_destination` varchar(20) NOT NULL,
  `city_departure` varchar(20) NOT NULL,
  `time_departure` time NOT NULL DEFAULT current_timestamp(),
  `time_destination` time NOT NULL DEFAULT current_timestamp(),
  `times_flight` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id_price`, `price`, `id_plane`, `order_class`, `passengger`, `city_destination`, `city_departure`, `time_departure`, `time_destination`, `times_flight`) VALUES
(1, 100, 1, 'Economy', 'Adult', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(2, 200, 2, 'Business', 'Adult', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(3, 300, 1, 'First Class', 'Adult', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(4, 50, 1, 'Economy', 'Child', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(5, 100, 1, 'Business', 'Child', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(6, 150, 1, 'First Class', 'Child', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(7, 150, 3, 'Economy', 'Adult', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(8, 300, 3, 'Business', 'Adult', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(9, 500, 3, 'First Class', 'Adult', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(10, 70, 3, 'Economy', 'Child', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(11, 130, 3, 'Business', 'Child', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(12, 200, 3, 'First Class', 'Child', 'JFK', 'CGK', '12:33:00', '15:21:00', 'Pagi'),
(13, 50, 4, 'Economy', 'Adult', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(14, 100, 4, 'Business', 'Adult', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(15, 200, 4, 'First Class', 'Adult', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(16, 30, 4, 'Economy', 'Child', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(17, 60, 4, 'Business', 'Child', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(18, 100, 4, 'First Class', 'Child', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(19, 100, 3, 'Economy', 'Adult', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(20, 150, 3, 'Business', 'Adult', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(21, 200, 3, 'First Class', 'Adult', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(22, 50, 3, 'Economy', 'Child', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(23, 140, 3, 'Business', 'Child', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi'),
(24, 180, 3, 'First Class', 'Child', 'CGK', 'BPN', '12:33:00', '15:21:00', 'Pagi');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id_profile`, `id_account`, `profile_image`, `city`, `address`) VALUES
(1, 1, 'image-1602870241152.jpg', 'Jakarta', 'South Jakarta'),
(4, 10, 'image-1602938685769.jpg', 'Nunukan', 'Jl. Indonesia'),
(6, 11, 'image-1602870241152.jpg', NULL, NULL),
(7, 12, 'image-1602870241152.jpg', NULL, NULL),
(8, 13, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`id_plane`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id_price`),
  ADD KEY `constraint_id_plane` (`id_plane`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`),
  ADD KEY `constraint_id_user` (`id_account`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `plane`
--
ALTER TABLE `plane`
  MODIFY `id_plane` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id_price` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `constraint_id_plane` FOREIGN KEY (`id_plane`) REFERENCES `plane` (`id_plane`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `constraint_id_user` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
