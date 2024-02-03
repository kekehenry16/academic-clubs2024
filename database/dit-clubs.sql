-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 05:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dit-clubs`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announc_id` int(11) NOT NULL,
  `announc_title` varchar(200) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `announc_discription` text NOT NULL,
  `club_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_commence` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `event_name` varchar(300) NOT NULL,
  `attendance_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `event_name`, `attendance_date`) VALUES
(1, 'project presentations', '2023-12-10'),
(2, 'orientation day', '2023-12-10'),
(3, 'classes', '2023-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `club_id` int(11) NOT NULL,
  `club_name` varchar(150) NOT NULL,
  `no_student` int(11) NOT NULL,
  `club_discription` text NOT NULL,
  `advisor_name` varchar(150) NOT NULL,
  `advisor_email` varchar(150) NOT NULL,
  `date_created` date NOT NULL,
  `no_events` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`club_id`, `club_name`, `no_student`, `club_discription`, `advisor_name`, `advisor_email`, `date_created`, `no_events`) VALUES
(1, 'Design club', 15, 'Innovation and Creativity', 'Joel Tarimo', 'joel34@gmail.com', '2023-12-07', 4),
(2, 'Huawei club', 23, 'Networking and Security', 'Dickson Mkindi', 'dickson@gmail.com', '2023-12-07', 6),
(3, 'Ladies Club', 45, 'Women rights and responsibilities', 'Dorcas Sele', 'sele@gmail.com', '2023-12-01', 12),
(4, 'Project Club', 32, 'Deals with creating projects and solutions to society problems ', 'Shadrack Mukama', 'mukamashaddy@gmail.com', '2017-12-13', 20);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(300) NOT NULL,
  `event_venue` varchar(200) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `event_discription` text NOT NULL,
  `member_id` int(11) NOT NULL,
  `event_status` enum('planned','ongoing','completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `event_venue`, `event_date`, `event_time`, `event_discription`, `member_id`, `event_status`) VALUES
(1, 'homework', 'D3', '2023-12-01', '00:00:00', '', 3, 'ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `memberattendance`
--

CREATE TABLE `memberattendance` (
  `memberAttendance_id` int(10) NOT NULL,
  `member_id` int(10) DEFAULT NULL,
  `attendance_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberattendance`
--

INSERT INTO `memberattendance` (`memberAttendance_id`, `member_id`, `attendance_id`) VALUES
(1, 4, 1),
(2, 5, 3),
(3, 2, 2),
(4, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `memberclub`
--

CREATE TABLE `memberclub` (
  `memberclub_id` int(10) NOT NULL,
  `member_id` int(10) DEFAULT NULL,
  `club_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberclub`
--

INSERT INTO `memberclub` (`memberclub_id`, `member_id`, `club_id`) VALUES
(1, 5, 4),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `member_name` varchar(150) NOT NULL,
  `member_email` varchar(100) NOT NULL,
  `member_reg` int(11) NOT NULL,
  `member_course` varchar(150) DEFAULT NULL,
  `date_joined` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `member_name`, `member_email`, `member_reg`, `member_course`, `date_joined`) VALUES
(2, 'Penina Macha', 'pmacha@gmail.com', 87765433, 'civil engineering', '2023-12-27 14:56:10'),
(3, 'Bite', 'bite33@gmail', 222244444, 'mechanical engineering', '2023-12-07 15:00:27'),
(4, 'Dorcas', 'dory13@gmail.com', 23334444, 'computer engineering ', '2023-12-07 15:03:31'),
(5, 'Godson Kakulwa', 'kakulwa23@gmail', 222222555, 'computer engineering', '2023-12-07 15:06:19'),
(7, 'shesha', 'shesha@gmail.com', 260077666, 'electric eng', '2023-12-19 16:27:45'),
(8, 'kagero', 'kagero@gmail.com', 23345555, 'computer eng', '0000-00-00 00:00:00'),
(9, 'fahad', 'fahad@gmail.com', 2147483647, 'civil Engineering', '2024-02-08 00:00:00'),
(15, 'davita', 'davita@gmail.com', 2357797, 'civil Engineering', '2024-02-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_adms`
--

CREATE TABLE `users_adms` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_adms`
--

INSERT INTO `users_adms` (`id`, `username`, `email`, `password`) VALUES
(4, 'dor', 'dor@gmail.com', 'dor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announc_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`club_id`),
  ADD UNIQUE KEY `club_name` (`club_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `memberattendance`
--
ALTER TABLE `memberattendance`
  ADD PRIMARY KEY (`memberAttendance_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `attendance_id` (`attendance_id`);

--
-- Indexes for table `memberclub`
--
ALTER TABLE `memberclub`
  ADD PRIMARY KEY (`memberclub_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `member_name` (`member_name`),
  ADD UNIQUE KEY `member_email` (`member_email`),
  ADD UNIQUE KEY `member_reg` (`member_reg`);

--
-- Indexes for table `users_adms`
--
ALTER TABLE `users_adms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `memberattendance`
--
ALTER TABLE `memberattendance`
  MODIFY `memberAttendance_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `memberclub`
--
ALTER TABLE `memberclub`
  MODIFY `memberclub_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users_adms`
--
ALTER TABLE `users_adms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `announcements_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `memberattendance`
--
ALTER TABLE `memberattendance`
  ADD CONSTRAINT `memberattendance_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `memberattendance_ibfk_2` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`);

--
-- Constraints for table `memberclub`
--
ALTER TABLE `memberclub`
  ADD CONSTRAINT `memberclub_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `memberclub_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
