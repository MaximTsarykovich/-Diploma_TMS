-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 3.10.227.1
-- Дата: 08.05.2017 15:49:42
-- Версия сервера: 5.5.23
-- Версия клиента: 4.1

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;

SET NAMES 'utf8';
USE bankassistant;

--
-- Описание для таблицы admin
--
CREATE TABLE admin(
  login VARCHAR (16) DEFAULT 'root',
  `password` VARCHAR (16) NOT NULL DEFAULT 'root',
  PRIMARY KEY (login)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы tariffs
--
CREATE TABLE tariffs(
  tariff_id INT (11) NOT NULL AUTO_INCREMENT,
  percent INT (3) NOT NULL,
  max_sum INT (11) NOT NULL,
  min_sum INT (11) NOT NULL,
  max_time INT (11) NOT NULL,
  name VARCHAR (45) NOT NULL,
  PRIMARY KEY (tariff_id),
  UNIQUE INDEX name_UNIQUE USING BTREE (name)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы users
--
CREATE TABLE users(
  acc_id INT (11) NOT NULL AUTO_INCREMENT,
  f_name VARCHAR (45) DEFAULT NULL,
  l_name VARCHAR (45) DEFAULT NULL,
  age INT (11) DEFAULT NULL,
  n_pass INT (11) DEFAULT NULL,
  address VARCHAR (128) DEFAULT NULL,
  login VARCHAR (16) NOT NULL,
  `password` VARCHAR (45) NOT NULL,
  PRIMARY KEY (acc_id),
  UNIQUE INDEX acc_id_UNIQUE USING BTREE (acc_id),
  UNIQUE INDEX login_UNIQUE USING BTREE (login)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы deposits
--
CREATE TABLE deposits (
  deposit_id INT(11) NOT NULL AUTO_INCREMENT,
  amount INT(11) NOT NULL,
  `time` INT(11) NOT NULL,
  is_confirmed TINYINT(1) NOT NULL DEFAULT 0,
  tarif_id INT(11) NOT NULL,
  user_login VARCHAR(16) NOT NULL,
  PRIMARY KEY (deposit_id),
  UNIQUE INDEX deposit_id_UNIQUE USING BTREE (deposit_id),
  INDEX tarif_id_idx USING BTREE (tarif_id),
  INDEX user_login_idx USING BTREE (user_login),
  CONSTRAINT tarif_id FOREIGN KEY (tarif_id)
    REFERENCES tariffs(tariff_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT user_login FOREIGN KEY (user_login)
    REFERENCES users(login) ON DELETE NO ON UPDATE NO
)
ENGINE = INNODB
AUTO_INCREMENT = 5
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы admin
-- 
INSERT INTO admin VALUES('admin', 'password');


-- 
-- Вывод данных для таблицы tariffs
-- 
INSERT INTO tariffs VALUES(1, 6, 90000, 5000, 3650, 'Тариф "Семейный"');


-- 
-- Вывод данных для таблицы users
-- 
INSERT INTO users VALUES(1, 'Петя', 'Петров', 25, 123456, 'минск', 'user1', 'password');


-- 
-- Вывод данных для таблицы deposits
-- 
INSERT INTO deposits VALUES(4, 10000, 365, 1, 1, 'user1');


/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;

