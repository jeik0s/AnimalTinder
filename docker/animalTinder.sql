-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Feb 03, 2022 at 10:22 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animalTinder`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `animalID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `sex` varchar(1) NOT NULL,
  `provinceId` int NOT NULL,
  `breed` varchar(50) NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photoUrl` varchar(255) NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `environment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`animalID`, `name`, `age`, `sex`, `provinceId`, `breed`, `description`, `photoUrl`, `taken`, `environment`) VALUES
(1, 'Lars', 3, 'M', 3, 'Pies', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque', 'https://www.essentialliving.co.uk/wp-content/uploads/2021/02/Where-to-Adopt-a-Dog-in-London_Thumbnail.png', 0, 's'),
(2, 'Clifford', 5, 'M', 5, 'Pies', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque', 'https://s3.viva.pl/newsy/zmarl-boo-najpopularniejszy-pies-swiata-561503-GALLERY_BIG.jpg', 0, 'p'),
(3, 'Puszek', 2, 'M', 6, 'Pies', 'Puszek jest przyjazny i łagodny. Bardzo lubi spacery, wszystko go interesuje, ładnie chodzi na smyczy i nie zaczepia psów. Lubi głaskanie i jest ufny wobec ludzi. Puszek potrzebuje odpowiedzialnego domu, gdzie dostanie opiekę weterynaryjną oraz dużo miłości. Bardzo prosimy o dom dla Puszka, to piękny i dobry psiak.', 'https://www.zoocentrum24.pl/blog/wp-content/uploads/2020/08/dog-5449489_1920-1140x760.jpg', 0, 'Schronisko dla Bezdomnych Zwierząt \"Na Paluchu\"'),
(4, 'Nela', 8, 'F', 2, 'Kot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque', 'https://cdn.wamiz.fr/cdn-cgi/image/quality=80,width=400,fit=contain/https://cdn.wamiz.fr/article/images/Wamiz%20PL/koty/rasy%20kotow/sfinks-donski.jpg', 0, 's'),
(5, 'Hass', 7, 'M', 13, 'Koń', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque', 'https://www.tygodnik-rolniczy.pl/media/articles/Kon_stanal_na_kobiecie_21-latka_zmarla_na_miejscu.jpg', 0, 'p'),
(6, 'Betty', 4, 'F', 3, 'Kot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque', 'https://www.swinoujskie.info/wp-content/uploads/2019/07/vpcJlBd.jpg', 0, 'p');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `provinceId` int NOT NULL,
  `provinceName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`provinceId`, `provinceName`) VALUES
(1, 'dolnoslaskie'),
(2, 'kujawsko-pomorskie'),
(3, 'lubelskie'),
(4, 'lubuskie'),
(5, 'lodzkie'),
(6, 'malopolskie'),
(7, 'mazowieckie'),
(8, 'opolskie'),
(9, 'podkarpackie'),
(10, 'podlaskie'),
(11, 'pomorskie'),
(12, 'slaskie'),
(13, 'swietokrzyskie'),
(14, 'warminsko-mazurskie'),
(15, 'wielkopolskie'),
(16, 'zachodniopomorskie');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`animalID`),
  ADD KEY `provinceId` (`provinceId`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`provinceId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `animalID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `provinceId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `province` (`provinceId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
