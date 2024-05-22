/*
Подсчитаем, какие группы чаще всего попадают в избранное пользователей. 
Выведем десять самых часто выбираемых.
*/

SELECT 
	(SELECT name FROM artists AS a WHERE f.artist_id = a.id) AS band,
	COUNT(artist_id) AS favorite_band
FROM favorites AS f
GROUP BY band
ORDER BY favorite_band DESC
LIMIT 10; 

/* 
С помощью джойнов соединим три таблицы и выведем данные: название группы, 
название альбома, песни с этого альбома, год выпуска альбома. Упорядочим 
их по году выпуска и выведем первые десять: самые ранние. 
*/

SELECT
	a.name AS band,
	r.name AS album,
	t.name AS song,
	r.release_year AS `year`
FROM tracks AS t
JOIN releases AS r ON r.id = t.release_id
JOIN artists AS a ON a.id = r.artist_id
ORDER BY `year`
LIMIT 10;
