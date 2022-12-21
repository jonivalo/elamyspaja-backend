-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 08:06 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Hemmoittelu'),
(2, 'Pakopelit'),
(3, 'Maalaiselämykset'),
(4, 'Eläimet'),
(5, 'Huimapäille');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_row`
--

CREATE TABLE `order_row` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double(10,2) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `image`, `description`, `category_id`) VALUES
(1, 'Päähieronta', 30.00, 'paahierontap.png', 'On tärkeää muistaa välillä irtaantua arjesta ja pysähtyä hetkeksi rentoutumaan. Hieronta rentouttaa mukavasti. Tämä elämys soveltuu kaikille, jotka kaipaavat hemmottelua.\r\nSisältää:\r\npäähieronnan.\r\n', 1),
(2, 'Viini', 20.00, 'viinip.png', 'Hurmaavassa viinitastingissä pääset tutustumaan punaisiin/valkoisiin eri rypälelajikkeisiin, niiden piirteisiin ja tyypillisiin valmistusmenetelmiin ja myös muutamiin harvinaisuuksiin. Viinitasting sisältää 3 punaista ja 3 valkoista erilaista viiniä.\r\n', 1),
(3, 'Laivapako', 50.00, 'laivapakop.png', 'Laivapako on pakohuonepeli joka sijaitsee Suomenlinnan edustalla.\r\nPelissä on tarkoitus etsiä tie ulos vanhasta museo laivasta ennen ajan loppumista. Pelin kesto on maksimissaan 1 tunti ja kerralla peliin pystyy osallistua 4-8 henkilöä.\r\n', 2),
(4, 'Kauhutalu', 40.00, 'kauhutalop.png', 'Huittisissa sijaitseva vanha talo johon huhutaan\r\nKuolleen perhe joka edelleen kummittelee talossa.\r\nTalo on ollut asumaton vuodesta 1915. Vuonna 2022\r\nTaloon avattiin pakohuonepeli, jossa ryhmän\r\nOn päästävä ulos talosta ennen ajan päättymistä\r\nVihjeiden avulla.\r\n\r\nElämykseen sisältyy pakohuonepeli, jonka kesto\r\nVoi olla jopa 3 tuntia. Taloon mahtuu pelaamaan\r\nKerralla isompikin ryhmä.\r\n', 2),
(5, 'Klapi', 10.00, 'klapip.png', 'Klapielämys on henkilölle, joka haaveilee\r\nMaalaiselämästä ja siitä kun voin itse tehdä\r\nKlapit omaan takkaan taikka saunaan.\r\n\r\nElämys sisältää:\r\nKirveen\r\nPuut halottavaksi\r\n', 3),
(6, 'Sauna', 5.00, 'saunap.png', 'Rentoudu merellisen maalaismaiseman keskellä ja koe erilainen saunaelämys tynnyrisaunassa. Oppaamme kertoo saunan merkityksestä suomalaisessa kulttuurissa ja neuvoo samalla, kuinka saunassa toimitaan. Perinteinen puilla lämpiävä kiuas ja intiimi saunatila luovat yhdessä viihtyisän tunnelman.\r\n\r\nSisältää:\r\n\r\nSaunan 1-10:lle henkilölle. Saunaan sopii kerralla neljä henkilöä.\r\nElämys kestää noin kolme tuntia.\r\nSauna on valmiiksi lämmitetty ja pyyhkeet kuuluvat hintaan.\r\n', 3),
(7, 'Poroajelu', 25.00, 'poroajelup.png', 'Etsitkö täydellistä elämystä, joka yhdistää menevän vauhdin ja talvisen luonnon? Poroajelu on erinomainen valinta, kun haluat nauttia Suomen luonnosta arktisen eksotiikan merkeissä.\r\nPoroajelu alkaa porotilalta, jonne ajetaan yhdessä moottorikelkoilla. Tilalla isäntä kertoo osallistujille tarkemmin poroelinkeinosta, jonka jälkeen siirrytään ajamaan porovaljakoissa. Elämyksen kruunaa ajelun jälkeinen rentouttava hetki kodassa, jossa osallistujat pääsevät nauttimaan nokipannukahvit tai kuumaa mehua tunnelmallisesti avotulen ääressä.\r\n\r\nSisältää:\r\nPoroajelu\r\nlämpimät juomat avotulen ääressä\r\nvarusteet\r\nvakuutus\r\n', 4),
(8, 'Husky', 35.00, 'huskyp.png', 'Huskysafari kahdelle henkilölle. Koiravaljakkoajelun pituus on noin 5 kilometriä. Elämys sopii hyvin pohjoisen erämaassa ja lumisissa maisemissa viihtyville.\r\n\r\nElämykseen sisältyy:\r\n\r\nHuskysafari kahdelle\r\nKuumaa mehua ja pullaa\r\nVakuutukset.\r\n', 4),
(9, 'Benji', 120.00, 'benjip.png', 'Oletko sinä tai onko lähipiirissäsi hurjapää joka\r\nSanoo olevansa valmis ihan mihin tahansa.\r\nBenjihyppy herättelee adrenaliinihyökkäyksen joka\r\nKutittelee vatsanpohjasta ja saa rohkeimmillekin\r\nKylmän hien pintaan. Hypyn aikana voidaan saavuttaa\r\nJopa n. 120 km/h nopeus ja ensimmäisen pompun\r\nAikana nopeus on jopa n.80 km/h ylöspäin.\r\nBenjihyppy sopii kaikille, jotka ovat valmiita\r\nÄärimmäisiin tempauksiin.\r\n', 5),
(10, 'Kuumailmapallo', 200.00, 'kuumailmapallop.png', 'Kuumailmapallolento on ainutlaatuinen elämys vailla vertaa! Yleisölennolla pääset nauttimaan upeista maisemista ja rauhallisesta lennosta. Kokeneet lentäjät takaavat turvallisen lentoelämyksen. Keväällä ja kesällä yleisölentoja lennetään illalla auringon tehon jo laski\r\nKuumailmapallolento kestää noin tunnin ja kokonaisuudessaan kuumailmapallolentotapahtumaan kannattaa varata aikaa 4-5 tuntia. Lentoonlähtöä edeltäviin valmisteluihin ja mahdolliseen siirtymiseen kokoontumispaikalta lähtöpaikalle kuluu aikaa noin tunti. Pallon valmistelu lähtökuntoon on tiimityötä, johon myös matkustajilla on mahdollisuus osallistua.\r\n', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_row`
--
ALTER TABLE `order_row`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `order_row`
--
ALTER TABLE `order_row`
  ADD CONSTRAINT `order_row_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_row_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
