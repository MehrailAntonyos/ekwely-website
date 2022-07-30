-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2022 at 11:53 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveryforms`
--

CREATE TABLE `deliveryforms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `license` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_of_vehicle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ironforms`
--

CREATE TABLE `ironforms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `appointment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commercial_register` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_shop_area` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details_of_shop_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('انتظار','تأكيد') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ironforms`
--

INSERT INTO `ironforms` (`id`, `created_at`, `updated_at`, `appointment`, `commercial_register`, `name_of_shop_area`, `details_of_shop_address`, `status`, `user_id`) VALUES
(8, '2022-07-24 17:14:43', '2022-07-24 17:24:12', 'فترة صباحية', 'نموذج-سجل-تجاري-مصري-pdf.jpeg', 'وسط البلد', 'اسوان-البركة', 'تأكيد', 15),
(9, '2022-07-24 19:32:33', '2022-07-24 19:43:17', 'فترة صباحية', 'نموذج-سجل-تجاري-مصري-pdf.jpeg', 'الصداقة', 'اسوان-الصداقة', 'تأكيد', 19);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_27_192917_create_projectdatas_table', 1),
(6, '2022_06_28_125923_create_deliveryforms_table', 1),
(7, '2022_06_28_134542_create_ironforms_table', 1),
(8, '2022_06_28_181053_create_orders_table', 1),
(9, '2022_06_29_200509_create_order_details_table', 1),
(10, '2022_06_29_201305_create_offers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `ironform_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `created_at`, `updated_at`, `price`, `order_id`, `ironform_id`) VALUES
(12, '2022-07-24 19:17:56', '2022-07-24 19:17:56', 20, 32, 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `totalPrice` double(8,2) DEFAULT NULL,
  `status` enum('انتظار','تأكيد') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ironform_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deliveryform_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `totalPrice`, `status`, `user_id`, `ironform_id`, `deliveryform_id`) VALUES
(29, '2022-07-24 19:11:52', '2022-07-24 19:11:52', NULL, 'انتظار', 18, NULL, NULL),
(32, '2022-07-24 19:17:35', '2022-07-24 19:18:14', 20.00, 'تأكيد', 14, 8, NULL),
(33, '2022-07-24 19:34:53', '2022-07-24 19:34:53', NULL, 'انتظار', 18, NULL, NULL),
(34, '2022-07-24 19:41:26', '2022-07-24 19:41:26', NULL, 'انتظار', 19, NULL, NULL),
(35, '2022-07-24 19:43:49', '2022-07-24 19:43:49', NULL, 'انتظار', 19, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `typeOfPieces` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfPieces` int(11) NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `created_at`, `updated_at`, `typeOfPieces`, `numberOfPieces`, `order_id`) VALUES
(23, NULL, NULL, 'قميص', 4, 32);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectdatas`
--

CREATE TABLE `projectdatas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `national_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birhdate` date NOT NULL,
  `government` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_of_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details_of_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `status` enum('انتظار','تأكيد') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `admin`, `national_id`, `email`, `password`, `birhdate`, `government`, `name_of_area`, `details_of_address`, `phone`, `status`, `image`, `created_at`, `updated_at`) VALUES
(14, 'Raghda Hesham', 0, 'بطاقة.JPG', 'raghda@example.com', '$2y$10$sH/2ZCZLcgYh1n/EL426teHPyyUJ/2MEk82L27ADimPu8rbJiXbYC', '1993-07-02', 'اسوان', 'وسط البلد', 'البركة بجوار فندق اوسكار عمارة 9 الدور الثاني علوي', 1060273386, 'تأكيد', 'ProfilePic.png', '2022-07-24 17:09:02', '2022-07-24 17:24:05'),
(15, 'Sayed Mohamed', 0, 'بطاقة.JPG', 'sayed@example.com', '$2y$10$OloXzpz2il5m4daUfOl4He5x3wpPaTppbpbZWMU/12NKDWmCJmkFK', '1965-07-06', 'اسوان', 'وسط البلد', 'البركة', 1130506702, 'تأكيد', 'ProfilePic2png.png', '2022-07-24 17:13:42', '2022-07-24 17:13:42'),
(16, 'Ahmed Farid', 1, 'بطاقة.JPG', 'ahmed@example.com', '$2y$10$eY23DlK7ODW2O3sQ6TlqlOBT6aRCweAlh63fJtErqrjp/GPwbJxea', '1995-07-08', 'اسوان', 'المحمودية', 'اسوان-المحمودية', 1020367855, 'تأكيد', 'ProfilePic2png.png', '2022-07-24 17:16:25', '2022-07-24 18:47:59'),
(18, 'Mehrail Antonyos', 0, 'بطاقة.JPG', 'mehrail@example.com', '$2y$10$Z8BingJ7n78pEmXsv0si/OnhKJ9TrGoHV4foPaPF9Mkpj0qehlifu', '1998-08-05', 'اسوان', 'المحمودية', 'اسوان-المحمودية', 102036622, 'انتظار', 'ProfilePic.png', '2022-07-24 18:03:22', '2022-07-24 18:03:22'),
(19, 'Samir', 0, 'بطاقة.JPG', 'samir@example.com', '$2y$10$AIId/CbU3q5des2ujDjeQOqz0GWWyLOyvE60cWDChFeKQCFaoKzH2', '1965-02-05', 'اسوان', 'الصداقة', 'اسوان-الصداقة', 1233692, 'انتظار', 'ProfilePic2png.png', '2022-07-24 19:21:53', '2022-07-24 19:21:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveryforms`
--
ALTER TABLE `deliveryforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliveryforms_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ironforms`
--
ALTER TABLE `ironforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ironforms_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_order_id_foreign` (`order_id`),
  ADD KEY `offers_ironform_id_foreign` (`ironform_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_ironform_id_foreign` (`ironform_id`),
  ADD KEY `orders_deliveryform_id_foreign` (`deliveryform_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projectdatas`
--
ALTER TABLE `projectdatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveryforms`
--
ALTER TABLE `deliveryforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ironforms`
--
ALTER TABLE `ironforms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projectdatas`
--
ALTER TABLE `projectdatas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveryforms`
--
ALTER TABLE `deliveryforms`
  ADD CONSTRAINT `deliveryforms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ironforms`
--
ALTER TABLE `ironforms`
  ADD CONSTRAINT `ironforms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ironform_id_foreign` FOREIGN KEY (`ironform_id`) REFERENCES `ironforms` (`id`),
  ADD CONSTRAINT `offers_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_deliveryform_id_foreign` FOREIGN KEY (`deliveryform_id`) REFERENCES `deliveryforms` (`id`),
  ADD CONSTRAINT `orders_ironform_id_foreign` FOREIGN KEY (`ironform_id`) REFERENCES `ironforms` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
