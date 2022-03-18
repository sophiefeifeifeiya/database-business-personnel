-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-12-03 11:49:51
-- 服务器版本： 10.4.14-MariaDB
-- PHP 版本： 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `cw3computer_part`
--

-- --------------------------------------------------------

--
-- 表的结构 `bonus_deduction`
--

CREATE TABLE `bonus_deduction` (
  `type` varchar(50) NOT NULL,
  `is_bonus_or_deduction` varchar(10) NOT NULL,
  `amount` float(10,6) NOT NULL,
  `reason` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `computers`
--

CREATE TABLE `computers` (
  `computer_no` varchar(50) NOT NULL,
  `computer_type` varchar(50) NOT NULL,
  `computer_model_no` varchar(50) NOT NULL,
  `is_sold` tinyint(1) NOT NULL,
  `retailstore_postcode` varchar(50) NOT NULL,
  `manufacture_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `computer_staff`
--

CREATE TABLE `computer_staff` (
  `quality_assurance_staff_id` int(11) DEFAULT NULL,
  `computer_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `departments`
--

CREATE TABLE `departments` (
  `dept_name` varchar(50) NOT NULL,
  `dept_descriptions` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `email_list`
--

CREATE TABLE `email_list` (
  `email_address` varchar(50) NOT NULL,
  `email_password` varchar(50) NOT NULL,
  `expected_changed_time` date NOT NULL,
  `is_common` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `offices`
--

CREATE TABLE `offices` (
  `office_no` varchar(50) NOT NULL,
  `office_postcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `parts`
--

CREATE TABLE `parts` (
  `part_no` varchar(50) NOT NULL,
  `part_type` varchar(50) NOT NULL,
  `part_model` varchar(50) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `manufacturer_tel` int(11) NOT NULL,
  `computer_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `role_name` varchar(50) NOT NULL,
  `role_descriptions` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `salary`
--

CREATE TABLE `salary` (
  `staff_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `baseline` float(20,6) NOT NULL,
  `bonus_rates` float(10,6) DEFAULT NULL,
  `salary` float(20,6) NOT NULL,
  `deduction_rates` float(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `staff_tel` int(11) DEFAULT NULL,
  `staff_computer_account` varchar(15) NOT NULL,
  `staff_personal_email_address` varchar(50) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `office_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `staff_dept_role`
--

CREATE TABLE `staff_dept_role` (
  `staff_id` int(11) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  `common_email_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `staff_salary_record`
--

CREATE TABLE `staff_salary_record` (
  `staff_id` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `workplaces`
--

CREATE TABLE `workplaces` (
  `place_postcode` varchar(50) NOT NULL,
  `place_name` varchar(50) NOT NULL,
  `place_type` varchar(50) NOT NULL,
  `place_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `bonus_deduction`
--
ALTER TABLE `bonus_deduction`
  ADD PRIMARY KEY (`type`);

--
-- 表的索引 `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`computer_no`),
  ADD KEY `retailstore_postcode_fk` (`retailstore_postcode`);

--
-- 表的索引 `computer_staff`
--
ALTER TABLE `computer_staff`
  ADD KEY `computer_staff_quality_assurance_staff_id` (`quality_assurance_staff_id`),
  ADD KEY `computer_staff_computer_no` (`computer_no`);

--
-- 表的索引 `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_name`);

--
-- 表的索引 `email_list`
--
ALTER TABLE `email_list`
  ADD PRIMARY KEY (`email_address`);

--
-- 表的索引 `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`office_no`),
  ADD KEY `office_postcode_fk` (`office_postcode`);

--
-- 表的索引 `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`part_no`),
  ADD KEY `parts_computer_no` (`computer_no`);

--
-- 表的索引 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_name`);

--
-- 表的索引 `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`staff_id`,`month`);

--
-- 表的索引 `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_personal_email_address` (`staff_personal_email_address`),
  ADD UNIQUE KEY `staff_tel_uk` (`staff_tel`),
  ADD KEY `office_no_fk` (`office_no`),
  ADD KEY `dept_name_fk` (`dept_name`),
  ADD KEY `staff_email_address_fk` (`staff_personal_email_address`);

--
-- 表的索引 `staff_dept_role`
--
ALTER TABLE `staff_dept_role`
  ADD KEY `staff_dept_role_staff_id_fk` (`staff_id`),
  ADD KEY `staff_dept_role_role_name_fk` (`role_name`),
  ADD KEY `staff_dept_role_dept_name_fk` (`dept_name`),
  ADD KEY `staff_dept_role_common_email_address_fk` (`common_email_address`);

--
-- 表的索引 `staff_salary_record`
--
ALTER TABLE `staff_salary_record`
  ADD KEY `staff_salary_record_type_fk` (`type`),
  ADD KEY `staff_salary_record_staff_id_month_fk` (`staff_id`,`month`);

--
-- 表的索引 `workplaces`
--
ALTER TABLE `workplaces`
  ADD PRIMARY KEY (`place_postcode`);

--
-- 限制导出的表
--

--
-- 限制表 `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `retailstore_postcode_fk` FOREIGN KEY (`retailstore_postcode`) REFERENCES `workplaces` (`place_postcode`);

--
-- 限制表 `computer_staff`
--
ALTER TABLE `computer_staff`
  ADD CONSTRAINT `computer_staff_computer_no` FOREIGN KEY (`computer_no`) REFERENCES `computers` (`computer_no`),
  ADD CONSTRAINT `computer_staff_quality_assurance_staff_id` FOREIGN KEY (`quality_assurance_staff_id`) REFERENCES `staff` (`staff_id`);

--
-- 限制表 `offices`
--
ALTER TABLE `offices`
  ADD CONSTRAINT `office_postcode_fk` FOREIGN KEY (`office_postcode`) REFERENCES `workplaces` (`place_postcode`);

--
-- 限制表 `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_computer_no` FOREIGN KEY (`computer_no`) REFERENCES `computers` (`computer_no`);

--
-- 限制表 `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_staff_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- 限制表 `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `dept_name_fk` FOREIGN KEY (`dept_name`) REFERENCES `departments` (`dept_name`),
  ADD CONSTRAINT `office_no_fk` FOREIGN KEY (`office_no`) REFERENCES `offices` (`office_no`),
  ADD CONSTRAINT `staff_email_address_fk` FOREIGN KEY (`staff_personal_email_address`) REFERENCES `email_list` (`email_address`);

--
-- 限制表 `staff_dept_role`
--
ALTER TABLE `staff_dept_role`
  ADD CONSTRAINT `staff_dept_role_common_email_address_fk` FOREIGN KEY (`common_email_address`) REFERENCES `email_list` (`email_address`),
  ADD CONSTRAINT `staff_dept_role_dept_name_fk` FOREIGN KEY (`dept_name`) REFERENCES `departments` (`dept_name`),
  ADD CONSTRAINT `staff_dept_role_role_name_fk` FOREIGN KEY (`role_name`) REFERENCES `roles` (`role_name`),
  ADD CONSTRAINT `staff_dept_role_staff_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- 限制表 `staff_salary_record`
--
ALTER TABLE `staff_salary_record`
  ADD CONSTRAINT `staff_salary_record_staff_id_month_fk` FOREIGN KEY (`staff_id`,`month`) REFERENCES `salary` (`staff_id`, `month`),
  ADD CONSTRAINT `staff_salary_record_type_fk` FOREIGN KEY (`type`) REFERENCES `bonus_deduction` (`type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
