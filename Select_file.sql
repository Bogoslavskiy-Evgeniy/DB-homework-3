--1 количество исполнителей в каждом жанре

  SELECT g.name, COUNT(e.id)
    FROM executor e
    JOIN genre_executor ge ON e.id = ge.executor_id
    JOIN genre g ON ge.genre_id = g.id
GROUP BY g.name
ORDER BY COUNT;

--2 количество треков, вошедших в альбомы 2019-2020 годов

SELECT COUNT(*)
  FROM track t
  JOIN album a ON t.album_id = a.id
 WHERE release_date IN (2019, 2020);

-- 3 средняя продолжительность треков по каждому альбому

   SELECT a.name, AVG(duration)
     FROM track t
     JOIN album a ON t.album_id = a.id
 GROUP BY a.name
 ORDER BY AVG;

--4 все исполнители, которые не выпустили альбомы в 2020 году

SELECT DISTINCT name
  FROM executor
 WHERE name NOT IN (
        SELECT DISTINCT e.name
        FROM executor e
        JOIN executor_album ea ON e.id = ea.executor_id
        JOIN album a ON ea.album_id = a.id
        WHERE release_date = 2020);

--5 названия сборников, в которых присутствует конкретный исполнитель (выберите сами)

SELECT DISTINCT c.name
  FROM executor e
  JOIN executor_album ea ON e.id = ea.executor_id
  JOIN album a ON ea.album_id = a.id
  JOIN track t ON a.id = t.album_id
  JOIN compilation_track ct ON t.id = ct.track_id
  JOIN compilation c ON ct.compilation_id = c.id
 WHERE e.name LIKE 'Eminem';

--6 название альбомов, в которых присутствуют исполнители более 1 жанра

SELECT DISTINCT a.name
    FROM genre g
    JOIN genre_executor ge ON g.id = ge.genre_id
    JOIN executor e ON ge.executor_id = e.id
    JOIN executor_album ea ON e.id = ea.executor_id
    JOIN album a ON ea.album_id = a.id
GROUP BY a.name
  HAVING COUNT (e.name)>1;

--7 наименование треков, которые не входят в сборники

   SELECT t.name
     FROM track t
FULL JOIN compilation_track ct ON t.id = ct.track_id
FULL JOIN compilation c ON ct.compilation_id = c.id
    WHERE c.id IS NULL;

--8 исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)

   SELECT e.name
     FROM executor e
     JOIN executor_album ea ON e.id = ea.executor_id
FULL JOIN album a ON ea.album_id = a.id
     JOIN track t ON a.id = t.album_id
    WHERE t.duration =
 		  (SELECT MIN(duration)
 	        FROM track);

--9 название альбомов, содержащих наименьшее количество треков

  SELECT a.name
    FROM album a
    JOIN track t ON a.id = t.album_id
GROUP BY a.name
  HAVING COUNT(*) = (SELECT COUNT(a.id)
    FROM album a
    JOIN track t ON a.id = t.album_id
GROUP BY a.name
ORDER BY COUNT
   LIMIT 1);




  