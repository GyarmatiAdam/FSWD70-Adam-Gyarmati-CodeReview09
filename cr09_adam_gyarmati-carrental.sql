-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2019 at 08:34 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_adam_gyarmati-carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `av_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `av_date` date DEFAULT NULL,
  `av_description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`av_id`, `fk_car_id`, `av_date`, `av_description`) VALUES
(1, 1, '2019-01-01', 'Available'),
(2, 2, '2019-01-01', 'Available'),
(3, 3, '2019-01-01', 'Available'),
(4, 4, '2019-01-01', 'Available'),
(5, 5, '2019-01-01', 'Available'),
(6, 6, '2019-01-01', 'Available'),
(7, 7, '2019-01-01', 'Available'),
(8, 8, '2019-01-01', 'Available'),
(9, 9, '2019-01-01', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `book_id` int(11) NOT NULL,
  `fk_inv_id` int(11) DEFAULT NULL,
  `pick_point` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `drop_point` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_date` date DEFAULT NULL,
  `drop_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`book_id`, `fk_inv_id`, `pick_point`, `drop_point`, `pick_date`, `drop_date`) VALUES
(1, NULL, 'Fo utca 8 Budapest ', 'Budai ut 89 Debrecen ', '2019-07-23', '2019-08-06'),
(2, NULL, 'Soproni ut Gyor 12', 'Budai ut 89 Debrecen ', '2019-08-01', '2019-08-13'),
(3, NULL, 'Fo utca 8 Budapest ', 'Gyori ut 98 Sopron', '2019-05-19', '2019-05-28'),
(4, NULL, 'Vamhaz ut 43 Pecs ', 'Gyori ut 98 Sopron', '2019-07-23', '2019-08-13'),
(5, NULL, 'Vamhaz ut 43 Pecs ', 'Budai ut 89 Debrecen ', '2019-07-13', '2019-08-13'),
(6, NULL, 'Gyori ut 98 Sopron', 'Gyori ut 98 Sopron', '2019-05-23', '2019-07-02'),
(7, NULL, 'Soproni ut Gyor 12', 'Petofi ut 46 Siofok ', '2019-06-13', '2018-06-21'),
(8, NULL, 'Fo utca 8 Budapest ', 'Vamhaz ut 43 Pecs ', '2019-08-13', '2019-08-23'),
(9, NULL, 'Soproni ut Gyor 12', 'Budai ut 89 Debrecen ', '2019-07-23', '2019-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `fk_rental_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `fk_model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `fk_book_id`, `fk_rental_id`, `price`, `fk_model_id`) VALUES
(1, 1, 1, 220, 2),
(2, 2, 2, 420, 4),
(3, 3, 3, 130, 7),
(4, 4, 4, 240, 9),
(5, 5, 5, 150, 9),
(6, 6, 6, 150, 6),
(7, 7, 7, 160, 11),
(8, 8, 8, 670, 14),
(9, 9, 9, 180, 16);

-- --------------------------------------------------------

--
-- Table structure for table `car_rental`
--

CREATE TABLE `car_rental` (
  `rental_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `address` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `r_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `car_rental`
--

INSERT INTO `car_rental` (`rental_id`, `fk_book_id`, `address`, `city`, `r_email`) VALUES
(1, 1, 'Fo utca 8  ', 'Budapest', 'buda@gmail.com'),
(2, 2, 'Soproni ut  12', 'Gyor', 'gyor@gmail.com'),
(3, 3, 'Fo utca 8  ', 'Budapest', 'buda@gmail.com'),
(4, 4, 'Vamhaz ut 43  ', 'Pecs', 'pecs@gmail.com'),
(5, 5, 'Vamhaz ut 43  ', 'Pecs', 'pecs@gmail.com'),
(6, 6, 'Gyori ut 98', ' Sopron', 'sopron@gmail.com'),
(7, 7, 'Soproni ut  12', 'Gyor', 'gyor@gmail.com'),
(8, 8, 'Fo utca 8  ', 'Budapest', 'buda@gmail.com'),
(9, 9, 'Soproni ut  12', 'Gyor', 'gyor@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cust_id`, `fk_book_id`, `first_name`, `last_name`, `c_email`, `dob`) VALUES
(402, 1, 'Oliver', 'Johnson', 'oliver@gmail.com', '1982-05-13'),
(403, 2, 'George ', 'Williams', 'gerorge@gmail.com', '1982-03-18'),
(404, 3, 'Harry', 'Jones  ', 'harry@gmail.com', '1982-09-16'),
(405, 4, 'Noah ', 'Brown  ', 'noah@gmail.com', '1974-03-15'),
(406, 5, 'Jack ', 'Davis  ', 'jack@gmail.com', '1982-07-23'),
(407, 6, 'Charlie', 'Miller  ', 'charlie@gmail.com', '1987-05-11'),
(408, 7, 'Leo', 'Wilson  ', 'leo@gmail.com', '1989-05-24'),
(409, 8, 'Jacob ', 'Moore  ', 'jacob@gmail.com', '1952-03-10'),
(410, 9, 'Freddie', 'Taylor  ', 'fredddie@gmail.com', '1982-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `dis_id` int(11) NOT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `dis_description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`dis_id`, `fk_car_id`, `dis_description`) VALUES
(1, 1, '30%'),
(2, 2, 'None'),
(3, 3, 'None'),
(4, 4, '30%'),
(5, 5, '10%'),
(6, 6, 'None'),
(7, 7, 'None'),
(8, 8, 'None'),
(9, 9, '30%');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `inv_id` int(11) NOT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `inv_date` date DEFAULT NULL,
  `inv_status` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`inv_id`, `fk_book_id`, `inv_date`, `inv_status`) VALUES
(1, 1, '2019-06-09', 'Ready'),
(2, 2, '2019-07-13', 'Ready'),
(3, 3, '2019-09-23', 'Pending'),
(4, 4, '2019-08-13', 'Pending'),
(5, 5, '2019-01-24', 'Ready'),
(6, 6, '2019-02-19', 'Ready'),
(7, 7, '2019-06-17', 'Ready'),
(8, 8, '2019-07-13', 'Ready'),
(9, 9, '2019-05-24', 'Ready');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manuf_id` int(11) NOT NULL,
  `man_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manuf_id`, `man_name`) VALUES
(1, 'BMW'),
(2, 'MAZDA'),
(3, 'FORD'),
(4, 'OPEL');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `fk_manuf_id` int(11) DEFAULT NULL,
  `mo_name` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mo_year` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `fk_manuf_id`, `mo_name`, `mo_year`) VALUES
(1, 1, '520E', '2016-01-01'),
(2, 1, '420E', '2017-01-01'),
(3, 1, '34E', '2018-01-01'),
(4, 1, '335E', '2016-01-01'),
(5, 1, '116E', '2017-01-01'),
(6, 2, '34E', '2018-01-01'),
(7, 2, '3E', '2016-01-01'),
(8, 2, '4E', '2018-01-01'),
(9, 2, '5S', '2018-01-01'),
(10, 3, 'FORD', '2016-01-01'),
(11, 3, 'FOCUS', '2018-01-01'),
(12, 3, 'CMAX', '2017-01-01'),
(13, 3, 'ESCORT', '2016-01-01'),
(14, 4, 'ADAM', '2017-01-01'),
(15, 4, 'CORSA', '2016-01-01'),
(16, 4, 'ASTRA', '2016-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `pay_id` int(11) NOT NULL,
  `fk_inv_id` int(11) DEFAULT NULL,
  `fk_type_id` int(11) DEFAULT NULL,
  `pay_status` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`pay_id`, `fk_inv_id`, `fk_type_id`, `pay_status`) VALUES
(1, 1, 1, 'Payed'),
(2, 2, 2, 'Payed'),
(3, 3, 3, 'Unpayed'),
(4, 4, 4, 'Unpayed'),
(5, 5, 4, 'Payed'),
(6, 6, 3, 'Payed'),
(7, 7, 2, 'Payed'),
(8, 8, 3, 'Payed'),
(9, 9, 1, 'Payed');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `type_id` int(11) NOT NULL,
  `pay_description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`type_id`, `pay_description`) VALUES
(1, 'Cash'),
(2, 'Card'),
(3, 'PayPal'),
(4, 'AMEX');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`av_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_book_id` (`fk_book_id`),
  ADD KEY `fk_rental_id` (`fk_rental_id`),
  ADD KEY `fk_model_id` (`fk_model_id`);

--
-- Indexes for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`dis_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`inv_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manuf_id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `fk_manuf_id` (`fk_manuf_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `fk_inv_id` (`fk_inv_id`),
  ADD KEY `fk_type_id` (`fk_type_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `av_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `car_rental`
--
ALTER TABLE `car_rental`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `dis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `inv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manuf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `availability`
--
ALTER TABLE `availability`
  ADD CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `bookings` (`book_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_rental_id`) REFERENCES `car_rental` (`rental_id`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`fk_model_id`) REFERENCES `model` (`model_id`);

--
-- Constraints for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD CONSTRAINT `car_rental_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `bookings` (`book_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `bookings` (`book_id`);

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `bookings` (`book_id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`fk_manuf_id`) REFERENCES `manufacturer` (`manuf_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fk_inv_id`) REFERENCES `invoices` (`inv_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`fk_type_id`) REFERENCES `payment_type` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
