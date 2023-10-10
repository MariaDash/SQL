CREATE TABLE public.students (
	id SERIAL4 NOT NULL,
	"name" VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	"password" VARCHAR(50) NOT NULL,
	created_on TIMESTAMP NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);

-- Show all information in the table 'Students'
SELECT * FROM students;

--Show all students of the table 'Students'
SELECT name FROM students;

--Show ids of the table 'Students'
SELECT id FROM students;

--Show all names of the table 'Students'
SELECT name FROM students;

--Show all emails of the table 'Students'
SELECT email FROM students;

--Show all names and emails of the table 'Students'
SELECT name, email FROM students;

--Show all ids, names, emails, dates of creation of the table 'Students'
SELECT id, name, email, created_on  FROM students;

--Show all users of the table 'Students' with password 12333
SELECT id
FROM students
WHERE password = '12333';

--Show all users of the table 'Students' which were created on 2021-03-26 00:00:00
SELECT id, name
FROM students
WHERE created_on = '2021-03-26 00:00:00';

--Show all users of the table 'Students'  which  names contain "Anna" 
SELECT id, name
FROM students
WHERE name   LIKE '%Anna%';

--Show all users of the table 'Students' which names contain "8" in the end of the name
SELECT id, name
FROM students
WHERE name   LIKE '%8';

--Show all users of the table 'Students' which names contain "a" 
SELECT id, name
FROM students
WHERE name   LIKE '%a%';


--Show all users of the table 'Students' which were created on 2021-07-12 00:00:00
SELECT id, name
FROM students
WHERE created_on = '2021-07-12 00:00:00';

--Show all users of the table 'Students' which were created on 2021-07-12 00:00:00 and have password 1m313
SELECT id, name
FROM students
WHERE created_on = '2021-07-12 00:00:00'
AND password = '1m313';

--Show all users of the table 'Students' which were created on 2021-07-12 00:00:00 and name contained "Andrey"
SELECT id, name
FROM students
WHERE created_on = '2021-07-12 00:00:00'
AND name   LIKE '%Andrey%';

--Show all users of the table 'Students' which were created on 2021-07-12 00:00:00 and name contained "8"
SELECT id, name
FROM students
WHERE created_on = '2021-07-12 00:00:00'
AND name   LIKE '%8%';

--Show user of the table 'Students' which have id = 110
SELECT id, name
FROM students
WHERE id = 110;

--Show user of the table 'Students' which have id = 153
SELECT id, name
FROM students
WHERE id = 153;

--Show users of the table 'Students' which have id > 140
SELECT id, name
FROM students
WHERE id > 140;

--Show users of the table 'Students' which have id < 130
SELECT id, name
FROM students
WHERE id < 130;

--Show users of the table 'Students' which have id < 127 or > 188
SELECT id, name
FROM students
WHERE id < 127
OR id > 188 ;

--Show users of the table 'Students' which have id <= 137
SELECT id, name
FROM students
WHERE id <= 137;

--Show users of the table 'Students' which have id >= 137
SELECT id, name
FROM students
WHERE id >= 137;

--Show users of the table 'Students' which have id more than 180 and less than 190
SELECT id, name
FROM students
WHERE id BETWEEN 180 AND 190;

--Show users of the table 'Students' which have id between 180 and 190
SELECT id, name
FROM students
WHERE id BETWEEN 180 AND 190;

--Show users of the table 'Students' which have password in range 12333, 1m313, 123313
SELECT id, name, password
FROM students
WHERE password  IN ('12333', '1m313', '123313');

--Show users of the table 'Students' which were created in range 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00
 
SELECT id, name, created_on
FROM students
WHERE created_on  IN ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

--Show minimum id of the table 'Students'
SELECT Min(id)
FROM students;

--Show maximum id of the table 'Students'
SELECT Max(id)
FROM students;

--Show number of users of the table 'Students'
SELECT count(id) AS number_of_users
FROM students;

--Show all names of the table 'Students' order by creation  date ascending order
SELECT id, name, created_on
FROM students
ORDER BY created_on;

--Show all names of the table 'Students' order by creation  date descending order
SELECT id, name, created_on
FROM students
order BY created_on DESC;



