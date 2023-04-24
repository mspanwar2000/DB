-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2022 at 09:11 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `qr_unique_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `event_id`, `qr_unique_code`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Qevent-demo-event-16610727911722877571', NULL, NULL),
(2, 1, 1, 'Qevent-demo-event-16610727911722877571', '2022-08-21 10:58:33', '2022-08-21 10:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `participants` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_generate_qr` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `name`, `start_date`, `end_date`, `participants`, `location`, `status`, `is_generate_qr`, `created_at`, `updated_at`) VALUES
(1, 1, 'demo event', '2022-08-25', '2022-11-20', '2', 'demo , jaipur', '1', '1', '2022-08-20 01:41:58', '2022-08-21 03:36:36'),
(2, 3, 'demo asok', '2022-09-01', '2022-09-02', '20', 'dehli', '1', '1', '2022-08-21 01:09:41', '2022-08-23 01:00:16'),
(3, 1, 'meetong JK', '2022-08-26', '2022-08-27', '1', 'jaipur, Raj 302020', '1', '0', '2022-08-21 01:34:17', '2022-08-21 01:34:17'),
(4, 1, 'smith demo', '2022-08-30', '2022-08-31', '15', 'jaipur, raj', '1', '1', '2022-08-21 11:12:03', '2022-08-23 00:54:12');

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
(6, '2022_08_19_052609_create_events_table', 2),
(7, '2022_08_20_053839_add_role_in_user', 3),
(8, '2022_08_20_054112_add_user_in_event_table', 4),
(9, '2022_08_21_061821_add_is_generate_qe_in_events_table', 5),
(10, '2022_08_21_065309_create_qr_management_table', 6),
(11, '2022_08_21_090957_create_attendance_table', 7),
(12, '2022_08_21_100508_add_api_token_in_users_table', 8),
(13, '2022_08_23_061622_add_soft_delete_in_users_table', 9);

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
-- Table structure for table `qr_management`
--

CREATE TABLE `qr_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `qr_unique_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_management`
--

INSERT INTO `qr_management` (`id`, `user_id`, `event_id`, `qr_unique_code`, `path`, `created_at`, `updated_at`) VALUES
(8, 1, 1, 'Qevent-demo-event-16610727911722877571', 'QRcode/1/7b34e2034a17e26aa40b8ac31e8e8a47.png', '2022-08-21 09:06:34', '2022-08-21 09:06:34'),
(9, 1, 1, 'Qevent-demo-event-16610727911722877571', 'QRcode/1/c8f94459b07e3457a3a9673f422cd0c0.png', '2022-08-21 09:06:36', '2022-08-21 09:06:36'),
(40, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/894e7d5542b1b115a4b1b6948ace9907.png', '2022-08-21 16:42:29', '2022-08-21 16:42:29'),
(41, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/e0208ea70c48e6d8ed57c44c07eae3f1.png', '2022-08-21 16:42:30', '2022-08-21 16:42:30'),
(42, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/8522307c4967dfa9cebb92709b300f1a.png', '2022-08-21 16:42:31', '2022-08-21 16:42:31'),
(43, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/7c6dec89a70d281fb4c71e4198f5fa2e.png', '2022-08-21 16:42:32', '2022-08-21 16:42:32'),
(44, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/d26b0100eec27bf51f2739f7bac166f8.png', '2022-08-21 16:42:33', '2022-08-21 16:42:33'),
(45, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/b5c8e357fb4229a63d2cbe5a82544dee.png', '2022-08-21 16:42:34', '2022-08-21 16:42:34'),
(46, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/b2b4310fe5f689773b47d5bc4be8d48f.png', '2022-08-21 16:42:35', '2022-08-21 16:42:35'),
(47, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/de0246efa63c9c0c8a32e7acf0c356a5.png', '2022-08-21 16:42:36', '2022-08-21 16:42:36'),
(48, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/809d159e88ac923e48027c1a3debc6aa.png', '2022-08-21 16:42:37', '2022-08-21 16:42:37'),
(49, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/d6d4ec25f25752f16a0d015b06ec545d.png', '2022-08-21 16:42:38', '2022-08-21 16:42:38'),
(50, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/3ee1ae9ab7ef83d3457dc462e0fe640c.png', '2022-08-21 16:42:39', '2022-08-21 16:42:39'),
(51, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/1fbc8315d956fad3489f724a57b04191.png', '2022-08-21 16:42:40', '2022-08-21 16:42:40'),
(52, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/09663e226b6b079540649da2122c9a7f.png', '2022-08-21 16:42:41', '2022-08-21 16:42:41'),
(53, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/b6547d9cce0163cf5d679b2c5811e7f9.png', '2022-08-21 16:42:43', '2022-08-21 16:42:43'),
(54, 6, 4, 'Qevent-smith-demo-166110014789672062', 'QRcode/4/b3a9d3771382d59d1e052c60c59feff8.png', '2022-08-21 16:42:43', '2022-08-21 16:42:43'),
(55, 1, 2, 'Qevent-demo-asok-1661236196531857237', 'QRcode/2/a75f665c283f9d98d329090c906d7a85.png', '2022-08-23 06:29:58', '2022-08-23 06:29:58'),
(56, 1, 2, 'Qevent-demo-asok-16612361982043354798', 'QRcode/2/dc5f97007671cf967203ca341bde629d.png', '2022-08-23 06:29:59', '2022-08-23 06:29:59'),
(57, 1, 2, 'Qevent-demo-asok-16612361992141898679', 'QRcode/2/e2e714d9a92b6cfcb0f3512f6942ec81.png', '2022-08-23 06:30:00', '2022-08-23 06:30:00'),
(58, 1, 2, 'Qevent-demo-asok-16612362001637165954', 'QRcode/2/3bf60d70c79daa358ecfce1f508ebcba.png', '2022-08-23 06:30:01', '2022-08-23 06:30:01'),
(59, 1, 2, 'Qevent-demo-asok-1661236201418657782', 'QRcode/2/9a0ef2169de03479e3e61a3500aff091.png', '2022-08-23 06:30:01', '2022-08-23 06:30:01'),
(60, 1, 2, 'Qevent-demo-asok-16612362022069738950', 'QRcode/2/90b43f9dd44143bbdef972ad6a8cf2f5.png', '2022-08-23 06:30:02', '2022-08-23 06:30:02'),
(61, 1, 2, 'Qevent-demo-asok-1661236202123196707', 'QRcode/2/862272487121d1c116438783d8faad33.png', '2022-08-23 06:30:03', '2022-08-23 06:30:03'),
(62, 1, 2, 'Qevent-demo-asok-1661236203993235700', 'QRcode/2/a5e3bbfaef28a5e5203b121543db4807.png', '2022-08-23 06:30:04', '2022-08-23 06:30:04'),
(63, 1, 2, 'Qevent-demo-asok-16612362041699967802', 'QRcode/2/0f38804340e63d8d30bf57bccc3a59d2.png', '2022-08-23 06:30:05', '2022-08-23 06:30:05'),
(64, 1, 2, 'Qevent-demo-asok-166123620513440326', 'QRcode/2/057f3866e9b96cfa83d220ea4b8adaee.png', '2022-08-23 06:30:06', '2022-08-23 06:30:06'),
(65, 1, 2, 'Qevent-demo-asok-16612362061693401931', 'QRcode/2/7ee97ae24ca770f4a1fe84d0fd1aefe4.png', '2022-08-23 06:30:07', '2022-08-23 06:30:07'),
(66, 1, 2, 'Qevent-demo-asok-166123620734288179', 'QRcode/2/1dd2d0a1cd85a7a3b50246a37dc8edd6.png', '2022-08-23 06:30:08', '2022-08-23 06:30:08'),
(67, 1, 2, 'Qevent-demo-asok-16612362081858517463', 'QRcode/2/c0a67c0326042b2fd16a61cd159b4e6f.png', '2022-08-23 06:30:09', '2022-08-23 06:30:09'),
(68, 1, 2, 'Qevent-demo-asok-1661236209714648194', 'QRcode/2/4e01fb979b41e02063992edd15ea0c61.png', '2022-08-23 06:30:10', '2022-08-23 06:30:10'),
(69, 1, 2, 'Qevent-demo-asok-1661236210286199637', 'QRcode/2/000ac22cde2a2602c4e2f0f101c28164.png', '2022-08-23 06:30:11', '2022-08-23 06:30:11'),
(70, 1, 2, 'Qevent-demo-asok-16612362111042454746', 'QRcode/2/b4e393a450d4a7bead6ced158b663076.png', '2022-08-23 06:30:12', '2022-08-23 06:30:12'),
(71, 1, 2, 'Qevent-demo-asok-16612362121069716497', 'QRcode/2/725f0ae75c961cbda5bb246a7f582d67.png', '2022-08-23 06:30:13', '2022-08-23 06:30:13'),
(72, 1, 2, 'Qevent-demo-asok-16612362131800575849', 'QRcode/2/cba3f0be622ecc0ed219deb7b1f0ce4f.png', '2022-08-23 06:30:14', '2022-08-23 06:30:14'),
(73, 1, 2, 'Qevent-demo-asok-1661236214259709451', 'QRcode/2/a171a372c00aba95b06cff35b26f5c7d.png', '2022-08-23 06:30:15', '2022-08-23 06:30:15'),
(74, 1, 2, 'Qevent-demo-asok-166123621585889947', 'QRcode/2/f9e8e6b33231a8f3eb43703aab723807.png', '2022-08-23 06:30:16', '2022-08-23 06:30:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `api_token`, `created_at`, `updated_at`, `role_id`, `deleted_at`) VALUES
(1, 'Admin Admin', 'admin@material.com', '2022-08-18 23:33:46', '$2y$10$SzNzx3Abfmm/rsNiNnULo.5QM2zlXOARSCm9Q5HubXSxjhzNpUs/W', NULL, NULL, '2022-08-18 23:33:46', '2022-08-18 23:33:46', 1, NULL),
(3, 'ashok panwar', 'ashok@material.com', NULL, '$2y$10$b2G7BpPOf3W7Z7dVm93X..mDmFa0P/e.jwkkBjyt6tNrccSML21KS', NULL, NULL, '2022-08-19 02:07:47', '2022-08-21 10:18:21', 2, NULL),
(4, 'smith coder', 'smith@material.com', NULL, '$2y$10$BtmwD1GJLKDdXjV0VgwgBendoB8HuN6oV8JJGcQlHUlu00Gp0.jNK', NULL, NULL, '2022-08-19 02:11:04', '2022-08-19 02:11:04', 2, NULL),
(6, 'smith dev', 'smithdev@material.com', NULL, '$2y$10$BVjsvoTd7.lRLnw.64Rxbe1hHcuAXw62X40QFyk.ble1F3t4rvs9y', NULL, NULL, '2022-08-21 11:10:29', '2022-08-23 00:54:12', 2, '2022-08-23 00:54:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `qr_management`
--
ALTER TABLE `qr_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_management`
--
ALTER TABLE `qr_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
