-- 'Using Null Tutorial'
--1
SELECT
  name
FROM
  teacher
WHERE
  dept IS NULL;

--2
SELECT
  teacher.name,
  dept.name
FROM
  teacher
  INNER JOIN dept ON (teacher.dept = dept.id);

--3
SELECT
  teacher.name,
  dept.name
FROM
  teacher
  LEFT JOIN dept ON (teacher.dept = dept.id);

--4
SELECT
  teacher.name,
  dept.name
FROM
  teacher
  RIGHT JOIN dept ON (teacher.dept = dept.id);

--5
SELECT
  name,
  COALESCE(mobile, '07986 444 2266')
FROM
  teacher;

--6
SELECT
  COALESCE(teacher.name, 'NONE'),
  COALESCE(dept.name, 'None')
FROM
  teacher
  LEFT JOIN dept ON (teacher.dept = dept.id);

--7
SELECT
  COUNT(name),
  COUNT(mobile)
FROM
  teacher;

--8
SELECT
  dept.name,
  COUNT(teacher.name)
FROM
  teacher
  RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY
  dept.name;

--9
SELECT
  teacher.name,
  CASE
    WHEN dept.id = 1 THEN 'Sci'
    WHEN dept.id = 2 THEN 'Sci'
    ELSE 'Art'
  END
FROM
  teacher
  LEFT JOIN dept ON teacher.dept = dept.id;

--10
SELECT
  teacher.name,
  CASE
    WHEN dept.id = 1 THEN 'Sci'
    WHEN dept.id = 2 THEN 'Sci'
    WHEN dept.id = 3 THEN 'Art'
    ELSE 'None'
  END
FROM
  teacher
  LEFT JOIN dept ON (dept.id = teacher.dept);

--QUIZ
--1
--'OPTION 5'
--2
--'Option 3'
--3
--'OPTION 5'
--4
--'OPTION 2'
--5
--'OPTION 1'
--6
--'OPTION 1'
--END