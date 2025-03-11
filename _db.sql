-- phpMyAdmin SQL Dump

--
-- Host: localhost
-- Generation Time: Feb 08, 2021 at 09:24 AM


SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `felvi`
--

-- --------------------------------------------------------

--
-- Table structure for table `rendeles`
--

CREATE TABLE `rendeles` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `status_id` int(3) NOT NULL COMMENT '0: Feldolgozásra vár, 1: Feldolgozva'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rendeles`
--

INSERT INTO `rendeles` (`id`, `user_id`, `date`, `status_id`) VALUES
(1, 1, '2021-02-08 06:18:08', 1),
(2, 2, '2021-02-07 09:12:33', 1),
(3, 3, '2021-02-01 19:18:20', 0),
(4, 4, '2021-02-02 12:11:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rendeles_megjegyzes`
--

CREATE TABLE `rendeles_megjegyzes` (
  `id` bigint(20) NOT NULL,
  `rendeles_id` bigint(20) NOT NULL,
  `megjegyzes` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rendeles_megjegyzes`
--

INSERT INTO `rendeles_megjegyzes` (`id`, `rendeles_id`, `megjegyzes`, `date`) VALUES
(1, 1, 'teszt 1 árvíztűrő', '2015-10-19 10:10:40'),
(2, 1, 'teszt 2 tükörfúrógép', '2015-10-19 10:10:40'),
(3, 4, 'storno', '2015-10-19 10:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `rendeles_tetel`
--

CREATE TABLE `rendeles_tetel` (
  `id` bigint(20) NOT NULL,
  `rendeles_id` bigint(20) NOT NULL,
  `termek_id` bigint(20) NOT NULL,
  `darab` int(8) NOT NULL,
  `egysegar` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rendeles_tetel`
--

INSERT INTO `rendeles_tetel` (`id`, `rendeles_id`, `termek_id`, `darab`, `egysegar`) VALUES
(1, 1, 1, 2, 2000),
(2, 1, 2, 2, 1000),
(3, 2, 3, 12, 3000),
(4, 3, 4, 4, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL COMMENT '#md5',
  `fullname` varchar(200) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `active`) VALUES
(1, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Demó 1', 1),
(2, 'demo2', '1066726e7160bd9c987c9968e0cc275a', 'Demó 2', 0),
(3, 'demo3', '297e430d45e7bf6f65f5dc929d6b072b', 'Demó 3', 1),
(4, 'demo4', '7b1312a1b3e74bb174b3fbbf68ab5a92', 'Demó 4', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rendeles_megjegyzes`
--
ALTER TABLE `rendeles_megjegyzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendeles_id` (`rendeles_id`);

--
-- Indexes for table `rendeles_tetel`
--
ALTER TABLE `rendeles_tetel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendeles_id` (`rendeles_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rendeles_megjegyzes`
--
ALTER TABLE `rendeles_megjegyzes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rendeles_tetel`
--
ALTER TABLE `rendeles_tetel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `rendeles_megjegyzes`
--
ALTER TABLE `rendeles_megjegyzes`
  ADD CONSTRAINT `rendeles_megjegyzes_ibfk_1` FOREIGN KEY (`rendeles_id`) REFERENCES `rendeles` (`id`);

--
-- Constraints for table `rendeles_tetel`
--
ALTER TABLE `rendeles_tetel`
  ADD CONSTRAINT `rendeles_tetel_ibfk_1` FOREIGN KEY (`rendeles_id`) REFERENCES `rendeles` (`id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
