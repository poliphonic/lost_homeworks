/*
1 
В базе данных shop и sample присутствуют одни  и те же таблицы, учебной 
базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу 
sample.users. Используйте транзакции.
 */

DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
USE sample;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  birthday_at DATE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

START TRANSACTION;
	INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
	DELETE FROM shop.users WHERE id = 1;
COMMIT;

/*
2
Создайте представление, которое выводит название name товарной позиции из 
таблицы products и соответствующее название каталога name из таблицы 
catalogs.
*/

USE shop;

CREATE OR REPLACE VIEW products_catalogs AS
SELECT
	p.name AS product_name,
	c.name AS catalog_name
FROM
	products AS p
JOIN
	catalogs AS c
ON
	p.catalog_id = c.id;

/*
3
Пусть имеется таблица с календарным полем created_at. В ней размещены 
разреженные календарные записи за август 2018 года '2018-08-01', 
'2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который 
выводит полный список дат за август, выставляя в соседнем поле значение 
1, если дата присутствует в исходной таблице и 0, если она отсутствует.
*/

DROP TABLE IF EXISTS august_2018;
CREATE TABLE august_2018 (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key,
  created_at DATE DEFAULT NULL
);

INSERT INTO august_2018 (created_at) VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17');

DROP TABLE IF EXISTS full_month;
CREATE TABLE full_month (
  day_num VARCHAR(255) DEFAULT NULL,
  every_day DATE DEFAULT NULL
);

INSERT INTO full_month (day_num) VALUES
	(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
	(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
	(21), (22), (23), (24), (25), (26), (27), (28), (29), (30),
	(31);

UPDATE full_month  
SET every_day = DATE_ADD('2018-07-31', INTERVAL day_num DAY);

SELECT 
	fm.every_day AS `day`,
	NOT ISNULL(a.created_at) AS 'is_noted'
FROM 
	full_month AS fm
LEFT JOIN 
	august_2018 AS a
ON 
	fm.every_day = a.created_at;

/*
4
Пусть имеется любая таблица с календарным полем created_at. Создайте 
запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 
самых свежих записей.
*/

DROP TABLE IF EXISTS august_2018;
CREATE TABLE august_2018 (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY key,
	created_at DATE DEFAULT NULL
);

INSERT INTO august_2018 (created_at) VALUES
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-16'),
	('2018-08-17');

INSERT INTO shop.august_2018 (created_at) SELECT birthday FROM vk.profiles;
	
DELETE 
	august_2018
FROM 
	august_2018 
JOIN
	(SELECT 
		created_at
	FROM
		august_2018
	ORDER BY
		created_at DESC
	LIMIT 5, 1) AS delpst
ON
	august_2018.created_at <= delpst.created_at;

SELECT * FROM august_2018 ORDER BY created_at;

/*
5
Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — 
"Доброй ночи".
*/

DELIMITER //

CREATE FUNCTION hello()
RETURNS TINYTEXT DETERMINISTIC
BEGIN 
	DECLARE hour_num INT;
	SET hour_num = HOUR(NOW());
	CASE
		WHEN hour_num BETWEEN 0 AND 5 THEN 
			RETURN 'Доброй ночи';
		WHEN hour_num BETWEEN 6 AND 11 THEN 
			RETURN 'Доброе утро';
		WHEN hour_num BETWEEN 12 AND 17 THEN 
			RETURN 'Добрый день';
		WHEN hour_num BETWEEN 18 AND 23 THEN 
			RETURN 'Добрый вечер';
	END CASE;
END//

DELIMITER ;

/*
6
В таблице products есть два текстовых поля: name с названием товара и 
description с его описанием. Допустимо присутствие обоих полей или одно 
из них. Ситуация, когда оба поля принимают неопределенное значение NULL 
неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей 
или оба поля были заполнены. При попытке присвоить полям NULL-значение 
необходимо отменить операцию.
*/

CREATE TRIGGER not_both_null BEFORE INSERT ON products
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. Both name and description are NULL!';
	END IF;
END;

/*
7
Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
Числами Фибоначчи называется последовательность в которой число равно 
сумме двух предыдущих чисел. Вызов функции FIBONACCI(10) должен 
возвращать число 55.
| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7  | 8  | 9  | 10 |
| 0 | 1 | 1 | 2 | 3 | 5 | 8 | 13 | 21 | 34 | 55 |
*/

DELIMITER //

CREATE FUNCTION fibonacci(num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE fs DOUBLE;
	SET fs = SQRT(5);
	RETURN (POW((1 + fs) / 2.0, num) + POW((1 - fs) / 2.0, num)) / fs;
END//

DELIMITER ;

DELIMITER ;
