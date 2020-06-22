drop database if exists kurs_v1;
create database kurs_v1;
use kurs_v1;

drop table if exists table_organization;
create table table_organization(
	`id` SERIAL primary key,
  	name_division VARCHAR(100) not null,
  	plan_in_ton varchar(100),
  	index table_organization(name_division)
)COMMENT = 'Создание базы по верхнему уровню организации' ;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL primary key,
  id_manager INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  
) COMMENT = 'от кого приказ и сколько в плане добыть';

drop table if exists sub_organization;
create table sub_organization(
	id SERIAL PRIMARY KEY,
  	name_subdivision VARCHAR(100),
  	plan_in_ton varchar(100)
)COMMENT = 'Создание базы по уровням подразделений организации' ;

drop table if exists managers;
create table managers(
	id SERIAL PRIMARY KEY,
	id_manager BIGINT UNSIGNED NOT NULL,
	firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамиль',
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  FOREIGN KEY (id_manager) REFERENCES orders(id_manager)
)COMMENT = 'Имена и должности начальства связанных с подразделениями орагинзаций';

drop table if exists staff;
create table staff(
	id SERIAL PRIMARY KEY,
	id_staff BIGINT UNSIGNED NOT NULL,
	firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамиль',
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT = 'Имена и должности работников связанных с подразделениями орагинзаций';

drop table if exists equipment;
create table equipment(
	id SERIAL PRIMARY KEY,
	id_equipment BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT = 'Оборудование для обработки породы в связке с подразделениями и машинами';

drop table if exists big_cars;
create table big_cars(
	id SERIAL PRIMARY KEY,
	id_big_cars BIGINT UNSIGNED NOT NULL,
	desription TEXT COMMENT 'Описание',
	gaz_in_ton DECIMAL (20,2) COMMENT 'объем в топлива',
	val_in_ton DECIMAL (20,2) COMMENT 'объем в тоннах',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'начала запуска машины в работу',
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT = 'Оборудование для обработки породы в связке с подразделениями и машинами';

DROP TABLE IF EXISTS orders_big_cars;
CREATE TABLE orders_big_cars(
  id SERIAL PRIMARY KEY,
  id_manager INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'от кого приказ и сколько в плане добыть';

drop table if exists small_cars;
create table small_cars(
	id SERIAL PRIMARY KEY,
	id_small_cars BIGINT UNSIGNED NOT NULL,
	desription TEXT COMMENT 'Описание',
	gaz_in_ton DECIMAL (20,2) COMMENT 'объем в топлива',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'начала запуска машины в работу',
  	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)COMMENT = 'Оборудование для доставки сотрудников в связке с подразделениями и машинами';

DROP TABLE IF EXISTS orders_small_cars;
CREATE TABLE orders_small_cars(
  id SERIAL PRIMARY KEY,
  id_manager INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'от кого приказ и сколько в плане добыть';