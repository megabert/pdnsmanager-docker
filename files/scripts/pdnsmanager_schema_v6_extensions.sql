-- create additional tables for pdnsmanager for schema_version 6 
-- all further future updates have to be applied from pdnsmanager

CREATE TABLE `permissions` (
          `domain_id` int(11) NOT NULL,
          `user_id` int(11) NOT NULL,
          PRIMARY KEY (`domain_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `remote` (
          `id` int(11) NOT NULL AUTO_INCREMENT,
          `record` bigint(20) NOT NULL,
          `description` varchar(255) NOT NULL,
          `type` varchar(20) NOT NULL,
          `security` varchar(2000) NOT NULL,
          `nonce` varchar(255) DEFAULT NULL,
          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
          `id` int(11) NOT NULL AUTO_INCREMENT,
          `name` varchar(50) NOT NULL,
          `backend` varchar(50) NOT NULL,
          `type` varchar(20) NOT NULL,
          `password` varchar(255) DEFAULT NULL,
          PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `options` (
          `name` varchar(255) NOT NULL,
          `value` varchar(2000) DEFAULT NULL,
          PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `remote`
  ADD CONSTRAINT `remote_ibfk_1` FOREIGN KEY (`record`) REFERENCES `records` (`id`) ON DELETE CASCADE;

UPDATE users SET backend='native' WHERE backend='';

INSERT INTO `options` (`name`, `value`) VALUES
('schema_version', '6');
