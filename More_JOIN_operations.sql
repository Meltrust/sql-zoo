-- 'More JOIN operations TUTORIAL'
--1
SELECT
  id,
  title
FROM
  movie
WHERE
  yr = 1962;

--2
SELECT
  yr
FROM
  movie
WHERE
  title = 'Citizen Kane';

--3
SELECT
  id,
  title,
  yr
FROM
  movie
WHERE
  title LIKE '%Star_Trek%'
ORDER BY
  yr;

--4
SELECT
  id
FROM
  actor
WHERE
  name LIKE '%Glenn Close%';

--5
SELECT
  movie.id
FROM
  movie
WHERE
  title LIKE 'Casablanca';

--6
SELECT
  actor.name
FROM
  actor
  JOIN casting ON actor.id = casting.actorid
WHERE
  movieid = 11768;

--7
SELECT
  actor.name
FROM
  actor
  JOIN casting ON actor.id = casting.actorid
WHERE
  movieid =(
    SELECT
      movie.id
    FROM
      movie
    WHERE
      title LIKE 'Alien'
  );

--8
SELECT
  movie.title
FROM
  movie
  JOIN casting ON movie.id = casting.movieid
  AND (
    actorid = (
      SELECT
        id
      FROM
        actor
      WHERE
        actor.name = 'Harrison Ford'
    )
  );

-- ANOTHER POSSIBLE CLEANER ANSWER
SELECT
  title
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  actor.name = 'Harrison Ford';

--9
SELECT
  title
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  actor.name = 'Harrison Ford'
  AND casting.ord != 1
GROUP BY
  title;

--10
SELECT
  movie.title,
  actor.name
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  movie.yr = 1962
  AND casting.ord = 1;

--11
SELECT
  yr,
  COUNT(title)
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  actor.name = 'Rock Hudson'
GROUP BY
  yr
HAVING
  COUNT(title) > 2;

--12
SELECT
  title,
  actor.name
FROM
  movie
  JOIN casting ON movie.id = movieid
  JOIN actor ON actorid = actor.id
WHERE
  ord = 1
  AND movieid IN (
    SELECT
      movieid
    FROM
      casting
      JOIN actor ON actorid = actor.id
    WHERE
      name = 'Julie Andrews'
  );

--13
SELECT
  name
FROM
  actor
  JOIN casting ON id = actorid
  AND ord = 1
GROUP BY
  name
HAVING
  COUNT(name) >= 15;

--14
SELECT
  movie.title,
  COUNT(casting.actorid)
FROM
  movie
  JOIN casting ON id = movieid
WHERE
  yr = 1978
GROUP BY
  title
ORDER BY
  COUNT(actorid) DESC,
  title;

--15
SELECT
  DISTINCT actor.name
FROM
  movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
WHERE
  movie.id IN (
    SELECT
      movieid
    FROM
      casting
      JOIN actor ON id = actorid
    WHERE
      actor.name = 'Art Garfunkel'
  )
  AND actor.name <> 'Art Garfunkel';

-- QUIZ
--1
-- 'OPTION 3'
--2
-- 'OPTION 5'
--3
-- 'OPTION 3'
--4
-- 'OPTION 2'
--5
-- 'OPTION 4
--6
-- 'OPTION 3'
--7 
-- 'OPTION 2'
--END