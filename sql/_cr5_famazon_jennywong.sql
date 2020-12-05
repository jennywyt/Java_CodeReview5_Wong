-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 03:54 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+01:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: ` cr5_famazon_jennywong`
--
CREATE DATABASE IF NOT EXISTS ` cr5_famazon_jennywong` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ` cr5_famazon_jennywong`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ID` bigint(20) NOT NULL,
  `Customer_ID` bigint(20) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `House_Number` varchar(20) NOT NULL,
  `Post_Code` varchar(50) DEFAULT NULL,
  `City` varchar(100) NOT NULL,
  `Region` varchar(100) DEFAULT NULL,
  `Country_Code` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ID`, `Customer_ID`, `First_Name`, `Last_Name`, `Street`, `House_Number`, `Post_Code`, `City`, `Region`, `Country_Code`) VALUES
(1, 1, 'Johanna ', 'Strauss', ' Praterstraße', '54', '1020', 'Vienna', 'Wien', 'AUT'),
(2, 2, 'William ', 'Champion', 'Gumpendorfer Strasse', '91', '1060', 'Vienna', 'Wien', 'AUT'),
(3, 3, 'Guy', 'Berryman', 'Neustiftgasse ', '40', '1070', 'Vienna', 'Wien', 'AUT'),
(4, 4, 'Chris', 'Martin ', 'Lancresse Close ', '13', 'UB81XU', 'Uxbridge', '', 'GBR'),
(5, 5, 'Jonny', 'Buckland', 'Untergummer ', '41', '39053', 'Karneid', 'BZ', 'ITA');

-- --------------------------------------------------------

--
-- Stand-in structure for view `address_line_for_address`
-- (See below for the actual view)
--
CREATE TABLE `address_line_for_address` (
`ID` bigint(20)
,`Name_exp_2` varchar(480)
);

-- --------------------------------------------------------

--
-- Table structure for table `credit_card`
--

CREATE TABLE `credit_card` (
  `ID` bigint(20) NOT NULL,
  `Customer_ID` bigint(20) NOT NULL,
  `Payee_Name` varchar(100) NOT NULL,
  `Credit_Card_Number` varchar(16) NOT NULL,
  `CVC` varchar(3) NOT NULL,
  `Expiry_Month` mediumint(9) NOT NULL,
  `Expiry_Year` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credit_card`
--

INSERT INTO `credit_card` (`ID`, `Customer_ID`, `Payee_Name`, `Credit_Card_Number`, `CVC`, `Expiry_Month`, `Expiry_Year`) VALUES
(1, 1, 'Johanna Strauss', '5438232612345555', '650', 12, 24),
(2, 2, 'William Champion', '4350124578980099', '788', 2, 22),
(3, 3, 'Guy Berryman', '5600900045327896', '560', 12, 23),
(4, 4, 'Christ Martin', '4567908023436541', '679', 3, 24),
(5, 5, 'Jonny Buckland', '4563232123439876', '480', 4, 22);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` bigint(20) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Birthday` date NOT NULL,
  `Phone_Number` varchar(50) NOT NULL,
  `Email_Address` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `First_Name`, `Last_Name`, `User_Name`, `Birthday`, `Phone_Number`, `Email_Address`, `Password`) VALUES
(1, 'Johanna ', 'Strauss', 'bluedonau123', '1958-02-15', '0140003535', 'bluedonau123@gmx.at', 'bluedonau123456'),
(2, 'William ', 'Champion', 'willchamp', '1978-02-03', '06648735535', 'will.champ@gmail.com', 'will.champ123'),
(3, 'Guy', 'Berryman', 'guyberr', '1980-01-27', '019423155', 'guy.berry@gmail.com', 'password'),
(4, 'Chris', 'Martin ', 'coldplay1996', '1977-03-02', '015812308', 'coldplay@coldplay.com', 'sicherheit'),
(5, 'Jonny', 'Buckland', 'jbuckland', '1982-09-15', '015952800', 'jonny.buckland@live.com', 'secure123');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_orders`
-- (See below for the actual view)
--
CREATE TABLE `customer_orders` (
`id` bigint(20)
,`customer_id` bigint(20)
,`Product_Name` varchar(100)
,`Price` decimal(10,2)
,`order_date` datetime
,`delivery_date` datetime
,`Order_Status_Description` varchar(100)
,`payment_date` datetime
,`payment_amount` decimal(10,2)
,`refund_date` datetime
,`refund_amount` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_agent`
--

CREATE TABLE `delivery_agent` (
  `ID` bigint(20) NOT NULL,
  `Employee_Number` varchar(100) NOT NULL,
  `Employee_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_agent`
--

INSERT INTO `delivery_agent` (`ID`, `Employee_Number`, `Employee_Name`) VALUES
(1, 'SAP123456', 'Eason Chan'),
(2, 'SAP234567', 'Celine Dion'),
(3, 'SAP223344', 'Christ Martin'),
(4, 'SAP334566', 'Enrique Iglesias'),
(5, 'SAP998866', 'Michael Buble');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `ID` bigint(20) NOT NULL,
  `Order_Status_Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`ID`, `Order_Status_Description`) VALUES
(1, 'Delivered '),
(3, 'In warehouse'),
(2, 'On the way '),
(7, 'Order Cancelled'),
(4, 'Order Confirmed '),
(9, 'Out of stock '),
(5, 'Payment Received'),
(8, 'Recipient absent '),
(10, 'Refund pending '),
(6, 'Refunded ');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `ID` bigint(20) NOT NULL,
  `Payment_ID` varchar(100) NOT NULL,
  `Time_Stamp` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`ID`, `Payment_ID`, `Time_Stamp`, `Amount`) VALUES
(1, '23445566', '2020-12-03 13:56:06', '200.00'),
(2, '65432123', '2020-12-04 13:56:06', '4.00'),
(3, '23456679', '2020-12-06 14:00:14', '10.00'),
(4, '78654320', '2020-11-25 14:00:14', '5.00'),
(5, '90023390', '2020-11-30 14:00:14', '2.00'),
(6, '55668790', '2020-12-03 13:56:06', '200.00'),
(7, '896780543', '2020-12-04 13:56:06', '3.50');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` bigint(20) NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `product_type_ID` bigint(20) NOT NULL,
  `Length` double NOT NULL,
  `Weight` double NOT NULL,
  `Height` double NOT NULL,
  `Width` double NOT NULL,
  `Warehouse_ID` bigint(20) NOT NULL,
  `Shop_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Product_Name`, `Price`, `product_type_ID`, `Length`, `Weight`, `Height`, `Width`, `Warehouse_ID`, `Shop_ID`) VALUES
(1, 'B&O E8 Bluetooth Earphone', '200.00', 1, 8, 100, 5, 4, 1, 2),
(2, 'Happy Eggs', '4.00', 6, 24, 500, 8, 11, 2, 3),
(3, 'Lindt Excellence Advent Calendar ', '10.00', 2, 50, 250, 3, 36, 4, 5),
(4, 'P G Tips Black Tea Value Pack', '5.00', 3, 20, 1000, 11, 17, 3, 1),
(5, 'PM Beauty Olive hand cream', '2.00', 4, 15, 100, 4, 5, 2, 4),
(6, 'Tempo Tissue ', '3.50', 5, 20, 150, 6, 19, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `ID` bigint(20) NOT NULL,
  `order_status_ID` bigint(20) NOT NULL,
  `Order_date` datetime NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_agent_ID` bigint(20) DEFAULT NULL,
  `payment_id` bigint(20) DEFAULT NULL,
  `refund_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_order`
--

INSERT INTO `product_order` (`ID`, `order_status_ID`, `Order_date`, `delivery_date`, `delivery_agent_ID`, `payment_id`, `refund_id`, `product_id`, `address_id`, `customer_id`) VALUES
(11, 1, '2020-12-01 13:49:43', '2020-12-03 13:49:43', 3, 1, NULL, 1, 4, 4),
(12, 3, '2020-12-03 13:49:43', NULL, NULL, 2, NULL, 2, 1, 1),
(13, 2, '2020-12-04 13:51:02', NULL, 2, 3, NULL, 3, 3, 3),
(14, 7, '2020-11-24 13:51:02', NULL, NULL, 4, NULL, 4, 5, 5),
(15, 6, '2020-11-30 13:51:02', NULL, NULL, 5, 1, 5, 2, 2),
(16, 6, '2020-12-01 14:13:46', '2020-12-02 14:13:46', NULL, 6, 2, 1, 3, 4),
(17, 6, '2020-11-30 14:13:46', '2020-12-02 14:13:46', NULL, 7, 3, 6, 5, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_order_count`
-- (See below for the actual view)
--
CREATE TABLE `product_order_count` (
`product_id` bigint(20)
,`product_name` varchar(100)
,`shop_id` bigint(20)
,`shop_name` varchar(100)
,`order_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_per_city`
-- (See below for the actual view)
--
CREATE TABLE `product_per_city` (
`City` varchar(100)
,`Product_Name` varchar(100)
,`shop_name` varchar(100)
,`order_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `ID` bigint(20) NOT NULL,
  `Product_Type_Name` varchar(100) NOT NULL,
  `Fragility` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`ID`, `Product_Type_Name`, `Fragility`) VALUES
(1, 'Bluetooth Earphone', 2),
(2, 'Chocolate ', 3),
(3, 'Tea Bags', 4),
(4, 'Hand Cream', 3),
(5, 'Tissue paper', 4),
(6, 'Fresh Eggs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `ID` bigint(20) NOT NULL,
  `Payment_ID` varchar(100) NOT NULL,
  `Time_Stamp` datetime NOT NULL,
  `Amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refund`
--

INSERT INTO `refund` (`ID`, `Payment_ID`, `Time_Stamp`, `Amount`) VALUES
(1, '	\r\n78654320', '2020-12-03 13:56:06', '2.00'),
(2, '23456790', '2020-12-05 14:20:33', '200.00'),
(3, '890765423', '2020-12-04 13:56:06', '3.50');

-- --------------------------------------------------------

--
-- Stand-in structure for view `refunds_per_shop`
-- (See below for the actual view)
--
CREATE TABLE `refunds_per_shop` (
`shop_name` varchar(100)
,`total_refunds` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sales_per_shop`
-- (See below for the actual view)
--
CREATE TABLE `sales_per_shop` (
`shop_name` varchar(100)
,`total_sales` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email_Address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`ID`, `Name`, `Email_Address`) VALUES
(1, 'Tea Shop', 'chai.tee@tea.com'),
(2, 'Mars ', 'mars.electronics@electronics.com'),
(3, 'Happy Farm', 'Goggeler@eier.com'),
(4, 'Drogerie', 'pm@pm.com'),
(5, 'Hyper Market ', 'hypermarket@hyper.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `store_order_count`
-- (See below for the actual view)
--
CREATE TABLE `store_order_count` (
`store_id` bigint(20)
,`store_name` varchar(100)
,`order_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `ID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`ID`, `Name`) VALUES
(1, 'Schiltach'),
(2, 'Korneuburg'),
(3, 'Trnava'),
(4, 'Schiphol ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `User_Name` (`User_Name`),
  ADD UNIQUE KEY `Email_Address` (`Email_Address`);

--
-- Indexes for table `delivery_agent`
--
ALTER TABLE `delivery_agent`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Order_Status_Description` (`Order_Status_Description`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `product_type_ID` (`product_type_ID`),
  ADD KEY `Warehouse_ID` (`Warehouse_ID`),
  ADD KEY `Shop_ID` (`Shop_ID`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `payment_id` (`payment_id`),
  ADD UNIQUE KEY `refund_id` (`refund_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `delivery_agent_ID` (`delivery_agent_ID`),
  ADD KEY `order_status_ID` (`order_status_ID`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Product_Type_Name` (`Product_Type_Name`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `credit_card`
--
ALTER TABLE `credit_card`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_agent`
--
ALTER TABLE `delivery_agent`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `credit_card`
--
ALTER TABLE `credit_card`
  ADD CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_type_ID`) REFERENCES `product_type` (`ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Warehouse_ID`) REFERENCES `warehouse` (`ID`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`Shop_ID`) REFERENCES `shop` (`ID`);

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`ID`),
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`refund_id`) REFERENCES `refund` (`ID`),
  ADD CONSTRAINT `product_order_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `product_order_ibfk_4` FOREIGN KEY (`address_id`) REFERENCES `address` (`ID`),
  ADD CONSTRAINT `product_order_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `product_order_ibfk_6` FOREIGN KEY (`delivery_agent_ID`) REFERENCES `delivery_agent` (`ID`),
  ADD CONSTRAINT `product_order_ibfk_7` FOREIGN KEY (`order_status_ID`) REFERENCES `order_status` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
