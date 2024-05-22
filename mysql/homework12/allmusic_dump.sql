INSERT INTO genres (name) VALUES
('Alternative Rock'),
('Lo-Fi'),
('Shoegaze'),
('Experimental Rock'),
('Electronic'),
('Grime'),
('Indie Rock'),
('Post-Punk'),
('Post-Rock'),
('Ska-Punk');

INSERT INTO artists (name, genre_id, biography) VALUES
('Sigur Rós', 9, 'Was formed in January 1994 in Reykjavík, Iceland'),
('Ska-P', 10, 'Was formed in 1994 in Madrid, Spain'),
('Son Lux', 9, 'Was formed in 2007 in New York, USA'),
('Sonic Youth', 4, 'Was formed in 1981 in New York, USA. Disbanded in 2011.'),
('Stereo Total', 7, 'Was formed in 1993 in Berlin, Germany. Disbanded in 2021.'),
('Sublime', 10, 'Was formed in 1988 in Long Beach, USA. Disbanded in 1996.'),
('The Smashing Pumpkins', 1, 'Was formed in 1988 in Chicago, USA'), 
('The Smiths', 8, 'Was formed in 1982 in Manchester, England. Disbanded in 1987.'),
('The Streets', 6, 'Mike Skinner was born in November 27, 1978 in Birmingham, England.'), 
('The Strokes', 8, 'Was formed in 1998 in New York, USA');

INSERT INTO releases (artist_id, name, genre_id, release_year, release_length, cover_id) VALUES
(1, 'Ágætis Byrjun', 9, '1999', '01:11:54', 'agatis.jpg'),
(3, 'Tomorrows I', 4, '2020', '00:34:53', 'tomorrows.jpg'),
(5, 'Do the Bambi', 7, '2005', '00:53:51', 'bambi.jpg'),
(6, "Robbin the Hood", 10, '1994', '01:00:51', 'robbin.jpg'),
(6, 'Sublime', 10, '1996', '00:58:34', 'sublime.jpg'),
(7, 'Siamese Dreams', 1, '1993', '01:02:17', 'dreams.jpg'),
(7, 'Mellon Collie and the Infinite Sadness', 1, '1995', '02:01:40', 'mellon.jpg'),
(8, 'The Queen Is Dead', 7, '1986', '00:37:05', 'queen.jpg'),
(9, 'Original Pirate Material', 6, '2002', '00:47:31', 'pirate.jpg'),
(10, 'Is This It', 8, '2001', '00:35:45', 'this.jpg');

INSERT INTO tracks (release_id, name, genre_id, track_length, track_link) VALUES
(1, 'Svefn-G-Englar', 9, '00:10:04', 'https://apple.music.com/Svefn-G-Englar%20artists%3ASigur+R%C3%B3s'),
(2, 'Undertow', 4, '00:05:46', 	'https://apple.music.com/Undertow%20artists%3ASon+Lux'),
(3, 'Cinémania', 7, '00:02:26', 'https://apple.music.com/Cin%C3%A9mania%20artists%3AStereo+Total'),
(5, 'What I Got', 10, '00:02:51', 'https://apple.music.com/What+I+Got%20artists%3ASublime'),
(5, 'Santeria', 10, '00:03:03', 'https://apple.music.com/Santeria%20artists%3ASublime'),
(6, 'Disarm', 1, '00:03:17', 'https://apple.music.com/Disarm%20artists%3AThe+Smashing+Pumpkins'),
(7, 'Zero', 1, '00:02:40', 'https://apple.music.com/Zero%20artists%3AThe+Smashing+Pumpkins'),
(8, "I Know It's Over", 7, '00:05:49', 'https://apple.music.com/I+Know+It%27s+Over%20artists%3AThe+Smiths'),
(9, "It's Too Late", 6, '00:04:11', 'https://apple.music.com/It%27s+Too+Late%20artists%3AThe+Streets'),
(10, 'Last Nite', 8, '00:03:17', 'https://apple.music.com/Last+Nite%20artists%3AThe+Strokes');

INSERT INTO users (name, email, password_hash, phone, created_at) VALUES
('Aayla', 'aayla_secura@jedi.gl', 'c09e0d523c50390f241fa9ea3796b4e4', 9281697137, '2023-11-09 06:38:39'), 
('Anakin', 'anakin_skywalker@jedi.gl', 'd783bdc09ad8a57e4afaf4243fd0af7c', 4882096994, '2023-12-03 09:19:25'),
('Dooku', 'count_dooku@jedi.gl', '3cc5720ad09858bcaa2590803793a32f', 9245046339, '2023-07-01 00:23:16'),
('Ki-Adi-Mundi', 'ki_adi_mundi@jedi.gl', '4421d1b5abe2a13f4655637c8d27ccc5', 4382795023, '2023-10-10 07:21:00'),
('Kit', 'kit_fisto@jedi.gl', '821646c71725d0035d0fd9c42cb5b0e5', 9283609302, '2023-08-25 07:32:56'),
('Mace', 'mace_windu@jedi.gl', '17d2c299e4d02f7b375eec3f057a5b50', 8506769486, '2023-09-09 11:03:49'),
('Obi-Wan', 'obi_wan_kenobi@jedi.gl', '7c7117a4308d8a037b14236179f42b92', 6962517851, '2023-04-05 01:18:38'),
('Plo', 'plo_koon@jedi.gl', '5f4a917e07379daa3ec7e114209c7426', 7991372546, '2023-10-29 08:29:01'),
('Qui-Gon', 'qui_gon_jinn@jedi.gl', 'd41aaf8159d515095d0ff2f5d2cf39c5', 4839627962, '2023-10-29 05:16:31'),
('Yoda', 'yoda@jedi.gl', 'fff94efd8ec139d871f696006ca3f7da', 4145918844, '2023-03-26 11:21:56');

INSERT INTO playlists (user_id, name, description) VALUES 
(2, '21', 'Music of XXI century'),
(7, 'My fav muzzle', 'unordered'),
(9, 'Ha-ha classic', 'Classical music'),
(10, 'e1990', '');

INSERT INTO playlist_content (playlist_id, track_id) VALUES 
(1, 2),
(1, 3),
(1, 9),
(1, 10),
(2, 8),
(4, 1),
(4, 4),
(4, 5),
(4, 6),
(4, 7);

INSERT INTO reviews (release_id, review, grade, user_id) VALUES 
(1, 'This album is perfect from beginning to end. The complete work tells an intricate story even though most of the lyrics are gibberish.', 10, 3),
(2, 'The album unfolds much more like a composed concept record than a collection of individual tracks with club potential.', 7, 5),
(3, "Do the Bambi isn't a radical change from Stereo Total's previous work, but it is completely enjoyable from start to finish.", 8, 9),
(4, 'The amount of great composition and well written material here, both engrossing and sometimes funny, both make up for it.', 9, 7),
(5, 'On my top 5 albums for sure, very influential for me as a person as a musician. So sad it was their last.', 10, 8),
(6, 'Hummer, one of my all-time fav tracks from SP.', 10, 4),
(7, "Corgan's musical and lyrical complexity and ambition reached an absurd level.", 10, 1),
(8, 'The Smiths were a great, seminal group, and this album depicts them at the height of their power.', 10, 2),
(9, "Skinner's debut, Original Pirate Material, is an excellent listen -- much better than the heavy-handed hype would make you think.", 10, 6),
(10, 'Stone. Cold. Classic. Easily one of the best debuts of all-time and a must-listen for any fan of rock music.', 10, 10);

INSERT INTO comments (track_id, comm, user_id, created_at) VALUES
(1, 'A song of such accomplished gorgeousness that one wonders why such tiny Iceland can musically outperform entire continents.', 3, '2024-05-08 00:46:31'),
(2, 'I told Son Lux that it is my fav song and they have made the song video!', 5, '2024-01-05 07:09:49'),
(3, "A cute who's-who in cinema world that name-checks everyone from Woody Allen to Sophia Loren.", 9, '2024-04-17 10:35:40'),
(4, 'Sublime are sitching between bracing hardcore and slow, sexy reggae numbers.', 7, '2024-02-14 08:56:14'),
(5, 'More conventional Reggae!', 8, '2024-02-03 07:25:37'),
(6, "One of Billy's more personal songs, he really describes how he feels about his parents and abusive childhood.", 4, '2024-01-06 07:19:35'),
(7, 'My favorite song of TSP!', 1, '2024-03-18 10:57:12'),
(8, "Critics who dismissed Morrissey's miserablism as juvenile angst found it harder to dismiss the honesty of this song.", 2, '2024-03-18 10:57:12'),
(9, 'Cool!', 6, '2024-01-29 06:56:29'),
(10, '10/10', 10, '2024-04-19 08:59:05');

INSERT INTO favorites (artist_id, user_id) VALUES
(1, 4),
(1, 1),
(1, 2),
(3, 3),
(3, 5),
(3, 9),
(3, 7),
(3, 8),
(6, 6),
(6, 10);

INSERT INTO listening_history (release_id, user_id, listened_at) VALUES 
(1, 4, '2023-08-19 10:49:08'),
(1, 1, '2023-10-16 05:18:07'),
(1, 2, '2024-02-18 04:44:58'),
(2, 3, '2024-02-26 01:35:53'),
(2, 5, '2024-04-28 01:30:51'),
(2, 9, '2023-09-03 14:05:50'),
(2, 7, '2024-05-11 00:06:49'),
(2, 8, '2023-07-23 06:23:46'),
(4, 6, '2023-08-01 04:53:54'),
(5, 10, '2023-11-29 04:58:56');
