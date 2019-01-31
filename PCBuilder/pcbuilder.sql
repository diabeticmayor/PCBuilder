-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2019 at 02:57 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pcbuilder`
--

-- --------------------------------------------------------

--
-- Table structure for table `cpus`
--

CREATE TABLE `cpus` (
  `cpu_id` int(1) NOT NULL,
  `cpu_manufacturer` varchar(10) NOT NULL,
  `cpu_name` varchar(255) NOT NULL,
  `cpu_socket` varchar(255) NOT NULL,
  `cpu_cores` int(1) NOT NULL,
  `cpu_clockspeed` double(4,2) NOT NULL,
  `cpu_overclockable` tinyint(1) NOT NULL,
  `cpu_stock` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gpus`
--

CREATE TABLE `gpus` (
  `gpu_id` int(1) NOT NULL,
  `gpu_manufacturer` int(11) NOT NULL,
  `gpu_name` varchar(255) NOT NULL,
  `gpu_chipset` int(11) NOT NULL,
  `gpu_memory_speed` int(4) NOT NULL,
  `gpu_ram` int(4) NOT NULL,
  `gpu_length` int(4) NOT NULL,
  `gpu_width` int(4) NOT NULL,
  `gpu_stock` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `motherboards`
--

CREATE TABLE `motherboards` (
  `motherboard_id` int(3) NOT NULL,
  `motherboard_manufacturer` varchar(255) NOT NULL,
  `motherboard_name` varchar(255) NOT NULL,
  `motherboard_socket` varchar(255) NOT NULL,
  `motherboard_formfactor` varchar(255) NOT NULL,
  `motherboard_chipset` varchar(255) NOT NULL,
  `motherboard_sataports` int(3) NOT NULL,
  `motherboard_ramtype` varchar(255) NOT NULL,
  `motherboard_ramslots` int(3) NOT NULL,
  `motherboard_pcislots` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_no` int(11) NOT NULL,
  `user_id` int(3) NOT NULL,
  `cpu_id` int(3) NOT NULL,
  `gpu_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `ram_id` int(11) NOT NULL,
  `ram_manufacturer` varchar(255) NOT NULL,
  `ram_name` varchar(255) NOT NULL,
  `ram_type` varchar(255) NOT NULL,
  `ram_speed` int(11) NOT NULL,
  `ram_size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_secondname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_address1` varchar(255) NOT NULL,
  `user_address2` varchar(255) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpus`
--
ALTER TABLE `cpus`
  ADD PRIMARY KEY (`cpu_id`),
  ADD UNIQUE KEY `Name` (`cpu_name`);

--
-- Indexes for table `gpus`
--
ALTER TABLE `gpus`
  ADD PRIMARY KEY (`gpu_id`);

--
-- Indexes for table `motherboards`
--
ALTER TABLE `motherboards`
  ADD PRIMARY KEY (`motherboard_id`),
  ADD UNIQUE KEY `motherboard_name` (`motherboard_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `User_id` (`user_id`),
  ADD KEY `Gpu_id` (`gpu_id`),
  ADD KEY `Cpu_id` (`cpu_id`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ram_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `Email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cpus`
--
ALTER TABLE `cpus`
  MODIFY `cpu_id` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gpus`
--
ALTER TABLE `gpus`
  MODIFY `gpu_id` int(1) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `motherboards`
--
ALTER TABLE `motherboards`
  MODIFY `motherboard_id` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `ram_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`gpu_id`) REFERENCES `gpus` (`gpu_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`cpu_id`) REFERENCES `cpus` (`cpu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
