-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2023 at 02:10 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(1, 'Jaguar', 'Jaguar Company', 1, '2021-08-30 10:33:53'),
(2, 'Honda', 'Honda Company', 1, '2021-08-30 10:34:12'),
(3, 'Lexus', 'Lexus Company', 1, '2021-08-30 10:34:22'),
(4, 'BMW', 'BMW Company', 1, '2021-08-30 10:34:38'),
(5, 'Audi', 'Audi Company', 1, '2021-08-30 10:35:00'),
(6, 'Kia', 'Kia Company', 1, '2021-08-30 10:35:26'),
(7, 'Volkswagen', 'Volkswagen Company', 1, '2021-08-30 10:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Automobiles', 'Automotive Cars', 1, '2021-08-30 10:52:25'),
(2, 'Accessories', 'Phone Accessories', 1, '2021-08-30 10:52:49'),
(3, 'Automobile Hardware', 'Automotive Hardware products', 1, '2021-08-30 10:53:31'),
(4, 'External Storage', 'External Storage Products', 1, '2021-08-30 10:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'Claire', 'Blake', 'Female', '09123456789', 'cblake@gmail.com', 'cd74fae0a3adf459f73bbf187607ccea', 'Sample Address', '2021-08-30 15:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 15, 15301000, '2021-08-30 13:24:01', '2023-04-06 17:10:34'),
(2, 2, 20, 7000990, '2021-08-30 13:27:26', '2023-04-06 17:10:50'),
(3, 3, 25, 350, '2021-08-30 15:42:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1, 75340, 1, 1, '2021-08-30 15:57:01', '2021-08-30 16:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(1, 1, 1, 1, 15300000, 15300000),
(2, 1, 3, 1, 350, 350);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `sub_category_id`, `name`, `specs`, `status`, `date_created`) VALUES
(1, 1, 1, 0, 'Jaguar F-Pace', '<ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\">\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0px; padding: 0px;\\\">2 seater SuperCar</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding:\r\n	       0px;\\\">Automatic Transmission</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Mileage\r\n    - 9.4 to 12.3 kmpl</li>\r\n</ul>\r\n<p class=\\\"typography-caption model-caption\\\" style=\\\"margin: 0.8em 0px 0px; padding: 0px; line-height: 1.33337;\\\">\r\n\r\nJaguar F-Type price ranges between ₹ 98.13 Lakh - ₹ 1.53 Crore depending on the variant selected.\r\n\r\nVariants:\r\n\r\nIt is offered in three variants – 2.0-litre coupe R-Dynamic, 5.0-litre V8 coupe R-Dynamic, and 5.0-litre V8 convertible R-Dynamic.\r\n\r\nEngine and transmission:\r\n\r\nThe F-Type is available with two powertrains; a 2.0-litre, four-cylinder turbocharged with two outputs - 444bhp/580Nm and 567bhp/700Nm. The more powerful V8 powers the R variants and is exclusively available with an AWD drivetrain. All engines are paired to a ZF-sourced eight-speed automatic transmission.\r\n\r\nExterior:\r\n\r\nThe F-Type loses the feline design penned by Ian Callum for a more generic ‘always angry’ design philosophy. The sleek headlamps, new grille, massive air intakes and air vents on the engine cover are part of the new design theme being adopted by all new Jaguar cars. Apart from some new upholstery and trim materials, the interior design has been left untouched.\r\n\r\nInterior:\r\n\r\nThe most noticeable equipment change is the addition of the 12.3-inch all-digital instrument cluster and the improved touchscreen infotainment system.\r\n\r\nSafety and features:\r\n\r\nIt gets launch control, stability control, front and side impact airbags, overhead airbags, and ABS. \r\n\r\nSeating capacity:\r\n\r\nIt has a seating capacity for two occupants. \r\n\r\nColours:\r\n\r\nThe Jaguar F-type is available in 23 different colours – Indus Silver, Flux Silver, Amethyst Grey Purple, Eiger Grey, Carpathian Grey, Ice White, Silicon Silver, Bluefire Blue, Sorrento Yellow, Fuji White, Santorini Black, Desire Deep Red, Caldera Red, Ligurian Black, British Racing Green, Sunset Glow, Petroiix Blue, Portofino Blue, Yulong White, Dynamic Black, Tourmaline Brown, Sanguinello Orange, and Firenze Red.\r\n\r\nRivals:\r\n\r\nThe F-Type takes on the very capable Porsche 718 Cayman and Boxster models, Ford Mustang, BMW Z4, Mercedes-AMG C 43, and BMW M2 competition.  \r\n\r\n</p>\r\n<p style=\\\"margin: 0.8em 0px 0px; padding: 0px; line-height: 1.33337;\\\"><br></p>\r\n<ul class=\\\"techspecs-list\\\" role=\\\"list\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none;\\\">\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0px; padding: 0px;\\\">HDR display</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">True Tone</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Wide color (P3)</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Haptic Touch</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">2,000,000:1 contrast ratio (typical)</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">800 nits max brightness (typical); 1,200 nits max brightness (HDR)</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Fingerprint-resistant oleophobic coating</li>\r\n    <li role=\\\"listitem\\\" style=\\\"margin: 0.4em 0px 0px; padding: 0px;\\\">Support for display of multiple languages and characters simultaneously</li>\r\n</ul>\r\n', 1, '2021-08-30 12:19:22'),
(2, 3, 1, 0, 'Lexus', '<p>\r\n<p></p>\r\n<p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding:\r\n	   0px; vertical-align: top; line-height: 1.25; text-align:\r\n	   center;\\\"><span class=\\\"c_model_unit-type1\\\" style=\\\"text-align:\r\n		    left; margin: 0px; padding: 0px; vertical-align: top;\r\n		    display: block; line-height: 1.3;\\\">Lexus Supercar</span></p>\r\n<p style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding:\r\n	   0px; vertical-align: top; line-height: 1.25;\\\">250hp engine</p>\r\n<dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\">\r\n    <dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Dimensions:</dt>\r\n    <dd style=\\\"text-align: left; margin-top: 10px; margin-right: 0px;\r\n		margin-bottom: 0px; padding: 0px; vertical-align:\r\n		top;\\\">75.6x165.1x8.9dm</dd>\r\n    <dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Weight:</dt>\r\n    <dd style=\\\"text-align: left; margin-top: 10px; margin-right: 0px;\r\n		margin-bottom: 0px; padding: 0px; vertical-align: top;\\\">2\r\n									tonnes</dd>\r\n    <dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">Biometric Authentication:</dt>\r\n</dl>\r\n<p></p>\r\n<p></p>\r\n<dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\">\r\n    <dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px\r\n		0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">5\r\n									    year\r\n    Warranty</dt>\r\n</dl>\r\n</p>\r\n<h3 class=\\\"c_model_title-type1\\\" style=\\\"margin-right: 0px; margin-bottom: 0px;\r\n	    margin-left: 0px; padding: 0px; vertical-align: top;\\\">Super Smooth\r\nDrive</h3>\r\n<p>\r\n<p></p>\r\n</p>\r\n<dl style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top; line-height: 1.25; text-align: center;\\\">\r\n    <dt class=\\\"c_model_unit-type3\\\" style=\\\"text-align: left; margin: 40px 0px 0px; padding: 0px; vertical-align: top; line-height: 1.25;\\\">\r\n        <p class=\\\"c_model_desc-type1\\\" style=\\\"margin: 8px 0px 0px; padding:\r\n		   0px; vertical-align: top;\\\">Our smoothest engine screen keeps\r\n					      up with all your power hungry\r\n					      driving.</p>\r\n        <h3 class=\\\"c_model_title-type1\\\" style=\\\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: top;\\\">Durability</h3>\r\n        <p class=\\\"c_model_desc-type1\\\" style=\\\"margin: 8px 0px 0px; padding:\r\n		   0px; vertical-align: top;\\\">Luxurious and\r\n							    Comfortable<span\r\n					      style=\\\"line-height: 1.2;\r\n						      position: relative; top:\r\n						      0px; margin: 0px; padding:\r\n						      0px; vertical-align:\r\n						      top;\\\"></span></p>\r\n    </dt>\r\n</dl>\r\n', 1, '2021-08-30 13:15:11'),
(3, 1, 2, 2, 'Jaguar Mat Cover', '<p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur rhoncus posuere accumsan. Maecenas eget aliquam odio, ac vehicula leo. Praesent magna erat, consectetur elementum leo nec, ornare congue dolor. Sed tristique magna non lorem tristique, vitae dictum velit posuere. Aliquam in tempor dui, nec scelerisque mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur venenatis urna justo, eu dapibus diam venenatis vel. Proin tincidunt leo a elit mollis, in sollicitudin est iaculis. In metus urna, cursus non ullamcorper sed, cursus id velit. Nullam dui justo, gravida sit amet sollicitudin vel, tempor ac diam. Phasellus egestas quis metus in condimentum. Pellentesque non dapibus eros, eu facilisis ipsum. Cras suscipit metus iaculis, varius est eu, blandit metus. Mauris sed diam eros. Curabitur gravida pulvinar metus a euismod. Cras consequat metus eros, id tincidunt massa aliquam ut.</p><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\">Sed sit amet eleifend nisl. Aliquam ullamcorper nisl sed eros commodo cursus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo metus, malesuada ac viverra quis, placerat in magna. Morbi suscipit justo vitae tincidunt venenatis. Aliquam ex odio, sagittis quis tincidunt id, semper ut orci. Cras consequat dui vel vestibulum volutpat. Maecenas dapibus purus quis magna consectetur placerat. Donec porttitor massa eu lacus aliquet bibendum.</p><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\">Sed ut ex sed elit blandit ultrices. Curabitur non suscipit purus, eu facilisis felis. Proin ac nisl commodo, efficitur tortor mattis, elementum velit. Duis vel mattis justo. Pellentesque sodales, enim vel blandit vulputate, nunc nunc pretium dolor, vitae cursus massa erat consectetur ex. Donec varius tristique dui vitae semper. Quisque dictum volutpat vulputate. Morbi dui enim, auctor vel velit vel, sollicitudin scelerisque metus. Duis in turpis a elit luctus vestibulum.</p>', 1, '2021-08-30 15:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 75340, '2021-08-30 15:57:01');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 3, 'Mats', 'Car Mats', 1, '2021-08-30 11:28:40'),
(2, 2, 'Mats', 'Mats for Trunk', 1, '2021-08-30 11:29:15'),
(3, 4, 'Micro SD Card', 'Micro SD Cards', 1, '2021-08-30 11:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Automobile Ordering System'),
(6, 'short_name', 'AOS'),
(11, 'logo', 'uploads/1630289100_mobile.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630289280_wallpaper.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
