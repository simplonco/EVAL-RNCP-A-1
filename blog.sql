-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2016 at 06:32 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(1, 'uncategorized'),
(2, 'Business'),
(3, 'Politics'),
(4, 'Sports'),
(5, 'Military'),
(6, 'social ');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email_add` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `email_add`, `name`, `comment`) VALUES
(12, 4, 'adora@gmail.com', 'adora', 'Wow i can not belive that it is imazing but i thing we should do that ');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `posted` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `title`, `body`, `category_id`, `posted`) VALUES
(1, 1, 'US-backed forces in Syria say launching bid to seize ISIS \'capital\' Raqqa', '(CNN)US-backed militia groups in Syria said they\'re launching an operation to seize ISIS\' de facto capital, Raqqa, in coordination with international coalition forces. According to the statement, the Syrian Democratic Forces established a joint operations center Saturday night for the military campaign "Euphrates Rage," which includes multiple Arab, Kurdish and Turkmen militia groups. The operation was announced just days after Iraqi forces entered the city of Mosul, where they are now in a fierce battle with ISIS militants. There has been no official comment by the US-led coalition regarding the launch of a new Raqqa offensive.', 5, '2016-11-04 00:34:17'),
(2, 1, 'Spain: Alleged leader of Basque separatist group ETA arrested in France', '(CNN)Security forces have arrested the alleged leader of the Basque separatist group ETA, Spain\'s interior ministry said, in what is described as a "hard blow" to the militant organization.\r\n\r\nMikel Irastorza, 41, was detained Saturday in the town of Ascain, near the border with Spain in southwestern France, in a joint French-Spanish operation, the interior ministry statement said.\r\nIrastorza, who had been on the run since 2008, had been in charge of ETA activities for the past year and was the most senior ETA member still at large, the ministry said, following the arrest of the group\'s previous leader.\r\nHis arrest represents a "hard blow" to ETA, it said, "because it involves a leadership loss within the organization and the elimination of its management structure, which was responsible for administering the weapons and the explosive arsenal."\r\nTwo other people were arrested with Irastorza, the statement said. They\'re accused of collaboration with ETA and giving shelter to Irastorza in their house, the statement added.\r\nListed as a terrorist organization by Spain, the United States and the European Union, ETA is blamed for more than 800 deaths in its decades-long fight for an independent Basque state that it wants carved out of sections of northern Spain and southwestern France.\r\nIn 2011, ETA announced "a definitive cessation of its armed activity," raising hopes that decades of separatist violence might finally be over.\r\nAuthorities have continued their efforts since then to arrest the group\'s members.\r\nCNN\'s Sofia Fernandes contributed to this report.', 5, '2016-11-04 00:39:10'),
(3, 1, 'What the world wants to know about the US election', '(CNN)Many Americans might be suffering from election fatigue as we enter the final stretch before voting day, but if Google search traffic is any indication, the world is still more than interested.\r\n\r\nOver the last week, global searches related to the election have surged -- particularly in Canada, Uganda, Ghana, Ireland and Nigeria, the countries outside the US where Google search interest has been the highest over the past 7 days.', 3, '2016-11-04 14:20:26'),
(4, 1, 'Pope warns against walls ahead of US election', '(CNN)Pope Francis delivered a powerful message Saturday in which he warned against "social walls" and "false prophets" fueling fear and intolerance in politics.\r\n\r\nWhile the Pope made no mention of Donald Trump, his comments at the Vatican have been widely seen as a thinly veiled stab at the Republican presidential candidate, whose proposal to build a wall between the United States and Mexico has been a centerpiece of his campaign.', 3, '2016-11-04 14:25:03'),
(5, 1, 'Breeders\' Cup: Arrogate runs down California Chrome in Classic', '(CNN)Billed as the triumphant finale to a triumphant year, the Breeders\' Cup Classic ended in a first defeat of 2016 for California Chrome Saturday as young pretender Arrogate ran him down in the final stretch at Santa Anita.\r\n\r\nThe Dubai World Cup winner looked to have the $6 million race under control until jockey Mike Smith produced Arrogate to pip him at the post.\r\nFormer Kentucky Derby and Preakness winner Chrome, with jockey Victor Espinoza, was six for six this year with £13 million career earnings to make him the richest horse in American thoroughbred history, but all good things come to an end.', 6, '2016-11-05 17:21:05'),
(6, 1, 'Real Madrid and Bayern Munich to wear jerseys made from ocean waste', '(CNN)With his own range of designer shoes, branded clothes and luxury blankets, Cristiano Ronaldo isn\'t used to wearing rubbish.\r\n\r\nExcept, the Portuguese superstar soon will be -- literally.\r\n\r\nHis club Real Madrid and Bayern Munich -- along with kit manufacturer Adidas -- have teamed up with Parley for the Oceans, an organization that raises awareness about environmental damage to the world\'s seas, to create a one-off jersey.', 4, '2016-11-05 17:22:16'),
(7, 5, 'Kendall, Cara and ... Katie Grand? Meet the fashion industry\'s secret weapon', '(CNN)As social media continues to lift the veil on the inner workings of the fashion industry, the teams that craft the images -- make up artists, hairdressers, photographers and stylists -- have, in many cases, as much influence as the models and designers they support.', 6, '2016-11-06 12:48:35'),
(8, 5, 'Fireworks of the future? Japan to create fake shooting stars', '(CNN)Ephemeral and poetic, shooting stars are among the world\'s most beautiful natural wonders.\r\n\r\nBut come 2018, these fleeting fireballs will no longer be left to chance.\r\nJapanese space start-up ALE is developing the technology to deliver on-demand man-made meteors, which could turn the night sky into a blank canvas.\r\n"Imagine a future, where you can use our meteors for international fireworks displays, a proposal for marriage, or a special memorial," says Shinsuke Abe, ALE\'s research director and Nihon University aerospace engineering professor.\r\nThe grand showcase for this outer space entertainment could be the opening of the 2020 Olympics, in Tokyo, which ALE is rumored to have bid to take part in.', 6, '2016-11-06 12:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(5, 'adora', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
