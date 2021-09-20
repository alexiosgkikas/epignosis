-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 20 Σεπ 2021 στις 11:03:08
-- Έκδοση διακομιστή: 10.4.21-MariaDB
-- Έκδοση PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `woofx`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `animal`
--

CREATE TABLE `animal` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `animal`
--

INSERT INTO `animal` (`ID`, `NAME`) VALUES
(1, 'DOG'),
(2, 'CAT'),
(3, 'HORSE'),
(4, 'SPIDER'),
(5, 'SNAKE');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `breed`
--

CREATE TABLE `breed` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `ID_ANIMAL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `breed`
--

INSERT INTO `breed` (`ID`, `NAME`, `ID_ANIMAL`) VALUES
(1, 'American Foxhound', 1),
(2, 'Labrador Retriever', 1),
(3, 'Australian Terrier', 1),
(4, 'Abyssinian Cat', 2),
(5, 'Birman Cat Breed', 2),
(6, 'Chartreux Cat Breed', 2),
(7, 'American Quarter Horse', 3),
(8, 'Arabian', 3),
(9, 'Appaloosa', 3),
(10, 'Black Widow', 4),
(11, 'Black Widow', 4),
(12, 'Jumping Spider', 4),
(13, 'King Snake', 5),
(14, 'Burmese Python', 5);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pet`
--

CREATE TABLE `pet` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_breed` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `chip_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `pet`
--

INSERT INTO `pet` (`ID`, `NAME`, `id_animal`, `id_breed`, `email`, `password`, `chip_code`) VALUES
(35, 'Max', 1, 2, 'a@a.com', '$2y$10$czSi8hX28RjGqw0RG.0dm.a1JvGho.jokBFF9GZ.4iiP5Otaz9lT6', '12345ABCDE');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`ID`);

--
-- Ευρετήρια για πίνακα `breed`
--
ALTER TABLE `breed`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_ANIMAL_FK` (`ID_ANIMAL`);

--
-- Ευρετήρια για πίνακα `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `chip_code` (`chip_code`),
  ADD KEY `ID_BREED_FK` (`id_breed`),
  ADD KEY `ID_ANIMALFK` (`id_animal`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `animal`
--
ALTER TABLE `animal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT για πίνακα `breed`
--
ALTER TABLE `breed`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT για πίνακα `pet`
--
ALTER TABLE `pet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `breed`
--
ALTER TABLE `breed`
  ADD CONSTRAINT `ID_ANIMAL_FK` FOREIGN KEY (`ID_ANIMAL`) REFERENCES `animal` (`ID`) ON DELETE CASCADE;

--
-- Περιορισμοί για πίνακα `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `ID_ANIMALFK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_BREED_FK` FOREIGN KEY (`id_breed`) REFERENCES `breed` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
