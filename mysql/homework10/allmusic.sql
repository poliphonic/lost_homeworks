DROP DATABASE IF EXISTS allmusic;
CREATE DATABASE allmusic;
USE allmusic;

DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
	id SERIAL,
	name VARCHAR(50)
) COMMENT 'жанры';

DROP TABLE IF EXISTS artists;
CREATE TABLE artists (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
    genre_id BIGINT UNSIGNED NULL,
    biography TEXT,
 	FOREIGN KEY (genre_id) REFERENCES genres(id)
) COMMENT 'исполнители';

DROP TABLE IF EXISTS releases;
CREATE TABLE releases (
	id SERIAL,
	artist_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(120),
	genre_id BIGINT UNSIGNED NULL,
	release_year YEAR,
	release_length TIME,
	cover_id VARCHAR(50),
	FOREIGN KEY (artist_id) REFERENCES artists(id),
	FOREIGN KEY (genre_id) REFERENCES genres(id)
) COMMENT 'релизы';

DROP TABLE IF EXISTS tracks;
CREATE TABLE tracks (
	id SERIAL,
	release_id BIGINT UNSIGNED NULL,
	name VARCHAR(120),
	genre_id BIGINT UNSIGNED NULL,
	track_length TIME,
	track_link VARCHAR(120),
    FOREIGN KEY (release_id) REFERENCES releases(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
) COMMENT 'треки';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE, 
	created_at DATETIME DEFAULT NOW()
) COMMENT 'пользователи';

DROP TABLE IF EXISTS playlists;
CREATE TABLE playlists (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(60),
	description VARCHAR(120),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'плейлисты';

DROP TABLE IF EXISTS playlist_content;
CREATE TABLE playlist_content(
	playlist_id BIGINT UNSIGNED NOT NULL,
	track_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (playlist_id) REFERENCES playlists(id),
    FOREIGN KEY (track_id) REFERENCES tracks(id)
) COMMENT 'содержание плейлистов';

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews(
	id SERIAL,
	release_id BIGINT UNSIGNED NULL,
	review TEXT,
	grade TINYINT,
	user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (release_id) REFERENCES releases(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'обзоры';

DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	id SERIAL,
	track_id BIGINT UNSIGNED NULL,
	comm TEXT,
	user_id BIGINT UNSIGNED NOT NULL,
  	created_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'комментарии';

DROP TABLE IF EXISTS favorites;
CREATE TABLE favorites(
	id SERIAL,
    artist_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
  	FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'избранное';

DROP TABLE IF EXISTS listening_history;
CREATE TABLE listening_history (
	id SERIAL,
	release_id BIGINT UNSIGNED NULL,
    user_id BIGINT UNSIGNED DEFAULT NULL,
    listened_at DATETIME DEFAULT NOW(),
    FOREIGN KEY (release_id) REFERENCES releases(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'история прослушиваний';
