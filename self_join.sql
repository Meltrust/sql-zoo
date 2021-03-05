-- 'Self Join Tutorial'
--1
SELECT
  COUNT(id)
FROM
  stops;

--2
SELECT
  id
FROM
  stops
WHERE
  name IN ('Craiglockhart');

--3
SELECT
  id,
  name
FROM
  stops,
  route
WHERE
  id = STOP
  AND company = 'LRT'
  AND num = '4';

--4
SELECT
  company,
  num,
  COUNT(*) AS visits
FROM
  route
WHERE
  STOP = 149
  OR STOP = 53
GROUP BY
  company,
  num
HAVING
  visits = 2;

--5
SELECT
  a.company,
  a.num,
  a.stop,
  b.stop
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
WHERE
  a.stop = 53
  AND b.stop = 149;

--6
SELECT
  a.company,
  a.num,
  stopa.name,
  stopb.name
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'London Road';

--7
SELECT
  DISTINCT a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.company = b.company
    AND a.num = b.num
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Haymarket'
  AND stopb.name = 'Leith';

--8
SELECT
  DISTINCT a.company,
  a.num
FROM
  route a
  JOIN route b ON (
    a.num = b.num
    AND a.company = b.company
  )
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart'
  AND stopb.name = 'Tollcross';

--9
SELECT
  DISTINCT S2.name,
  R2.company,
  R2.num
FROM
  stops S1,
  stops S2,
  route R1,
  route R2
WHERE
  S1.name = 'Craiglockhart'
  AND S1.id = R1.stop
  AND R1.company = R2.company
  AND R1.num = R2.num
  AND R2.stop = S2.id;

--10
SELECT
  S.num,
  S.company,
  S.name,
  T.num,
  T.company
FROM
  (
    SELECT
      DISTINCT a.num,
      a.company,
      sb.name
    FROM
      route a
      JOIN route b ON (
        a.num = b.num
        AND a.company = b.company
      )
      JOIN stops sa ON sa.id = a.stop
      JOIN stops sb ON sb.id = b.stop
    WHERE
      sa.name = 'Craiglockhart'
      AND sb.name <> 'Craiglockhart'
  ) S
  JOIN (
    SELECT
      x.num,
      x.company,
      sy.name
    FROM
      route x
      JOIN route y ON (
        x.num = y.num
        AND x.company = y.company
      )
      JOIN stops sx ON sx.id = x.stop
      JOIN stops sy ON sy.id = y.stop
    WHERE
      sx.name = 'Lochend'
      AND sy.name <> 'Lochend'
  ) T ON (S.name = T.name)
ORDER BY
  S.num,
  S.name,
  T.num;

--QUIZ
--1
--'OPTION 3'
--2
--'Option 5'
--3
--'OPTION 4'
--END