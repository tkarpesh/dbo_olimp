-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 14 2015 г., 02:23
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dbOlympicGames`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `cityID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `countryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`cityID`, `name`, `countryID`) VALUES
(1, 'Sochi', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `countryID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`countryID`, `name`) VALUES
(1, 'Russia');

-- --------------------------------------------------------

--
-- Структура таблицы `olympicGames`
--

CREATE TABLE `olympicGames` (
  `olympicGameID` int(11) NOT NULL,
  `name` enum('winter','summer','','') NOT NULL,
  `cityID` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `sequnce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `olympicGames`
--

INSERT INTO `olympicGames` (`olympicGameID`, `name`, `cityID`, `year`, `sequnce`) VALUES
(1, 'winter', 1, 2014, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `olympicGamesDiciplines`
--

CREATE TABLE `olympicGamesDiciplines` (
  `olympicGameID` int(11) NOT NULL,
  `diciplineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `olympicGamesLogos`
--

CREATE TABLE `olympicGamesLogos` (
  `olympicGameID` int(11) NOT NULL,
  `nameLogo` varchar(50) NOT NULL,
  `imageLogo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `olympicGamesParticipants`
--

CREATE TABLE `olympicGamesParticipants` (
  `olympicGameID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `countryID` int(11) NOT NULL,
  `diciplineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `olympicGamesSponsors`
--

CREATE TABLE `olympicGamesSponsors` (
  `olympicGameID` int(11) NOT NULL,
  `sponsorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `olympicGamesSponsors`
--

INSERT INTO `olympicGamesSponsors` (`olympicGameID`, `sponsorID`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `olympicTalismanLogos`
--

CREATE TABLE `olympicTalismanLogos` (
  `olympicTalismanID` int(11) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `olympicTalismans`
--

CREATE TABLE `olympicTalismans` (
  `olympicTalismanID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `olympicGameID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `personAwards`
--

CREATE TABLE `personAwards` (
  `awardID` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `diciplineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `personAwardsHistory`
--

CREATE TABLE `personAwardsHistory` (
  `personID` int(11) NOT NULL,
  `awardID` int(11) NOT NULL,
  `date` date NOT NULL,
  `currency` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `personDiciplinesHistory`
--

CREATE TABLE `personDiciplinesHistory` (
  `personID` int(11) NOT NULL,
  `diciplineID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `personInfoHistory`
--

CREATE TABLE `personInfoHistory` (
  `personInfoID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `marriedStatus` char(2) NOT NULL,
  `disabilityStatus` char(2) NOT NULL,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `personInjuries`
--

CREATE TABLE `personInjuries` (
  `injuryID` int(11) NOT NULL,
  `injuryType` varchar(50) NOT NULL,
  `injuryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `personInjuriesHistory`
--

CREATE TABLE `personInjuriesHistory` (
  `injuryID` int(11) NOT NULL,
  `personID` int(11) NOT NULL,
  `dateStart` date NOT NULL,
  `duration` varchar(50) NOT NULL,
  `injuryComment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `persons`
--

CREATE TABLE `persons` (
  `personID` int(11) NOT NULL,
  `firstName` int(11) NOT NULL,
  `lastName` int(11) NOT NULL,
  `middleName` int(11) DEFAULT NULL,
  `gender` enum('m','w','','') NOT NULL,
  `dateBirth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sponsors`
--

CREATE TABLE `sponsors` (
  `sponsorID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tagline` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sponsors`
--

INSERT INTO `sponsors` (`sponsorID`, `name`, `tagline`) VALUES
(1, 'Nike', 'Just do it!'),
(2, 'LG', 'Life is Good');

-- --------------------------------------------------------

--
-- Структура таблицы `sportapplications`
--

CREATE TABLE `sportapplications` (
  `applicationID` int(11) NOT NULL,
  `parent_appID` int(11) DEFAULT NULL,
  `eventID` int(11) NOT NULL,
  `personID` int(11) DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportCompetitions`
--

CREATE TABLE `sportCompetitions` (
  `sportCompetitionID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sportDiciplineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportDiciplines`
--

CREATE TABLE `sportDiciplines` (
  `sportDiciplineID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sportKindID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportEvents`
--

CREATE TABLE `sportEvents` (
  `sportEventID` int(11) NOT NULL,
  `competitionID` int(11) NOT NULL,
  `competitionPlaceID` int(11) NOT NULL,
  `stage` enum('qualification','final','','') NOT NULL,
  `date` date NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportKinds`
--

CREATE TABLE `sportKinds` (
  `sportKindsID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportObjectAddresses`
--

CREATE TABLE `sportObjectAddresses` (
  `sportObjectID` int(11) NOT NULL,
  `cityID` int(11) NOT NULL,
  `streetName` varchar(50) NOT NULL,
  `streetType` int(50) NOT NULL,
  `buildingNumber` int(11) NOT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `longitute` int(11) NOT NULL,
  `latitude` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportObjectPlaces`
--

CREATE TABLE `sportObjectPlaces` (
  `sportObjectPlaceID` int(11) NOT NULL,
  `sportObjectID` int(11) NOT NULL,
  `placeType` varchar(50) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportObjects`
--

CREATE TABLE `sportObjects` (
  `sportObjectID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sportObjectType` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `olympicGamesID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sportResults`
--

CREATE TABLE `sportResults` (
  `applicationID` int(11) NOT NULL,
  `result` varchar(50) NOT NULL,
  `place` int(11) NOT NULL,
  `isDisq` char(2) DEFAULT NULL,
  `isFail` char(2) DEFAULT NULL,
  `typeWin` enum('win','lose','draw','') DEFAULT NULL,
  `failComment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tvChannels`
--

CREATE TABLE `tvChannels` (
  `tvChannelID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tvChannelsBroadcasts`
--

CREATE TABLE `tvChannelsBroadcasts` (
  `tvChannelsBroadcastID` int(11) NOT NULL,
  `tvChannelID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time DEFAULT NULL,
  `isLive` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `weatherConditions`
--

CREATE TABLE `weatherConditions` (
  `eventID` int(11) NOT NULL,
  `temperature` int(11) NOT NULL,
  `snowLevel` int(11) DEFAULT NULL,
  `windSpeed` int(11) NOT NULL,
  `windDirection` enum('n','w','s','e','nw','ne','sw','se') NOT NULL,
  `waterLevel` int(11) DEFAULT NULL,
  `preassure` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cityID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `olympicGames`
--
ALTER TABLE `olympicGames`
  ADD PRIMARY KEY (`olympicGameID`),
  ADD KEY `cityID` (`cityID`);

--
-- Индексы таблицы `olympicGamesDiciplines`
--
ALTER TABLE `olympicGamesDiciplines`
  ADD PRIMARY KEY (`olympicGameID`,`diciplineID`),
  ADD KEY `diciplineID` (`diciplineID`);

--
-- Индексы таблицы `olympicGamesLogos`
--
ALTER TABLE `olympicGamesLogos`
  ADD PRIMARY KEY (`olympicGameID`);

--
-- Индексы таблицы `olympicGamesParticipants`
--
ALTER TABLE `olympicGamesParticipants`
  ADD PRIMARY KEY (`olympicGameID`,`personID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `diciplineID` (`diciplineID`),
  ADD KEY `personID` (`personID`);

--
-- Индексы таблицы `olympicGamesSponsors`
--
ALTER TABLE `olympicGamesSponsors`
  ADD PRIMARY KEY (`olympicGameID`,`sponsorID`),
  ADD KEY `sponsorID` (`sponsorID`);

--
-- Индексы таблицы `olympicTalismanLogos`
--
ALTER TABLE `olympicTalismanLogos`
  ADD PRIMARY KEY (`olympicTalismanID`);

--
-- Индексы таблицы `olympicTalismans`
--
ALTER TABLE `olympicTalismans`
  ADD PRIMARY KEY (`olympicTalismanID`),
  ADD KEY `olympicGameID` (`olympicGameID`);

--
-- Индексы таблицы `personAwards`
--
ALTER TABLE `personAwards`
  ADD PRIMARY KEY (`awardID`),
  ADD KEY `diciplineID` (`diciplineID`);

--
-- Индексы таблицы `personAwardsHistory`
--
ALTER TABLE `personAwardsHistory`
  ADD PRIMARY KEY (`personID`,`awardID`,`date`),
  ADD KEY `awardID` (`awardID`);

--
-- Индексы таблицы `personDiciplinesHistory`
--
ALTER TABLE `personDiciplinesHistory`
  ADD PRIMARY KEY (`personID`,`diciplineID`,`startDate`),
  ADD KEY `diciplineID` (`diciplineID`);

--
-- Индексы таблицы `personInfoHistory`
--
ALTER TABLE `personInfoHistory`
  ADD PRIMARY KEY (`personInfoID`),
  ADD KEY `personID` (`personID`);

--
-- Индексы таблицы `personInjuries`
--
ALTER TABLE `personInjuries`
  ADD PRIMARY KEY (`injuryID`);

--
-- Индексы таблицы `personInjuriesHistory`
--
ALTER TABLE `personInjuriesHistory`
  ADD PRIMARY KEY (`injuryID`,`personID`,`dateStart`),
  ADD KEY `personID` (`personID`);

--
-- Индексы таблицы `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`personID`),
  ADD KEY `firstName` (`firstName`);

--
-- Индексы таблицы `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`sponsorID`);

--
-- Индексы таблицы `sportapplications`
--
ALTER TABLE `sportapplications`
  ADD PRIMARY KEY (`applicationID`),
  ADD KEY `eventID` (`eventID`),
  ADD KEY `parent_appID` (`parent_appID`),
  ADD KEY `personID` (`personID`),
  ADD KEY `countryID` (`countryID`);

--
-- Индексы таблицы `sportCompetitions`
--
ALTER TABLE `sportCompetitions`
  ADD PRIMARY KEY (`sportCompetitionID`),
  ADD KEY `sportDiciplineID` (`sportDiciplineID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `sportDiciplines`
--
ALTER TABLE `sportDiciplines`
  ADD PRIMARY KEY (`sportDiciplineID`),
  ADD KEY `sportKindID` (`sportKindID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `sportEvents`
--
ALTER TABLE `sportEvents`
  ADD PRIMARY KEY (`sportEventID`),
  ADD KEY `competitionID` (`competitionID`),
  ADD KEY `competitionPlaceID` (`competitionPlaceID`),
  ADD KEY `stage` (`stage`),
  ADD KEY `date` (`date`);

--
-- Индексы таблицы `sportKinds`
--
ALTER TABLE `sportKinds`
  ADD PRIMARY KEY (`sportKindsID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `sportObjectAddresses`
--
ALTER TABLE `sportObjectAddresses`
  ADD PRIMARY KEY (`sportObjectID`),
  ADD KEY `cityID` (`cityID`);

--
-- Индексы таблицы `sportObjectPlaces`
--
ALTER TABLE `sportObjectPlaces`
  ADD PRIMARY KEY (`sportObjectPlaceID`),
  ADD KEY `sportObjectID` (`sportObjectID`);

--
-- Индексы таблицы `sportObjects`
--
ALTER TABLE `sportObjects`
  ADD PRIMARY KEY (`sportObjectID`),
  ADD KEY `name` (`name`),
  ADD KEY `olympicGamesID` (`olympicGamesID`);

--
-- Индексы таблицы `sportResults`
--
ALTER TABLE `sportResults`
  ADD PRIMARY KEY (`applicationID`);

--
-- Индексы таблицы `tvChannels`
--
ALTER TABLE `tvChannels`
  ADD PRIMARY KEY (`tvChannelID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `tvChannelsBroadcasts`
--
ALTER TABLE `tvChannelsBroadcasts`
  ADD PRIMARY KEY (`tvChannelsBroadcastID`),
  ADD KEY `tvChannelID` (`tvChannelID`),
  ADD KEY `eventID` (`eventID`);

--
-- Индексы таблицы `weatherConditions`
--
ALTER TABLE `weatherConditions`
  ADD PRIMARY KEY (`eventID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `cityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `countryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `olympicGames`
--
ALTER TABLE `olympicGames`
  MODIFY `olympicGameID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `olympicGamesLogos`
--
ALTER TABLE `olympicGamesLogos`
  MODIFY `olympicGameID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `olympicTalismans`
--
ALTER TABLE `olympicTalismans`
  MODIFY `olympicTalismanID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `personAwards`
--
ALTER TABLE `personAwards`
  MODIFY `awardID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `personInfoHistory`
--
ALTER TABLE `personInfoHistory`
  MODIFY `personInfoID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `personInjuries`
--
ALTER TABLE `personInjuries`
  MODIFY `injuryID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `persons`
--
ALTER TABLE `persons`
  MODIFY `personID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `sponsorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `sportapplications`
--
ALTER TABLE `sportapplications`
  MODIFY `applicationID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sportCompetitions`
--
ALTER TABLE `sportCompetitions`
  MODIFY `sportCompetitionID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sportDiciplines`
--
ALTER TABLE `sportDiciplines`
  MODIFY `sportDiciplineID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sportEvents`
--
ALTER TABLE `sportEvents`
  MODIFY `sportEventID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sportKinds`
--
ALTER TABLE `sportKinds`
  MODIFY `sportKindsID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sportObjectPlaces`
--
ALTER TABLE `sportObjectPlaces`
  MODIFY `sportObjectPlaceID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sportObjects`
--
ALTER TABLE `sportObjects`
  MODIFY `sportObjectID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tvChannels`
--
ALTER TABLE `tvChannels`
  MODIFY `tvChannelID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tvChannelsBroadcasts`
--
ALTER TABLE `tvChannelsBroadcasts`
  MODIFY `tvChannelsBroadcastID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `countries` (`countryID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `olympicGames`
--
ALTER TABLE `olympicGames`
  ADD CONSTRAINT `olympicgames_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `cities` (`cityID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `olympicGamesDiciplines`
--
ALTER TABLE `olympicGamesDiciplines`
  ADD CONSTRAINT `olympicgamesdiciplines_ibfk_2` FOREIGN KEY (`diciplineID`) REFERENCES `sportDiciplines` (`sportDiciplineID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `olympicgamesdiciplines_ibfk_1` FOREIGN KEY (`olympicGameID`) REFERENCES `olympicGames` (`olympicGameID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `olympicGamesLogos`
--
ALTER TABLE `olympicGamesLogos`
  ADD CONSTRAINT `olympicgameslogos_ibfk_1` FOREIGN KEY (`olympicGameID`) REFERENCES `olympicGames` (`olympicGameID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `olympicGamesParticipants`
--
ALTER TABLE `olympicGamesParticipants`
  ADD CONSTRAINT `olympicgamesparticipants_ibfk_4` FOREIGN KEY (`diciplineID`) REFERENCES `sportDiciplines` (`sportDiciplineID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `olympicgamesparticipants_ibfk_1` FOREIGN KEY (`olympicGameID`) REFERENCES `olympicGames` (`olympicGameID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `olympicgamesparticipants_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `olympicgamesparticipants_ibfk_3` FOREIGN KEY (`countryID`) REFERENCES `countries` (`countryID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `olympicGamesSponsors`
--
ALTER TABLE `olympicGamesSponsors`
  ADD CONSTRAINT `olympicgamessponsors_ibfk_2` FOREIGN KEY (`sponsorID`) REFERENCES `sponsors` (`sponsorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `olympicgamessponsors_ibfk_1` FOREIGN KEY (`olympicGameID`) REFERENCES `olympicGames` (`olympicGameID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `olympicTalismans`
--
ALTER TABLE `olympicTalismans`
  ADD CONSTRAINT `olympictalismans_ibfk_2` FOREIGN KEY (`olympicTalismanID`) REFERENCES `olympicTalismanLogos` (`olympicTalismanID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `olympictalismans_ibfk_1` FOREIGN KEY (`olympicGameID`) REFERENCES `olympicGames` (`olympicGameID`);

--
-- Ограничения внешнего ключа таблицы `personAwards`
--
ALTER TABLE `personAwards`
  ADD CONSTRAINT `personawards_ibfk_1` FOREIGN KEY (`diciplineID`) REFERENCES `sportDiciplines` (`sportDiciplineID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personAwardsHistory`
--
ALTER TABLE `personAwardsHistory`
  ADD CONSTRAINT `personawardshistory_ibfk_2` FOREIGN KEY (`awardID`) REFERENCES `personAwards` (`awardID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personawardshistory_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personDiciplinesHistory`
--
ALTER TABLE `personDiciplinesHistory`
  ADD CONSTRAINT `persondiciplineshistory_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persondiciplineshistory_ibfk_2` FOREIGN KEY (`diciplineID`) REFERENCES `sportDiciplines` (`sportDiciplineID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personInfoHistory`
--
ALTER TABLE `personInfoHistory`
  ADD CONSTRAINT `personinfohistory_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `personInjuriesHistory`
--
ALTER TABLE `personInjuriesHistory`
  ADD CONSTRAINT `personinjurieshistory_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `personinjurieshistory_ibfk_1` FOREIGN KEY (`injuryID`) REFERENCES `personInjuries` (`injuryID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportapplications`
--
ALTER TABLE `sportapplications`
  ADD CONSTRAINT `sportapplications_ibfk_4` FOREIGN KEY (`countryID`) REFERENCES `countries` (`countryID`),
  ADD CONSTRAINT `sportapplications_ibfk_1` FOREIGN KEY (`parent_appID`) REFERENCES `applications` (`applicationID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sportapplications_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `sportEvents` (`sportEventID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sportapplications_ibfk_3` FOREIGN KEY (`personID`) REFERENCES `persons` (`personID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportCompetitions`
--
ALTER TABLE `sportCompetitions`
  ADD CONSTRAINT `sportcompetitions_ibfk_1` FOREIGN KEY (`sportDiciplineID`) REFERENCES `sportDiciplines` (`sportDiciplineID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportDiciplines`
--
ALTER TABLE `sportDiciplines`
  ADD CONSTRAINT `sportdiciplines_ibfk_1` FOREIGN KEY (`sportKindID`) REFERENCES `sportKinds` (`sportKindsID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportEvents`
--
ALTER TABLE `sportEvents`
  ADD CONSTRAINT `sportevents_ibfk_2` FOREIGN KEY (`competitionPlaceID`) REFERENCES `sportObjectPlaces` (`sportObjectPlaceID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sportevents_ibfk_1` FOREIGN KEY (`competitionID`) REFERENCES `sportCompetitions` (`sportCompetitionID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportObjectAddresses`
--
ALTER TABLE `sportObjectAddresses`
  ADD CONSTRAINT `sportobjectaddresses_ibfk_2` FOREIGN KEY (`cityID`) REFERENCES `cities` (`cityID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sportobjectaddresses_ibfk_1` FOREIGN KEY (`sportObjectID`) REFERENCES `sportObjects` (`sportObjectID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportObjectPlaces`
--
ALTER TABLE `sportObjectPlaces`
  ADD CONSTRAINT `sportobjectplaces_ibfk_1` FOREIGN KEY (`sportObjectID`) REFERENCES `sportObjects` (`sportObjectID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportObjects`
--
ALTER TABLE `sportObjects`
  ADD CONSTRAINT `sportobjects_ibfk_1` FOREIGN KEY (`olympicGamesID`) REFERENCES `olympicGames` (`olympicGameID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sportResults`
--
ALTER TABLE `sportResults`
  ADD CONSTRAINT `sportresults_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `sportapplications` (`applicationID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tvChannelsBroadcasts`
--
ALTER TABLE `tvChannelsBroadcasts`
  ADD CONSTRAINT `tvchannelsbroadcasts_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `sportEvents` (`sportEventID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tvchannelsbroadcasts_ibfk_1` FOREIGN KEY (`tvChannelID`) REFERENCES `tvChannels` (`tvChannelID`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `weatherConditions`
--
ALTER TABLE `weatherConditions`
  ADD CONSTRAINT `weatherconditions_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `sportEvents` (`sportEventID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
