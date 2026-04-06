-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2026 at 12:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Bodleian_Library_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  `BirthYear` int(11) DEFAULT NULL,
  `DeathYear` int(11) DEFAULT NULL,
  `Biography` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorID`, `Name`, `Nationality`, `BirthYear`, `DeathYear`, `Biography`) VALUES
(1, 'F. Scott Fitzgerald', 'American', 1896, 1940, 'Famous novelist of the Jazz Age.'),
(2, 'Harper Lee', 'American', 1926, 2016, 'Pulitzer Prize-winning author.'),
(3, 'George Orwell', 'British', 1903, 1950, 'Known for dystopian novels.'),
(4, 'Jane Austen', 'British', 1775, 1817, 'Renowned English novelist.'),
(5, 'J.D. Salinger', 'American', 1919, 2010, 'Wrote \"The Catcher in the Rye\"'),
(6, 'Herman Melville', 'American', 1819, 1891, 'Author of \"Moby Dick\"'),
(7, 'Mark Twain', 'American', 1835, 1910, 'Master of satire and humor.'),
(11, 'ponnaya', 'lankawa', 2007, 2025, 'ehema ewa na');

-- --------------------------------------------------------

--
-- Table structure for table `BookCopies`
--

CREATE TABLE `BookCopies` (
  `CopyID` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `DateBought` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BookCopies`
--

INSERT INTO `BookCopies` (`CopyID`, `ISBN`, `DateBought`) VALUES
(1, '9780743273565', '2015-01-01'),
(2, '9780061120084', '2014-01-01'),
(3, '9780451524935', '2012-01-01'),
(4, '9780141439518', '2010-11-01'),
(5, '9780316769488', '2014-12-04'),
(6, '9780451526340', '2015-01-01'),
(7, '9780142437247', '2016-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `PublisherID` int(11) NOT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `CopiesAvailable` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`ISBN`, `Title`, `AuthorID`, `PublisherID`, `Genre`, `CopiesAvailable`) VALUES
('9780061120084', 'To Kill a Mockingbird', 2, 4, 'Fiction', 3),
('9780141439518', 'Pride and Prejudice', 4, 6, 'Romance', 7),
('9780142437247', 'Moby Dick', 6, 1, 'Adventure', 1),
('9780316769488', 'The Catcher in the Rye', 5, 7, 'Fiction', 4),
('9780451524935', '1984', 3, 5, 'Dystopian', 2),
('9780451526340', 'Animal Farm', 3, 5, 'Satire', 6),
('9780743273565', 'The Great Gatsby', 1, 3, 'Fiction', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Fines`
--

CREATE TABLE `Fines` (
  `FineID` int(11) NOT NULL,
  `LoanID` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `IssueDate` date DEFAULT NULL,
  `PaidDate` date DEFAULT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Fines`
--

INSERT INTO `Fines` (`FineID`, `LoanID`, `Amount`, `IssueDate`, `PaidDate`, `Status`) VALUES
(1, 5, 5, '2023-09-20', NULL, 'Unpaid'),
(2, 3, 2.5, '2023-09-18', '2023-09-22', 'Paid'),
(3, 1, 0, NULL, NULL, 'No Fine'),
(4, 7, 7.5, '2023-09-21', NULL, 'Unpaid'),
(5, 2, 0, NULL, NULL, 'No Fine'),
(6, 6, 3, '2023-09-19', '2023-09-23', 'Paid'),
(7, 4, 0, NULL, NULL, 'No Fine');

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `GenreID` int(11) NOT NULL,
  `GenreName` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`GenreID`, `GenreName`, `Description`) VALUES
(1, 'Fiction', 'Imaginary stories and narratives.'),
(2, 'Non-Fiction', 'Based on facts and real events.'),
(3, 'Science', 'Focus on scientific topics.'),
(4, 'History', 'Explores historical events and figures.'),
(5, 'Fantasy', 'Involves magical and supernatural elements.'),
(6, 'Mystery', 'Centers around solving a puzzle or crime.'),
(7, 'Biography', 'Detailed account of a person\'s life.');

-- --------------------------------------------------------

--
-- Table structure for table `Inventory`
--

CREATE TABLE `Inventory` (
  `InventoryID` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `TotalCopies` int(11) NOT NULL,
  `AvailableCopies` int(11) NOT NULL,
  `LastUpdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Inventory`
--

INSERT INTO `Inventory` (`InventoryID`, `ISBN`, `TotalCopies`, `AvailableCopies`, `LastUpdated`) VALUES
(1, '9780743273565', 10, 5, '2023-09-01'),
(2, '9780061120084', 8, 3, '2023-09-02'),
(3, '9780451524935', 5, 2, '2023-09-03'),
(4, '9780141439518', 12, 7, '2023-09-04'),
(5, '9780316769488', 7, 4, '2023-09-05'),
(6, '9780451526340', 9, 6, '2023-09-06'),
(7, '9780142437247', 3, 1, '2023-09-07');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `LoanID` int(11) NOT NULL,
  `CopyID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `LoanDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`LoanID`, `CopyID`, `MemberID`, `LoanDate`, `DueDate`, `ReturnDate`, `Status`) VALUES
(1, 1, 1, '2023-09-01', '2023-09-15', NULL, 'Active'),
(2, 2, 2, '2023-09-02', '2023-09-16', '2023-09-10', 'Returned'),
(3, 3, 3, '2023-09-03', '2023-09-17', NULL, 'Active'),
(4, 4, 4, '2023-09-04', '2023-09-18', '2023-09-12', 'Returned'),
(5, 5, 5, '2023-09-05', '2023-09-19', NULL, 'Overdue'),
(6, 6, 6, '2023-09-06', '2023-09-20', '2023-09-15', 'Returned'),
(7, 7, 7, '2023-09-07', '2023-09-21', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `MemberID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `hone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `MembershipType` varchar(50) NOT NULL,
  `JoinDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`MemberID`, `Name`, `Email`, `hone`, `Address`, `MembershipType`, `JoinDate`) VALUES
(1, 'John Doe', 'john.doe@uow.com', '1234567890', '123 Elm St', 'Regular', '2022-01-15'),
(2, 'Jane Smith', 'jane.smith@uow.com', '2345678901', '456 Oak Ave', 'Premium', '2022-02-10'),
(3, 'Alice Johnson', 'alice.johnson@uow.com', '3456789012', '789 Pine Blvd', 'Regular', '2022-03-05'),
(4, 'Bob Brown', 'bob.brown@uow.com', '4567890123', '321 Maple Dr', 'Student', '2022-04-20'),
(5, 'Carol White', 'carol.white@uow.com', '5678901234', '654 Birch Ln', 'Regular', '2022-05-12'),
(6, 'David Green', 'david.green@uow.com', '6789012345', '987 Cedar Ct', 'Premium', '2022-06-18'),
(7, 'Emily Black', 'emily.black@uow.com', '7890123456', '111 Willow Way', 'Student', '2022-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `NewMember`
--

CREATE TABLE `NewMember` (
  `MemberID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `PublisherID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `FoundYear` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`PublisherID`, `Name`, `Address`, `Phone`, `Email`, `FoundYear`) VALUES
(1, 'Penguin Books', '345 Hudson St', '1234567890', 'info@penguin.com', '1935-01-01'),
(2, 'HarperCollins', '195 Broadway', '2345678901', 'info@harpercollins.com', '1989-01-01'),
(3, 'Random House', '1745 Broadway', '3456789012', 'info@randomhouse.com', '1927-01-01'),
(4, 'Simon & Schuster', '1230 Avenue of the Americas', '4567890123', 'info@simonandschuster.com', '1924-01-01'),
(5, 'Houghton Mifflin', '2 Park St', '5678901234', 'info@hmhco.com', '1832-01-01'),
(6, 'Oxford University Press', 'Great Clarendon St', '6789012345', 'info@oup.com', '1480-01-01'),
(7, 'Macmillan', '120 Broadway', '7890123456', 'info@macmillan.com', '1843-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `ReservationID` int(11) NOT NULL,
  `CopyID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `ReservationDate` date NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`ReservationID`, `CopyID`, `MemberID`, `ReservationDate`, `Status`) VALUES
(1, 1, 2, '2023-09-01', 'Pending'),
(2, 3, 4, '2023-09-02', 'Completed'),
(3, 5, 6, '2023-09-03', 'Pending'),
(4, 7, 1, '2023-09-04', 'Completed'),
(5, 2, 3, '2023-09-05', 'Pending'),
(6, 4, 5, '2023-09-06', 'Completed'),
(7, 6, 7, '2023-09-07', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `HireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `Role`, `Email`, `Phone`, `HireDate`) VALUES
(1, 'Michael Lee', 'Librarian', 'michael.lee@uow.com', '1234567890', '2020-05-10'),
(2, 'Sarah Adams', 'Assistant', 'sarah.adams@uow.com', '2345678901', '2021-06-15'),
(3, 'James Carter', 'Manager', 'james.carter@uow.com', '3456789012', '2019-07-20'),
(4, 'Laura Davis', 'Clerk', 'laura.davis@uow.com', '4567890123', '2022-08-25'),
(5, 'Robert Evans', 'IT Support', 'robert.evans@uow.com', '5678901234', '2021-09-30'),
(6, 'Patricia Hall', 'Cleaner', 'patricia.hall@uow.com', '6789012345', '2020-10-05'),
(7, 'William King', 'Security', 'william.king@uow.com', '7890123456', '2022-11-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `BookCopies`
--
ALTER TABLE `BookCopies`
  ADD PRIMARY KEY (`CopyID`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indexes for table `Fines`
--
ALTER TABLE `Fines`
  ADD PRIMARY KEY (`FineID`),
  ADD KEY `LoanID` (`LoanID`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD PRIMARY KEY (`InventoryID`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `CopyID` (`CopyID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `NewMember`
--
ALTER TABLE `NewMember`
  ADD PRIMARY KEY (`MemberID`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`PublisherID`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `CopyID` (`CopyID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Fines`
--
ALTER TABLE `Fines`
  MODIFY `FineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookCopies`
--
ALTER TABLE `BookCopies`
  ADD CONSTRAINT `bookcopies_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`);

--
-- Constraints for table `Books`
--
ALTER TABLE `Books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`PublisherID`) REFERENCES `publishers` (`PublisherID`);

--
-- Constraints for table `Fines`
--
ALTER TABLE `Fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`LoanID`) REFERENCES `loans` (`LoanID`);

--
-- Constraints for table `Inventory`
--
ALTER TABLE `Inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Books` (`ISBN`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`CopyID`) REFERENCES `BookCopies` (`CopyID`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`CopyID`) REFERENCES `BookCopies` (`CopyID`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
