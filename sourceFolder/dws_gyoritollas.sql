-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2026. Okt 12. 09:10
-- Kiszolgáló verziója: 5.7.44-log
-- PHP verzió: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `dws_gyoritollas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_applications`
--

CREATE TABLE `mywb_mod_gyoritollas_applications` (
  `id` int(11) NOT NULL,
  `comment` text,
  `user_id` int(11) DEFAULT NULL,
  `training_id` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL,
  `adding_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_incomes`
--

CREATE TABLE `mywb_mod_gyoritollas_incomes` (
  `id` int(11) NOT NULL,
  `sum` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paydate` datetime DEFAULT NULL,
  `comment` text,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_locations`
--

CREATE TABLE `mywb_mod_gyoritollas_locations` (
  `id` int(11) NOT NULL,
  `name` text,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_paymentconstructions`
--

CREATE TABLE `mywb_mod_gyoritollas_paymentconstructions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `basefeeduration` int(11) NOT NULL DEFAULT '1',
  `basefee` int(11) DEFAULT NULL,
  `creditfee` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `trainingNr1` int(11) DEFAULT NULL,
  `trainingNr2` int(11) DEFAULT NULL,
  `trainingNr3` int(11) DEFAULT NULL,
  `discountPercent1` int(11) DEFAULT NULL,
  `discountPercent2` int(11) DEFAULT NULL,
  `discountPercent3` int(11) DEFAULT NULL,
  `locations_id` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_paymentoccours`
--

CREATE TABLE `mywb_mod_gyoritollas_paymentoccours` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `comment` text,
  `paymentconstruction_id` int(11) DEFAULT NULL,
  `applications_id` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_trainingdates`
--

CREATE TABLE `mywb_mod_gyoritollas_trainingdates` (
  `id` int(11) NOT NULL,
  `day` int(11) DEFAULT NULL,
  `starttime` text,
  `endtime` text,
  `credit` decimal(15,4) DEFAULT NULL,
  `headcount` int(11) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `type` int(11) DEFAULT NULL,
  `locations_id` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_trainings`
--

CREATE TABLE `mywb_mod_gyoritollas_trainings` (
  `id` int(11) NOT NULL,
  `startdate` datetime DEFAULT NULL,
  `endtime` text,
  `credit` decimal(15,4) DEFAULT NULL,
  `headcount` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `locations_id` int(11) DEFAULT NULL,
  `comment` text,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_usersconstructions`
--

CREATE TABLE `mywb_mod_gyoritollas_usersconstructions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `paymentconstruction_id` int(11) DEFAULT NULL,
  `addtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mywb_mod_gyoritollas_users_to_trainingdates`
--

CREATE TABLE `mywb_mod_gyoritollas_users_to_trainingdates` (
  `id` int(11) NOT NULL,
  `trainingdates_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `mywb_mod_gyoritollas_applications`
--
ALTER TABLE `mywb_mod_gyoritollas_applications`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_incomes`
--
ALTER TABLE `mywb_mod_gyoritollas_incomes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_locations`
--
ALTER TABLE `mywb_mod_gyoritollas_locations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_paymentconstructions`
--
ALTER TABLE `mywb_mod_gyoritollas_paymentconstructions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_id` (`locations_id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_paymentoccours`
--
ALTER TABLE `mywb_mod_gyoritollas_paymentoccours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentconstruction_id` (`paymentconstruction_id`),
  ADD KEY `applications_id` (`applications_id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_trainingdates`
--
ALTER TABLE `mywb_mod_gyoritollas_trainingdates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_id` (`locations_id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_trainings`
--
ALTER TABLE `mywb_mod_gyoritollas_trainings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_id` (`locations_id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_usersconstructions`
--
ALTER TABLE `mywb_mod_gyoritollas_usersconstructions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentconstruction_id` (`paymentconstruction_id`);

--
-- A tábla indexei `mywb_mod_gyoritollas_users_to_trainingdates`
--
ALTER TABLE `mywb_mod_gyoritollas_users_to_trainingdates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pairs` (`trainingdates_id`,`users_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_applications`
--
ALTER TABLE `mywb_mod_gyoritollas_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_incomes`
--
ALTER TABLE `mywb_mod_gyoritollas_incomes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_locations`
--
ALTER TABLE `mywb_mod_gyoritollas_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_paymentconstructions`
--
ALTER TABLE `mywb_mod_gyoritollas_paymentconstructions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_paymentoccours`
--
ALTER TABLE `mywb_mod_gyoritollas_paymentoccours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_trainingdates`
--
ALTER TABLE `mywb_mod_gyoritollas_trainingdates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_trainings`
--
ALTER TABLE `mywb_mod_gyoritollas_trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_usersconstructions`
--
ALTER TABLE `mywb_mod_gyoritollas_usersconstructions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `mywb_mod_gyoritollas_users_to_trainingdates`
--
ALTER TABLE `mywb_mod_gyoritollas_users_to_trainingdates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
