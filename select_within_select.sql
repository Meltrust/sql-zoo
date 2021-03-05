-- 'SELECT within SELECT tutorial'
--1
SELECT
  name
FROM
  world
WHERE
  population > (
    SELECT
      population
    FROM
      world
    WHERE
      name = 'Russia'
  );

--2
SELECT
  name
FROM
  world
WHERE
  continent LIKE 'Europe'
  AND gdp / population > (
    SELECT
      gdp / population
    FROM
      world
    WHERE
      name LIKE 'United Kingdom'
  );

--3
SELECT
  name,
  continent
FROM
  world
WHERE
  continent IN (
    SELECT
      continent
    FROM
      world
    WHERE
      name LIKE 'Argentina'
      OR name LIKE 'Australia'
  )
ORDER BY
  name;

--4
SELECT
  name,
  population
FROM
  world
WHERE
  population > (
    SELECT
      population
    FROM
      world
    WHERE
      name = 'Canada'
  )
  AND population < (
    SELECT
      population
    FROM
      world
    WHERE
      name = 'Poland'
  );

--5
SELECT
  name,
  CONCAT(
    ROUND(
      100 * population /(
        SELECT
          population
        FROM
          world
        WHERE
          name = 'Germany'
      )
    ),
    '%'
  ) AS 'percentage'
FROM
  world
WHERE
  continent = 'Europe';

--6
SELECT
  name
FROM
  world
WHERE
  gdp >= ALL(
    SELECT
      gdp
    FROM
      world
    WHERE
      gdp > 0
      AND continent = 'Europe'
  )
  AND continent NOT IN ('Europe');

--7
SELECT
  continent,
  name,
  area
FROM
  world
WHERE
  area IN (
    SELECT
      MAX(area)
    FROM
      world
    GROUP BY
      continent
  );

--8
SELECT
  continent,
  name
FROM
  world x
WHERE
  x.name <= ALL(
    SELECT
      y.name
    FROM
      world y
    WHERE
      x.continent = y.continent
  )
ORDER BY
  continent;

--9
SELECT
  name,
  continent,
  population
FROM
  world x
WHERE
  25000000 > ALL(
    SELECT
      population
    FROM
      world y
    WHERE
      y.continent = x.continent
  );

--10
SELECT
  x.name,
  x.continent
FROM
  world x
WHERE
  x.population > ALL(
    SELECT
      population * 3
    FROM
      world y
    WHERE
      y.continent = x.continent
      AND x.name <> y.name
  );

--QUIZ
--1
--'OPTION 3'
--2
--'Option 2'
--3
--'OPTION 1'
--4
--'OPTION 4'
--5
--'OPTION 2'
--6
--'OPTION 2'
--7
--'OPTION 2'
--END