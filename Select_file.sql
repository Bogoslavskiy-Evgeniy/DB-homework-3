  SELECT g.name, COUNT(e.id)
    FROM executor e
    JOIN genre_executor ge ON e.id = ge.executor_id
    JOIN genre g ON ge.genre_id = g.id
GROUP BY g.name
ORDER BY COUNT;

SELECT COUNT(*)
  FROM track t
  JOIN album a ON t.album_id = a.id
 WHERE release_date IN (2019, 2020);

   SELECT a.name, AVG(duration)
     FROM track t
     JOIN album a ON t.album_id = a.id
 GROUP BY a.name
 ORDER BY AVG;

SELECT DISTINCT e.name
  FROM executor e
  JOIN executor_album ea ON e.id = ea.executor_id
  JOIN album a ON ea.album_id = a.id
 WHERE release_date <> 2020;

SELECT DISTINCT c.name
  FROM executor e
  JOIN executor_album ea ON e.id = ea.executor_id
  JOIN album a ON ea.album_id = a.id
  JOIN track t ON a.id = t.album_id
  JOIN compilation_track ct ON t.id = ct.track_id
  JOIN compilation c ON ct.compilation_id = c.id
 WHERE e.name LIKE 'Eminem';

SELECT DISTINCT a.name
  FROM genre g
  JOIN genre_executor ge ON g.id = ge.genre_id
  JOIN executor e ON ge.executor_id = e.id
  JOIN executor_album ea ON e.id = ea.executor_id
  JOIN album a ON ea.album_id = a.id
 WHERE g.id > 1;

   SELECT t.name
     FROM track t
FULL JOIN compilation_track ct ON t.id = ct.track_id
FULL JOIN compilation c ON ct.compilation_id = c.id
    WHERE c.id IS NULL ;

   SELECT e.name
     FROM executor e
     JOIN executor_album ea ON e.id = ea.executor_id
FULL JOIN album a ON ea.album_id = a.id
     JOIN track t ON a.id = t.album_id
    WHERE t.duration =
 		  (SELECT MIN(duration)
 	        FROM track);

-- 1 вариант
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

-- 2 вариант
SELECT name
  FROM album
 WHERE name IN
  	(SELECT a.name
       FROM album a
       JOIN track t ON a.id = t.album_id
   GROUP BY a.name
   ORDER BY COUNT(t.name)
      LIMIT 1);

-- 3 вариант
  SELECT a.name
    FROM album a
    JOIN track t ON a.id = t.album_id
GROUP BY a.name
ORDER BY COUNT(t.name)
   LIMIT 1;



  