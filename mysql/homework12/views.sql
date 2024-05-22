/*
Заводим представление temp, в который из разных таблиц добавляем название 
группы, название альбома, оценки, выставленные в обзорах, и количество 
прослушиваний. Это промежуточная таблица, которая понадобится нам для 
составления таблицы рейтингов.
 */

CREATE OR REPLACE VIEW temp AS 
	SELECT
		a.name AS band,
		rl.name AS album,
		rw.grade AS grade,
		COUNT(lh.release_id) AS listenings
	FROM listening_history AS lh
	JOIN releases AS rl ON rl.id = lh.release_id
	JOIN reviews AS rw  ON rw.release_id = rl.id
	JOIN artists AS a ON a.id = rl.artist_id
	GROUP BY album;

SELECT * FROM temp;

/*
Всю необходимую информацию для представления рейтингов мы получим 
из представления temp: название группы, название альбома и рейтинг, 
который получается путем умножения оценки альбома, умноженной 
на количество его прослушиваний.
 */

CREATE OR REPLACE VIEW rating_table AS 
	SELECT 
		band,
		album,
		grade * listenings AS rating
	FROM temp
	ORDER BY rating DESC;
	
SELECT * FROM rating_table;