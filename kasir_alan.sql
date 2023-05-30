-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 05:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_alan`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(255) NOT NULL,
  `jenis_menu` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nama_menu`, `jenis_menu`, `images`, `harga`) VALUES
(5, 'Cumi Sayur', 'Cumi', '1685415122_cc533e86b6dc36d1c747.jpg', '17000'),
(9, 'Kerang Bambu', 'Sayuran', 'kerang_bambu.jpg', '20000'),
(10, 'Kepiting Saus Padang', 'Sayuran', 'kepiting_saus_padang.jpg', '70000'),
(11, 'Gurame Asam Manis', 'Sayuran', 'gurame_asam_manis.jpg', '40000'),
(12, 'Udang Goreng', 'Udang', 'udang_goreng.jpg', '30000'),
(13, 'Udang Bakar', 'Udang', 'udang_bakar.jpg', '30000'),
(14, 'Udang Mayo', 'Udang', 'udang_mayo.jpg', '35000'),
(16, 'Ikan Bakar', 'Sayuran', '1685415084_4804654b2db4a36f57d0.jpg', '200000000'),
(17, 'Nasi', 'Happy Hour', 'nasi.jpg', '150000'),
(19, 'Ikan Bakar', 'Sayuran', '1685409128_32595f746ba1faa125c5.jpg', '200000000'),
(20, 'Ikan 22', 'Sayuran', '1685410870_34716d87c736cc0df459.jpg', '28738273'),
(21, 'Ikan Meledak', 'Sayuran', '1685410933_f7a3f13ca181062177fb.jpg', '12000000'),
(22, 'Ikan Enak', 'Ikan', '1685411188_a3931b566448d9f2853c.jpg', '20000'),
(26, 'Cumi Bakar', 'Cumi', '1685415290_463d7ae407e4d7227dcf.jpg', '10000000'),
(27, 'Cumi Goreng', 'Cumi', '1685415306_eecfbdd570fdefc7560f.jpg', '12000000'),
(28, 'Udang enak', 'Udang', '1685415440_38eaea3c621d62895967.jpg', '200000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
