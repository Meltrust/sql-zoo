-- 'SELECT from NOBEL Tutorial'
-- 1
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  yr = 1950;

--2
SELECT
  winner
FROM
  nobel
WHERE
  yr = 1962
  AND subject = 'Literature';

--3
SELECT
  yr,
  subject
FROM
  nobel
WHERE
  winner = 'Albert Einstein';

--4
SELECT
  winner
FROM
  nobel
WHERE
  subject = 'Peace'
  AND yr >= 2000;

--5
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  subject = 'Literature'
  AND yr BETWEEN 1980
  AND 1989;

--6
SELECT
  *
FROM
  nobel
WHERE
  winner IN (
    'Theodore Roosevelt',
    'Woodrow Wilson',
    'Jimmy Carter',
    'Barack Obama'
  );

--7
SELECT
  winner
FROM
  nobel
WHERE
  winner LIKE ('John%');

--8
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  yr = 1984
  AND subject = 'Chemistry'
UNION
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  yr = 1980
  AND subject = 'Physics';

--9
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine');

--10
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  subject = 'Literature'
  AND yr >= 2004
UNION
SELECT
  yr,
  subject,
  winner
FROM
  nobel
WHERE
  subject = 'Medicine'
  AND yr < 1910;

--11
SELECT
  *
FROM
  nobel
WHERE
  winner LIKE 'PETER GR_NBERG';

--12
SELECT
  *
FROM
  nobel
WHERE
  winner LIKE 'EUGENE O_NEILL';

--13
SELECT
  winner,
  yr,
  subject
FROM
  nobel
WHERE
  winner LIKE 'Sir%'
ORDER BY
  yr DESC;

--14
SELECT
  winner,
  subject
FROM
  nobel
WHERE
  yr = 1984
ORDER BY
  subject IN ('Physics', 'Chemistry'),
  subject,
  winner;

-- QUIZ
--1
-- 'OPTION 5'
--2
-- 'OPTION 3'
--3
-- 'OPTION 2'
--4
-- 'OPTION 3'
--5
-- 'OPTION 3'
--6
-- 'OPTION 3'
--7 
-- 'OPTION 4'
--END