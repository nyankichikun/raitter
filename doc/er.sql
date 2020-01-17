-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'User'
--
-- ---

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `display_name` VARCHAR(50) NOT NULL,
  `password_digest` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Tweet'
--
-- ---

DROP TABLE IF EXISTS `Tweet`;

CREATE TABLE `Tweet` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(140) NOT NULL,
  `user_id` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'FollowRelationship'
--
-- ---

DROP TABLE IF EXISTS `FollowRelationship`;

CREATE TABLE `FollowRelationship` (
  `relation_id` INTEGER NOT NULL,
  `follow_id` INTEGER NOT NULL,
  `follower_id` INTEGER NOT NULL DEFAULT NULL,
  UNIQUE KEY (`relation_id`),
KEY (`relation_id`)
);

-- ---
-- Table 'Favorite'
--
-- ---

DROP TABLE IF EXISTS `Favorite`;

CREATE TABLE `Favorite` (
  `relation_id` INTEGER NOT NULL,
  `user_id` INTEGER NOT NULL,
  `tweet_id` INTEGER NOT NULL,
KEY (`relation_id`),
  UNIQUE KEY (`relation_id`)
);

-- ---
-- Table 'Room'
--
-- ---

DROP TABLE IF EXISTS `Room`;

CREATE TABLE `Room` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`name`)
);

-- ---
-- Table 'Message'
--
-- ---

DROP TABLE IF EXISTS `Message`;

CREATE TABLE `Message` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(140) NOT NULL,
  `user_id` INTEGER NOT NULL,
  `room_id` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Entry'
--
-- ---

DROP TABLE IF EXISTS `Entry`;

CREATE TABLE `Entry` (
  `relation_id` INTEGER NOT NULL,
  `user_id` INTEGER NOT NULL,
  `room_id` INTEGER NOT NULL,
  PRIMARY KEY (`relation_id`),
KEY (`relation_id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Tweet` ADD FOREIGN KEY (user_id) REFERENCES `User` (`id`);
ALTER TABLE `FollowRelationship` ADD FOREIGN KEY (follow_id) REFERENCES `User` (`id`);
ALTER TABLE `FollowRelationship` ADD FOREIGN KEY (follower_id) REFERENCES `User` (`id`);
ALTER TABLE `Favorite` ADD FOREIGN KEY (user_id) REFERENCES `User` (`id`);
ALTER TABLE `Favorite` ADD FOREIGN KEY (tweet_id) REFERENCES `Tweet` (`id`);
ALTER TABLE `Message` ADD FOREIGN KEY (user_id) REFERENCES `User` (`id`);
ALTER TABLE `Message` ADD FOREIGN KEY (room_id) REFERENCES `Room` (`id`);
ALTER TABLE `Entry` ADD FOREIGN KEY (user_id) REFERENCES `User` (`id`);
ALTER TABLE `Entry` ADD FOREIGN KEY (room_id) REFERENCES `Room` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `User` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Tweet` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `FollowRelationship` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Favorite` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Room` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Message` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Entry` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `User` (`id`,`name`,`display_name`,`password_digest`) VALUES
-- ('','','','');
-- INSERT INTO `Tweet` (`id`,`content`,`user_id`) VALUES
-- ('','','');
-- INSERT INTO `FollowRelationship` (`relation_id`,`follow_id`,`follower_id`) VALUES
-- ('','','');
-- INSERT INTO `Favorite` (`relation_id`,`user_id`,`tweet_id`) VALUES
-- ('','','');
-- INSERT INTO `Room` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Message` (`id`,`content`,`user_id`,`room_id`) VALUES
-- ('','','','');
-- INSERT INTO `Entry` (`relation_id`,`user_id`,`room_id`) VALUES
-- ('','','');