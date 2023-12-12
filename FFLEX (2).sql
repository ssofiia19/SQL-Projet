-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Час створення: Гру 12 2023 р., 18:32
-- Версія сервера: 5.7.39
-- Версія PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `FFLEX`
--

-- --------------------------------------------------------

--
-- Структура таблиці `Abonement`
--

CREATE TABLE `Abonement` (
  `abon_id` int(11) NOT NULL,
  `abon_name` varchar(225) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Abonement`
--

INSERT INTO `Abonement` (`abon_id`, `abon_name`, `price`) VALUES
(1, 'Standart', 5),
(2, 'Premium', 10),
(3, 'VIP', 15),
(4, 'Invité', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `Category`
--

CREATE TABLE `Category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Category`
--

INSERT INTO `Category` (`category_id`, `category_name`) VALUES
(1, 'Comédie'),
(2, 'Horreur'),
(3, 'Drame'),
(4, 'Western'),
(5, 'Thriller'),
(6, 'Fantastique');

-- --------------------------------------------------------

--
-- Структура таблиці `Facture`
--

CREATE TABLE `Facture` (
  `user_id` int(11) NOT NULL,
  `abon_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `loc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Facture`
--

INSERT INTO `Facture` (`user_id`, `abon_id`, `price`, `start_date`, `loc_id`) VALUES
(1, 1, 5, '2023-12-03', 1),
(2, 3, 15, '2020-09-23', 2),
(3, 2, 10, '2022-07-14', 3),
(4, 1, 5, '2023-10-24', 4);

-- --------------------------------------------------------

--
-- Структура таблиці `Film`
--

CREATE TABLE `Film` (
  `f_id` int(11) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `f_lang` varchar(225) DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `ready` varchar(225) DEFAULT NULL,
  `f_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Film`
--

INSERT INTO `Film` (`f_id`, `title`, `category_id`, `f_lang`, `exit_date`, `ready`, `f_price`) VALUES
(1, 'SCREAM', 2, 'en', '2023-12-11', 'yes', 3),
(2, 'HOME ALONE', 1, 'fr', '2022-10-01', 'yes', 5),
(3, 'HARRY POTTER', 6, 'fr', '2021-11-01', 'yes', 7),
(4, 'MATRIX', 6, 'en', '2025-09-01', 'no', 6),
(5, 'LE ROI LION', 3, 'fr', '2020-05-16', 'yes', 4),
(6, 'ELEPHANT MEN', 3, 'en', '2026-05-16', 'no', 3),
(7, 'ELEPHANT MEN', 3, 'fr', '2022-03-22', 'yes', 3),
(8, 'LA MISSION', 4, 'fr', '2023-02-28', 'yes', 5),
(9, 'THE OLD WAY', 4, 'en', '2026-02-28', 'no', 4),
(10, 'PROJECT X', 1, 'en', '2017-06-07', 'yes', 8);

-- --------------------------------------------------------

--
-- Структура таблиці `Location`
--

CREATE TABLE `Location` (
  `user_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `abon_id` int(11) DEFAULT NULL,
  `loc_id` int(11) NOT NULL,
  `loc_date` date DEFAULT NULL,
  `f_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Location`
--

INSERT INTO `Location` (`user_id`, `f_id`, `abon_id`, `loc_id`, `loc_date`, `f_price`) VALUES
(1, 9, 1, 1, '2023-12-12', 4),
(2, 6, 3, 2, '2022-11-12', 3),
(3, 4, 2, 3, '2023-11-19', 6),
(4, 10, 1, 4, '2023-11-21', 8),
(5, 2, 4, 5, '2023-12-10', 5);

-- --------------------------------------------------------

--
-- Структура таблиці `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `User_Name` varchar(225) DEFAULT NULL,
  `abon_id` int(11) DEFAULT NULL,
  `mail` varchar(225) DEFAULT NULL,
  `passwrd` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `Users`
--

INSERT INTO `Users` (`user_id`, `User_Name`, `abon_id`, `mail`, `passwrd`) VALUES
(1, 'Sofiia', 1, 'sofa@gmail.com', '@@456&'),
(2, 'Bob', 3, 'bob@gmail.com', '15092004'),
(3, 'Tim', 2, 'tim@gmail.com', 'PassW0rd'),
(4, 'Jim', 1, 'jim@gmail.com', 'Mypass234'),
(5, 'Louis', 4, 'louis1234@gmail.com', '123123Pp');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `Abonement`
--
ALTER TABLE `Abonement`
  ADD PRIMARY KEY (`abon_id`);

--
-- Індекси таблиці `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`category_id`);

--
-- Індекси таблиці `Facture`
--
ALTER TABLE `Facture`
  ADD KEY `abon_id` (`abon_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `loc_id` (`loc_id`);

--
-- Індекси таблиці `Film`
--
ALTER TABLE `Film`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Індекси таблиці `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`loc_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `f_id` (`f_id`),
  ADD KEY `abon_id` (`abon_id`);

--
-- Індекси таблиці `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `abon_id` (`abon_id`);

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `Facture`
--
ALTER TABLE `Facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`abon_id`) REFERENCES `Abonement` (`abon_id`),
  ADD CONSTRAINT `facture_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `facture_ibfk_3` FOREIGN KEY (`loc_id`) REFERENCES `Location` (`loc_id`);

--
-- Обмеження зовнішнього ключа таблиці `Film`
--
ALTER TABLE `Film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`);

--
-- Обмеження зовнішнього ключа таблиці `Location`
--
ALTER TABLE `Location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `Film` (`f_id`),
  ADD CONSTRAINT `location_ibfk_3` FOREIGN KEY (`abon_id`) REFERENCES `Abonement` (`abon_id`);

--
-- Обмеження зовнішнього ключа таблиці `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`abon_id`) REFERENCES `Abonement` (`abon_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
