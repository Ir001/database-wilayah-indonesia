-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2020 at 07:41 AM
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
-- Database: `lokasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) NOT NULL,
  `dagri_district_id` bigint(20) NOT NULL,
  `dagri_regency_id` bigint(20) NOT NULL,
  `dagri_name` varchar(255) DEFAULT NULL,
  `bps_district_id` bigint(20) NOT NULL,
  `bps_regency_id` bigint(20) NOT NULL,
  `bps_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) NOT NULL,
  `dagri_province_id` bigint(20) NOT NULL,
  `dagri_name` varchar(255) DEFAULT NULL,
  `bps_province_id` bigint(20) NOT NULL,
  `bps_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regencies`
--

CREATE TABLE `regencies` (
  `id` bigint(20) NOT NULL,
  `dagri_regency_id` bigint(20) NOT NULL,
  `dagri_province_id` bigint(20) NOT NULL,
  `dagri_name` varchar(255) DEFAULT NULL,
  `bps_regency_id` bigint(20) NOT NULL,
  `bps_province_id` bigint(20) NOT NULL,
  `bps_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE `villages` (
  `id` bigint(20) NOT NULL,
  `dagri_village_id` bigint(20) NOT NULL,
  `dagri_district_id` bigint(20) NOT NULL,
  `dagri_name` varchar(255) DEFAULT NULL,
  `bps_village_id` bigint(20) NOT NULL,
  `bps_district_id` bigint(20) NOT NULL,
  `bps_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DAGRI` (`dagri_district_id`),
  ADD UNIQUE KEY `BPS` (`bps_district_id`),
  ADD KEY `FK_districts_regencies` (`dagri_regency_id`),
  ADD KEY `FK_districts_regencies_2` (`bps_regency_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BPS` (`bps_province_id`),
  ADD UNIQUE KEY `DAGRI` (`dagri_province_id`);

--
-- Indexes for table `regencies`
--
ALTER TABLE `regencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BPS` (`bps_regency_id`),
  ADD UNIQUE KEY `DAGRI` (`dagri_regency_id`),
  ADD KEY `FK_regencies_provinces` (`dagri_province_id`),
  ADD KEY `FK_regencies_provinces_2` (`bps_province_id`);

--
-- Indexes for table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DAGRI` (`dagri_village_id`),
  ADD UNIQUE KEY `BPS` (`bps_village_id`),
  ADD KEY `FK_villages_districts` (`dagri_district_id`),
  ADD KEY `FK_villages_districts_2` (`bps_district_id`);

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
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `FK_districts_regencies` FOREIGN KEY (`dagri_regency_id`) REFERENCES `regencies` (`dagri_regency_id`),
  ADD CONSTRAINT `FK_districts_regencies_2` FOREIGN KEY (`bps_regency_id`) REFERENCES `regencies` (`bps_regency_id`);

--
-- Constraints for table `regencies`
--
ALTER TABLE `regencies`
  ADD CONSTRAINT `FK_regencies_provinces` FOREIGN KEY (`dagri_province_id`) REFERENCES `provinces` (`dagri_province_id`),
  ADD CONSTRAINT `FK_regencies_provinces_2` FOREIGN KEY (`bps_province_id`) REFERENCES `provinces` (`bps_province_id`);

--
-- Constraints for table `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `FK_villages_districts` FOREIGN KEY (`dagri_district_id`) REFERENCES `districts` (`dagri_district_id`),
  ADD CONSTRAINT `FK_villages_districts_2` FOREIGN KEY (`bps_district_id`) REFERENCES `districts` (`bps_district_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
