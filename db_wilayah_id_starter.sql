-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2020 at 11:01 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lokasi_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `bps_districts`
--

CREATE TABLE `bps_districts` (
  `id` char(50) NOT NULL,
  `regency_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bps_provinces`
--

CREATE TABLE `bps_provinces` (
  `id` char(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bps_regencies`
--

CREATE TABLE `bps_regencies` (
  `id` char(50) NOT NULL,
  `province_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bps_villages`
--

CREATE TABLE `bps_villages` (
  `id` char(50) NOT NULL,
  `district_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dagri_districts`
--

CREATE TABLE `dagri_districts` (
  `id` char(50) NOT NULL,
  `regency_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dagri_provinces`
--

CREATE TABLE `dagri_provinces` (
  `id` char(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dagri_regencies`
--

CREATE TABLE `dagri_regencies` (
  `id` char(50) NOT NULL,
  `province_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dagri_villages`
--

CREATE TABLE `dagri_villages` (
  `id` char(50) NOT NULL,
  `district_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) NOT NULL,
  `bps_district_id` char(50) DEFAULT NULL,
  `dagri_district_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) NOT NULL,
  `dagri_province_id` char(50) DEFAULT NULL,
  `bps_province_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regencies`
--

CREATE TABLE `regencies` (
  `id` bigint(20) NOT NULL,
  `dagri_regency_id` char(50) DEFAULT NULL,
  `bps_regency_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE `villages` (
  `id` bigint(20) NOT NULL,
  `bps_village_id` char(50) DEFAULT NULL,
  `dagri_village_id` char(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bps_districts`
--
ALTER TABLE `bps_districts`
  ADD UNIQUE KEY `District ID` (`id`),
  ADD KEY `FK__bps_regencies` (`regency_id`);

--
-- Indexes for table `bps_provinces`
--
ALTER TABLE `bps_provinces`
  ADD UNIQUE KEY `Province ID` (`id`);

--
-- Indexes for table `bps_regencies`
--
ALTER TABLE `bps_regencies`
  ADD UNIQUE KEY `Index 1` (`id`),
  ADD KEY `FK_bps_regencies_bps_provinces` (`province_id`);

--
-- Indexes for table `bps_villages`
--
ALTER TABLE `bps_villages`
  ADD UNIQUE KEY `Village ID` (`id`),
  ADD KEY `FK_bps_villages_bps_districts` (`district_id`);

--
-- Indexes for table `dagri_districts`
--
ALTER TABLE `dagri_districts`
  ADD UNIQUE KEY `District ID` (`id`),
  ADD KEY `FK__dagri_regencies` (`regency_id`);

--
-- Indexes for table `dagri_provinces`
--
ALTER TABLE `dagri_provinces`
  ADD UNIQUE KEY `Province ID` (`id`);

--
-- Indexes for table `dagri_regencies`
--
ALTER TABLE `dagri_regencies`
  ADD UNIQUE KEY `Regency ID` (`id`),
  ADD KEY `FK__dagri_provinces` (`province_id`);

--
-- Indexes for table `dagri_villages`
--
ALTER TABLE `dagri_villages`
  ADD UNIQUE KEY `Village ID` (`id`),
  ADD KEY `FK_dagri_villages_dagri_districts` (`district_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__bps_districts` (`bps_district_id`),
  ADD KEY `FK__dagri_districts` (`dagri_district_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_provinces_dagri_provinces` (`dagri_province_id`),
  ADD KEY `FK_provinces_bps_provinces` (`bps_province_id`);

--
-- Indexes for table `regencies`
--
ALTER TABLE `regencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_regencies_dagri_regencies` (`dagri_regency_id`),
  ADD KEY `FK_regencies_bps_regencies` (`bps_regency_id`);

--
-- Indexes for table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_villages_bps_villages` (`bps_village_id`),
  ADD KEY `FK_villages_dagri_villages` (`dagri_village_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regencies`
--
ALTER TABLE `regencies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `villages`
--
ALTER TABLE `villages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bps_districts`
--
ALTER TABLE `bps_districts`
  ADD CONSTRAINT `FK__bps_regencies` FOREIGN KEY (`regency_id`) REFERENCES `bps_regencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bps_regencies`
--
ALTER TABLE `bps_regencies`
  ADD CONSTRAINT `FK_bps_regencies_bps_provinces` FOREIGN KEY (`province_id`) REFERENCES `bps_provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bps_villages`
--
ALTER TABLE `bps_villages`
  ADD CONSTRAINT `FK_bps_villages_bps_districts` FOREIGN KEY (`district_id`) REFERENCES `bps_districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dagri_districts`
--
ALTER TABLE `dagri_districts`
  ADD CONSTRAINT `FK__dagri_regencies` FOREIGN KEY (`regency_id`) REFERENCES `dagri_regencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dagri_regencies`
--
ALTER TABLE `dagri_regencies`
  ADD CONSTRAINT `FK__dagri_provinces` FOREIGN KEY (`province_id`) REFERENCES `dagri_provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dagri_villages`
--
ALTER TABLE `dagri_villages`
  ADD CONSTRAINT `FK_dagri_villages_dagri_districts` FOREIGN KEY (`district_id`) REFERENCES `dagri_districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `FK__bps_districts` FOREIGN KEY (`bps_district_id`) REFERENCES `bps_districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__dagri_districts` FOREIGN KEY (`dagri_district_id`) REFERENCES `dagri_districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `provinces`
--
ALTER TABLE `provinces`
  ADD CONSTRAINT `FK_provinces_bps_provinces` FOREIGN KEY (`bps_province_id`) REFERENCES `bps_provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_provinces_dagri_provinces` FOREIGN KEY (`dagri_province_id`) REFERENCES `dagri_provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regencies`
--
ALTER TABLE `regencies`
  ADD CONSTRAINT `FK_regencies_bps_regencies` FOREIGN KEY (`bps_regency_id`) REFERENCES `bps_regencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_regencies_dagri_regencies` FOREIGN KEY (`dagri_regency_id`) REFERENCES `dagri_regencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `FK_villages_bps_villages` FOREIGN KEY (`bps_village_id`) REFERENCES `bps_villages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_villages_dagri_villages` FOREIGN KEY (`dagri_village_id`) REFERENCES `dagri_villages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
