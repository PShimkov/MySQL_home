use vk;

-- Generation time: Wed, 10 Jun 2020 14:49:49 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_20
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `friend_requests`;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` VALUES ('1','1','1','2007-09-05 14:50:00'),
('2','2','2','1998-11-02 04:24:26'),
('3','3','3','2018-02-02 05:37:30'),
('4','4','4','2005-05-31 03:27:46'),
('5','5','5','1989-06-17 03:27:35'),
('6','6','6','2014-01-22 22:18:44'),
('7','7','7','2009-03-08 08:53:11'),
('8','8','8','2006-08-24 23:14:39'),
('9','9','9','1991-10-11 18:11:48'),
('10','10','10','1994-03-19 01:59:24'); 


DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` VALUES ('1','1','1','Quibusdam omnis voluptas architecto dolorum temporibus sint autem. Ut est quod sed qui neque quidem qui. Voluptas aut ex et autem.','expedita','268057621',NULL,'1983-11-13 09:35:54','1976-10-22 00:18:23'),
('2','2','2','Eum et velit itaque sit. Eos aspernatur aut praesentium labore ut aperiam laboriosam ex. Consequatur neque quia sit delectus.','sint','9532',NULL,'1977-03-18 13:00:27','1972-09-18 21:07:05'),
('3','3','3','Voluptatem nulla mollitia id ut voluptate ea. Reprehenderit consequuntur voluptates omnis placeat. Id animi qui ratione unde.','rerum','7859',NULL,'1981-06-20 07:52:36','1989-11-20 18:32:04'),
('4','4','4','Tempora vitae aliquid rerum rerum. Nisi sit aut voluptatibus et. Quia nihil ea ex perferendis velit repellendus voluptas.','quia','44264',NULL,'1988-05-01 19:26:27','1997-08-17 05:50:24'),
('5','5','5','Ea molestiae dolores voluptatem voluptatem vel quibusdam in. Fugiat omnis provident aliquid magnam non qui doloribus. Nihil et dolores qui quis reiciendis eos.','porro','0',NULL,'1979-11-06 03:57:46','1982-10-21 04:57:31'),
('6','6','6','Ut rerum ducimus alias earum incidunt aspernatur voluptatem. Dolore occaecati accusantium sit deserunt laudantium possimus beatae. Deleniti quo ipsa iure tempora a. Autem aspernatur tempore nulla sed et sit similique.','illo','8350218',NULL,'1992-04-01 15:46:54','2013-03-15 01:44:28'),
('7','1','7','Eos culpa error corporis aut. Sed ex et reiciendis labore sequi quaerat cumque. Sunt esse quo aut consectetur autem.','commodi','819798',NULL,'1998-11-07 14:30:47','1989-09-18 08:17:19'),
('8','2','8','Cumque sapiente sequi id velit. Et earum natus placeat a. Est quo aut iure est. Autem qui laborum nulla ut voluptatem perferendis fugiat.','molestias','357',NULL,'1984-04-05 12:34:19','2019-07-06 08:13:38'),
('9','3','9','Accusamus sed non eum. Exercitationem odio id impedit soluta. Qui voluptate eveniet deserunt et ratione doloremque. Quas sed esse quis cumque voluptas et.','deserunt','885700',NULL,'2005-10-08 15:14:51','1991-07-04 03:59:24'),
('10','4','10','Aut quisquam deleniti excepturi vel velit molestiae impedit. Animi aut voluptas omnis architecto nihil inventore ipsam. Ut et eos ratione deleniti temporibus cumque. Ut eum quas vel eveniet.','qui','9227',NULL,'1984-10-11 08:02:13','2003-09-12 16:44:38'),
('11','5','11','Enim consequatur perferendis numquam cum animi rerum qui. Soluta rerum et nesciunt et eos aut. Rem asperiores maxime et vel labore iusto commodi. Quo incidunt laboriosam voluptas assumenda labore laboriosam quo.','eligendi','519790592',NULL,'1976-06-29 11:10:29','1998-06-30 07:43:17'),
('12','6','12','Quasi cumque tenetur vel id. Deserunt minus tenetur non rerum repellat. Sunt quibusdam sunt voluptas vitae voluptas perspiciatis.','corporis','6268',NULL,'1992-02-27 09:52:27','2003-03-29 11:22:04'),
('13','1','13','Occaecati voluptates maxime cumque facere et ipsa. Velit quia autem voluptatem enim maiores ut quidem. Eum nihil saepe temporibus voluptas.','vero','722',NULL,'2018-02-12 13:14:39','1990-01-08 22:51:28'),
('14','2','14','Laudantium sed facilis quae beatae voluptatibus voluptas quas. Dolore non voluptas culpa at ut ut autem. Accusamus ut tempora aperiam dolores.','fugiat','84204',NULL,'1970-07-23 00:40:50','2017-02-18 09:54:34'),
('15','3','15','Ut et minus numquam ullam. Iure earum eos illo tempora odit occaecati excepturi. Dolorum repellat beatae consequatur et laborum non.','voluptatem','139585890',NULL,'2017-03-16 22:20:48','1988-12-26 10:14:36'); 


DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` VALUES ('1','voluptatem','2001-04-25 04:49:12','1973-02-09 22:09:10'),
('2','aliquid','2015-04-30 05:38:49','1986-11-18 06:45:02'),
('3','et','2000-12-29 11:48:51','2019-04-30 10:37:09'),
('4','totam','1973-03-03 23:19:26','1970-08-21 06:41:24'),
('5','ea','1993-02-03 23:05:37','1971-11-26 03:11:24'),
('6','aut','2000-02-13 13:23:42','2020-01-08 13:21:44'); 


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `post_posts`;
CREATE TABLE `post_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_post_id` bigint(20) unsigned NOT NULL,
  `post_to_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_post_id` (`from_post_id`),
  KEY `post_to_id` (`post_to_id`),
  CONSTRAINT `post_posts_ibfk_1` FOREIGN KEY (`from_post_id`) REFERENCES `users` (`id`),
  CONSTRAINT `post_posts_ibfk_2` FOREIGN KEY (`post_to_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` VALUES ('1','Brett','Stracke','hessel.nolan@example.com','87690'),
('2','Emmie','Conroy','thea21@example.net','439746'),
('3','Paul','Franecki','arnold.klein@example.net','5478296102'),
('4','Ola','Bode','joanne71@example.net','0'),
('5','Berniece','Halvorson','melody.kerluke@example.net','53462'),
('6','Lizeth','Quitzon','emerald.medhurst@example.net','0'),
('7','Michaela','Tromp','stroman.thalia@example.net','0'),
('8','Christelle','McLaughlin','phomenick@example.org','942'),
('9','Westley','Fritsch','mallie29@example.com','1044943647'),
('10','Ova','Corwin','noel.kessler@example.org','1'),
('11','Jacky','Kulas','jmarks@example.net','672708'),
('12','Pearline','Satterfield','presley40@example.com','1'),
('13','Ron','McCullough','egoldner@example.net','978'),
('14','Jayme','Gorczany','nolan.mcglynn@example.org','610'),
('15','Americo','Weimann','zbradtke@example.org','4626667062'),
('16','Alexandre','Lind','alivia.west@example.com','10864'),
('17','D\'angelo','Kunze','ransom.mante@example.com','6'),
('18','Issac','Cruickshank','ubeatty@example.org','0'),
('19','Colt','Nienow','daugherty.rosa@example.com','0'),
('20','Arielle','Lehner','giovanna.corwin@example.com','1'),
('21','Coty','Considine','benedict58@example.org','46'),
('22','Tiara','Gerlach','cali43@example.org','681958'),
('23','Emmanuel','Becker','jschuster@example.net','707272'),
('24','Kraig','Ruecker','veda26@example.net','0'),
('25','Sigmund','Hermann','reichert.hillary@example.net','204990'),
('26','Jaiden','Reichert','melisa21@example.com','974'),
('27','Elisabeth','Mitchell','feffertz@example.org','0'),
('28','Enrico','O\'Connell','utreutel@example.net','581283'),
('29','Joel','Bartoletti','brennan.breitenberg@example.net','1093359303'),
('30','Martina','O\'Reilly','schmidt.hilda@example.com','4336152912'),
('31','Piper','Harris','geovanny.lindgren@example.net','0'),
('32','Waylon','Wisozk','mabel25@example.net','559'),
('33','Garrick','Bayer','yundt.keagan@example.org','333246'),
('34','Laisha','Balistreri','ena72@example.org','1'),
('35','Ettie','Schneider','kuhic.summer@example.org','0'),
('36','Piper','Abernathy','tania51@example.com','1'),
('37','Alfredo','Rodriguez','haylee27@example.org','908426'),
('38','Hailee','Ferry','kuvalis.charity@example.com','596496'),
('39','Novella','Fay','denis56@example.net','0'),
('40','Elmo','Hessel','ferry.jillian@example.net','1'),
('41','Ervin','Mills','mohammed.carroll@example.org','439978445'),
('42','Brad','Carroll','henri46@example.org','55562'),
('43','Pansy','Ondricka','jamar24@example.com','319'),
('44','Easton','Torp','imetz@example.org','57'),
('45','Kali','O\'Conner','magnolia.strosin@example.net','0'),
('46','Kaden','Herzog','jacquelyn.hills@example.com','1'),
('47','Duane','Howell','imonahan@example.com','776008336'),
('48','Raul','Gislason','ritchie.kay@example.org','684625'),
('49','Alexandrine','Cummerata','zbrakus@example.org','890745'),
('50','Nickolas','McGlynn','pbahringer@example.org','1'),
('51','Webster','Erdman','cecilia58@example.com','53'),
('52','Joey','Lakin','gmcclure@example.org','68'),
('53','Myriam','Ruecker','lakin.yasmin@example.com','857'),
('54','Kavon','Ryan','blaze.lebsack@example.net','604957'),
('55','Jermey','Dare','ewintheiser@example.com','0'),
('56','Bernardo','Ebert','cornell54@example.org','0'),
('57','Chaya','Nitzsche','janiya.raynor@example.com','0'),
('58','Alisha','White','glenda.senger@example.org','279517'),
('59','Marguerite','Wyman','wlubowitz@example.org','1'),
('60','Cornell','Corkery','derdman@example.net','1'),
('61','Cordell','Hoeger','miller27@example.org','0'),
('62','Leopoldo','Johnson','jacklyn.renner@example.com','601147'),
('63','Courtney','Jerde','elvera25@example.org','0'),
('64','Thomas','Bergnaum','johnston.jimmy@example.net','1'),
('65','Mustafa','Crist','bwhite@example.com','0'),
('66','Lucile','Lemke','nicklaus09@example.net','42'),
('67','Antonietta','O\'Keefe','qlangworth@example.com','44'),
('68','Austyn','O\'Connell','hailey02@example.com','77'),
('69','Retta','Zulauf','antwan70@example.com','449'),
('70','Jamie','Schowalter','ernie31@example.net','0'),
('71','Zelma','Bashirian','eullrich@example.net','480'),
('72','Harley','Hayes','enrique.schoen@example.net','0'),
('73','Ayla','Osinski','lillian91@example.com','194060'),
('74','Pasquale','Prosacco','edwin.lind@example.org','1'),
('75','Devonte','Kemmer','skylar17@example.com','839517'),
('76','Marshall','O\'Keefe','qbatz@example.org','971'),
('77','Davon','Kris','o\'conner.adriel@example.com','0'),
('78','Sigurd','Johnson','rhoeger@example.org','0'),
('79','Tad','Keeling','xziemann@example.net','7532335790'),
('80','Green','Senger','colby27@example.net','1'),
('81','Nestor','Medhurst','mitchell.dorothea@example.net','1'),
('82','Reginald','Gibson','ariel41@example.net','0'),
('83','Alverta','Willms','tommie.schoen@example.com','0'),
('84','Blaise','Larson','freda.bernier@example.org','0'),
('85','Abagail','Ondricka','eino26@example.net','1'),
('86','Lesly','Howe','ferne.tillman@example.org','0'),
('87','Unique','Jerde','leonora62@example.org','298753'),
('88','Mallie','Frami','lavon68@example.net','6755945598'),
('89','Francis','Lockman','medhurst.otis@example.net','299'),
('90','Irving','Yundt','lisette.rolfson@example.org','956'),
('91','Eunice','Hartmann','dooley.wilber@example.org','1'),
('92','Johnpaul','Gerhold','terrell37@example.net','1'),
('93','Maybelle','Kshlerin','langworth.craig@example.com','0'),
('94','Norris','Toy','brendon99@example.org','1'),
('95','Adele','Cronin','brianne.ratke@example.net','136'),
('96','Jacques','Schoen','guadalupe11@example.org','500'),
('97','Lois','Grimes','retha.lebsack@example.com','47'),
('98','Malika','Steuber','cmcglynn@example.net','566'),
('99','Alicia','Christiansen','bernita.stanton@example.org','1'),
('100','Brandi','Nienow','kutch.ernest@example.net','6789934749'); 


DROP TABLE IF EXISTS `users_communities`;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `profiles` values ('1', 'M', '1986-11-18 06:45:02', '21422');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Home task 2

select distinct firstname
from users
order by firstname;

-- Home Task 3

ALTER TABLE vk.profiles 
ADD COLUMN is_active BIT DEFAULT 1;

update profiles
set is_active = 0
where (birthday + INTERVAL 18 YEAR) > now();

select *
from profiles
where is_active = 0
order by birthday;

select *
from profiles
where is_active = 1
order by birthday;

-- Home Task 4

ALTER TABLE messages 
ADD COLUMN is_deleted BIT DEFAULT 0;

update messages
set created_at = now() + interval 1 year
limit 2;

update messages
set is_deleted = 1
where created_at > NOW();


select *
from messages
order by created_at desc;

