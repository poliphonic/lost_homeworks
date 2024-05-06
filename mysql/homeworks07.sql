/* 
1
Составьте список пользователей users, которые осуществили хотя бы один 
заказ orders в интернет магазине.
*/

SELECT DISTINCT users.id, users.name
FROM users
JOIN orders
ON users.id = orders.user_id;

/*
2
Выведите список товаров products и разделов catalogs, который 
соответствует товару.
*/

SELECT products.id, products.name, catalogs.name AS 'catalog name'
FROM products
JOIN catalogs
ON products.catalog_id = catalogs.id;

/*
3
Пусть имеется таблица рейсов flights (id, from, to) и таблица городов 
cities (label, name). Поля from, to и label содержат английские названия 
городов, поле name — русское. Выведите список рейсов flights с русскими
 названиями городов.
 */

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`from` VARCHAR(255),
	`to` VARCHAR(255)
);

INSERT INTO flights (`from`, `to`) VALUES 
	('moscow', 'omsk'), 
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');


DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	label VARCHAR(255),
	name VARCHAR(255)
);

INSERT INTO cities(label, name)
VALUES 
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');

SELECT c_from.name AS `from`, c_to.name AS `to`
FROM flights
JOIN cities AS c_from ON flights.from = c_from.label
JOIN cities AS c_to ON flights.to = c_to.label;
