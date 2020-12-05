CREATE DATABASE IF NOT EXISTS ` cr5_famazon_jennywong` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ` cr5_famazon_jennywong`;


--
-- Structure for view `address_line_for_address`
--
DROP TABLE IF EXISTS `address_line_for_address`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `address_line_for_address`  AS SELECT `a`.`ID` AS `ID`, concat_ws('\n',concat(`a`.`First_Name`,' ',`a`.`Last_Name`),concat(`a`.`Street`,' ',`a`.`House_Number`),concat(`a`.`Post_Code`,' ',`a`.`City`),`a`.`Region`,`a`.`Country_Code`) AS `Name_exp_2` FROM `address` AS `a` ;

-- --------------------------------------------------------

--
-- Structure for view `customer_orders`
--
DROP TABLE IF EXISTS `customer_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_orders`  AS SELECT `o`.`ID` AS `id`, `o`.`customer_id` AS `customer_id`, `pr`.`Product_Name` AS `Product_Name`, `pr`.`Price` AS `Price`, `o`.`Order_date` AS `order_date`, `o`.`delivery_date` AS `delivery_date`, `s`.`Order_Status_Description` AS `Order_Status_Description`, `p`.`Time_Stamp` AS `payment_date`, `p`.`Amount` AS `payment_amount`, `r`.`Time_Stamp` AS `refund_date`, `r`.`Amount` AS `refund_amount` FROM ((((`product_order` `o` join `product` `pr` on(`pr`.`ID` = `o`.`product_id`)) left join `payment` `p` on(`p`.`ID` = `o`.`payment_id`)) left join `refund` `r` on(`r`.`ID` = `o`.`refund_id`)) left join `order_status` `s` on(`o`.`order_status_ID` = `s`.`ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `product_order_count`
--
DROP TABLE IF EXISTS `product_order_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_order_count`  AS SELECT `p`.`ID` AS `product_id`, `p`.`Product_Name` AS `product_name`, `s`.`ID` AS `shop_id`, `s`.`Name` AS `shop_name`, count(distinct `o`.`ID`) AS `order_count` FROM ((`product` `p` left join `shop` `s` on(`p`.`Shop_ID` = `s`.`ID`)) left join `product_order` `o` on(`o`.`product_id` = `p`.`ID`)) GROUP BY 1, 2, 3, 4 ORDER BY 5 DESC ;

-- --------------------------------------------------------

--
-- Structure for view `product_per_city`
--
DROP TABLE IF EXISTS `product_per_city`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_per_city`  AS SELECT `address`.`City` AS `City`, `product`.`Product_Name` AS `Product_Name`, `shop`.`Name` AS `shop_name`, count(distinct `product_order`.`ID`) AS `order_count` FROM (((`product` left join `product_order` on(`product`.`ID` = `product_order`.`product_id`)) left join `address` on(`product_order`.`address_id` = `address`.`ID`)) left join `shop` on(`shop`.`ID` = `product`.`Shop_ID`)) GROUP BY 1, 2, 3 ;

-- --------------------------------------------------------

--
-- Structure for view `refunds_per_shop`
--
DROP TABLE IF EXISTS `refunds_per_shop`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `refunds_per_shop`  AS SELECT `s`.`Name` AS `shop_name`, ifnull(sum(`pt`.`Amount`),0) AS `total_refunds` FROM (((`shop` `s` left join `product` `p` on(`p`.`Shop_ID` = `s`.`ID`)) left join `product_order` on(`p`.`ID` = `product_order`.`product_id`)) left join `refund` `pt` on(`pt`.`ID` = `product_order`.`refund_id`)) GROUP BY 1 ;

-- --------------------------------------------------------

--
-- Structure for view `sales_per_shop`
--
DROP TABLE IF EXISTS `sales_per_shop`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_per_shop`  AS SELECT `s`.`Name` AS `shop_name`, sum(`pt`.`Amount`) AS `total_sales` FROM (((`shop` `s` left join `product` `p` on(`p`.`Shop_ID` = `s`.`ID`)) left join `product_order` on(`p`.`ID` = `product_order`.`product_id`)) left join `payment` `pt` on(`pt`.`ID` = `product_order`.`payment_id`)) GROUP BY 1 ;

-- --------------------------------------------------------

--
-- Structure for view `store_order_count`
--
DROP TABLE IF EXISTS `store_order_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `store_order_count`  AS SELECT `s`.`ID` AS `store_id`, `s`.`Name` AS `store_name`, count(distinct `o`.`ID`) AS `order_count` FROM ((`shop` `s` left join `product` `p` on(`p`.`Shop_ID` = `s`.`ID`)) left join `product_order` `o` on(`o`.`product_id` = `p`.`ID`)) GROUP BY 1, 2 ;
