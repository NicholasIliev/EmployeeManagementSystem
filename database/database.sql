-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 05:35 PM
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
-- Database: `kilburnazon5`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `operating_area` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `building_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `operating_area` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `reason` text NOT NULL,
  `customer_id` int(11) NOT NULL,
  `hr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `postal_location` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customerorder`
--

CREATE TABLE `customerorder` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `location_id`, `manager_id`) VALUES
(1, 'HR', 1, 1),
(2, 'Management', 2, 2),
(3, 'Packagers', 3, 3),
(4, 'Drivers', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `emp_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontact`
--

CREATE TABLE `emergencycontact` (
  `emergency_contact_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `relationship` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emergencycontact`
--

INSERT INTO `emergencycontact` (`emergency_contact_id`, `name`, `relationship`, `phone_number`) VALUES
(1, 'Jereme Slayford', 'Girlfriend', '07721 065 357\r'),
(2, 'Nessy Panting', 'Civil Partner', '07326 502 172\r'),
(3, 'Kipp Lavens', 'Boyfriend', '07489 365 686\r'),
(4, 'Theo Sheard', 'Mother', '07356 401 825\r'),
(5, 'Joly Doram', 'Girlfriend', '07106 575 891\r'),
(6, 'Baird Fingleton', 'Boyfriend', '07789 751 694\r'),
(7, 'Patty Horsburgh', 'Husband', '07924 918 978\r'),
(8, 'Frazier Snelman', 'Boyfriend', '07235 513 354\r'),
(9, 'Regan Yarn', 'Mother', '44444 444 444'),
(10, 'Zita Stanborough', 'Mother', '07532 693 273\r'),
(11, 'Norrie Aggis', 'Husband', '07390 692 263\r'),
(12, 'Eada Silmon', 'Wife', '07007 182 872\r'),
(13, 'Maryjo Elgie', 'Wife', '07007 723 133\r'),
(14, 'Bastian Walliker', 'Civil Partner', '07695 349 556\r'),
(15, 'Winfred Moncey', 'Wife', '07510 608 683\r'),
(16, 'Michaelina Brahms', 'Civil Partner', '07996 211 011\r'),
(17, 'Tabbitha Shemmans', 'Wife', '07625 474 049\r'),
(18, 'Jone Tatersale', 'Mother', '07761 255 990\r'),
(19, 'Quinn Goodfellow', 'Husband', '07755 486 861\r'),
(20, 'Flory Billham', 'Husband', '07184 248 686\r'),
(21, 'Alyosha Halewood', 'Boyfriend', '07204 386 023\r'),
(22, 'Simone Kitchenman', 'Father', '07958 325 944\r'),
(23, 'Tyler Rowsell', 'Wife', '07753 973 466\r'),
(24, 'Renee Kubatsch', 'Mother', '07643 213 336\r'),
(25, 'Ivett Rapier', 'Boyfriend', '07016 239 710\r'),
(26, 'Margot Santos', 'Girlfriend', '07915 649 295\r'),
(27, 'Alis Plaster', 'Father', '07547 928 939\r'),
(28, 'Jon McAlester', 'Husband', '07015 001 355\r'),
(29, 'Cori Phillipps', 'Husband', '07572 306 041\r'),
(30, 'Alonzo Whilder', 'Boyfriend', '07404 498 162\r'),
(31, 'Leslie Keningham', 'Father', '07765 606 938\r'),
(32, 'Tim Stiff', 'Girlfriend', '07764 772 037\r'),
(33, 'Arthur Landsborough', 'Mother', '07679 670 222\r'),
(34, 'Golda Preston', 'Father', '07636 377 875\r'),
(35, 'Stevy Cestard', 'Husband', '07510 562 958\r'),
(36, 'Leesa Bonhome', 'Wife', '07668 929 915\r'),
(37, 'Godard Klimmek', 'Wife', '07219 099 770\r'),
(38, 'Joycelin Mushet', 'Father', '07772 470 745\r'),
(39, 'Ewart Benton', 'Civil Partner', '07888 475 034\r'),
(40, 'Lloyd Pidon', 'Boyfriend', '07416 146 403\r'),
(41, 'Nolie Turfitt', 'Boyfriend', '07872 652 134\r'),
(42, 'Vinnie Parr', 'Father', '07792 234 252\r'),
(43, 'Milty Corney', 'Husband', '07432 348 532\r'),
(44, 'Alaine Gozney', 'Girlfriend', '07874 802 135\r'),
(45, 'Bambie Bennell', 'Father', '07411 921 600\r'),
(46, 'Antoine De Caville', 'Father', '07676 274 711\r'),
(47, 'Margette Osman', 'Girlfriend', '07794 678 823\r'),
(48, 'Zita Greasty', 'Father', '07672 610 977\r'),
(49, 'Wain Savine', 'Civil Partner', '07473 391 474\r'),
(50, 'Taylor Screach', 'Civil Partner', '07029 866 049\r'),
(51, 'Haroun Izakovitz', 'Husband', '07369 136 446\r'),
(52, 'Lorri Elkington', 'Girlfriend', '07692 074 959\r'),
(53, 'Rosabella Howlin', 'Father', '07545 233 448\r'),
(54, 'Freddie Lorie', 'Husband', '07975 207 662\r'),
(55, 'Paxton Aspole', 'Boyfriend', '07789 380 331\r'),
(56, 'Seumas Ivantsov', 'Husband', '07643 549 188\r'),
(57, 'Hieronymus Eldon', 'Mother', '07315 598 289\r'),
(58, 'Theresina Tring', 'Civil Partner', '07536 036 354\r'),
(59, 'Eilis Domenici', 'Civil Partner', '07141 393 691\r'),
(60, 'Paten Velten', 'Husband', '07747 283 371\r'),
(61, 'Franz Barribal', 'Mother', '07304 601 591\r'),
(62, 'Coleen McPhater', 'Father', '07695 675 287\r'),
(63, 'Montague Giles', 'Girlfriend', '07602 582 994\r'),
(64, 'Amabelle McFaell', 'Mother', '07406 136 450\r'),
(65, 'Codee Hurndall', 'Boyfriend', '07296 394 678\r'),
(66, 'Lazarus Pomeroy', 'Boyfriend', '07288 097 464\r'),
(67, 'Troy Connock', 'Boyfriend', '07603 307 243\r'),
(68, 'Rorie Silverton', 'Civil Partner', '07675 154 777\r'),
(69, 'Eb Ludlem', 'Boyfriend', '07258 306 130\r'),
(70, 'Sumner Armer', 'Civil Partner', '07124 699 528\r'),
(71, 'Ashley Jeenes', 'Wife', '07512 219 266\r'),
(72, 'Bobby Breslin', 'Boyfriend', '07156 132 741\r'),
(73, 'Gerry Bastone', 'Boyfriend', '07831 515 385\r'),
(74, 'Alysa Bonavia', 'Husband', '07998 104 368\r'),
(75, 'Jon Guisby', 'Boyfriend', '07770 964 956\r'),
(76, 'Krisha Mingasson', 'Mother', '07594 793 358\r'),
(77, 'Inness Hendrick', 'Father', '07196 056 242\r'),
(78, 'Troy Danielis', 'Boyfriend', '07543 372 808\r'),
(79, 'Sal Bruckstein', 'Wife', '07113 310 488\r'),
(80, 'Trey Shannon', 'Husband', '07275 260 538\r'),
(81, 'Wanids Dunckley', 'Boyfriend', '07415 773 406\r'),
(82, 'Dagmar Ranahan', 'Mother', '07367 105 969\r'),
(83, 'Pandora Furnell', 'Husband', '07519 157 083\r'),
(84, 'Rora Windross', 'Boyfriend', '07964 139 091\r'),
(85, 'Hurley Nadin', 'Husband', '07141 801 105\r'),
(86, 'Sella Ronca', 'Civil Partner', '07235 827 256\r'),
(87, 'Paolina Rosenwasser', 'Wife', '07405 739 948\r'),
(88, 'Rollo Olczak', 'Mother', '07268 021 034\r'),
(89, 'Scarlet Maps', 'Girlfriend', '07959 819 817\r'),
(90, 'Ernestine Syne', 'Father', '07699 779 427\r'),
(91, 'Emmy Giraldo', 'Boyfriend', '07456 139 081\r'),
(92, 'Timothy Reck', 'Civil Partner', '07149 504 735\r'),
(93, 'Berty Brimblecomb', 'Girlfriend', '07765 565 720\r'),
(94, 'Reed Easterfield', 'Civil Partner', '07523 340 134\r'),
(95, 'Joyce Jaynes', 'Civil Partner', '07184 014 200\r'),
(96, 'Sibyl Mabson', 'Civil Partner', '07924 859 819\r'),
(97, 'Traci Hammersley', 'Wife', '07950 182 116\r'),
(98, 'Gloriana McFade', 'Husband', '07061 354 829\r'),
(99, 'Kristopher Pawfoot', 'Boyfriend', '07623 018 398\r'),
(100, 'Jaime Picford', 'Mother', '07745 996 565\r'),
(101, 'Bron Danby', 'Mother', '07385 290 163\r'),
(102, 'Bibbie Tradewell', 'Wife', '07829 257 797\r'),
(103, 'Ada Vaissiere', 'Girlfriend', '07065 792 686\r'),
(104, 'Emelen Spender', 'Father', '07345 326 453\r'),
(105, 'Husain Yerborn', 'Civil Partner', '07241 523 713\r'),
(106, 'Adena Vasyuchov', 'Husband', '07515 558 479\r'),
(107, 'Denys Tuckwood', 'Father', '07099 769 526\r'),
(108, 'Nathalia Frake', 'Boyfriend', '07568 334 465\r'),
(109, 'Dickie Prophet', 'Wife', '07596 027 218\r'),
(110, 'Shara Bernardy', 'Mother', '07045 228 558\r'),
(111, 'Domingo Zuppa', 'Boyfriend', '07642 910 675\r'),
(112, 'Dixie Glazebrook', 'Mother', '07427 129 714\r'),
(113, 'Sansone Harragin', 'Mother', '07946 591 368\r'),
(114, 'Stanley Duffitt', 'Boyfriend', '07136 718 165\r'),
(115, 'Ilyse Schultheiss', 'Wife', '07228 818 773\r'),
(116, 'Rouvin Von Oertzen', 'Mother', '07950 739 212\r'),
(117, 'Murielle Suett', 'Husband', '07932 036 011\r'),
(118, 'Conway Howman', 'Husband', '07285 064 810\r'),
(119, 'Darci Milbourne', 'Civil Partner', '07035 959 026\r'),
(120, 'Monro Piatkowski', 'Girlfriend', '07439 078 961\r'),
(121, 'Braden Sabben', 'Girlfriend', '07264 110 068\r'),
(122, 'Ross Little', 'Father', '07811 367 312\r'),
(123, 'Joe MacCleay', 'Mother', '07329 779 233\r'),
(124, 'Harrietta Arpin', 'Mother', '07469 896 525\r'),
(125, 'Gearard Lindback', 'Father', '07918 823 802\r'),
(126, 'Mose Pulham', 'Boyfriend', '07818 864 970\r'),
(127, 'Thain Kellard', 'Boyfriend', '07540 241 186\r'),
(128, 'Goddard Schenkel', 'Boyfriend', '07248 542 532\r'),
(129, 'Erie Wardingly', 'Civil Partner', '07055 738 740\r'),
(130, 'Leia MacMearty', 'Father', '07525 541 001\r'),
(131, 'Perla Sokill', 'Girlfriend', '07455 033 890\r'),
(132, 'Megen Vynall', 'Wife', '07100 762 873\r'),
(133, 'Becka Card', 'Father', '07503 035 492\r'),
(134, 'Filberto Railton', 'Wife', '07719 120 956\r'),
(135, 'Calv Alelsandrovich', 'Boyfriend', '07717 918 115\r'),
(136, 'Francene Licquorish', 'Husband', '07831 756 132\r'),
(137, 'Agnella Wyman', 'Husband', '07269 336 319\r'),
(138, 'Fae Whales', 'Boyfriend', '07698 294 787\r'),
(139, 'Nickolaus Riepel', 'Girlfriend', '07194 463 040\r'),
(140, 'Jacquette Cardenosa', 'Civil Partner', '07642 004 857\r'),
(141, 'Joel Laxson', 'Girlfriend', '07781 001 495\r'),
(142, 'Forster Naisby', 'Civil Partner', '07236 732 030\r'),
(143, 'Margot Barabich', 'Boyfriend', '07585 007 222\r'),
(144, 'Brittan Rubroe', 'Girlfriend', '07620 851 960\r'),
(145, 'Corabella Bitten', 'Boyfriend', '07918 827 977\r'),
(146, 'Malissa Scurrah', 'Wife', '07189 813 349\r'),
(147, 'Eben Samms', 'Wife', '07923 010 205\r'),
(148, 'Matias Ruckert', 'Girlfriend', '07792 360 390\r'),
(149, 'Annette Bydaway', 'Boyfriend', '07670 530 361\r'),
(150, 'Dion Tolson', 'Mother', '07154 115 530\r'),
(151, 'Johna Radki', 'Civil Partner', '07783 704 124\r'),
(152, 'Asher Ferrarotti', 'Civil Partner', '07460 150 758\r'),
(153, 'Roddie O\' Molan', 'Boyfriend', '07464 651 444\r'),
(154, 'Veradis Glidder', 'Girlfriend', '07392 244 305\r'),
(155, 'Nichol Rawsthorne', 'Civil Partner', '07508 127 404\r'),
(156, 'Toma Van\'t Hoff', 'Boyfriend', '07866 974 051\r'),
(157, 'Esme MacGlory', 'Girlfriend', '07291 150 140\r'),
(158, 'Thibaud Bladder', 'Mother', '07357 406 936\r'),
(159, 'Ken Sloane', 'Mother', '07771 820 262\r'),
(160, 'Paule Willingham', 'Father', '07689 398 886\r'),
(161, 'Lorrin Morman', 'Boyfriend', '07627 803 411\r'),
(162, 'Ogden Wynne', 'Father', '07740 998 062\r'),
(163, 'Mikey Vedeniktov', 'Boyfriend', '07326 764 405\r'),
(164, 'Sibyl Danovich', 'Girlfriend', '07655 343 095\r'),
(165, 'Cecil Gathercoal', 'Wife', '07480 391 714\r'),
(166, 'Farleigh Norwich', 'Husband', '07452 090 283\r'),
(167, 'Conrado Laker', 'Girlfriend', '07004 401 178\r'),
(168, 'Jenn Sander', 'Wife', '07434 841 982\r'),
(169, 'Cornie Moodie', 'Girlfriend', '07878 023 821\r'),
(170, 'Lee Burt', 'Mother', '07001 392 333\r'),
(171, 'Jacenta Slimme', 'Boyfriend', '07903 181 488\r'),
(172, 'Noelle Physick', 'Mother', '07224 883 037\r'),
(173, 'Klara Eckford', 'Girlfriend', '07580 481 684\r'),
(174, 'Thedric Kenwright', 'Father', '07519 455 911\r'),
(175, 'Granville Hacket', 'Husband', '07058 101 214\r'),
(176, 'Penelope Hancill', 'Mother', '07018 375 399\r'),
(177, 'Amye Brecknock', 'Mother', '07633 415 279\r'),
(178, 'Neila Haimes', 'Girlfriend', '07794 407 646\r'),
(179, 'Orelie Balasin', 'Civil Partner', '07971 986 560\r'),
(180, 'Bobbette Ruddlesden', 'Civil Partner', '07116 235 571\r'),
(181, 'Krissy Clayworth', 'Mother', '07448 190 979\r'),
(182, 'Cassandra Merle', 'Mother', '07220 743 776\r'),
(183, 'Cull Harraway', 'Mother', '07970 418 060\r'),
(184, 'Griffith Witherow', 'Father', '07449 485 950\r'),
(185, 'Frasquito Legerwood', 'Mother', '07484 895 380\r'),
(186, 'Damian Elsworth', 'Wife', '07934 375 220\r'),
(187, 'Sallee Hughes', 'Mother', '07731 937 530\r'),
(188, 'Prudi Blum', 'Girlfriend', '07262 636 173\r'),
(189, 'Goran Lamburn', 'Father', '07304 482 930\r'),
(190, 'Brose Jepp', 'Husband', '07935 559 320\r'),
(191, 'Tasha Bromilow', 'Civil Partner', '07666 955 404\r'),
(192, 'Dominick Schirach', 'Girlfriend', '07814 696 449\r'),
(193, 'Phyllys Lamey', 'Boyfriend', '07427 306 598\r'),
(194, 'Ham Snalum', 'Father', '07513 042 679\r'),
(195, 'Hollie Hebble', 'Mother', '07399 003 920\r'),
(196, 'Rorke Biles', 'Father', '07204 662 049\r'),
(197, 'Noland Doret', 'Boyfriend', '07157 222 552\r'),
(198, 'Georgena Clappison', 'Husband', '07584 205 419\r'),
(199, 'Casie MacAirt', 'Civil Partner', '07394 653 792\r'),
(200, 'Palmer Vial', 'Civil Partner', '07277 220 402\r'),
(201, 'Mike Tiron', 'Girlfriend', '07100 728 296\r'),
(202, 'Cristina Ervine', 'Civil Partner', '07854 566 028\r'),
(203, 'Arielle Etock', 'Boyfriend', '07312 873 616\r'),
(204, 'Raphaela Fishlee', 'Girlfriend', '07691 368 084\r'),
(205, 'Odo Frame', 'Mother', '07142 691 496\r'),
(206, 'Lief Wilhelmy', 'Boyfriend', '07972 492 545\r'),
(207, 'Judas Tonn', 'Mother', '07354 878 768\r'),
(208, 'Concordia Marklund', 'Civil Partner', '07959 795 234\r'),
(209, 'Bradford Rudolf', 'Girlfriend', '07753 919 257\r'),
(210, 'Letitia Ellph', 'Boyfriend', '07764 688 949\r'),
(211, 'Kimmie McKevitt', 'Boyfriend', '07591 865 044\r'),
(212, 'Shannon McGinty', 'Girlfriend', '07499 192 522\r'),
(213, 'Angus Ranscome', 'Boyfriend', '07105 859 928\r'),
(214, 'Birgitta Naerup', 'Wife', '07161 526 613\r'),
(215, 'Aaren Lomaz', 'Civil Partner', '07117 843 636\r'),
(216, 'Leena Gorry', 'Father', '07049 508 215\r'),
(217, 'Cindelyn Gallant', 'Husband', '07583 588 628\r'),
(218, 'Iolanthe Carlick', 'Girlfriend', '07006 963 911\r'),
(219, 'Bastien Hollingshead', 'Girlfriend', '07250 548 384\r'),
(220, 'Alameda Iacobacci', 'Wife', '07244 048 879\r'),
(221, 'Welbie Hearon', 'Mother', '07174 233 681\r'),
(222, 'Ethelbert Warret', 'Boyfriend', '07813 571 441\r'),
(223, 'Alie Lutz', 'Civil Partner', '07880 354 813\r'),
(224, 'Alikee O\'Malley', 'Girlfriend', '07352 836 056\r'),
(225, 'Rustie Ridge', 'Husband', '07462 515 206\r'),
(226, 'Brien Narrie', 'Girlfriend', '07567 015 757\r'),
(227, 'Eduino Gainsboro', 'Civil Partner', '07169 495 661\r'),
(228, 'Cybil Bemrose', 'Mother', '07078 712 010\r'),
(229, 'Harlan Foxton', 'Husband', '07054 759 828\r'),
(230, 'Lanny Pendred', 'Boyfriend', '07493 098 720\r'),
(231, 'Cooper Sillars', 'Husband', '07228 676 244\r'),
(232, 'Reeba Lamartine', 'Mother', '07726 563 483\r'),
(233, 'Christoforo Decker', 'Husband', '07396 626 394\r'),
(234, 'Davey Gregan', 'Mother', '07204 221 186\r'),
(235, 'Cordy Sudell', 'Father', '07007 011 997\r'),
(236, 'Stearne Chaffer', 'Mother', '07640 868 506\r'),
(237, 'Rolph Reast', 'Wife', '07388 570 448\r'),
(238, 'Bren Epperson', 'Girlfriend', '07295 123 244\r'),
(239, 'Nola Yeowell', 'Mother', '07556 127 597\r'),
(240, 'Alberik Meaton', 'Boyfriend', '07785 086 128\r'),
(241, 'Joanie Scholtz', 'Husband', '07244 882 292\r'),
(242, 'Hiram Imrie', 'Husband', '07218 567 891\r'),
(243, 'Marianne Elion', 'Mother', '07866 004 620\r'),
(244, 'Aksel Ticehurst', 'Girlfriend', '07496 100 258\r'),
(245, 'Ryley Schieferstein', 'Mother', '07941 015 817\r'),
(246, 'Lucila Farlamb', 'Husband', '07665 666 934\r'),
(247, 'Levon Bratt', 'Boyfriend', '07123 594 714\r'),
(248, 'Sim Sacher', 'Father', '07962 176 107\r'),
(249, 'Janela Jeffels', 'Wife', '07747 406 557\r'),
(250, 'Bord Bartoletti', 'Mother', '07369 214 958\r'),
(251, 'Dougy Hamlen', 'Boyfriend', '07003 409 288\r'),
(252, 'Brnaby Snoday', 'Husband', '07570 183 764\r'),
(253, 'Ossie McBean', 'Civil Partner', '07137 684 264\r'),
(254, 'Jacki Tupling', 'Boyfriend', '07890 810 674\r'),
(255, 'Wain Corneck', 'Girlfriend', '07089 659 356\r'),
(256, 'Sara-ann Knoller', 'Civil Partner', '07189 537 844\r'),
(257, 'Sigmund McLafferty', 'Wife', '07996 723 103\r'),
(258, 'Giuseppe Petican', 'Wife', '07685 471 321\r'),
(259, 'Elisa McNamee', 'Boyfriend', '07173 106 494\r'),
(260, 'Gina Manueli', 'Boyfriend', '07640 597 771\r'),
(261, 'Ezmeralda Ertel', 'Boyfriend', '07929 318 804\r'),
(262, 'Lelia Heppenspall', 'Mother', '07865 407 286\r'),
(263, 'Darby Lias', 'Husband', '07194 892 472\r'),
(264, 'Samuele Solesbury', 'Wife', '07037 038 101\r'),
(265, 'Damara Dudny', 'Mother', '07425 771 845\r'),
(266, 'Lew O\'Dempsey', 'Mother', '07885 465 113\r'),
(267, 'Benni Botting', 'Wife', '07639 903 071\r'),
(268, 'Clotilda Blues', 'Girlfriend', '07754 815 231\r'),
(269, 'Hadleigh Twining', 'Civil Partner', '07302 069 966\r'),
(270, 'Aristotle MacGrath', 'Boyfriend', '07717 401 856\r'),
(271, 'Byran Greaser', 'Husband', '07556 017 337\r'),
(272, 'Zaneta Shrubb', 'Father', '07613 479 105\r'),
(273, 'Debera Itzkovich', 'Mother', '07196 432 406\r'),
(274, 'Joyann Spellessy', 'Husband', '07873 688 139\r'),
(275, 'Fiorenze Elvey', 'Father', '07902 274 458\r'),
(276, 'Marwin Haburne', 'Husband', '07467 024 579\r'),
(277, 'Hagen Lantoph', 'Wife', '07512 531 127\r'),
(278, 'Sydel Dexter', 'Father', '07795 010 970\r'),
(279, 'Shannon Purdy', 'Mother', '07885 597 859\r'),
(280, 'Morley Mastrantone', 'Mother', '07615 396 907\r'),
(281, 'Clyve Pedroli', 'Father', '07680 068 925\r'),
(282, 'Natassia Ludvigsen', 'Father', '07785 317 092\r'),
(283, 'Michale Kluger', 'Husband', '07685 967 303\r'),
(284, 'Caryl Coyle', 'Girlfriend', '07142 015 007\r'),
(285, 'Violet Doutch', 'Wife', '07346 373 537\r'),
(286, 'Zachariah Trassler', 'Girlfriend', '07670 477 662\r'),
(287, 'Justinn Maginot', 'Civil Partner', '07255 258 700\r'),
(288, 'Hurlee Bendle', 'Father', '07016 639 458\r'),
(289, 'Cathyleen Lindfors', 'Husband', '07119 333 689\r'),
(290, 'Staci Normadell', 'Girlfriend', '07035 352 138\r'),
(291, 'Willis Deary', 'Girlfriend', '07475 627 111\r'),
(292, 'Marlie Schwaiger', 'Civil Partner', '07055 302 769\r'),
(293, 'Zaria Tallet', 'Boyfriend', '07473 173 088\r'),
(294, 'Tam Howler', 'Boyfriend', '07107 484 803\r'),
(295, 'Francois Goodrick', 'Civil Partner', '07224 909 347\r'),
(296, 'Manfred Morston', 'Wife', '07857 880 717\r'),
(297, 'Ileana Wicken', 'Girlfriend', '07816 723 310\r'),
(298, 'Allie Hambleton', 'Wife', '07583 207 317\r'),
(299, 'Poul Poznan', 'Wife', '07353 747 279\r'),
(300, 'Chaddie Kelcey', 'Husband', '07135 140 819\r'),
(301, 'Llywellyn Buckley', 'Girlfriend', '07978 885 045\r'),
(302, 'Nickie Driscoll', 'Husband', '07163 688 713\r'),
(303, 'Tallie Huggon', 'Father', '07493 025 274\r'),
(304, 'Papageno Baiyle', 'Girlfriend', '07413 999 083\r'),
(305, 'Harper Crutchley', 'Father', '07349 039 768\r'),
(306, 'Nanete Hassard', 'Boyfriend', '07005 200 200\r'),
(307, 'Coleen Tolley', 'Father', '07220 519 362\r'),
(308, 'Mindy Gatch', 'Girlfriend', '07074 285 151\r'),
(309, 'Bald Bennoe', 'Wife', '07580 556 646\r'),
(310, 'Nancy Masterson', 'Father', '07031 588 061\r'),
(311, 'Augustine Corstorphine', 'Father', '07793 242 869\r'),
(312, 'Helen Gouda', 'Boyfriend', '07268 106 425\r'),
(313, 'Adolph Hedgeman', 'Wife', '07295 967 993\r'),
(314, 'Philis Gulleford', 'Father', '07838 716 945\r'),
(315, 'Selia Sopp', 'Husband', '07937 394 557\r'),
(316, 'Mile Scholler', 'Father', '07558 144 894\r'),
(317, 'Porter Nance', 'Civil Partner', '07097 155 888\r'),
(318, 'Alden Bourthoumieux', 'Boyfriend', '07435 864 662\r'),
(319, 'Christan Leupoldt', 'Husband', '07699 612 785\r'),
(320, 'Karel Gully', 'Father', '07088 509 851\r'),
(321, 'Waldemar Plunket', 'Civil Partner', '07417 261 693\r'),
(322, 'Brnaby Hilhouse', 'Girlfriend', '07346 042 351\r'),
(323, 'Nap Muzzlewhite', 'Wife', '07942 102 464\r'),
(324, 'Samaria Rennie', 'Civil Partner', '07366 799 382\r'),
(325, 'Friedrich Howsego', 'Father', '07787 734 288\r'),
(326, 'Ruggiero Kilgrove', 'Civil Partner', '07100 170 818\r'),
(327, 'Beitris Morison', 'Boyfriend', '07455 807 075\r'),
(328, 'Cassandre Attawell', 'Wife', '07612 472 814\r'),
(329, 'Mariejeanne Prendeville', 'Mother', '07474 771 437\r'),
(330, 'Baudoin Danigel', 'Girlfriend', '07315 752 509\r'),
(331, 'Cris Melladew', 'Mother', '07427 006 306\r'),
(332, 'Bradly Mitrovic', 'Husband', '07708 980 078\r'),
(333, 'Eunice Chmarny', 'Father', '07717 672 468\r'),
(334, 'Brear Kluge', 'Husband', '07267 762 763\r'),
(335, 'Melodee Sillars', 'Boyfriend', '07822 069 566\r'),
(336, 'Jennee Costock', 'Father', '07362 630 943\r'),
(337, 'Xaviera Chaves', 'Mother', '07054 012 385\r'),
(338, 'Caroline Brinicombe', 'Father', '07276 959 298\r'),
(339, 'Leoine Ayrs', 'Boyfriend', '07403 137 340\r'),
(340, 'Towny Deetch', 'Civil Partner', '07086 691 240\r'),
(341, 'Melinda Edelston', 'Mother', '07607 490 054\r'),
(342, 'Rozelle McCullouch', 'Husband', '07387 875 939\r'),
(343, 'Tootsie Holdey', 'Wife', '07329 818 995\r'),
(344, 'Cordey Peer', 'Girlfriend', '07645 326 285\r'),
(345, 'Bendicty Macek', 'Husband', '07726 134 897\r'),
(346, 'Nobie Scardifeild', 'Mother', '07035 382 913\r'),
(347, 'Haley Kellock', 'Girlfriend', '07487 727 188\r'),
(348, 'Clayton Segar', 'Mother', '07030 174 840\r'),
(349, 'Kristin Stanhope', 'Civil Partner', '07095 123 826\r'),
(350, 'Gabi Crooks', 'Father', '07021 173 423\r'),
(351, 'Caresa McGeown', 'Girlfriend', '07546 091 676\r'),
(352, 'Cully Galilee', 'Civil Partner', '07898 839 206\r'),
(353, 'Edi Haygreen', 'Husband', '07382 538 132\r'),
(354, 'Jacky Schwandt', 'Father', '07787 718 899\r'),
(355, 'Ardyce McAree', 'Mother', '07648 096 231\r'),
(356, 'Iseabal Leidl', 'Girlfriend', '07683 879 132\r'),
(357, 'Audrey Calafate', 'Boyfriend', '07905 196 224\r'),
(358, 'Charmain Ewbanck', 'Husband', '07876 106 377\r'),
(359, 'Florentia Cornelisse', 'Wife', '07465 428 558\r'),
(360, 'Sayre Faint', 'Girlfriend', '07320 940 413\r'),
(361, 'Libbey Van den Bosch', 'Civil Partner', '07623 894 854\r'),
(362, 'Galvan Kaszper', 'Girlfriend', '07814 082 485\r'),
(363, 'Joscelin Dumblton', 'Wife', '07719 695 663\r'),
(364, 'Joela Artois', 'Boyfriend', '07419 063 793\r'),
(365, 'Krishna Payle', 'Mother', '07834 640 631\r'),
(366, 'Hermine Sapsed', 'Boyfriend', '07245 144 587\r'),
(367, 'Carling Jell', 'Civil Partner', '07345 068 432\r'),
(368, 'Emmet Speedy', 'Husband', '07964 772 320\r'),
(369, 'Jeane Fleet', 'Girlfriend', '07452 139 490\r'),
(370, 'Fifi Lamputt', 'Father', '07477 278 621\r'),
(371, 'Sanders Firsby', 'Husband', '07483 322 111\r'),
(372, 'Marjorie Fraine', 'Wife', '07037 535 429\r'),
(373, 'Durand Klassman', 'Father', '07324 591 670\r'),
(374, 'Aksel Gallimore', 'Father', '07677 246 578\r'),
(375, 'Dorthy Savoury', 'Mother', '07911 839 364\r'),
(376, 'Jamison Richardet', 'Civil Partner', '07608 960 744\r'),
(377, 'Torrence Fowells', 'Civil Partner', '07620 698 046\r'),
(378, 'Dorise Polin', 'Civil Partner', '07030 945 316\r'),
(379, 'Alica Adnam', 'Civil Partner', '07339 364 526\r'),
(380, 'Merlina Adolthine', 'Civil Partner', '07498 555 907\r'),
(381, 'George Barczynski', 'Girlfriend', '07927 318 789\r'),
(382, 'Donella Scullard', 'Boyfriend', '07764 317 881\r'),
(383, 'Stearne Coveny', 'Girlfriend', '07552 624 180\r'),
(384, 'Brendis Saunder', 'Mother', '07747 163 685\r'),
(385, 'Justina Steinson', 'Girlfriend', '07978 286 641\r'),
(386, 'Duke Ruske', 'Father', '07775 640 640\r'),
(387, 'Meridith Lowes', 'Civil Partner', '07881 576 200\r'),
(388, 'Eilis Decent', 'Husband', '07190 067 060\r'),
(389, 'Marybeth Dibben', 'Boyfriend', '07888 296 305\r'),
(390, 'Dianne Pease', 'Wife', '07983 466 814\r'),
(391, 'Salem Courtliff', 'Boyfriend', '07239 492 326\r'),
(392, 'Joel Fairham', 'Girlfriend', '07080 664 959\r'),
(393, 'Hayden Monkley', 'Wife', '07958 131 810\r'),
(394, 'Odelle Godsmark', 'Wife', '07530 434 901\r'),
(395, 'Chandra Tiesman', 'Father', '07829 492 462\r'),
(396, 'Emera Yearne', 'Father', '07206 048 771\r'),
(397, 'Essa Sor', 'Husband', '07629 867 802\r'),
(398, 'Goldia Nisard', 'Girlfriend', '07475 211 884\r'),
(399, 'Katusha Kirkham', 'Civil Partner', '07216 578 917\r'),
(400, 'Scotti Nowill', 'Boyfriend', '07797 601 369\r'),
(401, 'Corabella Possek', 'Girlfriend', '07171 514 291\r'),
(402, 'Gabriela Wehden', 'Mother', '07904 464 506\r'),
(403, 'Frederique Wheatman', 'Civil Partner', '07068 255 984\r'),
(404, 'Delmore Borel', 'Civil Partner', '07050 832 727\r'),
(405, 'Giustina Stephen', 'Wife', '07101 430 354\r'),
(406, 'Gustave Benedikt', 'Husband', '07689 714 850\r'),
(407, 'Taylor Micka', 'Civil Partner', '07239 031 455\r'),
(408, 'Ulick Snyder', 'Father', '07013 596 878\r'),
(409, 'Sandye De Gouy', 'Husband', '07383 021 093\r'),
(410, 'Gideon Gillivrie', 'Boyfriend', '07257 411 126\r'),
(411, 'Jeremiah Pavlasek', 'Father', '07425 200 343\r'),
(412, 'Maritsa McGann', 'Wife', '07389 587 350\r'),
(413, 'Layne Laurenty', 'Boyfriend', '07925 739 484\r'),
(414, 'El Grishagin', 'Husband', '07888 438 593\r'),
(415, 'Lynsey Moraleda', 'Wife', '07652 112 844\r'),
(416, 'Alasteir McKeand', 'Wife', '07373 224 784\r'),
(417, 'Baxie De Rye Barrett', 'Wife', '07594 266 644\r'),
(418, 'Nikaniki Stenhouse', 'Husband', '07585 388 400\r'),
(419, 'Tildy Donett', 'Civil Partner', '07996 433 549\r'),
(420, 'Gerik Graeser', 'Girlfriend', '07753 745 592\r'),
(421, 'Verney Essam', 'Husband', '07173 823 511\r'),
(422, 'Claudetta Plaistowe', 'Civil Partner', '07358 746 653\r'),
(423, 'Erhart Husset', 'Boyfriend', '07683 714 091\r'),
(424, 'Nicol Dockray', 'Wife', '07174 952 329\r'),
(425, 'Reinold Kaubisch', 'Husband', '07005 138 853\r'),
(426, 'Leshia Allcorn', 'Mother', '07341 771 237\r'),
(427, 'Reeta Feary', 'Wife', '07985 842 262\r'),
(428, 'Rivy Gensavage', 'Husband', '07544 911 166\r'),
(429, 'Harmon Gindghill', 'Civil Partner', '07285 352 836\r'),
(430, 'Waylan Kochlin', 'Boyfriend', '07629 713 818\r'),
(431, 'Amabelle Ferreiro', 'Wife', '07395 862 130\r'),
(432, 'Lesya Phebey', 'Wife', '07741 907 270\r'),
(433, 'Daloris Lanon', 'Mother', '07102 109 240\r'),
(434, 'Bernadene Lowey', 'Wife', '07937 182 672\r'),
(435, 'Peyton MacShirie', 'Girlfriend', '07219 511 447\r'),
(436, 'Jabez Yewman', 'Father', '07280 779 671\r'),
(437, 'Valaree Treadgold', 'Civil Partner', '07427 564 348\r'),
(438, 'Bondie Schruyers', 'Father', '07868 628 411\r'),
(439, 'Delainey Benedtti', 'Mother', '07621 668 278\r'),
(440, 'Eimile Vial', 'Husband', '07477 622 496\r'),
(441, 'Malory Hawes', 'Husband', '07066 178 667\r'),
(442, 'Lizbeth Curbishley', 'Father', '07104 138 411\r'),
(443, 'Randall Corriea', 'Husband', '07654 630 110\r'),
(444, 'Shelly Gimblet', 'Boyfriend', '07107 706 065\r'),
(445, 'Augustus Goodluck', 'Mother', '07997 004 063\r'),
(446, 'Nariko Illsley', 'Civil Partner', '07008 281 309\r'),
(447, 'Caz Dartnell', 'Mother', '07448 651 046\r'),
(448, 'Ramsey Denacamp', 'Boyfriend', '07342 317 379\r'),
(449, 'Terrijo Piatto', 'Husband', '07870 877 830\r'),
(450, 'Diannne Streight', 'Boyfriend', '07974 403 769\r'),
(451, 'Marylinda Titta', 'Girlfriend', '07410 675 062\r'),
(452, 'Bryan Shawdforth', 'Father', '07939 930 407\r'),
(453, 'Charla Crickmore', 'Boyfriend', '07512 743 229\r'),
(454, 'Leroi Dingivan', 'Husband', '07244 918 390\r'),
(455, 'Budd Follacaro', 'Girlfriend', '07569 513 210\r'),
(456, 'Dante Snozzwell', 'Boyfriend', '07066 007 108\r'),
(457, 'Adam Roderighi', 'Husband', '07503 037 843\r'),
(458, 'Madonna McCague', 'Wife', '07187 549 944\r'),
(459, 'Rafaellle Tweedlie', 'Wife', '07036 754 544\r'),
(460, 'Ilsa McAusland', 'Boyfriend', '07064 930 835\r'),
(461, 'Vilhelmina Wrangle', 'Mother', '07750 131 976\r'),
(462, 'Fidela Heaviside', 'Wife', '07081 377 359\r'),
(463, 'Phillie Eles', 'Husband', '07925 034 405\r'),
(464, 'Katee Dilrew', 'Father', '07612 660 166\r'),
(465, 'Melody Brotherwood', 'Wife', '07735 358 950\r'),
(466, 'Colette Reisk', 'Husband', '07457 814 451\r'),
(467, 'Hamnet Hamly', 'Wife', '07692 458 187\r'),
(468, 'Abbey Waryk', 'Boyfriend', '07260 273 133\r'),
(469, 'Pattie Bohl', 'Girlfriend', '07158 470 617\r'),
(470, 'Izzy Ahlf', 'Father', '07044 089 640\r'),
(471, 'Anastasia Camamile', 'Civil Partner', '07043 627 535\r'),
(472, 'Rand Madrell', 'Civil Partner', '07252 015 009\r'),
(473, 'Zaneta Deddum', 'Mother', '07529 897 607\r'),
(474, 'Elston Loins', 'Girlfriend', '07930 606 296\r'),
(475, 'Arlie Korfmann', 'Husband', '07348 062 445\r'),
(476, 'Madelaine Hutt', 'Mother', '07734 801 502\r'),
(477, 'Leon McCotter', 'Father', '07126 636 219\r'),
(478, 'Glenden Livett', 'Civil Partner', '07613 591 203\r'),
(479, 'Ferrell Scruton', 'Boyfriend', '07455 760 917\r'),
(480, 'Stepha Doohan', 'Husband', '07728 862 325\r'),
(481, 'Sisely Castelin', 'Mother', '07152 080 965\r'),
(482, 'Northrup Pittendreigh', 'Mother', '07603 027 379\r'),
(483, 'Kev Bradmore', 'Boyfriend', '07180 333 916\r'),
(484, 'Wallache Ropkins', 'Girlfriend', '07410 226 285\r'),
(485, 'Agatha Nulty', 'Girlfriend', '07895 871 178\r'),
(486, 'Tobe Vazquez', 'Boyfriend', '07936 699 391\r'),
(487, 'Umberto Mulrooney', 'Boyfriend', '07291 039 769\r'),
(488, 'Creighton Hinzer', 'Girlfriend', '07394 851 273\r'),
(489, 'Duane Mitton', 'Civil Partner', '07087 447 204\r'),
(490, 'Kane Piers', 'Husband', '07453 022 869\r'),
(491, 'Nonie Ledgard', 'Girlfriend', '07316 951 272\r'),
(492, 'Kass Haysman', 'Girlfriend', '07480 332 736\r'),
(493, 'Marsh Abilowitz', 'Wife', '07026 832 505\r'),
(494, 'Ahmad Muge', 'Boyfriend', '07028 898 207\r'),
(495, 'Der Merner', 'Girlfriend', '07472 485 627\r'),
(496, 'Sallyanne Minchinton', 'Father', '07491 768 068\r'),
(497, 'Grove Spellissy', 'Husband', '07555 870 467\r'),
(498, 'Boony Hardwell', 'Wife', '07211 259 256\r'),
(499, 'Shannon Kesteven', 'Father', '07543 934 498\r'),
(500, 'Danny Heinsen', 'Father', '07194 408 632');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `dob` date NOT NULL,
  `nin` varchar(20) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `emergency_contact_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `name`, `address`, `salary`, `dob`, `nin`, `department_id`, `emergency_contact_id`, `manager_id`) VALUES
('00-4334715', 'Stormie Lowndes', '280 Thompson Plaza', 66017.87, '1981-02-06', 'xn991742p', 1, 471, 8),
('01-5576008', 'Jaquenetta Rankin', '3249 Dahle Plaza', 42698.62, '1981-03-26', 'ir187391u', 3, 406, 1),
('01-6146269', 'Krispin Eastmond', '584 Twin Pines Place', 46304.52, '1969-06-13', 'oc293284f', 4, 395, 11),
('01-9065592', 'Catina Josovitz', '09 Center Alley', 78353.10, '1989-07-19', 'gl907590t', 4, 286, 9),
('01-9983285', 'Evvy Burrill', '18 Pennsylvania Crossing', 65007.09, '1987-05-21', 'pz402630g', 1, 390, 16),
('02-1151200', 'Bax Di Gregorio', '34063 Fordem Way', 76631.69, '1962-04-12', 'kt775367m', 4, 69, 10),
('02-4109274', 'Efren Sealove', '7623 Lien Center', 59217.95, '1981-03-29', 'jk980246h', 4, 244, 8),
('02-6214516', 'Merrill Joust', '75 Portage Center', 51515.84, '1967-05-16', 'wa104983f', 4, 431, 9),
('02-9566746', 'Dud Firman', '467 Lighthouse Bay Junction', 35155.65, '1979-02-19', 'xs400698x', 3, 142, 6),
('03-2826761', 'Pyotr Ingham', '81 John Wall Junction', 38532.11, '1987-07-25', 'ys435194s', 3, 252, 4),
('03-3544565', 'Feodor Inge', '5 Knutson Plaza', 91614.47, '1994-05-30', 'en390360s', 3, 41, 6),
('04-1386775', 'Omero Hurles', '878 Vidon Point', 85092.27, '2003-05-10', 'zz594734b', 4, 207, 7),
('04-2608361', 'Homer Bresman', '84058 Hayes Parkway', 66224.45, '1981-07-16', 'ku802868l', 4, 297, 9),
('04-2758260', 'Simeon Dilworth', '749 Summit Circle', 63320.02, '1983-08-20', 'ql275702i', 4, 134, 8),
('04-2798023', 'Cinda Plesing', '57518 Chinook Park', 49509.39, '1967-07-23', 'bl772452l', 3, 401, 5),
('05-1128789', 'Paulita Casewell', '18 Riverside Trail', 73099.76, '1972-11-19', 'ds948250k', 4, 45, 2),
('05-1945849', 'Cherilyn Jepps', '062 Nevada Parkway', 85550.33, '2001-10-03', 'xz796669h', 4, 16, 16),
('05-3647243', 'Yank Vasilyonok', '5 Debs Alley', 38871.26, '1992-02-13', 'kc608204k', 3, 475, 6),
('05-5059849', 'Giffard Endecott', '13672 Caliangt Terrace', 30809.16, '1995-05-01', 'tu153415t', 3, 364, 10),
('05-5646283', 'Karole Roderighi', '6281 Hovde Road', 83507.63, '1994-04-15', 'np061992l', 4, 354, 1),
('05-9682452', 'Dorothee Pennell', '90 Rutledge Circle', 44159.39, '1979-06-15', 'bo740928h', 4, 394, 9),
('06-0280761', 'Odey Smeeth', '46584 Kedzie Point', 97871.00, '2000-05-25', 'rz638367h', 1, 78, 2),
('06-2857563', 'Osgood Sutherby', '88855 Merrick Road', 27045.62, '1965-08-18', 'ya877759r', 2, 274, 6),
('06-3396053', 'Hayes Butting', '120 Lotheville Pass', 50125.67, '2004-12-18', 'jm300330r', 3, 143, 10),
('06-3776558', 'Kristofer Janson', '18140 Straubel Road', 94483.61, '1983-12-05', 'pw205885r', 3, 498, 3),
('06-3850682', 'Celinda Joberne', '5 Jana Way', 61612.72, '1990-09-26', 'lw782748u', 4, 429, 6),
('06-7381402', 'Pansy Benasik', '777 Welch Junction', 41672.28, '1995-11-28', 'rb727027l', 4, 335, 10),
('06-9710935', 'Wileen Elwell', '82 Tennyson Alley', 78678.52, '2001-04-27', 'no969473z', 3, 35, 5),
('07-4517183', 'Rochell O\'Doohaine', '1802 Hayes Court', 99999999.99, '1966-11-18', 'rz111360g', 3, 9, 12),
('07-4724394', 'C1istiane Barnes', '2958 Butterfield Point', 51949.10, '1962-06-11', 'vw694872r', 3, 311, 8),
('08-4428147', 'Daryl Chartman', '2413 Ramsey Avenue', 58749.21, '1997-07-29', 'ad905076o', 3, 278, 1),
('08-5459846', 'Leola Dayly', '1 Tony Avenue', 43761.91, '2002-07-19', 'xz369649i', 4, 422, 7),
('08-7213723', 'Dorie Brazener', '7720 Miller Way', 14357.12, '1968-01-01', 'qa101983v', 4, 465, 10),
('09-2857613', 'Faunie Testo', '903 Pawling Terrace', 42813.15, '1964-05-13', 'yh126921t', 4, 161, 16),
('09-4017521', 'Flemming Arnoll', '2 Eggendart Crossing', 22873.04, '2003-10-30', 'sb614856m', 1, 334, 5),
('09-4856118', 'Sofie Cavaney', '12677 Nort1idge Alley', 19096.73, '1982-01-13', 'hg982259y', 4, 76, 6),
('09-8147999', 'Alfonso Pirdue', '201 Garrison Crossing', 60175.71, '1984-09-13', 'pq325071u', 3, 358, 4),
('10-1743239', 'Clareta Bamlet', '1038 Bellgrove Parkway', 46542.99, '1971-05-24', 'tx858508r', 3, 315, 2),
('10-4168432', 'Robinetta Triswell', '5 Independence Trail', 74033.43, '1988-11-13', 'eu934314q', 3, 25, 16),
('10-6127924', 'Joshuah Faircliffe', '8 Merry Center', 30666.21, '1978-03-01', 'ft026339d', 3, 54, 6),
('10-6321236', 'Janot Kleinsinger', '4324 Huxley Point', 59407.49, '1964-03-19', 'vw739034c', 1, 191, 3),
('10-6680137', 'Burnaby McGreay', '55 Hansons Center', 54552.70, '1972-08-01', 'xz020089e', 4, 150, 9),
('10-8148353', 'Frannie Pedron', '85 Meadow Valley Avenue', 20034.33, '1964-04-11', 'kw816523w', 1, 301, 13),
('10-9736161', 'Pet Littrik', '19 Haas Pass', 99117.25, '1989-08-17', 'fa725896g', 4, 165, 6),
('11-0990160', 'Rhea Saffle', '77051 Shasta Circle', 37907.97, '2003-04-24', 'el763944v', 3, 369, 6),
('11-4556284', 'Joceline Oats', '8 East Pass', 19329.56, '1995-09-01', 'iu795663w', 3, 329, 5),
('11-5411031', 'Joaquin Eringey', '890 Brickson Park Circle', 76521.21, '1962-05-28', 'di653042t', 4, 186, 8),
('11-6489646', 'Alfie Glasebrook', '5942 Del Mar Court', 24207.50, '2003-01-10', 'kc363601g', 1, 162, 1),
('11-9162644', 'Ninnette Reach', '018 2nd Parkway', 33411.86, '1983-11-29', 'qi586048l', 4, 73, 6),
('12-0104092', 'Gerladina MacGinney', '270 Melody Park', 26606.61, '1996-06-21', 'pc545418r', 3, 164, 10),
('12-5128654', 'Hadlee Stealey', '0 4th Court', 52510.07, '1978-08-20', 'tf577069v', 3, 24, 8),
('12-6888959', 'Benoit Collman', '827 Erie Junction', 74922.96, '1989-10-02', 'yc393041q', 3, 178, 13),
('12-8760096', 'Mallorie De Brett', '1 Lillian Drive', 27166.70, '1960-11-09', 'gb976841w', 3, 127, 16),
('13-8722134', 'Adler Wheeliker', '018 Lakewood Parkway', 97905.35, '1967-01-15', 'gd959536a', 3, 320, 8),
('13-9234597', 'Katya Ilewicz', '68697 Sutteridge Road', 62528.81, '1992-08-15', 'he783674o', 3, 183, 8),
('14-0432288', 'Marius Brosnan', '94941 Fairfield Terrace', 35816.39, '1963-12-30', 'fp824869e', 4, 200, 4),
('14-1209073', 'Cheri Cancellieri', '97763 Anhalt Way', 62678.28, '1974-02-08', 'fj377449j', 4, 36, 4),
('14-2911172', 'Koren McCluskey', '6677 Evergreen Plaza', 73800.93, '1972-07-18', 'ox915931w', 3, 237, 11),
('14-4001908', 'Wilmette Jerrom', '6 Monica Way', 34082.14, '1980-05-31', 'gb391445q', 3, 473, 11),
('14-6532726', 'Salim Cator', '74 Lyons Place', 40060.04, '1978-06-05', 'os724826w', 3, 450, 12),
('14-9076003', 'Padgett Casel', '3552 Towne Road', 61058.36, '1990-11-21', 'ws394988s', 4, 108, 6),
('15-4783339', 'Ermengarde Breitling', '2376 Brentwood Place', 18516.54, '1967-03-01', 'qh838641y', 1, 250, 5),
('15-5837614', 'Loren Kupper', '24 West Plaza', 92010.30, '1995-02-25', 'tx310999b', 4, 66, 6),
('15-6949928', 'Dominique Causon', '2 Mallard Way', 61194.11, '1976-04-10', 'jz826946h', 4, 276, 7),
('16-0283796', 'Delphinia Skelhorn', '115 Cody Point', 91026.23, '1981-11-29', 'mx935884p', 4, 48, 8),
('16-1242322', 'Gris Elington', '12 School Way', 40776.94, '1974-09-28', 'sp696523t', 4, 75, 9),
('17-1342407', 'Mala Eyree', '6 Dorton Circle', 24532.92, '1967-12-19', 'kf326923s', 4, 97, 5),
('17-1925809', 'Donella Chinery', '3 Tennessee Street', 31438.66, '2001-08-10', 'xr596082y', 3, 173, 3),
('17-3967296', 'Tiffany Wessing', '422 Darwin Lane', 69965.03, '1960-02-21', 'fi082187y', 3, 413, 2),
('17-5831110', 'Viviana Dreschler', '3 Oak Terrace', 56587.83, '1973-11-18', 'vx435216w', 4, 85, 7),
('18-0534773', 'Alix Ambrogelli', '60 North Place', 62229.76, '1982-12-27', 'ny144248g', 3, 124, 4),
('18-3863597', 'Tamiko Holton', '49 Cody Lane', 97318.42, '1987-04-16', 'dm359618l', 3, 277, 13),
('18-3911956', 'Rafferty Edowes', '96 Helena Crossing', 41496.02, '1981-06-26', 'yk522444d', 1, 136, 4),
('18-6142811', 'Starr Akhurst', '42 Golf Course Hill', 16005.59, '1985-07-22', 'qj120357r', 3, 445, 7),
('18-9171336', 'Sallie Hardwell', '6 Golf View Pass', 80829.14, '1977-05-01', 'yx656704n', 3, 493, 8),
('19-0713712', 'Georg De Gouy', '06 Hermina Terrace', 37144.20, '1969-12-24', 'vi744437v', 3, 339, 7),
('19-1079892', 'Charline Saggers', '32 Burning Wood Alley', 85860.59, '2003-11-30', 'uw710251u', 3, 208, 16),
('19-1277494', 'Perice Abramovitz', '2354 Jenifer Place', 55612.48, '1965-08-16', 'bs437833j', 3, 86, 9),
('19-6732633', 'Ferrell Lages', '39705 Goodland Center', 63515.05, '1994-05-22', 'xb032437g', 4, 448, 16),
('20-2758343', 'Harrison Waller-Bridge', '73899 Sachtjen Alley', 39846.48, '1977-01-21', 'dw797814s', 1, 44, 2),
('20-3044693', 'Raina Yearn', '7 Havey Point', 91757.16, '1988-02-15', 'uz970481u', 4, 338, 16),
('20-5440287', 'Doralyn Freemantle', '33 Gateway Crossing', 36023.61, '2003-06-15', 'oj166622v', 4, 106, 3),
('20-6300983', 'Juliann Profit', '047 Mandrake Drive', 59829.91, '2000-11-21', 'bx776119o', 4, 351, 8),
('20-7194686', 'Carolin Jagson', '57891 Bultman Circle', 56278.56, '1988-02-03', 'yb039141a', 1, 497, 16),
('20-7886428', 'Dael Confort', '0533 Grasskamp Park', 56391.77, '1977-10-13', 'ee121177l', 3, 259, 7),
('20-9516100', 'Cordula Redsull', '3 Sullivan Lane', 70412.31, '1964-08-22', 'mu901992i', 4, 172, 7),
('21-1787461', 'Stefa Stringman', '3 Lake View Lane', 76206.39, '1975-11-13', 'qn206371i', 4, 144, 3),
('21-2689388', 'Mildrid Ethington', '4 Buhler Pass', 18703.01, '1979-05-27', 'kp709951v', 3, 344, 5),
('21-3155551', 'Alaric Santarelli', '8757 Thompson Trail', 24449.19, '1963-05-31', 'hn280217c', 3, 373, 6),
('21-4089887', 'Corette Mourbey', '246 Wayridge Hill', 76423.32, '1964-11-07', 'km813203w', 4, 374, 9),
('22-0788973', 'Kalvin Corrado', '770 Fallview Trail', 59688.79, '1974-01-09', 'ei247057v', 4, 333, 6),
('22-2051613', 'Alys Feye', '000 Grayhawk Court', 50021.50, '1969-07-25', 'rs859776q', 3, 383, 10),
('22-3052971', 'Giorgia McCrohon', '80323 Myrtle Court', 91699.68, '1965-10-01', 'jk018371c', 4, 128, 15),
('22-3708071', 'Rab Feast', '9503 Buell Drive', 30397.56, '1960-01-21', 'rb499211c', 1, 1, 6),
('22-6627032', 'Brynna Dyble', '0 Bonner Pass', 23496.30, '1967-01-02', 'al340446b', 3, 197, 3),
('22-7191567', 'Goddard Bagot', '362 Coleman Way', 90643.98, '1999-12-02', 'lx057194p', 4, 411, 3),
('22-9529013', 'Reginauld Oak', '8 Pleasure Drive', 80693.80, '2000-07-29', 'ju954932e', 3, 57, 8),
('24-4585192', 'Elvira Vinson', '37 Kipling Lane', 91216.82, '1997-02-13', 'sa107205q', 3, 446, 16),
('24-4677621', 'Derril Scaife', '4 Tony Street', 82281.31, '1977-11-17', 'qb596623c', 3, 77, 7),
('24-6851371', 'Puff Speeding', '22016 New Castle Hill', 78841.84, '1984-01-15', 'mh954487u', 4, 157, 2),
('24-9067553', 'Lief Schimann', '4786 Rowland Trail', 87146.69, '1980-07-20', 'xo554182r', 3, 212, 16),
('24-9840403', 'Ashley Barcke', '7 Eastlawn Alley', 33391.07, '1990-08-24', 'ww328815i', 3, 356, 3),
('25-4103329', 'Elfrieda Slessar', '5536 Stone Corner Terrace', 64639.39, '2005-07-26', 'ri926857q', 4, 417, 5),
('25-6187206', 'Farlay Haughan', '99 Schurz Plaza', 63905.08, '2003-11-23', 'fg558529z', 4, 409, 8),
('25-9736142', 'Aurore Neilson', '9 Darwin Parkway', 53082.75, '1996-10-09', 'bi255825p', 3, 236, 12),
('26-0938951', 'Fabe Lief', '94 Gerald Crossing', 56639.65, '1966-03-08', 'cc841112d', 4, 483, 6),
('26-3324931', 'Nelle Thams', '04 Weeping Birch Junction', 12571.28, '1972-08-07', 'qj455525d', 4, 100, 3),
('26-9050326', 'Dode Hurtado', '12322 Cottonwood Point', 40814.61, '2004-06-13', 'lm182202b', 4, 352, 8),
('27-1540713', 'Raphaela Symon', '41109 Stephen Plaza', 72118.42, '1960-06-09', 'ry550614d', 4, 330, 6),
('27-8037561', 'Junina McAirt', '45 Ramsey Junction', 39500.15, '1966-11-10', 'cx516631k', 3, 337, 6),
('27-8094243', 'Rhodia Realy', '2748 Wayridge Junction', 54901.54, '1992-12-21', 'sh464311u', 3, 271, 4),
('27-8387260', 'Annetta Cock', '76245 Hoffman Court', 90559.92, '1966-04-13', 'vd818340c', 4, 256, 9),
('28-4979315', 'Sashenka Artin', '71 Talmadge Drive', 36543.57, '1984-06-29', 'tp697018e', 4, 155, 16),
('28-7012669', 'Rahel Gallo', '798 Karstens Parkway', 60391.38, '1971-08-18', 'kz848071o', 1, 494, 5),
('28-7818998', 'Alfi MacFadzean', '6 Old Shore Center', 45825.46, '1990-08-28', 'tp307139n', 3, 447, 9),
('29-2364794', 'Guido Hoopper', '51 Prairieview Alley', 78530.16, '1986-05-25', 'in158664i', 2, 392, 8),
('29-2785103', 'Agnes Dendon', '158 Twin Pines Crossing', 17734.18, '2000-01-06', 'kk792060s', 3, 440, 9),
('29-5105992', 'Borg Szymanzyk', '41 Amoth Crossing', 77828.80, '1988-11-19', 'hm134578n', 4, 72, 5),
('29-5209106', 'Mellisa Mapam', '65 Maryland Junction', 85398.19, '1984-05-17', 'wn277158x', 3, 219, 10),
('29-6350132', 'Pietro Ochterlony', '75 Weeping Birch Junction', 51249.75, '1995-03-26', 'fv388894k', 3, 291, 5),
('29-6571924', 'Arne Bosson', '77803 Messerschmidt Park', 73371.57, '1971-01-11', 'ux813250n', 3, 51, 6),
('29-6656577', 'Lynne Muccino', '65 Northland Avenue', 63251.24, '2001-06-13', 'rg151568q', 4, 126, 6),
('29-7832408', 'Lexine Joney', '73817 Muir Court', 19232.41, '1996-02-27', 'pk696816m', 3, 19, 15),
('30-1322103', 'Earl Wagerfield', '34 Lillian Center', 91770.28, '1970-06-08', 'zw251674d', 3, 14, 9),
('30-2374884', 'Felicdad Escala', '26 Holy Cross Place', 22260.80, '1995-09-15', 'ei636866y', 4, 30, 14),
('30-3058947', 'Hettie Broadbent', '5 Rowland Road', 74439.57, '1969-03-22', 'an167975t', 3, 60, 5),
('30-7334418', 'Lorita Fere', '9899 Johnson Park', 64340.92, '1995-04-18', 'yh523785h', 3, 263, 5),
('30-8456021', 'Tandi Dmitrovic', '5447 Lyons Center', 99223.26, '1997-06-28', 'sr314203n', 3, 359, 8),
('30-8953969', 'Will Craik', '50 Florence Junction', 85698.44, '1995-07-30', 'rk384949o', 4, 215, 7),
('31-5831645', 'Sofia Skoof', '47354 Clyde Gallagher Point', 58714.12, '1979-05-27', 'va211893v', 4, 307, 12),
('31-7111614', 'Artemis Adami', '99842 Spenser Point', 58500.47, '1996-04-12', 'bp682069w', 4, 355, 3),
('31-7167962', 'Emanuele Strickland', '3772 Dawn Drive', 15549.15, '1991-03-15', 'qy726870d', 1, 15, 16),
('31-8312411', 'Georgine Winspare', '2732 Cottonwood Way', 50921.83, '1961-03-01', 'eo514879y', 4, 139, 1),
('31-9709677', 'Heda Cathersides', '7 Laurel Park', 32079.57, '1964-03-19', 'fp198238e', 4, 179, 7),
('32-3604971', 'Sterling Elgood', '428 8th Point', 14162.95, '1977-08-03', 'eh265089x', 4, 251, 11),
('32-4834306', 'Andra Bamfield', '9799 Russell Crossing', 59706.55, '1989-04-17', 'rw267230v', 4, 145, 5),
('32-6251861', 'Frederic Ginnaly', '2 Drewry Circle', 98924.54, '1961-09-11', 'rs647299i', 3, 449, 5),
('33-0071114', 'Nola Wilcox', '7055 Sout1idge Drive', 61500.70, '1972-08-08', 'aq503711l', 1, 476, 13),
('33-0489054', 'Onfre Woolmore', '7868 Pearson Hill', 61377.23, '1971-12-06', 'xa033094e', 3, 129, 8),
('33-1261585', 'Bary Skoof', '20630 Tony Avenue', 95728.74, '1981-11-04', 'fh221614b', 4, 267, 3),
('33-1897506', 'Verla Seacroft', '0134 Fieldstone Trail', 52928.18, '1987-06-04', 'un133384d', 2, 198, 8),
('33-5159037', 'Ina Farrans', '65968 Fairview Center', 67306.02, '1985-07-31', 'vk466721d', 3, 195, 5),
('33-7183053', 'Lucinda McGhee', '625 Mitchell Point', 53031.50, '2005-08-19', 'nn735991o', 1, 140, 8),
('33-7614004', 'Modesty Chicchelli', '74 Bashford Pass', 23376.55, '1973-06-04', 'zz664726s', 3, 46, 1),
('34-2543597', 'Rodina Ofener', '5556 Schmedeman Court', 92118.32, '1982-03-23', 'dy170889s', 3, 132, 7),
('34-2817296', 'Jemmy Levens', '298 Elka Alley', 31521.70, '1984-11-07', 'dw387671h', 3, 499, 1),
('34-4740678', 'Germain Stockow', '102 Haas Junction', 56278.62, '1971-08-02', 'yo417120d', 3, 346, 1),
('34-8601206', 'Dulcia Antonutti', '9 Kingsford Plaza', 61015.90, '1989-05-15', 'za364662q', 4, 83, 6),
('34-8695852', 'Reg Lanphier', '049 Cambridge Road', 93925.10, '1980-02-03', 'lr289379r', 1, 176, 12),
('35-2689059', 'Junette Hackforth', '74801 Lakewood Trail', 36180.91, '1972-05-05', 'pr407605t', 4, 255, 9),
('35-6685131', 'Shaw Brandsen', '55545 Toban Trail', 47949.95, '1961-06-10', 'ps562104c', 4, 103, 1),
('35-7212754', 'Dorian Claringbold', '7422 Crownhardt Avenue', 13347.31, '1976-03-06', 'uw834458r', 2, 177, 12),
('35-8208617', 'Sayre Simnel', '761 Kennedy Lane', 72894.00, '1990-07-30', 'jr596419t', 3, 20, 3),
('36-1132600', 'Danyette Kendrew', '1 Karstens Point', 98386.60, '1972-05-03', 'dc106173c', 4, 458, 3),
('36-1480567', 'Skell Swainson', '31 Sundown Terrace', 80604.76, '1975-12-20', 'ib067151y', 1, 239, 6),
('36-4190617', 'Glyn Canet', '565 Glendale Park', 54281.26, '2002-10-27', 'gr760688u', 4, 323, 12),
('36-4580826', 'Olivia MacPhee', '09 Saint Paul Point', 85391.76, '1988-03-15', 'dj312271a', 4, 80, 8),
('36-6348131', 'Tedda Daggett', '12 Lindbergh Place', 25694.32, '1972-07-22', 'bm829464z', 3, 114, 16),
('36-6943031', 'Wolfgang Frake', '97152 Waubesa Center', 21505.69, '1984-03-02', 'op535073z', 3, 408, 7),
('36-7073092', 'Thelma Wilkie', '113 Badeau Plaza', 32280.23, '1997-03-05', 'bl221585z', 3, 17, 8),
('37-0478226', 'Jenn Alsina', '281 Marquette Drive', 40753.20, '1981-05-14', 'pw357899l', 3, 233, 16),
('37-1673392', 'Constantine Gilfillan', '87 Washington Junction', 32245.83, '2001-04-26', 'ct112101i', 1, 416, 7),
('37-6605556', 'Jacobo Pashba', '101 Linden Crossing', 67037.04, '1964-06-22', 'vg977309d', 4, 398, 8),
('37-7900056', 'Victoir Loveitt', '7 Judy Parkway', 24486.52, '1996-06-04', 'vd479897l', 3, 477, 5),
('37-8247167', 'Elaina Ramplee', '9 Merry Hill', 70979.93, '1990-09-14', 'eo273727q', 3, 462, 6),
('38-0609594', 'Bev Yakunikov', '50563 Waubesa Point', 69660.66, '2004-03-29', 'ku940218f', 3, 238, 7),
('38-1272080', 'Mozes Fishleigh', '2636 Burning Wood Crossing', 42919.29, '1997-02-05', 'zx396808c', 3, 218, 6),
('38-1884801', 'Valida Bootes', '06 Bluejay Way', 75580.43, '1966-10-05', 'hy568138e', 4, 321, 6),
('38-2126707', 'Vinni Champneys', '38416 Susan Plaza', 35513.16, '1974-07-08', 'vn364397s', 3, 405, 4),
('38-3647372', 'Carey Netley', '279 Helena Place', 67072.08, '1966-04-18', 'lb767754c', 4, 258, 16),
('38-4369228', 'Merwin Partener', '29021 Clemons Terrace', 13685.06, '1993-12-07', 'ef765749d', 4, 324, 3),
('38-5473326', 'Feodora Benning', '620 Sachtjen Center', 89549.75, '1972-10-09', 'kz832424w', 3, 300, 11),
('38-8885296', 'Ginelle Morgon', '411 2nd Pass', 84423.53, '1968-01-26', 'ps334310v', 3, 357, 9),
('38-9798664', 'Minor Bennion', '9756 Cottonwood Lane', 17020.16, '1962-01-10', 'fl067205y', 4, 135, 7),
('39-1227728', 'Tandy Goodbourn', '719 Sloan Drive', 47852.85, '1991-12-05', 'go119787t', 1, 466, 5),
('39-4788866', 'Phillida Musicka', '111 Twin Pines Center', 84543.42, '1975-07-21', 'pg674068r', 3, 62, 8),
('40-0786243', 'Oswell Beddingham', '12989 Village Green Street', 97980.89, '1987-12-26', 'lh106861m', 1, 31, 7),
('40-1037983', 'Odelinda Wardingly', '069 Mesta Road', 90622.48, '1961-04-07', 'bk920804k', 4, 230, 10),
('40-1136806', 'Julio Featherstonhalgh', '35498 Jackson Pass', 89162.28, '1974-05-17', 'qr454157y', 4, 400, 9),
('40-2208062', 'Sonny Tabrett', '25326 Briar Crest Hill', 62818.83, '1982-01-27', 'zs026946u', 3, 102, 5),
('40-5288701', 'Ame Balser', '2282 Sutteridge Lane', 71557.80, '1981-03-31', 'dt545040m', 3, 3, 9),
('40-6943405', 'Charlena Marques', '2800 Dahle Avenue', 83307.32, '2000-01-05', 'vz886203m', 4, 451, 16),
('41-1429269', 'Jacki Rumin', '84 Kipling Parkway', 81648.46, '2004-04-27', 'rp562470q', 4, 482, 6),
('41-3216938', 'Joeann Beckerleg', '6442 Dennis Street', 56988.53, '1969-07-24', 'zi901356n', 3, 225, 7),
('41-3268639', 'Sherlocke Cornner', '00811 Morning Crossing', 43444.78, '1966-11-09', 'uo254689s', 4, 341, 12),
('41-3659990', 'Ruperta Stobie', '2825 Pepper Wood Center', 83681.20, '1965-08-03', 'qf137469l', 3, 5, 6),
('41-3975053', 'Felipe Ferschke', '5508 Hauk Terrace', 63359.81, '1967-05-17', 'pu346240t', 1, 96, 10),
('41-6555988', 'Marwin Raybould', '925 Novick Lane', 51081.29, '1980-02-09', 'dp016938u', 1, 47, 9),
('41-9319442', 'Luisa Burtonwood', '554 Marcy Crossing', 48099.78, '1992-06-01', 'ji602428k', 3, 261, 16),
('41-9645109', 'Merrel Miklem', '00 Marcy Trail', 39131.10, '1969-10-03', 'ls403208x', 4, 488, 3),
('42-0131259', 'Kelsi Cunney', '5 Toban Terrace', 92101.67, '2003-07-13', 'nm508435w', 4, 328, 16),
('42-0717807', 'Robin Bartkowiak', '5559 Shelley Circle', 89053.24, '1964-05-17', 'mu698813c', 3, 88, 8),
('42-1134854', 'Norma Budgeon', '5061 Northland Place', 45208.71, '1989-04-19', 'gq875183d', 4, 298, 6),
('42-2072103', 'Oates Snepp', '684 Park Meadow Junction', 42019.18, '2001-05-11', 'ie180913g', 3, 304, 5),
('42-5263028', 'Corny Leynham', '8 Hansons Drive', 82698.63, '1986-11-26', 'kc800413c', 3, 378, 5),
('42-7011523', 'Giorgia Hynes', '23948 Ruskin Place', 44916.43, '1970-06-08', 'xh499685d', 3, 305, 2),
('42-7240015', 'Godfrey Napoleon', '030 Fallview Court', 89542.77, '1977-06-21', 'hg523274c', 3, 190, 6),
('42-8848918', 'Zahara Pepis', '15 2nd Crossing', 17215.70, '1970-01-18', 'vv722651o', 3, 393, 10),
('43-2037577', 'Leisha Mieville', '027 Clarendon Center', 68826.28, '2003-10-31', 'nj080641o', 4, 21, 8),
('43-6568300', 'Gillan Stolberger', '04255 Mayfield Way', 92147.29, '1965-01-03', 'hx200738r', 3, 302, 8),
('43-7385696', 'Nicky Ipplett', '7153 Merrick Terrace', 48895.33, '1991-07-22', 'tk845900k', 4, 412, 12),
('43-8492699', 'Hortense Berecloth', '2 Barby Parkway', 38548.00, '1964-09-27', 'zt656754o', 4, 6, 7),
('44-1072008', 'Jacob Kelf', '48033 Forest Run Parkway', 66228.12, '1981-01-15', 'zi651705l', 4, 380, 7),
('44-4915402', 'Phaidra Ivey', '46 Toban Lane', 61580.95, '2004-12-26', 'yg637206i', 4, 61, 14),
('44-7083318', 'Dari Siene', '57 Randy Point', 85262.11, '1983-10-22', 'ku592945q', 3, 362, 12),
('45-1060690', 'Morgen Shortland', '3 Doe Crossing Trail', 81649.14, '1990-01-25', 'vr974451g', 1, 231, 6),
('45-1168337', 'Jade Yaakov', '13 Parkside Avenue', 95249.87, '1992-12-04', 'eb401601e', 3, 389, 6),
('45-2811300', 'Veradis Wagstaff', '592 Sullivan Pass', 54982.88, '1988-06-02', 've944995l', 4, 205, 7),
('45-3804689', 'Pauly McDell', '4 Fordem Trail', 66117.54, '2003-04-29', 'ac869050u', 4, 294, 16),
('45-3951342', 'C1is Skittrell', '174 Namekagon Court', 80039.37, '1999-05-14', 'io334297g', 1, 33, 5),
('45-5773014', 'Patric Etienne', '87269 Huxley Place', 22053.53, '1980-11-07', 'nd673205l', 4, 159, 5),
('45-6995640', 'Sigfrid Mankor', '9773 Old Shore Way', 12758.05, '1992-03-01', 'fi299116a', 4, 67, 9),
('45-7500187', 'Juditha Pesterfield', '076 Heath Drive', 37428.34, '1966-04-09', 'zf490474b', 4, 137, 2),
('46-0059406', 'Marylou McClunaghan', '7 Bluestem Pass', 60710.92, '1986-11-09', 'ys652384q', 3, 160, 6),
('46-2600043', 'Del Fitter', '4290 Superior Terrace', 54544.33, '1983-06-20', 'tt394813q', 3, 313, 13),
('46-4344763', 'Benny Lander', '86904 Montana Road', 88061.49, '1996-10-07', 'sq353921l', 4, 196, 13),
('47-1387266', 'Bevon Gaskoin', '549 Oakridge Avenue', 56671.63, '1981-06-10', 'ce665632s', 3, 180, 6),
('47-3147567', 'Britta Northin', '757 Ramsey Terrace', 74080.45, '2002-11-23', 'yz717919v', 2, 257, 10),
('47-5302795', 'Gerardo Brosio', '6949 Bonner Junction', 92669.35, '1972-02-26', 'rb204617t', 4, 347, 8),
('48-1799687', 'Charissa Peattie', '6497 Haas Park', 32502.37, '1984-01-31', 'lw132386n', 4, 188, 13),
('48-5840838', 'Raquel Stave', '8 Springview Plaza', 91219.79, '1997-12-15', 'yl966209u', 1, 226, 7),
('48-9328765', 'Orsola Francillo', '31360 Debra Junction', 98161.15, '1985-07-10', 'tq009471b', 3, 299, 7),
('49-1036239', 'Onofredo Joontjes', '938 2nd Way', 36626.20, '1973-10-03', 'so040048u', 4, 425, 11),
('49-1159362', 'Valeria Proschek', '6 Red Cloud Court', 97436.14, '1998-03-15', 'xd817271x', 4, 495, 3),
('49-1457327', 'Sinclair Byfford', '201 Melody Parkway', 50636.92, '1971-10-01', 'hp128399x', 4, 187, 1),
('49-2217652', 'Georas Divisek', '25 Moulton Lane', 87452.13, '1996-02-18', 'ht175666x', 3, 2, 8),
('49-5299749', 'Vonny Meeny', '06702 Lawn Plaza', 83205.62, '1967-06-02', 'ah996640u', 4, 166, 3),
('49-6102253', 'Annabelle Fairnie', '12384 Warrior Point', 60436.09, '1980-09-08', 'dl892664i', 4, 410, 10),
('49-9705882', 'Quentin Devine', '09 Knutson Park', 23326.81, '1995-03-12', 'fm907610k', 4, 492, 16),
('50-0945563', 'Ashbey England', '3 Oneill Crossing', 66223.46, '1981-11-26', 'uj306006a', 4, 32, 8),
('50-5810953', 'Jarad Thorowgood', '01 East Hill', 80581.88, '1963-12-06', 'fe255201p', 4, 288, 7),
('50-6111855', 'Shepard Johansson', '22 Hudson Trail', 86414.16, '2005-12-12', 'ng987509r', 3, 148, 11),
('50-7117246', 'Everett Hoggetts', '4809 Gale Trail', 99084.22, '1993-12-08', 'pk662258w', 3, 385, 8),
('50-9092071', 'Jodie Busswell', '8 Pepper Wood Avenue', 14441.41, '1991-11-04', 'qz236393m', 3, 22, 2),
('51-0122715', 'Ardyce Calcraft', '953 Green Trail', 63482.01, '1971-05-25', 'kk311112p', 3, 265, 3),
('51-6967096', 'Bertina Berard', '1 Almo Place', 21320.75, '1967-06-17', 'ed732328n', 4, 444, 6),
('51-7315582', 'Kathy Goodnow', '24494 Kenwood Alley', 94364.48, '1963-02-07', 'dn632963a', 4, 121, 6),
('51-7472749', 'Bonnibelle Disley', '9 Vermont Trail', 32710.49, '1999-02-20', 'si278865g', 4, 435, 8),
('51-9601829', 'Maressa Hans', '73 Coolidge Park', 21773.24, '1962-05-19', 'er279775r', 4, 424, 9),
('52-0404205', 'Pierce Kemp', '63008 Raven Place', 82902.41, '1992-06-28', 'dd271029j', 3, 56, 5),
('52-1336694', 'Renaldo Fussey', '7 Northland Street', 46099.86, '1977-04-25', 'nz535691o', 4, 98, 11),
('52-4567561', 'Braden Wigin', '9641 Loftsgordon Park', 85761.99, '1995-02-05', 'lc856388d', 3, 130, 5),
('52-4726377', 'Vania Simonsson', '666 Hoffman Parkway', 90719.74, '1991-07-17', 'ry740755s', 1, 227, 1),
('52-5735024', 'Donica Hewell', '2911 Sout1idge Hill', 34806.46, '1966-05-30', 'wn058972w', 3, 430, 6),
('52-6674444', 'Codie Stambridge', '38 Schurz Pass', 29289.03, '1989-06-08', 'ku840832k', 4, 396, 16),
('53-0431396', 'Demetrius Lowmass', '8 Stone Corner Crossing', 99061.45, '1995-12-11', 'wd175217c', 4, 104, 15),
('53-5630368', 'Evey Luckman', '898 Butternut Point', 26964.71, '2005-05-30', 'ee740794t', 4, 209, 7),
('53-6948800', 'Dorothea Trewinnard', '0 Stephen Way', 74486.86, '1987-03-22', 'cd290362a', 3, 203, 9),
('53-7191465', 'Delila Folland', '5993 Warner Park', 32281.47, '2005-11-15', 'vk993165i', 4, 29, 8),
('53-9062912', 'Doralynn Suddaby', '4 Springview Plaza', 59458.15, '1969-09-14', 'zh337987i', 4, 153, 16),
('54-1117411', 'Schuyler Stoffels', '31 Carioca Terrace', 41087.65, '1963-01-23', 'sh512546i', 4, 481, 6),
('54-5318903', 'Stanislaus Ferreli', '5 Northland Park', 51816.24, '1990-07-28', 'sw345892x', 1, 343, 5),
('54-6428980', 'Janek Semeradova', '12015 Dayton Trail', 89572.34, '1965-09-03', 'hm636135w', 3, 309, 2),
('54-7676865', 'Pepillo Maha', '2025 Waxwing Drive', 38143.51, '1988-08-28', 'ii522336e', 4, 296, 6),
('54-7904459', 'Alexandros Ormesher', '664 Gale Plaza', 51642.73, '1994-04-09', 'sl566148h', 3, 402, 8),
('54-8296596', 'Tommie Vallintine', '37 Superior Parkway', 87912.38, '1999-05-15', 'tm808573f', 3, 317, 7),
('54-9522118', 'Nari Chowne', '169 Clemons Drive', 40585.75, '1962-01-11', 'vm874796y', 2, 460, 12),
('55-0320348', 'Granville McKitterick', '04 Rieder Parkway', 83664.78, '1990-01-19', 'dr180938w', 4, 10, 16),
('55-3650046', 'Gerek Bardnam', '91085 Maple Court', 51185.61, '1992-09-06', 'xh198735c', 4, 306, 15),
('55-4384947', 'Eudora Marten', '6 Corry Road', 80059.87, '1966-11-28', 'mz193764k', 3, 332, 1),
('55-5908272', 'Petronille Squelch', '67 Golden Leaf Park', 65853.46, '1988-07-01', 'ly831340g', 3, 318, 7),
('55-6072477', 'Waring Durkin', '9597 Towne Center', 82140.98, '1989-10-08', 'mg195096h', 3, 87, 11),
('55-9616651', 'Murdock Linsay', '8 Shelley Terrace', 55605.57, '1977-05-07', 'tn328405l', 3, 138, 5),
('55-9770243', 'Janeva Carlet', '5557 Washington Point', 35334.78, '2003-06-09', 'pu508250s', 3, 211, 13),
('56-0484045', 'Lyn Topp', '20 Sloan Circle', 36487.51, '1987-02-20', 'np848289h', 4, 366, 16),
('56-3682739', 'Melany Klugel', '14577 Truax Alley', 41959.59, '1965-05-17', 'tg734644m', 1, 279, 10),
('56-4309508', 'Tessy Cartan', '75834 Burning Wood Parkway', 85017.74, '1997-06-18', 'of985665x', 3, 118, 12),
('56-7734821', 'Micki Wyness', '26 Novick Plaza', 38060.45, '1993-03-09', 'nh139989u', 3, 174, 11),
('57-1609142', 'Jilly Skirvane', '4227 Darwin Circle', 91296.52, '1967-07-20', 'md982609a', 3, 125, 6),
('57-2548391', 'Wynne Flowitt', '8 Harbort Road', 45230.72, '1990-03-08', 'ns537861h', 3, 432, 8),
('57-4162757', 'Beulah Vala', '07601 Sunfield Hill', 37954.91, '1996-04-05', 'ro435900h', 3, 89, 3),
('57-7596762', 'Joelie Bacchus', '0374 Pawling Hill', 14722.35, '2004-10-05', 'ok001999u', 4, 91, 7),
('58-0128736', 'Sandye How', '2 Fordem Street', 13440.04, '1983-01-10', 'wj636565x', 4, 222, 9),
('58-0824770', 'Zared Klulicek', '62958 Canary Junction', 40677.89, '1986-11-06', 'hx158296g', 4, 151, 7),
('58-2471319', 'Constantino Phlippsen', '52 Nevada Road', 77184.02, '1979-02-27', 'vz575305z', 3, 391, 7),
('58-5912504', 'Nappy Ludmann', '3329 Sheridan Junction', 51318.65, '1975-03-31', 'ge941219f', 3, 414, 5),
('58-8249246', 'Maggi Hamshar', '92344 Main Avenue', 34269.41, '1978-10-03', 'rb919501k', 4, 58, 16),
('58-8390431', 'Brandi Andreassen', '008 Service Alley', 19209.80, '1962-01-15', 'ib637202u', 4, 345, 5),
('59-0150604', 'Florry Oblein', '5 Elmside Lane', 87584.21, '2005-12-11', 'vv093891d', 1, 199, 9),
('59-0997098', 'Aila Paolillo', '41 Esker Terrace', 14148.29, '1999-08-05', 'cm005454h', 3, 273, 12),
('59-1166943', 'Parker Filippov', '9 Granby Terrace', 65946.54, '1974-02-17', 'xp081647h', 3, 84, 3),
('59-2576093', 'Katerina Barnfield', '34404 Bellgrove Avenue', 61807.51, '2003-11-16', 'jx648488c', 3, 310, 9),
('59-4661298', 'Stearne Stennet', '664 Warrior Drive', 37835.13, '1998-12-25', 'vu851838j', 1, 168, 3),
('59-4684006', 'Angie Waddams', '82 Truax Crossing', 62378.68, '1977-04-14', 'df003975r', 3, 105, 6),
('59-5937939', 'Blancha McMillian', '59 Buhler Trail', 89177.07, '1975-06-23', 'zp730277w', 4, 442, 11),
('59-6274425', 'Talbert Abbotts', '29565 Jenifer Court', 92884.08, '1985-07-10', 'ae100121f', 3, 28, 16),
('59-8314806', 'Scotty Keson', '14 Kipling Point', 67107.29, '1995-03-13', 'gx924268x', 3, 11, 13),
('59-8381667', 'Emmey Dallywater', '98705 Forest Run Avenue', 92664.30, '1967-05-28', 'dk443174l', 1, 350, 4),
('60-0655971', 'Cherie Murch', '3340 Gale Way', 12502.40, '1983-06-07', 'ap253442h', 1, 327, 5),
('60-1691051', 'Winnah Gillott', '40711 Dayton Plaza', 48040.51, '1962-12-13', 'qv299811c', 3, 64, 10),
('60-2276889', 'Ransell Seakings', '1 Ramsey Park', 43734.59, '1996-06-15', 'uu534964w', 3, 120, 15),
('60-3158201', 'Carlee Shearmur', '2 Vermont Terrace', 78619.51, '1995-06-05', 'lo612272u', 4, 242, 6),
('60-6270362', 'Theressa Prentice', '2026 Oak Valley Hill', 78594.80, '1981-10-05', 'qf112815j', 3, 371, 11),
('60-6428015', 'Fayette Hackin', '212 Loomis Trail', 51844.54, '1962-07-14', 'rn693599v', 4, 214, 6),
('60-7601093', 'Elnar Tabrett', '280 Drewry Way', 85741.90, '1999-05-22', 'rf462586d', 1, 110, 7),
('60-9203590', 'Shoshana Downie', '8416 Carberry Crossing', 83867.01, '1965-04-30', 'ee740085i', 3, 63, 1),
('61-7469906', 'Demetre Headrick', '98692 Forster Hill', 88965.32, '1960-06-24', 'ns990887t', 1, 167, 8),
('61-9391449', 'Lester Carmo', '6 Buell Trail', 37061.26, '1992-06-04', 'mt812263o', 4, 27, 9),
('62-1957072', 'Elliot Allitt', '8 Redwing Court', 41808.84, '1982-09-04', 'nd981367q', 1, 319, 6),
('62-2186332', 'Meridith Bolton', '9 Hooker Avenue', 81390.66, '1976-02-08', 'vw612487d', 4, 404, 16),
('62-4020686', 'Tait Bremeyer', '82 Calypso Junction', 83142.55, '1972-07-01', 'ie609169k', 3, 260, 5),
('62-4959178', 'Josie Henricsson', '8035 Brown Lane', 64586.93, '1974-03-06', 'oh486872e', 3, 289, 6),
('62-6726896', 'Marje Cranage', '15 Crescent Oaks Junction', 82421.91, '1993-05-23', 'kt951067x', 1, 436, 7),
('62-6894804', 'Merrie Stayt', '0 Manufacturers Alley', 39159.86, '1992-06-02', 'cq847516d', 3, 70, 1),
('62-7019089', 'Agnese Murrhardt', '4666 Jay Court', 88965.75, '1975-12-03', 'yz407625p', 4, 438, 5),
('62-7120162', 'Fanni Melrose', '33 Sutteridge Parkway', 97520.73, '1988-05-09', 'na997468x', 4, 146, 4),
('63-0638100', 'Edd Speere', '812 High Crossing Junction', 13662.80, '1962-01-01', 'au549358u', 3, 99, 8),
('63-1545651', 'Dedra MacConnulty', '22342 Sauthoff Center', 85921.50, '1976-12-16', 'zc732912g', 3, 484, 8),
('63-1925261', 'Willyt Ezzy', '61751 Burrows Drive', 14811.14, '1992-10-11', 'vy468006g', 4, 496, 5),
('63-2539882', 'Darelle Peverell', '52683 Aberg Parkway', 80717.20, '1981-01-08', 'pg514115j', 3, 312, 3),
('63-5722038', 'Vikki Gut1ie', '6 Farragut Road', 95626.81, '1966-10-09', 'hx643872o', 3, 349, 6),
('63-6111701', 'Fayre Tomney', '1506 Ryan Point', 58829.33, '1976-10-15', 'ia005234g', 4, 93, 6),
('63-8802366', 'Cody Peasey', '6 Dixon Point', 54393.78, '1977-08-21', 'fu609000b', 4, 363, 7),
('63-9116461', 'Aylmer Gabbatiss', '8828 Blue Bill Park Avenue', 27880.52, '1997-10-26', 'qj799086z', 1, 55, 3),
('63-9446221', 'Tybie Exell', '1 Anderson Plaza', 56541.59, '2004-03-04', 'gi458830f', 3, 240, 4),
('64-0621633', 'Sigismundo FitzGibbon', '8 Gina Terrace', 55410.48, '1975-05-31', 'au449889p', 3, 280, 5),
('64-0636526', 'Antonetta Beefon', '68 Blackbird Drive', 39943.08, '1996-07-18', 'hb766263l', 3, 206, 4),
('64-6729020', 'Sarajane Abrams', '26499 Warrior Avenue', 87543.10, '2004-06-27', 'yh646941o', 3, 376, 4),
('64-6879023', 'Brose Niece', '18466 Village Green Plaza', 74713.01, '1980-10-21', 'yz865649d', 3, 149, 7),
('65-1738561', 'Say Lodwig', '54399 Forest Dale Avenue', 17891.12, '1976-07-24', 'tj978150h', 2, 382, 9),
('65-7661186', 'Lombard Debling', '36 Mayer Drive', 53121.90, '1980-05-23', 'jb039257n', 3, 122, 5),
('66-0739491', 'Latashia McGaugan', '1386 Artisan Parkway', 58941.46, '1966-04-11', 'nz662678p', 2, 12, 9),
('66-1883695', 'Jorge Bonham', '8 2nd Trail', 33284.78, '1976-03-15', 'ql642076f', 4, 419, 11),
('66-2361006', 'Hillard Milan', '9010 Straubel Park', 81724.41, '1976-03-12', 'og602265e', 1, 249, 8),
('66-2522703', 'Alyss Nance', '0974 Red Cloud Junction', 20416.96, '1992-05-12', 'gy674145h', 1, 282, 5),
('66-2765926', 'Jacinta Partleton', '3957 Hoard Place', 96193.45, '1981-03-21', 'sh419152d', 4, 472, 8),
('66-5805863', 'Vincents De Bruijne', '3 Claremont Parkway', 81193.24, '1969-01-03', 'na778983r', 4, 192, 8),
('66-7576883', 'Dur Janodet', '91175 Northland Hill', 54589.37, '1987-05-24', 'jd412382q', 4, 34, 13),
('67-4076527', 'Clarissa Houson', '1 Granby Pass', 35964.42, '1977-12-06', 'kh895707v', 3, 235, 16),
('67-5029558', 'Gianina Leppington', '1 Jenifer Park', 77499.37, '1967-06-25', 've628368y', 1, 38, 1),
('67-5304822', 'Taber Nuton', '94646 Charing Cross Parkway', 85586.57, '1989-08-12', 'ig939447u', 4, 407, 16),
('67-6284946', 'Alia Sygroves', '7 Roth Alley', 19945.20, '1993-08-13', 'ws189951j', 4, 220, 13),
('67-6903314', 'Dorene Ipplett', '87 Cardinal Court', 93942.93, '1993-03-31', 'ul176502b', 3, 266, 11),
('67-7636850', 'Felice Plaide', '0617 Daystar Drive', 58909.33, '1979-05-21', 'vl606950t', 4, 65, 9),
('68-3132421', 'Catlaina McInerney', '19 Aberg Plaza', 69134.66, '2003-03-08', 'pr574429q', 4, 204, 12),
('68-3172017', 'Hayyim Fleay', '3644 Blaine Court', 55384.02, '1979-10-04', 'yh345037b', 3, 270, 3),
('68-4171892', 'Yoshi Peakman', '641 Warner Point', 20293.38, '1975-03-30', 'to907441w', 3, 7, 2),
('68-5871521', 'Bearnard Parysowna', '60052 Monument Alley', 85175.33, '1976-12-07', 'vg613456a', 4, 90, 16),
('68-6940299', 'Tobi Bute', '46 Jenifer Plaza', 97878.28, '1998-12-14', 'mw253204t', 4, 370, 3),
('68-7037451', 'Saree Starling', '1 Artisan Drive', 34145.23, '1965-12-12', 'ct629800a', 3, 489, 8),
('68-7096348', 'Darsey Fryman', '996 Sauthoff Circle', 80568.78, '1964-11-19', 'gd794016y', 3, 234, 9),
('68-7504033', 'Brandi Clayson', '7 Myrtle Circle', 37302.00, '1966-08-04', 'kn988197t', 4, 478, 5),
('68-8976238', 'Florie Reyes', '2 Heffernan Center', 98224.34, '1978-04-16', 'ub855681n', 1, 361, 4),
('69-0393201', 'Lissa Egalton', '28673 Bultman Junction', 77974.79, '1985-09-05', 'ep586696m', 3, 434, 7),
('69-0536291', 'Jaime Woolhouse', '59 Jenna Park', 34370.50, '1987-07-11', 'dz195791x', 3, 107, 5),
('69-0803348', 'Editha Anney', '271 Browning Plaza', 67023.77, '1974-08-03', 'mk604551h', 4, 40, 5),
('69-3965258', 'Archie Godden', '7 Marcy Road', 33511.85, '1996-05-13', 'gk840892x', 3, 189, 12),
('69-5458568', 'Elvina Matuszynski', '6 Grover Road', 76167.80, '1960-01-21', 'ob669602j', 4, 287, 13),
('69-5925327', 'Sydelle Pelzer', '34635 Dawn Drive', 15069.38, '1989-03-12', 'ap767547i', 3, 399, 1),
('69-6968657', 'Diannne Scala', '96290 Bunker Hill Hill', 86102.65, '1967-10-20', 'lw629488e', 3, 386, 12),
('70-2965789', 'Lyell Brannan', '7 Anzinger Center', 49943.14, '2003-06-02', 'sv922230q', 4, 111, 6),
('70-4763276', 'Nikaniki Scarman', '81 Fallview Avenue', 92757.77, '1969-09-06', 'uu528507s', 4, 210, 3),
('71-3652304', 'Esteban Ziemen', '4832 Pankratz Road', 16929.76, '1970-03-02', 'wc844307p', 4, 115, 2),
('71-4783541', 'Brandise Kondrachenko', '3 Kenwood Alley', 49471.98, '1981-10-13', 'fm459704k', 3, 379, 3),
('71-7374760', 'Alfie Dean', '15 Mccormick Point', 21930.10, '1992-05-31', 'lh444635g', 3, 37, 8),
('71-7837650', 'Shelley Camilletti', '91311 Hauk Avenue', 67736.10, '1964-09-19', 'yx527895g', 4, 441, 16),
('72-0413596', 'Philly Halliberton', '33 Sheridan Road', 15689.28, '1978-05-08', 'mo726896p', 1, 375, 5),
('72-2448628', 'Gina Macrae', '607 Northport Center', 36331.78, '1991-08-07', 'tv211484w', 3, 427, 8),
('72-3040567', 'Tanney Marques', '9382 Prairie Rose Alley', 70585.82, '1970-12-10', 'no949821c', 3, 141, 9),
('72-3549258', 'Bailey Lewington', '3 Bobwhite Center', 90668.84, '1965-12-01', 'ze015887n', 3, 213, 7),
('72-5913162', 'Rudolfo Norridge', '22 Golf Court', 37428.03, '2002-10-05', 'du615694i', 3, 8, 5),
('72-6079643', 'Leonelle Claridge', '09468 Lunder Place', 61662.41, '1972-01-16', 'qv402258l', 4, 229, 3),
('72-7823438', 'Adrienne Myall', '9 Oneill Place', 31683.24, '1983-12-06', 'uv348158a', 4, 50, 7),
('72-9006336', 'Ikey Sholl', '62 North Place', 77016.02, '1997-07-09', 'qf846140g', 1, 243, 6),
('72-9328783', 'Constantia Privett', '162 Moland Terrace', 25686.80, '1983-10-26', 'tx491950i', 3, 452, 11),
('73-2251057', 'Lodovico Ashborne', '7312 Shoshone Court', 72963.41, '1966-07-12', 'cb298473a', 2, 461, 6),
('73-6200004', 'Marie Gummoe', '4 Debra Terrace', 45954.79, '1967-03-08', 'kw585002h', 4, 158, 12),
('73-7147493', 'Chelsea Robertucci', '94833 Northview Way', 78083.27, '1976-05-02', 'df426741g', 4, 74, 16),
('74-0303597', 'Bria Thomkins', '7 Homewood Road', 88871.61, '1974-02-14', 'tx085395s', 2, 94, 10),
('74-9747670', 'Hymie Dows', '12 Dwight Terrace', 62699.64, '1981-08-12', 'aq304702r', 4, 420, 7),
('75-0124112', 'Jennica Welbeck', '78916 Green Ridge Trail', 57947.01, '1979-09-12', 'ma973579k', 3, 468, 3),
('75-0131682', 'Charlot Dignall', '950 Arizona Terrace', 15153.98, '1993-08-23', 'bj869010d', 3, 290, 5),
('75-0328049', 'Cassy Hiddersley', '9902 Starling Circle', 71258.15, '1977-02-13', 'sg232892l', 3, 264, 7),
('75-0958781', 'Velvet Carbine', '682 Kensington Drive', 31440.81, '1990-09-06', 'of014519k', 4, 52, 5),
('75-1340477', 'Ferd Uccello', '90243 Karstens Pass', 72024.81, '1970-01-15', 'nu487701k', 4, 353, 5),
('75-6520267', 'Truda Edleston', '37994 Green Ridge Drive', 23646.90, '1964-02-27', 'lp500272n', 4, 23, 8),
('75-6891165', 'Robinett Iacopini', '2224 Kensington Street', 62045.69, '1996-08-30', 'lq983512u', 4, 480, 7),
('75-8250680', 'Conney Ferras', '43048 American Ash Hill', 93389.40, '1992-11-06', 'us717372t', 3, 82, 7),
('75-9134355', 'Ramonda Overpool', '12879 Mayfield Lane', 28892.13, '1968-04-02', 'ew007431m', 4, 223, 16),
('76-0000021', 'Norton Bygrove', '0412 Packers Lane', 43733.47, '1994-09-19', 'xx491915v', 1, 485, 12),
('76-0099650', 'Tymon Smeal', '22635 Toban Court', 65314.49, '1970-10-28', 'ww210857j', 4, 193, 9),
('76-2727093', 'Nesta Dottrell', '6 Ridgeway Court', 71905.32, '2001-12-19', 'mg608324j', 4, 123, 5),
('76-2985832', 'Desirae Gooch', '6306 Reinke Circle', 42779.29, '1999-05-12', 'uc493497v', 2, 463, 16),
('76-3367992', 'Pammy Sterling', '466 Northfield Alley', 86046.49, '1984-11-23', 'sj533699h', 4, 43, 8),
('76-4036199', 'Noni Szymoni', '6 Kedzie Circle', 90864.71, '1966-05-27', 'yl605202h', 3, 95, 1),
('76-4086283', 'Laird Stalley', '75447 Norway Maple Park', 91412.37, '1963-04-29', 'fc920310o', 4, 365, 2),
('76-4940799', 'Anderea Challicombe', '8 Melvin Terrace', 87575.30, '2003-06-02', 'vv690440b', 3, 340, 6),
('76-8791360', 'Afton Cassels', '4 Grover Way', 30662.87, '1983-02-09', 'uu202177x', 4, 245, 16),
('77-1835914', 'Annabelle Caddies', '66 Loomis Alley', 94451.03, '1991-04-16', 'mp067841c', 3, 246, 9),
('77-2348932', 'Sal Dominy', '88006 Charing Cross Hill', 39168.52, '2001-02-11', 'ro907653y', 1, 421, 7),
('77-5513461', 'Noell Azam', '66 Brown Hill', 60586.79, '1979-09-18', 'zk782722r', 4, 456, 8),
('77-5748543', 'Fanchon Stebbings', '77689 Donald Alley', 38753.87, '1981-03-21', 'xy286906n', 3, 348, 1),
('77-6317806', 'Keelby Pelling', '5 Jay Trail', 57007.18, '1960-12-17', 'hj451937l', 1, 281, 9),
('77-7401728', 'Cloris Truckell', '84521 Pearson Street', 72938.51, '1993-02-24', 'bn687310q', 4, 147, 9),
('77-8203719', 'Netta McCabe', '1 Lakewood Gardens Plaza', 45095.62, '1984-11-10', 'vy489059e', 4, 154, 12),
('78-0380118', 'Dewitt Gabby', '8 Montana Park', 93187.29, '1984-11-09', 'mo353148n', 4, 372, 10),
('78-1195027', 'Meade Ketteman', '47 Nevada Center', 17823.35, '1963-09-17', 'ul369491o', 4, 387, 16),
('78-4344207', 'Aldridge Kensett', '94 Dunning Trail', 86064.22, '1995-12-22', 'sk062184b', 4, 184, 11),
('78-6321379', 'Thea Bradborne', '3118 Lien Circle', 35665.99, '1990-09-27', 'vb943949c', 4, 4, 6),
('78-8816060', 'Marilyn Glassborow', '6 Waubesa Crossing', 90675.10, '2005-10-07', 'lh695834z', 4, 428, 12),
('78-9623211', 'Margaretha Kikke', '24 Logan Circle', 25726.10, '2004-08-12', 'uv389552l', 3, 426, 7),
('79-0464882', 'Lia Hargreaves', '721 Graceland Alley', 13755.82, '1999-10-10', 'dt884304c', 4, 133, 3),
('79-1576734', 'Malchy Kempshall', '5 Melby Plaza', 48788.98, '1979-01-07', 'nv658761a', 3, 253, 16),
('79-4798875', 'Iorgo Dowsey', '904 Pond Park', 14568.84, '1981-10-12', 'vv771459v', 4, 316, 8),
('79-5517945', 'Darryl Payfoot', '62334 Prairie Rose Drive', 84841.60, '1965-11-02', 'rc413749a', 3, 433, 5),
('79-9536595', 'Noni Abbatucci', '1 Monterey Center', 14602.61, '1969-11-09', 'nt307553s', 4, 228, 11),
('80-3234805', 'Greer Durnford', '44200 Sauthoff Terrace', 82703.39, '1991-10-08', 'ry037414u', 3, 308, 10),
('80-6524018', 'Ambur Challenor', '2 Morning Crossing', 47033.97, '1997-04-08', 'tn459758p', 3, 59, 8),
('80-7938995', 'Armstrong Ivachyov', '41681 Welch Court', 36204.54, '2005-01-15', 'ly992939e', 4, 275, 2),
('80-7941049', 'Chiarra Dundridge', '04 Porter Avenue', 67648.79, '1981-05-27', 'ps295181z', 1, 454, 1),
('80-8617080', 'Salomi Lintin', '29507 Bartillon Terrace', 78695.13, '1977-11-18', 'cc846598u', 4, 439, 16),
('81-0188200', 'Nadine Davidson', '0 Jana Alley', 23660.37, '1985-03-16', 'eb645921x', 4, 403, 11),
('81-2733835', 'Magdalen McIlwrick', '2099 Debra Trail', 41997.19, '1986-05-19', 'rr316532p', 1, 384, 9),
('81-4865027', 'Annette Josephs', '532 Kipling Place', 46710.64, '1970-04-12', 'vk802431y', 4, 116, 13),
('81-5031235', 'Gill Fulford', '9 Susan Avenue', 46429.85, '1978-04-07', 'vg667583e', 4, 459, 7),
('81-5228790', 'Rene Waddup', '47 Sout1idge Parkway', 40348.66, '1974-06-24', 'vy525798f', 4, 464, 4),
('81-7038918', 'Fraze Maletratt', '96 Rockefeller Circle', 30986.25, '1977-08-08', 'dr489342o', 3, 326, 16),
('81-8060778', 'Estevan Francesco', '2 Troy Avenue', 85869.29, '2004-07-29', 'sf717839d', 1, 254, 2),
('82-1629865', 'Dag Choules', '53 Blue Bill Park Center', 23537.76, '1992-01-26', 'dz430103g', 4, 418, 6),
('82-2609006', 'Cyrus Willmetts', '470 Oakridge Circle', 70654.72, '1986-08-12', 'gx740846k', 1, 247, 11),
('82-2981878', 'Cherida Gocke', '395 Comanche Center', 31735.68, '1996-11-12', 'ej657352g', 4, 423, 1),
('82-6558984', 'Hebert Zaniolini', '8 Buell Place', 50633.71, '1972-06-25', 'kd209714d', 2, 248, 3),
('82-9457047', 'Merralee Vannuchi', '7 Vera Place', 56425.54, '2003-10-27', 'lf092320a', 4, 322, 10),
('83-1009344', 'Eba Fiander', '0094 Fallview Terrace', 61818.38, '2003-08-25', 'nf421951o', 3, 368, 7),
('83-1217063', 'Viola Holleran', '877 Twin Pines Plaza', 94882.77, '2000-10-11', 'zb232750v', 4, 295, 9),
('83-3514873', 'Roscoe Honeyghan', '89 Golden Leaf Drive', 93281.90, '1986-12-11', 'lv730967l', 3, 479, 9),
('83-4865660', 'Jase Fulk', '80 Pennsylvania Center', 90529.95, '1972-05-24', 'ak984038n', 2, 53, 13),
('83-5537250', 'Arly Bartolommeo', '759 Esch Way', 67921.89, '1987-02-19', 'la176569w', 3, 109, 9),
('83-6435523', 'Bevan Durrell', '18 Butternut Road', 24202.05, '1966-06-30', 'wa954782v', 3, 331, 10),
('83-7810679', 'Davie Cutill', '61998 Fisk Lane', 92319.52, '2003-01-27', 'xq363276d', 3, 283, 9),
('84-0386773', 'Nady Yvens', '84 Mayer Court', 82751.39, '1971-11-14', 'rs150649p', 4, 443, 7),
('84-3457422', 'Ernestus Dewsnap', '937 Springs Road', 65304.51, '1982-02-17', 'xe947994r', 4, 112, 6),
('84-3853067', 'Bianka Druce', '5 Pierstorff Plaza', 98768.78, '1989-01-18', 'xa610379g', 1, 292, 3),
('84-5153657', 'Catharine Sharpous', '081 Hermina Trail', 98273.90, '1992-11-05', 'vg979335t', 4, 467, 5),
('84-8762859', 'Hewett Collcutt', '453 Emmet Center', 21438.35, '1991-02-03', 'nk424390j', 4, 470, 7),
('84-9275069', 'Julina Copnar', '8 Randy Court', 55255.85, '1970-11-30', 'xd785936e', 4, 342, 13),
('85-0601601', 'Dotti Busek', '32564 Veith Circle', 12043.56, '1967-04-19', 'xc467370v', 1, 457, 9),
('85-3334513', 'Benita Taffarello', '89784 Hollow Ridge Avenue', 58884.21, '1963-09-29', 'op270447a', 4, 101, 5),
('85-4557957', 'Barr Eefting', '234 Susan Lane', 44265.60, '2002-10-29', 'ju063558q', 3, 453, 11),
('85-5431069', 'Marney Kolak', '5 Merrick Road', 97251.70, '1978-11-25', 'xb125807v', 1, 117, 1),
('85-7355238', 'Kial Labden', '55507 Bultman Circle', 39885.17, '1972-01-08', 'ux496294h', 3, 336, 6),
('85-7718619', 'Rhody Yaxley', '90344 Merrick Crossing', 98055.42, '1963-05-29', 'of102924m', 1, 26, 3),
('86-1870935', 'Gwynne Garrow', '2648 Old Gate Circle', 66379.47, '1986-12-21', 'ds178316s', 4, 314, 11),
('86-2503827', 'Nikola Henbury', '8116 Erie Junction', 95300.54, '1992-08-19', 'cz046288u', 4, 18, 16),
('86-5274202', 'Holden Artharg', '61 Vera Crossing', 55750.53, '1996-04-02', 'cw848240k', 3, 381, 6),
('87-1470903', 'Stafani Clampe', '8 Bultman Avenue', 28092.26, '1997-05-11', 'vu807135v', 3, 156, 8),
('87-1949652', 'Malcolm Louys', '2 Ronald Regan Pass', 72398.03, '1992-01-13', 'wu157014q', 4, 262, 6),
('87-3376412', 'Michaela S1ieve', '78 Raven Road', 70070.27, '1962-02-05', 'jn422060l', 4, 437, 3),
('87-4453963', 'Sibeal Fullard', '6296 Pleasure Road', 46783.79, '1966-05-22', 'er088315j', 4, 491, 12),
('87-6633787', 'Vivie Jagels', '77 Dovetail Drive', 41830.50, '1985-08-24', 'sm423704x', 2, 182, 8),
('87-7188668', 'Salli Oulner', '26 Pepper Wood Parkway', 90004.65, '1977-01-26', 'kt389837b', 1, 490, 9),
('87-8002965', 'Fredericka Mathivat', '370 Mendota Court', 68554.76, '1968-06-01', 'rp358778t', 2, 232, 3),
('87-8745898', 'Harwell Lain', '11 Bartelt Terrace', 60453.87, '1996-11-14', 'yz604658j', 3, 474, 16),
('87-8762204', 'Patric Izsak', '02 Comanche Place', 65976.34, '1981-02-05', 'lb704495e', 3, 224, 7),
('88-4435308', 'Cedric Chazotte', '77 Ilene Parkway', 84591.95, '2000-11-21', 'ji880896f', 3, 325, 16),
('89-0022888', 'Nelli Esche', '78814 Summer Ridge Court', 15353.78, '1963-02-22', 'nr398078m', 3, 397, 9),
('89-1889473', 'Alysa Marley', '0906 Duke Point', 79091.50, '1991-01-20', 'ap444024o', 3, 469, 9),
('89-4176534', 'Conni Or1t', '92 Moose Park', 14137.68, '1967-11-03', 'ui092814r', 4, 272, 8),
('89-4884561', 'Wynn Winterscale', '931 Warbler Road', 76837.12, '1998-01-14', 'us493269a', 1, 221, 16),
('89-5714177', 'Bobbye Pottinger', '4633 Scott Street', 99191.41, '1988-08-29', 'vy437276r', 3, 455, 16),
('89-6058656', 'Yorgos Philippard', '8976 Dakota Terrace', 60909.78, '1989-03-13', 'bu861195y', 4, 285, 1),
('90-0686303', 'Ludovika Blucher', '0141 Forest Alley', 59728.01, '1974-01-01', 'sk016695u', 3, 49, 8),
('90-1403954', 'Jeffy Camel', '067 Columbus Street', 78815.19, '1988-06-01', 'ql321121l', 3, 42, 1),
('90-3945672', 'Lianna Seden', '655 Superior Alley', 37009.12, '1968-01-30', 'jt347163f', 4, 171, 16),
('90-5035577', 'Isacco Chaperling', '71120 West Crossing', 81126.94, '1961-02-23', 'sn878406k', 1, 217, 5),
('90-6409982', 'Irv Tomsen', '0 Harper Way', 66852.98, '1987-07-02', 'ms059474n', 4, 181, 8),
('90-9258513', 'Yank Mullan', '94728 5th Center', 82932.31, '2002-01-21', 'is015669m', 3, 169, 8),
('92-9480837', 'Phyllis Lalevee', '77169 Sullivan Crossing', 38220.79, '1995-10-11', 'wh734079v', 4, 303, 2),
('92-9623071', 'Wait Prate', '0367 Moose Hill', 95732.18, '1966-09-19', 'bn415170d', 4, 487, 4),
('92-9715314', 'Larissa Holtham', '8751 Hoepker Circle', 97254.38, '1978-04-05', 'bt371843i', 4, 185, 14),
('93-0686984', 'Dirk Perrott', '679 Summer Ridge Road', 82551.62, '1985-02-20', 'jc445141x', 4, 113, 16),
('93-5661312', 'Gordie Gaynesford', '4 Fordem Circle', 67381.57, '1984-12-01', 'hm085014v', 2, 175, 5),
('93-5928498', 'Sukey Roddan', '5 Gulseth Center', 18304.57, '1963-03-06', 'ik578743b', 3, 81, 7),
('93-8667645', 'Marna Abramski', '6 Scoville Pass', 13595.15, '1993-02-17', 'gj588599m', 1, 367, 3),
('94-4705277', 'Orton Willmore', '4 Pine View Street', 14870.36, '1978-02-15', 'xh603239m', 4, 92, 9),
('94-6907133', 'Alica Barthel', '80231 Twin Pines Center', 82703.00, '1997-03-27', 'mw080326p', 4, 377, 5),
('95-1174328', 'Heath Manvell', '77 Westridge Road', 29749.03, '1999-10-17', 'ub404168r', 4, 194, 13),
('95-1790755', 'Staford Klarzynski', '02676 Mesta Junction', 62596.85, '2001-04-03', 'lw151180l', 4, 360, 9),
('95-3517999', 'Garald Greenrde', '15302 Independence Drive', 56092.80, '2000-11-25', 'hp673805w', 3, 284, 11),
('95-7092127', 'Dulciana Duxfield', '44249 Westridge Drive', 62408.05, '1994-09-28', 'do305555k', 3, 170, 6),
('96-0987852', 'Nataline Roycroft', '52339 Eastlawn Crossing', 81005.05, '1964-12-31', 'rc734008g', 3, 500, 9),
('96-1648398', 'Hugues Tavner', '78 Parkside Point', 37393.68, '1972-10-11', 'va219127u', 4, 486, 6),
('97-0147786', 'Haze Rosenbush', '0 Kropf Alley', 89561.58, '1962-11-23', 'wx774255i', 1, 241, 6),
('97-0913105', 'Kelly Farragher', '6 Meadow Vale Trail', 52644.35, '1982-02-20', 'ob677832o', 1, 293, 7),
('97-3138911', 'Alvina Paterno', '09 Golf Drive', 23002.76, '1970-01-04', 'ao592540g', 4, 79, 9),
('97-3703178', 'Thatch Kinvig', '9 Fuller Street', 31866.49, '1989-08-21', 'gm065123w', 1, 201, 13),
('97-4110845', 'Judah Groomebridge', '1714 Clyde Gallagher Point', 52171.58, '1986-02-27', 'kc825703y', 1, 152, 8),
('97-5558458', 'Sarina Kalb', '565 Annamark Alley', 45859.99, '2001-11-15', 'qu905290s', 3, 131, 4),
('97-5683996', 'Cornie Hub', '564 Muir Alley', 13017.59, '1998-11-22', 'vs049545n', 4, 119, 7);
INSERT INTO `employee` (`emp_id`, `name`, `address`, `salary`, `dob`, `nin`, `department_id`, `emergency_contact_id`, `manager_id`) VALUES
('97-6528129', 'Darn O\'Lunny', '228 Porter Street', 23811.76, '1982-11-01', 'ai316031z', 4, 388, 9),
('97-9018441', 'Morganica Dracksford', '867 Pierstorff Hill', 91483.69, '2003-07-04', 'po115732f', 4, 68, 9),
('98-1678319', 'Lamar Chesters', '2234 Heffernan Place', 97090.47, '1971-01-09', 'wh660279o', 4, 13, 16),
('98-3556505', 'Douglas MacArdle', '14 Laurel Court', 92356.56, '1976-08-05', 'wk661827y', 4, 415, 7),
('98-4762907', 'Nari Crawshaw', '40 Debra Center', 91733.92, '1963-11-27', 'kd444344u', 4, 39, 5),
('98-9650752', 'Alene Amiss', '07913 Jenna Trail', 94129.62, '1975-09-30', 'hm391563j', 3, 202, 6),
('99-0222188', 'Lonnie Niessen', '754 Lien Road', 95600.64, '1981-01-05', 'gb123108s', 3, 71, 5),
('99-1372878', 'Annnora Leabeater', '931 Waxwing Pass', 84021.43, '1971-10-30', 'zy295345w', 1, 216, 6),
('99-4615801', 'Meggi Abbado', '3078 Hoffman Junction', 50699.73, '2002-02-05', 'kv498760u', 4, 163, 1),
('99-4988360', 'Carlie Braganza', '806 Sachs Parkway', 31442.08, '1997-01-01', 'ev422969a', 3, 269, 5),
('99-6209168', 'Renaud Skpsey', '4430 Fieldstone Alley', 44136.49, '1972-09-22', 'tm559297a', 1, 268, 10);

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `hr_id` int(11) NOT NULL,
  `emp_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `name`, `address`, `latitude`, `longitude`) VALUES
(1, 'Location1', 'London', 41, -74),
(2, 'Location2', 'Manchester', 34, -118),
(3, 'Location3', 'Warehouse', 23, 11);

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `manager_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `emp_id` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`manager_id`, `name`, `emp_id`, `password`) VALUES
(1, 'Osgood Sutherby', '06-2857563', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(2, 'Guido Hoopper', '29-2364794', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(3, 'Verla Seacroft', '33-1897506', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(4, 'Dorian Claringbold', '35-7212754', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(5, 'Britta Northin', '47-3147567', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(6, 'Nari Chowne', '54-9522118', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(7, 'Say Lodwig', '65-1738561', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(8, 'Latashia McGaugan\n', '66-0739491', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(9, 'Lodovico Ashborne', '73-2251057', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(10, 'Bria Thomkins', '74-0303597', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(11, 'Desirae Gooch\n', '76-2985832', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(12, 'Hebert Zaniolini\n', '82-6558984', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(13, 'Jase Fulk\n', '83-4865660', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(14, 'Vivie Jagels\n', '87-6633787', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(15, 'Fredericka Mathivat', '87-8002965', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG'),
(16, 'Gordie Gaynesford', '93-5661312', '$2y$10$Fr3qC1fcUHzEk1TpYk1bcOPs1DSisvyX1/tJgD.dcV1cT9bhue8UG');

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderproduct`
--

CREATE TABLE `orderproduct` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packagers`
--

CREATE TABLE `packagers` (
  `packager_id` varchar(255) NOT NULL,
  `work_hours_id` int(11) DEFAULT NULL,
  `emp_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packagers`
--

INSERT INTO `packagers` (`packager_id`, `work_hours_id`, `emp_id`) VALUES
('1', NULL, '01-5576008'),
('10', NULL, '06-9710935'),
('100', NULL, '50-6111855'),
('101', NULL, '50-7117246'),
('102', NULL, '50-9092071'),
('103', NULL, '51-0122715'),
('104', NULL, '52-0404205'),
('105', NULL, '52-4567561'),
('106', NULL, '52-5735024'),
('107', NULL, '53-6948800'),
('109', NULL, '54-6428980'),
('11', NULL, '07-4517183'),
('110', NULL, '54-7904459'),
('111', NULL, '54-8296596'),
('112', NULL, '55-4384947'),
('113', NULL, '55-5908272'),
('114', NULL, '55-6072477'),
('115', NULL, '55-9616651'),
('116', NULL, '55-9770243'),
('117', NULL, '56-4309508'),
('118', NULL, '56-7734821'),
('119', NULL, '57-1609142'),
('12', NULL, '07-4724394'),
('120', NULL, '57-2548391'),
('121', NULL, '57-4162757'),
('122', NULL, '58-2471319'),
('123', NULL, '58-5912504'),
('124', NULL, '59-0997098'),
('125', NULL, '59-1166943'),
('126', NULL, '59-2576093'),
('127', NULL, '59-4684006'),
('128', NULL, '59-6274425'),
('129', NULL, '59-8314806'),
('13', NULL, '08-4428147'),
('130', NULL, '60-1691051'),
('131', NULL, '60-2276889'),
('132', NULL, '60-6270362'),
('133', NULL, '60-9203590'),
('134', NULL, '62-4020686'),
('135', NULL, '62-4959178'),
('136', NULL, '62-6894804'),
('137', NULL, '63-0638100'),
('138', NULL, '63-1545651'),
('139', NULL, '63-2539882'),
('14', NULL, '09-8147999'),
('140', NULL, '63-5722038'),
('141', NULL, '63-9446221'),
('142', NULL, '64-0621633'),
('143', NULL, '64-0636526'),
('144', NULL, '64-6729020'),
('145', NULL, '64-6879023'),
('146', NULL, '65-7661186'),
('147', NULL, '67-4076527'),
('148', NULL, '67-6903314'),
('149', NULL, '68-3172017'),
('15', NULL, '10-1743239'),
('150', NULL, '68-4171892'),
('151', NULL, '68-7037451'),
('152', NULL, '68-7096348'),
('153', NULL, '69-0393201'),
('154', NULL, '69-0536291'),
('155', NULL, '69-3965258'),
('156', NULL, '69-5925327'),
('157', NULL, '69-6968657'),
('158', NULL, '71-4783541'),
('159', NULL, '71-7374760'),
('16', NULL, '10-4168432'),
('160', NULL, '72-2448628'),
('161', NULL, '72-3040567'),
('162', NULL, '72-3549258'),
('163', NULL, '72-5913162'),
('164', NULL, '72-9328783'),
('165', NULL, '75-0124112'),
('166', NULL, '75-0131682'),
('167', NULL, '75-0328049'),
('168', NULL, '75-8250680'),
('169', NULL, '76-4036199'),
('17', NULL, '10-6127924'),
('170', NULL, '76-4940799'),
('171', NULL, '77-1835914'),
('172', NULL, '77-5748543'),
('173', NULL, '78-9623211'),
('174', NULL, '79-1576734'),
('175', NULL, '79-5517945'),
('176', NULL, '80-3234805'),
('177', NULL, '80-6524018'),
('178', NULL, '81-7038918'),
('179', NULL, '83-1009344'),
('18', NULL, '11-0990160'),
('180', NULL, '83-3514873'),
('181', NULL, '83-5537250'),
('182', NULL, '83-6435523'),
('183', NULL, '83-7810679'),
('184', NULL, '85-4557957'),
('185', NULL, '85-7355238'),
('186', NULL, '86-5274202'),
('187', NULL, '87-1470903'),
('188', NULL, '87-8745898'),
('189', NULL, '87-8762204'),
('19', NULL, '11-4556284'),
('190', NULL, '88-4435308'),
('191', NULL, '89-0022888'),
('192', NULL, '89-1889473'),
('193', NULL, '89-5714177'),
('194', NULL, '90-0686303'),
('195', NULL, '90-1403954'),
('196', NULL, '90-9258513'),
('197', NULL, '93-5928498'),
('198', NULL, '95-3517999'),
('199', NULL, '95-7092127'),
('2', NULL, '02-9566746'),
('20', NULL, '12-0104092'),
('200', NULL, '96-0987852'),
('201', NULL, '97-5558458'),
('202', NULL, '98-9650752'),
('203', NULL, '99-0222188'),
('204', NULL, '99-4988360'),
('21', NULL, '12-5128654'),
('22', NULL, '12-6888959'),
('23', NULL, '12-8760096'),
('24', NULL, '13-8722134'),
('25', NULL, '13-9234597'),
('26', NULL, '14-2911172'),
('27', NULL, '14-4001908'),
('28', NULL, '14-6532726'),
('29', NULL, '17-1925809'),
('3', NULL, '03-2826761'),
('30', NULL, '17-3967296'),
('31', NULL, '18-0534773'),
('32', NULL, '18-3863597'),
('33', NULL, '18-6142811'),
('34', NULL, '18-9171336'),
('35', NULL, '19-0713712'),
('36', NULL, '19-1079892'),
('37', NULL, '19-1277494'),
('38', NULL, '20-7886428'),
('39', NULL, '21-2689388'),
('4', NULL, '03-3544565'),
('40', NULL, '21-3155551'),
('41', NULL, '22-2051613'),
('42', NULL, '22-6627032'),
('43', NULL, '22-9529013'),
('44', NULL, '24-4585192'),
('45', NULL, '24-4677621'),
('46', NULL, '24-9067553'),
('47', NULL, '24-9840403'),
('48', NULL, '25-9736142'),
('49', NULL, '27-8037561'),
('5', NULL, '04-2798023'),
('50', NULL, '27-8094243'),
('51', NULL, '28-7818998'),
('52', NULL, '29-2785103'),
('53', NULL, '29-5209106'),
('54', NULL, '29-6350132'),
('55', NULL, '29-6571924'),
('56', NULL, '29-7832408'),
('57', NULL, '30-1322103'),
('58', NULL, '30-3058947'),
('59', NULL, '30-7334418'),
('6', NULL, '05-3647243'),
('60', NULL, '30-8456021'),
('61', NULL, '32-6251861'),
('62', NULL, '33-0489054'),
('63', NULL, '33-5159037'),
('64', NULL, '33-7614004'),
('65', NULL, '34-2543597'),
('66', NULL, '34-2817296'),
('67', NULL, '34-4740678'),
('68', NULL, '35-8208617'),
('69', NULL, '36-6348131'),
('7', NULL, '05-5059849'),
('70', NULL, '36-6943031'),
('71', NULL, '36-7073092'),
('72', NULL, '37-0478226'),
('73', NULL, '37-7900056'),
('74', NULL, '37-8247167'),
('75', NULL, '38-0609594'),
('76', NULL, '38-1272080'),
('77', NULL, '38-2126707'),
('78', NULL, '38-5473326'),
('79', NULL, '38-8885296'),
('8', NULL, '06-3396053'),
('80', NULL, '39-4788866'),
('81', NULL, '40-2208062'),
('82', NULL, '40-5288701'),
('83', NULL, '41-3216938'),
('84', NULL, '41-3659990'),
('85', NULL, '41-9319442'),
('86', NULL, '42-0717807'),
('87', NULL, '42-2072103'),
('88', NULL, '42-5263028'),
('89', NULL, '42-7011523'),
('9', NULL, '06-3776558'),
('90', NULL, '42-7240015'),
('91', NULL, '42-8848918'),
('92', NULL, '43-6568300'),
('93', NULL, '44-7083318'),
('94', NULL, '45-1168337'),
('95', NULL, '46-0059406'),
('96', NULL, '46-2600043'),
('97', NULL, '47-1387266'),
('98', NULL, '48-9328765'),
('99', NULL, '49-2217652');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity_left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `start_location` varchar(255) NOT NULL,
  `end_location` varchar(255) NOT NULL,
  `arrival_time` time NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminations_log`
--

CREATE TABLE `terminations_log` (
  `termination_id` int(11) NOT NULL,
  `emp_id` varchar(20) NOT NULL,
  `termination_date` date NOT NULL,
  `termination_time` time NOT NULL,
  `deleting_employee_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `terminations_log`
--

INSERT INTO `terminations_log` (`termination_id`, `emp_id`, `termination_date`, `termination_time`, `deleting_employee_id`) VALUES
(2, '12-9213122', '2023-12-07', '10:38:46', '99-6209168'),
(3, '52-1421535', '2023-12-07', '11:18:09', '99-6209168'),
(5, '11-9853588', '2023-12-07', '13:38:13', '06-2857563'),
(6, '55-9921221', '2023-12-07', '13:41:39', '54-9522118'),
(7, '69-1349288', '2023-12-07', '13:45:11', '73-2251057'),
(8, '94-7981243', '2023-12-07', '13:52:25', '06-2857563');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `operating_area` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `purpose` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workhours`
--

CREATE TABLE `workhours` (
  `work_hours_id` int(11) NOT NULL,
  `hours_worked` int(11) NOT NULL,
  `emp_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`operating_area`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`building_id`),
  ADD KEY `fk_building_location` (`location_id`),
  ADD KEY `fk_building_area` (`operating_area`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `fk_complaint_customer` (`customer_id`),
  ADD KEY `fk_complaint_hr` (`hr_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_order` (`order_id`);

--
-- Indexes for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_order_customer` (`customer_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `FK_Department_Location` (`location_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_driver_vehicle` (`vehicle_id`),
  ADD KEY `fk_driver_employee` (`emp_id`);

--
-- Indexes for table `emergencycontact`
--
ALTER TABLE `emergencycontact`
  ADD PRIMARY KEY (`emergency_contact_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_employee_emergency_contact` (`emergency_contact_id`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `fk_hr_employee` (`emp_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `fk_office_building` (`building_id`);

--
-- Indexes for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `fk_order_product_product` (`product_id`),
  ADD KEY `fk_order_product_order` (`order_id`);

--
-- Indexes for table `packagers`
--
ALTER TABLE `packagers`
  ADD PRIMARY KEY (`packager_id`),
  ADD KEY `fk_packagers_work_hours` (`work_hours_id`),
  ADD KEY `fk_packagers_employee` (`emp_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_route_vehicle` (`vehicle_id`);

--
-- Indexes for table `terminations_log`
--
ALTER TABLE `terminations_log`
  ADD PRIMARY KEY (`termination_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `fk_vehicle_area` (`operating_area`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `fk_warehouse_building` (`building_id`);

--
-- Indexes for table `workhours`
--
ALTER TABLE `workhours`
  ADD PRIMARY KEY (`work_hours_id`),
  ADD KEY `fk_work_hours_employee` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emergencycontact`
--
ALTER TABLE `emergencycontact`
  MODIFY `emergency_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2120;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `terminations_log`
--
ALTER TABLE `terminations_log`
  MODIFY `termination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `building`
--
ALTER TABLE `building`
  ADD CONSTRAINT `fk_building_area` FOREIGN KEY (`operating_area`) REFERENCES `area` (`operating_area`),
  ADD CONSTRAINT `fk_building_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk_complaint_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_complaint_hr` FOREIGN KEY (`hr_id`) REFERENCES `hr` (`hr_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`order_id`) REFERENCES `customerorder` (`order_id`);

--
-- Constraints for table `customerorder`
--
ALTER TABLE `customerorder`
  ADD CONSTRAINT `fk_customer_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `FK_Department_Location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `fk_driver_employee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `fk_driver_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`);

--
-- Constraints for table `hr`
--
ALTER TABLE `hr`
  ADD CONSTRAINT `fk_hr_employee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `fk_office_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`);

--
-- Constraints for table `orderproduct`
--
ALTER TABLE `orderproduct`
  ADD CONSTRAINT `fk_order_product_order` FOREIGN KEY (`order_id`) REFERENCES `customerorder` (`order_id`),
  ADD CONSTRAINT `fk_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `packagers`
--
ALTER TABLE `packagers`
  ADD CONSTRAINT `fk_packagers_employee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `fk_packagers_work_hours` FOREIGN KEY (`work_hours_id`) REFERENCES `workhours` (`work_hours_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `fk_route_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `fk_vehicle_area` FOREIGN KEY (`operating_area`) REFERENCES `area` (`operating_area`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `fk_warehouse_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`);

--
-- Constraints for table `workhours`
--
ALTER TABLE `workhours`
  ADD CONSTRAINT `fk_work_hours_employee` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
