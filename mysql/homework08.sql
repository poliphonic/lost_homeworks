/*
1
Пусть задан некоторый пользователь. Из всех пользователей соц. сети 
найдите человека, который больше всех общался с выбранным пользователем 
(написал ему сообщений).
*/

SELECT 
	from_user_id, 
	CONCAT(u.firstname, ' ', u.lastname) AS name,
	COUNT(*) AS messages_cnt
FROM messages AS m
JOIN users AS u ON u.id = m.from_user_id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY messages_cnt DESC
limit 1;

/*
2
Подсчитать общее количество лайков, которые получили пользователи младше 
10 лет.
*/

SELECT COUNT(*) AS likes_cnt
FROM likes AS l
JOIN media AS m ON l.media_id = m.id
JOIN profiles AS p ON p.user_id = m.user_id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10;

/*
3
Определить кто больше поставил лайков (всего): мужчины или женщины. 
*/

SELECT 
	gender AS sex, 
	COUNT(*) AS likes_cnt
FROM likes AS l
JOIN profiles AS p ON l.user_id = p.user_id 
GROUP BY sex;
