INSERT INTO genre (name)
	VALUES
	('Rock'),
	('Pop'),
	('Dance'),
	('R&B'),
	('Rap');

INSERT INTO executor (name)
	VALUES
	('Ария'),
	('Алиса'),
	('Полина Гагарина'),
	('Loboda'),
	('Madonna'),
	('Lady Gaga'),
	('Rihanna'),
	('Beyonce'),
	('Eminem'),
	('JAY-Z');

INSERT INTO genre_executor (genre_id, executor_id)
	VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(3, 3),
	(3, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(4, 8),
	(5, 9),
	(5, 10);

INSERT INTO album (name, release_date)
	VALUES
	('Штиль', 2002),
	('Саботаж', 2012),
	('Вчера', 2019),
	('Под лед', 2015),
	('Celebration', 2009),
	('Just dance', 2018),
	('ANTI', 2016),
	('Break my soul', 2020),
	('Recovery', 2010),
	('Kingdom Come', 2011);

INSERT INTO executor_album (executor_id, album_id)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(3, 4),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(9, 10),
	(10, 9),
	(10, 10);

INSERT INTO track (name, duration, album_id)
	VALUES
	('Потерянный рай', 350, 1),
	('Ангельская пыль', 360, 1),
	('Сны', 188, 2),
	('Рок', 242, 2),
	('Обезоружена', 272, 3),
	('Миллион голосов', 183, 4),
	('Новый Рим', 227, 4),
	('Лети', 183, 4),
	('Swim', 300, 5),
	('Frosen', 370, 5),
	('Poker Face', 238, 6),
	('My Alejandro', 273, 6),
	('Higler', 120, 7),
	('James Joint', 72, 7),
	('Formation', 206, 8),
	('Partition', 319, 8),
	('On fire', 213, 9),
	('Seduction', 275, 9),
	('I made it', 204, 10),
	('Anything', 261, 10);

INSERT INTO compilation (name, release_date)
	VALUES
	('Русский рок', 2012),
	('Russian pop', 2021),
	('Dance hits', 2018),
	('R&B stars', 2022),
	('Rap hits', 2011),
	('The best on the west', 2019),
	('Rap&Pop', 2020),
	('Hits collection', 2017);

INSERT INTO compilation_track (compilation_id, track_id)
	VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(3, 8),
	(3, 11),
	(3, 12),
	(4, 13),
	(4, 14),
	(4, 15),
	(4, 16),
	(5, 17),
	(5, 18),
	(5, 19),
	(5, 20),
	(6, 10),
	(6, 12),
	(6, 14),
	(7, 11),
	(7, 13),
	(7, 16),
	(7, 18),
	(8, 10),
	(8, 12),
	(8, 15),
	(8, 17);














