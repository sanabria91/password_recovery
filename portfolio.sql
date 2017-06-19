-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2017 at 02:35 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Id` int(11) NOT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PasswordSalt` varchar(20) NOT NULL,
  `PasswordHash` varchar(50) NOT NULL,
  `Activated` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Id`, `RoleId`, `UserName`, `Email`, `PasswordSalt`, `PasswordHash`, `Activated`) VALUES
(1, 1, 'Boss', 'Bernard.Monette@humber.ca', 'root', '1a935314579adfe8dc18db6ae1e8aec4df941a93', b'1111111111111111111111111111111'),
(2, 3, 'student', 'student@gmail.com', 'student', '81291dee22e3be6d899743420c20764845b74dc0', b'1111111111111111111111111111111'),
(3, 3, 'someDude', 'test@test.com', 'test', '81291dee22e3be6d899743420c20764845b74dc0', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Id` int(11) NOT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Id`, `AccountId`, `FirstName`, `LastName`, `Phone`) VALUES
(1, 1, 'Bernard', 'Monette', '444 444 5555');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `Id` int(11) NOT NULL,
  `YearId` int(11) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `Graduated` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`Id`, `YearId`, `StudentId`, `Graduated`) VALUES
(1, 1, 1, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `externalservices`
--

CREATE TABLE `externalservices` (
  `Id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `BaseLink` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `externalservices`
--

INSERT INTO `externalservices` (`Id`, `Title`, `BaseLink`) VALUES
(1, 'GitHub', NULL),
(2, 'LinkedIn', NULL),
(3, 'Portfolio', NULL),
(4, 'Facebook', NULL),
(5, 'Google', NULL),
(6, 'Twitter', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `Id` int(11) NOT NULL,
  `ProjectId` int(11) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Path` varchar(50) NOT NULL,
  `Size` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `Id` int(11) NOT NULL,
  `YearId` int(11) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `ValidDate` datetime NOT NULL,
  `ActivationToken` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`Id`, `YearId`, `Email`, `ValidDate`, `ActivationToken`) VALUES
(1, 1, 'newstudent@gmail.com', '2017-09-01 12:00:00', 'year2016-2017');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `Id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`Id`, `Title`) VALUES
(1, 'Team Lead'),
(2, 'Developer'),
(3, 'Designer'),
(4, 'Front End'),
(5, 'Back End'),
(6, 'Database'),
(7, 'Project Manager');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `Id` int(11) NOT NULL,
  `ProgramName` varchar(30) NOT NULL,
  `Credentials` varchar(50) NOT NULL,
  `Length` varchar(30) NOT NULL,
  `Campus` varchar(50) NOT NULL,
  `AreaOfInterest` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`Id`, `ProgramName`, `Credentials`, `Length`, `Campus`, `AreaOfInterest`) VALUES
(1, 'Web Development', 'Ontario Graduate Certificate', '3 semesters', 'North', 'Media Studies & Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `Id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `MainPicture` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `FinishDate` datetime NOT NULL,
  `TeamProject` bit(1) DEFAULT b'0',
  `PositionId` int(11) DEFAULT NULL,
  `ShortDesc` varchar(200) DEFAULT NULL,
  `Description` varchar(750) NOT NULL,
  `Url` varchar(50) DEFAULT NULL,
  `GitHub` varchar(50) DEFAULT NULL,
  `UploadDate` datetime NOT NULL,
  `Approved` bit(1) NOT NULL DEFAULT b'0',
  `Published` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`Id`, `StudentId`, `MainPicture`, `Name`, `FinishDate`, `TeamProject`, `PositionId`, `ShortDesc`, `Description`, `Url`, `GitHub`, `UploadDate`, `Approved`, `Published`) VALUES
(1, 1, 'main.png', 'Hospital website redesign', '2017-04-28 12:00:00', b'1111111111111111111111111111111', 1, 'Short description to show in search results.', 'Full description of the project.', 'www.sample.com', '', '2017-06-08 11:11:11', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2, 3, 'main.jpg', 'SomeProject', '2017-06-17 00:00:00', b'1111111111111111111111111111111', 1, NULL, 'blah blah blah', 'www.somesite.com', NULL, '2017-06-08 07:00:00', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3, 4, 'main.jpg', 'React-Native', '2017-06-08 08:00:00', b'1111111111111111111111111111111', 1, NULL, 'blah blah', NULL, NULL, '2017-06-07 00:38:00', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4, 5, 'main.jpg', 'myproj', '2017-06-20 12:00:00', b'1111111111111111111111111111111', 1, NULL, 'blah blah', NULL, NULL, '2017-06-07 00:00:00', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5, 6, 'main.jpeg', 'awesome', '2017-06-09 00:00:00', b'1111111111111111111111111111111', 1, NULL, 'blah blah', NULL, NULL, '2017-06-28 00:00:00', b'1111111111111111111111111111111', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `projecttechs`
--

CREATE TABLE `projecttechs` (
  `Id` int(11) NOT NULL,
  `ProjectId` int(11) DEFAULT NULL,
  `TechId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projecttechs`
--

INSERT INTO `projecttechs` (`Id`, `ProjectId`, `TechId`) VALUES
(1, 1, 2),
(2, 1, 6),
(3, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `recovery_keys`
--

CREATE TABLE `recovery_keys` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `token` varchar(50) NOT NULL,
  `valid` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `AccessLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `Title`, `AccessLevel`) VALUES
(1, 'superadmin', 1),
(2, 'admin', 2),
(3, 'student', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stacks`
--

CREATE TABLE `stacks` (
  `Id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stacks`
--

INSERT INTO `stacks` (`Id`, `Title`) VALUES
(1, 'Frontend'),
(2, 'Backend'),
(3, 'Fullstack'),
(4, 'Designer'),
(5, 'DatabaseAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `studentexternals`
--

CREATE TABLE `studentexternals` (
  `Id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `EServiceId` int(11) DEFAULT NULL,
  `PersonalLink` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentexternals`
--

INSERT INTO `studentexternals` (`Id`, `StudentId`, `EServiceId`, `PersonalLink`) VALUES
(1, 1, 1, 'https://github.com'),
(2, 1, 2, 'https://www.linkedin.com/'),
(3, 1, 3, 'https://www.student.com');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Id` int(11) NOT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `ProfileImg` varchar(100) DEFAULT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `StudentNumber` varchar(100) NOT NULL,
  `ContactEmail` varchar(100) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `ContactNumber` varchar(100) DEFAULT NULL,
  `CurrentJob` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Id`, `AccountId`, `ProfileImg`, `FirstName`, `LastName`, `StudentNumber`, `ContactEmail`, `LastUpdate`, `ContactNumber`, `CurrentJob`) VALUES
(1, 2, NULL, 'Student', 'Studentovich', 'n00000000', 'student@gmail.com', '2017-06-08 11:06:06', '647-555-5555', NULL),
(2, 3, NULL, 'Some', 'Dude', 'n0000121', 'test@test.com', '0000-00-00 00:00:00', NULL, NULL),
(3, NULL, NULL, 'Jessica', 'Mount', 'n1234567', 'jess@test.com', '2017-06-08 00:00:00', NULL, NULL),
(4, NULL, NULL, 'Sierra', 'Katrian', 'n2222222222', 's@test.com', '2017-06-08 07:00:00', NULL, NULL),
(5, NULL, NULL, 'Kevin', 'Sanabria', 'n23344323332', 'sanabriakevin@hotmail.com', '2017-06-08 10:00:00', NULL, NULL),
(6, NULL, NULL, 'Steve', 'Djau', 'n121423542352', 'steve@test.com', '2017-06-08 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentstacks`
--

CREATE TABLE `studentstacks` (
  `Id` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `StackId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentstacks`
--

INSERT INTO `studentstacks` (`Id`, `StudentId`, `StackId`) VALUES
(1, 1, 3),
(2, 6, 1),
(3, 5, 2),
(4, 4, 3),
(5, 3, 5),
(6, 6, 3),
(7, 5, 5),
(8, 4, 3),
(9, 3, 4),
(10, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `studenttechs`
--

CREATE TABLE `studenttechs` (
  `Id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `TechId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studenttechs`
--

INSERT INTO `studenttechs` (`Id`, `StudentId`, `TechId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `techs`
--

CREATE TABLE `techs` (
  `Id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `techs`
--

INSERT INTO `techs` (`Id`, `Title`) VALUES
(1, 'PHP'),
(2, 'ASP.NET'),
(3, 'JavaScript'),
(4, 'CSS'),
(5, 'HTML'),
(6, 'jQuery'),
(7, 'Bootstrap');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `Id` int(11) NOT NULL,
  `ProgramId` int(11) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`Id`, `ProgramId`, `StartDate`, `EndDate`) VALUES
(1, 1, '2016-09-01 00:00:00', '2017-08-31 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AccountId` (`AccountId`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `YearId` (`YearId`),
  ADD KEY `StudentId` (`StudentId`);

--
-- Indexes for table `externalservices`
--
ALTER TABLE `externalservices`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProjectId` (`ProjectId`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `YearId` (`YearId`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `PositionId` (`PositionId`);

--
-- Indexes for table `projecttechs`
--
ALTER TABLE `projecttechs`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProjectId` (`ProjectId`),
  ADD KEY `TechId` (`TechId`);

--
-- Indexes for table `recovery_keys`
--
ALTER TABLE `recovery_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `stacks`
--
ALTER TABLE `stacks`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `studentexternals`
--
ALTER TABLE `studentexternals`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `EServiceId` (`EServiceId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AccountId` (`AccountId`);

--
-- Indexes for table `studentstacks`
--
ALTER TABLE `studentstacks`
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `StackId` (`StackId`);

--
-- Indexes for table `studenttechs`
--
ALTER TABLE `studenttechs`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `TechId` (`TechId`);

--
-- Indexes for table `techs`
--
ALTER TABLE `techs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProgramId` (`ProgramId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `externalservices`
--
ALTER TABLE `externalservices`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `projecttechs`
--
ALTER TABLE `projecttechs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `recovery_keys`
--
ALTER TABLE `recovery_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `studentexternals`
--
ALTER TABLE `studentexternals`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `studenttechs`
--
ALTER TABLE `studenttechs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `techs`
--
ALTER TABLE `techs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `Accounts_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`);

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `Admins_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `Enrollment_ibfk_1` FOREIGN KEY (`YearId`) REFERENCES `years` (`Id`),
  ADD CONSTRAINT `Enrollment_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `Images_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `projects` (`Id`);

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `Invitations_ibfk_1` FOREIGN KEY (`YearId`) REFERENCES `years` (`Id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `Projects_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `Projects_ibfk_2` FOREIGN KEY (`PositionId`) REFERENCES `positions` (`Id`);

--
-- Constraints for table `projecttechs`
--
ALTER TABLE `projecttechs`
  ADD CONSTRAINT `ProjectTechs_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `projects` (`Id`),
  ADD CONSTRAINT `ProjectTechs_ibfk_2` FOREIGN KEY (`TechId`) REFERENCES `techs` (`Id`);

--
-- Constraints for table `studentexternals`
--
ALTER TABLE `studentexternals`
  ADD CONSTRAINT `StudentExternals_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `StudentExternals_ibfk_2` FOREIGN KEY (`EServiceId`) REFERENCES `externalservices` (`Id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `accounts` (`Id`);

--
-- Constraints for table `studentstacks`
--
ALTER TABLE `studentstacks`
  ADD CONSTRAINT `StudentStacks_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `StudentStacks_ibfk_2` FOREIGN KEY (`StackId`) REFERENCES `stacks` (`Id`);

--
-- Constraints for table `studenttechs`
--
ALTER TABLE `studenttechs`
  ADD CONSTRAINT `StudentTechs_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `StudentTechs_ibfk_2` FOREIGN KEY (`TechId`) REFERENCES `techs` (`Id`);

--
-- Constraints for table `years`
--
ALTER TABLE `years`
  ADD CONSTRAINT `Years_ibfk_1` FOREIGN KEY (`ProgramId`) REFERENCES `programs` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
