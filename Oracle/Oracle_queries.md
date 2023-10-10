# Practicing Commands in Oracle (creating and manupilating with tables)
+ `CREATE TABLE su3_class (ID INT PRIMARY KEY, fname VARCHAR(255), lname VARCHAR(255), sex VARCHAR(1))` - создание таблицы, прописывание названий столбцов, указание primary key, и типов данных столбцов
+ `DESCRIBE su3_class`                                       - структура таблицы
+ `SELECT * FROM su3_class`  - чтение  всей таблицы/показать  всю таблицу
+ `SELECT * FROM su3_class ORDER BY id`   - чтение с сортировкой по id
+ `INSERT INTO su3_class VALUES (1, 'Janna', 'Sp', 'F')`   внести данные нового ряда ( record)
+ `INSERT INTO su3_class VALUES (2, 'Mikhail', 'P', 'M')`
+ `INSERT INTO su3_class VALUES ((SELECT MAX(id) +1 FROM su3_class), 'Sudha', 'Patel', 'F')`
+ `SELECT fname, lname FROM su3_class`   показать столбцы `fname`, `lname` таблицы
+ `SELECT MAX(id) +1 FROM su3_class`   - настройка `primary key` - чтобы в каждом новом ряду к порядковому номеру добавлялась 1 и не нужно было каждый раз проверять  номер, чтобы он был уникальным)
+ `INSERT INTO su3_class VALUES ((SELECT MAX(id) +1 FROM su3_class), 'Peter', 'Ivanov', 'M')` пример использования предыдущей команды для создания нового ряда
+ `ALTER TABLE su3_class RENAME COLUMN sex TO gender`  - изменить структуру таблицы `modify table` (не самих данных таблицы), переименовывая  столбец
+ `ALTER TABLE su3_class ADD address VARCHAR(255)`  - добавить новый столбец с именем address и указанием типа данных
+ `ALTER TABLE city_info_123 MODIFY (state CHAR(2))`   - изменить тип данных
+ `ALTER TABLE city_info_123 DROP COLUMN population`   - удалить столбец  population
+ `ALTER TABLE city_info_123 MODIFY (city_name VARCHAR(30) NOT NULL)`  -изменить тип данных, чтобы они не могли быть нулевыми
+ `RENAME city_123 TO city_info_123` - изменить название таблицы с  `city_123` на  `city_info_123` 
+ `UPDATE su3_class SET address = '123, Main Street, App. 45' ` - изменить данные таблицы `modify data` , но не указав какой ряд именно изменить, программа изменит все ряды
+ `UPDATE su3_class SET address = '11 first Ave., App. 23' WHERE id=1` - изменить данные таблицы `modify data` , указав какой ряд именно изменить
+ `UPDATE people SET fn='Jack' WHERE id=3`
+ `UPDATE city_info_123 SET good_attraction = 'Y' WHERE state='CA'`  - изменить значение ячейки good_attraction  там, state указан как CA  ( их несколько)
+ `UPDATE city_info_123 SET good_attraction = 'N', schools =5  WHERE ID=12`  изменить 2 параметра в одном record, разделение параметров с помощью запятой
+ `DELETE FROM su3_class`   - удаление всех данных таблицы! вы можете сделать undo, но только с доступом администратора
+ `DELETE FROM su3_class WHERE ID=1 ` - удаление данных первого ряда таблицы, сама таблица остается и остальные ряды
+ `TRUNCATE TABLE su3_class` - очень быстрое удаление всех данных таблицы,  нельзя сделать undo, сама таблица остается, но пустая
+ `DROP TABLE su3_class` - удаление всех данных и самой таблицы, нельзя сделать undo

## DDL - Data Definition Language commands -they are impacting, updating the structure of the table, so they impact back entire schema of database
+ `CREATE TABLE`
+ `ALTER TABLE`
+ `TRUNCATE TABLE`
+ `DROP TABLE`
+ `RENAME TABLE`
## DML -  Data Manipulation Language commands - they are updating the records only
+ `Describe`
+ `Insert`
+ `Delete`
+ `Select`
+ `Update.. Set`
+ `Table employees`  ( employeer_id is primary key)
+ `DESC employees`  - структура таблицы employees
+ `SELECT * FROM employees` - показать все содержимое таблицы
+ `SELECT first_name, last_name FROM employees` - показать содержимое столбцов first_name, last_name
+ `SELECT department_id FROM employees` - показать содержимое столбца department_id
+ `SELECT DISTINCT department_id FROM employees`  -  убрать дубликаты и показать уникальные  department_id
  
## Quiz table Departments  (Department_id is the primary key)
+ `DESC departments`
+ `SELECT * FROM departments`  - показать все содержимое таблицы departments
+ `SELECT department_id, department_name FROM departments` - показать содержимое department_id, department_name
+ `SELECT location_id FROM departments` - показать содержимое столбца `location_id` 
+ `SELECT ROWNUM FROM… `          Number of each row
+ `SELECT DISTINCT location_id FROM departments` - показать уникальные `location_id`
+ `SELECT DISTINCT department_id, location_id FROM departments` - показать уникальные `department_id` с их  `location_id`
+ `SELECT department_id, location_id FROM departments` - так как `department_id` - `primary key`, то он уникален, и показать уникальные `department_id` с их  `location_id` можно и без 'DISTINCT'.
## Operator WHERE
+ `SELECT * FROM employees WHERE department_id=100` - показать столбцы, где `department_id=100`
+ `SELECT * FROM employees WHERE department_id>100` - показать столбцы, где `department_id>100`
+ `SELECT * FROM employees WHERE department_id>=100` - показать столбцы, где `department_id>=100`
+ `SELECT * FROM employees WHERE department_id<>80` - показать столбцы, где `department_id<>80` ( где не равно 80)
+ `SELECT * FROM employees WHERE NOT department_id=100` - показать столбцы, где `department_id<>100`
## Operator BOOLEAN ( OR, AND)
показать строки, где либо `department_id=100` либо `department_id=110` (должно выполняться хотя бы одно условие)
Оператор` AND`  более главный, чем `OR`. Поэтому в первую очередь выполняется условие с `AND`:
```
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id=100
OR department_id=110`
```
здесь отдельно выполняются 2 условия, сначала с `AND`, либо другое:
```
SELECT * FROM employees
WHERE department_id =100
OR department_id=110 AND salary>8000
```
(пересечение всех условий и есть ответ):
```
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id=80
AND salary > 10000
AND employee_id>100
AND employee_id<150`
```
Read all department 80 employees, who are making over $10,000 (ids are between 100 and 150):

```
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id=80
AND salary > 10000
AND employee_id BETWEEN 100 AND 150
```
напишите строки, в которых есть фамилия King работающего в 30 или в 90 департменте:

```
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE (department_id=30 OR department_id=90)
AND last_name='King'
```
вывести на экран  строки, где либо есть фамилия King, либо человек работает в департменте 30 либо в департменте 90:
```
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE last_name='King'
OR department_id=30
OR department_id=90
```
## Operator WHERE IN, BETWEEN
+ `SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id IN (30, 60, 90, 100)` - показать строки, где несколько видов одного и того же заданного параметра
+ `SELECT first_name, last_name, salary, department_id FROM employees WHERE salary BETWEEN 12000 AND 15000` - показать строки (рекорды), в которых  указана зарплата от $12000 до $15000
## Operator LIKE
+ `SELECT first_name, last_name, salary, department_id FROM employees WHERE first_name LIKE 'A%'` - вывести все рекорды, где Имя начинается на "А" ( % это wild card, спецсимвол, который заменяет все другие буквы имени, которые не указаны)
+ `SELECT first_name, last_name, salary, department_id FROM employees WHERE first_name  LIKE '%a%'`  - вывести все рекорды, где Имя содержит "а"  в середине слова
+ SELECT first_name, last_name, salary, department_id FROM employees WHERE first_name  NOT LIKE 'A%'` - вывести все рекорды, где Имя не начинается на "А" 
## Operator IS NULL, IS NOT NULL
+ `SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id IS NULL`  -  показать список строк, где отсутствует `department_id`
+ `SELECT first_name, last_name, salary, department_id FROM employees WHERE department_id IS NOT NULL` - показать список строк, где прописан `department_id`
## Operator SELECT ... ORDER BY (ASC/DESC - ASCENDING ORDER/DESCENDING ORDER) ASC ORDER IS DEFAULT ORDER 
 *!!!ORDER BY is adding always at the end!!!*
```
SELECT first_name, last_name, salary, department_id
FROM employees WHERE department_id=80
ORDER BY last_name ASC
```
Read first name, last name and department id for all employees, who are: - working on commissions over 0.3%; - working on commissions not over 0.3%:
```
SELECT first_name, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct>0.3 OR commission_pct<=0.3
ORDER BY commission_pct
```
Descending order:   
```
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id=80
ORDER BY last_name DESC
```
+ `SELECT last_name, salary, department_id FROM employees ORDER BY salary DESC`   - Read employees info (salary, last_name, department_id), showing the highest paid first
+ `SELECT first_name, last_name, salary, department_id FROM employees ORDER BY department_id, last_name`  - показать список по увеличению department_id и в каждом из них- список фамилий по алфавиту (от А до Z)
## Aggregate Functions
+ `SELECT  COUNT (*)  FROM  employees` - ПОСЧИТАТЬ СКОЛЬКО ВСЕГО СОТРУДНИКОВ
+ `SELECT  COUNT (*)  FROM  employees WHERE department_id=80`   - посчитать всех сотрудников, из департмента 80
+ `SELECT  COUNT (*), MAX(salary), MIN(salary), SUM(salary)  FROM  employees` - можно сделать общую таблицу с необходимыми результатами
+ `SELECT  COUNT (employee_id) AS number of people, MAX(salary), MIN(salary) AS minimum salary, SUM(salary)  FROM  employees` - здесь employee_id это primary key, поэтому если бы при прочих равных в данном случае  COUNT (*)= COUNT (employee_id) . AS ( сокращение от alias)- это не переименование столбца, это замещение его имени в результатах ( присвоение ему прозвища, более понятного обычному человеку). В данном случае вместо имени COUNT  будет стоять имя number of people. То же самое касается AS minimum salary.
+ `SELECT  SUM(commission_pct) FROM employees`  - показать сумму всех комиссионных процентов (commission_pct) всех сотрудников
+ `SELECT FIRST() FROM…  First value`; 
+ `SELECT LAST()  FROM…   Last value`; 
+ `SELECT  MIN(last_name), MAX(last_name) FROM employees` - показать миним и макс значение имен сотрдников ( в данном случае если их отсортировать по алфавиту от А до Z , то вывести первое и последнее имя)
+ `SELECT  MIN(last_name) AS first, MAX(last_name) AS last FROM employees` - то же , что предыдущее, но с добавлением alias
## QUIZ 1
 
1) Read all information about departments
   
`SELECT * FROM departments `

2) Show only departments id and name
   
`SELECT department_id, department_name FROM departments`

3) Display all location ids
   
`SELECT location_id FROM departments`

4) Please display each location id just once
   
`SELECT DISTINCT location_id FROM departments`

5) Display all unique department ids with location ids
    
`SELECT DISTINCT department_id, location_id FROM departments`
 
## QUIZ 2
 
Table: EMPLOYEES
1) Read first name, last name and department id for all employees, who are working in the department 80
   
`SELECT first_name, last_name, department_id FROM employees WHERE department_id=80`

2) Read first name, last name and salary for all employees, who are making over $10,000
 
`SELECT first_name, last_name, salary FROM employees WHERE SALARY>10000`

3) Read first name, last name and department id for all employees, who are:
- working on commissions over 0.3%
- working on commissions not over 0.3%
  
`SELECT first_name, last_name, department_id, commission_pct FROM employees WHERE commission_pct>0.3 or commission_pct<=0.3 order by commission_pct`
 
 
## QUIZ 3
Table: EMPLOYEES
1) Read all department 80 employees, who are making over $10,000 (ids are between 100 and 150)
```
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id=80
AND salary > 10000
AND employee_id BETWEEN 100 AND 150
```
2) In the departments 30 and 90 find all employees  with the last name ‘King’
```
SELECT first_name, last_name, department_id
FROM employees
WHERE (department_id=30 OR department_id=90)
AND last_name='King'
```
3) Display employee, if his last name is “King” or if he works in the departments 30 or 90
```
SELECT first_name, last_name, department_id
FROM employees
WHERE last_name='King'
OR department_id=30
OR department_id=90
```
 
## QUIZ 4
 
1) In which department(s) we have employees, working on commissions
```
SELECT employee_id,first_name, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
```
2) Retrieve all employees, who are working on commission
```
SELECT employee_id,first_name, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY department_id
```
 
## QUIZ 5
 
1) Read employees info (salary, last_name, department_id), showing the highest paid first

`SELECT last_name, salary, department_id FROM employees ORDER BY salary DESC`

2) Provide the complete list of all employees within the department (show the departments in order and then last_names in order within a department)

`SELECT first_name, last_name, salary, department_id FROM employees ORDER BY department_id, last_name`
 
## QUIZ 6
 
1) What is the total commission percent for all employees within the company?

`SELECT  SUM(commission_pct) FROM employees`

2) If you'll sort employees last names in the ascending order, what will be the first and last on your list?

`SELECT  MIN(last_name) AS first, MAX(last_name) AS last FROM employees`

Advanced:

3) How many people work in each department?

`SELECT COUNT(employee_id) as quantity, department_id as department FROM employees  GROUP BY department_id ORDER BY department_id`
 
## QUIZ 7
 
Use EMPLOYEES table for all tasks:
1) Get the list of names and department Ids of everybody, reporting to manager (ID=103), or working at the Department 80, 60, or 90; Sort retrieved names within the department, having the largest department on top
```   
SELECT last_name, department_id, manager_id
FROM employees
WHERE manager_id=103
OR department_id IN (60, 80, 90)
ORDER BY department_ID DESC
```
2) Find out how much Luis Popp and David Austin are making a month?

`SELECT last_name, first_name, salary FROM employees WHERE first_name in('Luis', 'David') and last_name in('Popp', 'Austin')`

OR

`SELECT  first_name, last_name, salary FROM	employees WHERE  (first_name = 'Luis' and  last_name ='Popp' ) OR  (first_name = 'David' and  last_name = 'Austin' )`

3) Find Ki Gee phone number

`SELECT first_name, last_name, phone_number from employees where first_name='Ki' and last_name='Gee' ` 

4) Provide all information on employees, working on commission basis

`SELECT * FROM employees WHERE commission_pct IS NOT NULL`

5) Find all managers with id 108 or unknown, making  more than $7,700 a month
   
`SELECT first_name, last_name, manager_id, salary from employees where (manager_id=108 or manager_id is NULL) and salary>7700`

6) Display all unique numeric department ids, sorted by highest department number on top
   
`SELECT DISTINCT department_id FROM employees  WHERE department_id IS NOT NULL ORDER BY department_id DESC`

7) Please select all information from table “Employees” where last name contains “or”
   
`SELECT * FROM employees WHERE last_name LIKE '%or%'`

8) Our company is running a special promotion for all employees with last name starting with ‘D’. To qualify, you need to work in the department 50, 60, 90, or 100, make over $3000, and start working for our company  from Jan 1, 1989 through Jan 1, 2002.
```
SELECT last_name, department_id, salary, hire_date
FROM employees
WHERE last_name LIKE 'D%' AND department_id IN (50, 60, 90, 100)
AND salary >3000
AND TO_CHAR(hire_date, 'yyyy/mm/dd')  BETWEEN '1989/01/01' AND '2002/01/01'
``` 
9) Company is planning to celebrate the 1 st employee. When s/he was hired?
    
The current query is:
```
SELECT MIN(hire_date)
FROM employees
```
But if we want to know the name of this employee the quiery is:
```
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date=(SELECT MIN(hire_date) FROM employees)
```
10) Get list of departments and number of employees in each department, ordered alphabetically.
    
`SELECT  department_id, COUNT(*)AS number_of_employees FROM  employees GROUP BY  department_id ORDER BY  department_id`

## QUIZ 8
 
1) Read all information about departments
   
`SELECT * FROM departments `

2) Show only departments id and name
 
`SELECT department_id, department_name FROM departments`

3) Display all location ids
   
`SELECT location_id FROM departments`

4) Please display each location id just once
 
`SELECT DISTINCT location_id FROM departments`

5) Display all unique department ids with location ids
 
`SELECT DISTINCT department_id, location_id FROM departments`
 
## QUIZ 9
 
Table: EMPLOYEES
1) Read first name, last name and department id for all employees, who are working in the department 80
   
`SELECT first_name, last_name, department_id FROM employees WHERE department_id=80`

2) Read first name, last name and salary for all employees, who are making over $10,000
   
`SELECT first_name, last_name, salary FROM employees WHERE SALARY>10000`

3) Read first name, last name and department id for all employees, who are:
- working on commissions over 0.3%
- working on commissions not over 0.3%
  
`SELECT first_name, last_name, department_id, commission_pct FROM employees WHERE commission_pct>0.3 or commission_pct<=0.3 order by commission_pct`
 
 
## QUIZ 10
Table: EMPLOYEES
1) Read all department 80 employees, who are making over $10,000 (ids are between 100 and 150)
```   
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id=80
AND salary > 10000
AND employee_id BETWEEN 100 AND 150
```
2) In the departments 30 and 90 find all employees  with the last name ‘King’
```
SELECT first_name, last_name, department_id
FROM employees
WHERE (department_id=30 OR department_id=90)
AND last_name='King'
```
3) Display employee, if his last name is “King” or if he works in the departments 30 or 90
```   
SELECT first_name, last_name, department_id
FROM employees
WHERE last_name='King'
OR department_id=30
OR department_id=90
```
 
 
## QUIZ 11
 
1) In which department(s) we have employees, working on commissions
```   
SELECT employee_id,first_name, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
```
2) Retrieve all employees, who are working on commission
```
SELECT employee_id,first_name, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY department_id
```
 
## QUIZ 12
 
1) Read employees info (salary, last_name, department_id), showing the highest paid first
```
SELECT last_name, salary, department_id
FROM employees
ORDER BY salary DESC
```
2) Provide the complete list of all employees within the department (show the departments in order and then last_names in order within a department)
```   
SELECT first_name, last_name, salary, department_id
FROM employees
ORDER BY department_id, last_name
```
 
## QUIZ 13
 
1) What is the total commission percent for all employees within the company?
   
`SELECT  SUM(commission_pct) FROM employees`

2) If you'll sort employees last names in the ascending order, what will be the first and last on your list?
 
`SELECT  MIN(last_name) AS first, MAX(last_name) AS last FROM employees`

Advanced:

3) How many people work in each department?
   
`SELECT COUNT(employee_id) as quantity, department_id as department FROM employees  GROUP BY department_id ORDER BY department_id`
 
## QUIZ 14
 
Use EMPLOYEES table for all tasks:
1) Get the list of names and department Ids of everybody, reporting to manager (ID=103), or working at the Department 80, 60, or 90; Sort retrieved names within the department, having the largest department on top
```   
SELECT last_name, department_id, manager_id
FROM employees
WHERE manager_id=103
OR department_id IN (60, 80, 90)
ORDER BY department_ID DESC
```
2) Find out how much Luis Popp and David Austin are making a month?
   
`SELECT LAST_NAME, FIRST_NAME, SALARY FROM EMPLOYEES WHERE FIRST_NAME in('Luis', 'David') and last_name in('Popp', 'Austin')`

OR

`SELECT  first_name, last_name, salary FROM	employees WHERE  (first_name = 'Luis' and  last_name ='Popp' ) OR  (first_name = 'David' and  last_name = 'Austin' )`

3) Find Ki Gee phone number
   
`SELECT first_name, last_name, phone_number from employees where first_name='Ki' and last_name='Gee'  `

4) Provide all information on employees, working on commission basis
   
`SELECT * FROM employees WHERE commission_pct IS NOT NULL`

5) Find all managers with id 108 or unknown, making  more than $7,700 a month
 
`SELECT first_name, last_name, manager_id, salary from employees where (manager_id=108 or manager_id is NULL) and salary>7700`

6) Display all unique numeric department ids, sorted by highest department number on top
 
`SELECT DISTINCT department_id FROM employees  WHERE department_id IS NOT NULL ORDER BY department_id DESC`

7) Please select all information from table “Employees” where last name contains “or”
 
`SELECT * FROM employees WHERE last_name LIKE '%or%'`

8) Our company is running a special promotion for all employees with last name starting with ‘D’. To qualify, you need to work in the department 50, 60, 90, or 100, make over $3000, and start working for our company  from Jan 1, 1989 through Jan 1, 2002.
```
SELECT last_name, department_id, salary, hire_date
FROM employees
WHERE last_name like 'D%'
AND department_id IN (50, 60, 90, 100)
AND salary >3000
AND TO_CHAR(hire_date, 'yyyy/mm/dd')  BETWEEN '1989/01/01' AND '2002/01/01'
```
9) Company is planning to celebrate the 1 st employee. When s/he was hired?
    
The current query is:
```
SELECT MIN(hire_date)
FROM employees
```
But if we want to know the name of this employee the quiery is:
```
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date=(SELECT MIN(hire_date) FROM employees)
```
10) Get list of departments and number of employees in each department, ordered alphabetically.
```
SELECT  department_id, COUNT(*)AS number_of_employees
FROM  employees
GROUP BY  department_id
ORDER BY  department_id
```
## CROSS JOIN
CROSS JOIN will produce rows which combine each row from the first table with each row from the second table.
```
SELECT  * 
FROM  EMPLOYEE 
CROSS JOIN DEPARTMENT
```
OR
```
SELECT * 
FROM   EMPLOYEE, DEPARTMENT
```
It’s like select from two tables without a WHERE clause. Return is huge and cross join is not that popular.

## QUIZ 15 FROM INTERVIEW QUESTION
1. Select the highest salary 

`SELECT MAX(salary) FROM employees`

2. Return employee record with Max salary
```
SELECT first_name, last_name, salary, department_id
FROM employees WHERE salary = (SELECT MAX(salary) FROM employees)
```
3. Select range of employees based on employee id (from 100 to 120)
```
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees WHERE employee_id BETWEEN 100 AND 120
```
4. Return employee name, highest salary, and department name
```
SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name, e.department_id
FROM employees e
INNER JOIN departments d
ON d.department_id=e.department_id
WHERE e.salary = (SELECT MAX(e.salary) FROM employees)
```
or
```
SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name, e.department_id
FROM employees e, departments d
WHERE d.department_id=e.department_id
AND salary = (SELECT MAX(salary) FROM employees)
```
5. Select second highest salary in the company
```
SELECT MAX(salary) FROM employees
WHERE salary !=(SELECT MAX(salary) FROM employees)
```
## QUIZ 16
1. Show the total number of employees within the department,  reporting to manager Raphaely (Manager Id=114) or  making between $2,500 and $3,500, but only those departments, where total number of employees are  greater than 4
```
SELECT department_id, COUNT(*)
FROM employees
WHERE manager_id = 114 OR salary BETWEEN 2500 AND 3500
GROUP BY department_id
HAVING COUNT(*) > 4
ORDER BY department_id
```
2. Get the list of names and department Ids of everybody, reporting to manager (ID=103), or working at the Department 80, 60, or 90; Sort retrieved names within the department, having the largest department on top
```
SELECT last_name, department_id, manager_id
FROM employees
WHERE manager_id=103 OR department_id IN (60, 80, 90)
ORDER BY department_ID DESC
``` 
3. Find out how much Luis Popp and David Austin  are making a month? 

`SELECT last_name. first_name, salary FROM employees WHERE first_name IN ('Luis', 'David') AND last_name IN ('Popp', 'Austin')`

4. Find Ki Gee phone number
 
`SELECT first_name, last_name, phone_number FROM employees WHERE first_name='Ki' AND last_name='Gee'  `

5. Provide all information on employees, working on commission basis

`SELECT * FROM employees WHERE commission_pct IS NOT NULL `

6. Find all managers with id 108 or unknown, making more than $7,700 a month
 
`SELECT first_name, last_name, manager_id, salary from employees where (manager_id=108 or manager_id is NULL) and salary>7700`

7. Display all unique numeric department ids, sorted by highest department number on top

`SELECT  DISTINCT department_id FROM employees  WHERE department_id IS NOT NULL ORDER BY department_id DESC `

8. Please select all information from table “Employees”  where last name contains “or”

`SELECT * FROM employees WHERE last_name LIKE '%or%'   `
9. Our company is running a special promotion for all employees with last  name starting with ‘D’. To qualify, you need to work in the department  50, 60, 90, or 100, make over $3000, and start working for our  company  from Jan 1, 1989 through Jan 1, 2002. 
 ```
SELECT last_name, department_id, salary, hire_date
FROM employees
WHERE last_name like 'D%'
AND department_id IN (50, 60, 90, 100)
AND salary >3000
AND to_char(hire_date, 'yyyy/mm/dd')  BETWEEN '1989/01/01' AND '2002/01/01'
``` 
10. Company is planning to celebrate the 1 st employee. When s/he was hired? 

`SELECT first_name, last_name, hire_date FROM employees ORDER BY hire_date`  

or

`SELECT  MIN(TO_CHAR(hire_date, 'YYYY/MM/DD'))  FROM  employees   `  

11. Get list of departments and number of employees in each department,  ordered alphabetically. How would you read all employees who was born in Sep,  Oct, and Nov?

`SELECT  department_id, COUNT(*)AS number_of_employees FROM employees GROUP BY  department_id ORDER BY  department_id  ` 

or

`SELECT * FROM employees WHERE TO_CHAR(birth_date, 'mon') IN ('sep','oct','nov')`

or

`SELECT * FROM employees WHERE TO_CHAR(birth_date, 'MM') IN ('09','10','11')`

or

`SELECT * FROM employees WHERE TO_CHAR(birth_date, 'MM') BETWEEN 9 and 11`

## UNION
Union is used to combine the result-set of two or more SELECT statements.
```
SELECT column_name(s) FROM table_name1
UNION
SELECT column_name(s) FROM table_name2
```
+ Each SELECT must have the same number of columns. 
+ Selected column(s) must have similar data types. 
+ Selected column(s) must be in the same order.

UNION operator selects only distinct  (unique) values. To allow duplicate values , use UNION ALL.
```
SELECT column_name(s) FROM table_name1
UNION ALL
SELECT column_name(s) FROM table_name2
```
## INTERVIEW QUESTION:
## Join vs. Union
+ UNION combines the results of two or more queries  into a single result set that includes all the rows that belong to all queries in the union
+ JOINs retrieve data from  two or more tables  based on  logical relationships between the tables
+ Joins indicate how SQL should use data from one table to select the rows in another table
+ UNION is different from JOINs that combine columns from two tables.
+ COMMIT - permanently update your db
+ Roll Back - undo changes
+ /*comment*/ - oracle comments

## GROUP BY
составить таблицу  в которой посчитать, сколько в каждом департменте сотрудников (те сгруппировать по департменту) и вывести в виде двух столбцов , отсортированных от большего к меньшему.
```
SELECT COUNT(employee_id) as quantity, department_id as department
FROM employees
GROUP BY department_id
ORDER BY department_id
```
The following SQL statement lists the number of customers in each country, sorted high to low 
```
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC; 
```
## HAVING
The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers 
```
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
```
The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers)
```
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;
```
Dual table is a temporary table with one dummy column and single row 
```
SELECT SYSDATE FROM DUAL; System Date
SELECT USER FROM DUAL; System User
```
## view
VIEW is a virtual table which is created by executing a query. It is an abbreviation of SELECT statement (tableA_v)
### Синтаксис создания представления следующий:
```
CREATE VIEW view_name AS
SELECT columns
FROM tables;
```
Для создания представления используется оператор CREATE VIEW. view_name – это название представления. После оператора AS следует сам запрос.
```
CREATE VIEW lolipop AS 
SELECT * FROM employees 
WHERE department_id = 80
```
### Обновление определения представления. Синтаксис данной операции следующий:
```
CREATE OR REPLACE VIEW view_name AS
SELECT columns
FROM tables;
```
Обновление применимо, например, в том случае, если вам необходимо что-то изменить в запросе. Если представления не существует, то оно будет создано.
### Удаление представления
Синтаксис удаления представления следующий:

`DROP VIEW view_name;`

Теперь, изменим представление – добавим почты агентов. Удалять столбцы из представления нельзя.


## MATERIALIZED VIEW 
MATERIALIZED VIEW – contain physical data. For big tables, frequently use only some data. Helps execute queries faster; 
Представления не хранят данные. При запросе к представлениям данные извлекаются из таблиц. Но здесь существует исключение – это материализованные представления.
### Синтаксис создания такого представления представлен ниже:
```
CREATE MATERIALIZED VIEW view_name AS
SELECT columns
FROM tables;
```
Данный тип представлений один раз выполняет запрос и хранит данные. Тем самым повышается быстродействие, но данные в представлении необходимо обновлять вручную.
### Обновление Для этого применяется следующая команда:
`REFRESH MATERIALIZED VIEW view_name;`
Создание материализованного представления, пример:
-- Страховая сумма и премия по годам
```
CREATE MATERIALIZED VIEW by_year AS
SELECT CAST(Extract(year FROM date_in) AS INT)   AS "Год",
       Sum(insurance_amount)                     AS "Страховая сумма",
       Sum(insurance_premium)                    AS "Страховая премия"
FROM   insuranсe_policies
GROUP BY Extract(year FROM date_in) 
ORDER BY Extract(year FROM date_in)
```
Обратимся к представлению как к таблице:
```
SELECT *
FROM by_year
```
## TRIGGER
Trigger is a piece of SQL code that is activated when a certain event   happens. A common usage is when a new record is added to a database, this triggers is invoked; 
`CREATE TRIGGER (Transact-SQL)`
Область применения: SQL Server (все поддерживаемые версии)  База данных SQL Azure  Управляемый экземпляр SQL Azure
Создает триггер языка обработки данных, DDL или входа. Триггер — это особая разновидность хранимой процедуры, которая автоматически выполняется при возникновении события на сервере базы данных. Триггеры DML выполняются, когда пользователь пытается изменить данные с помощью событий языка обработки данных (DML). Событиями DML являются процедуры INSERT, UPDATE или DELETE, применяемые к таблице или представлению. Эти триггеры срабатывают при запуске любого допустимого события независимо от наличия и числа затронутых строк таблицы. Дополнительные сведения см. в разделе DML Triggers.
Триггеры DDL активируются в ответ на разные события языка описания данных (DDL). Эти события прежде всего соответствуют инструкциям Transact-SQL CREATE, ALTER, DROP и некоторым системным хранимым процедурам, которые выполняют схожие с DDL операции.
Триггеры входа могут срабатывать в ответ на событие LOGON, которое возникает при создании пользовательского сеанса. Вы можете создавать триггеры непосредственно из инструкций Transact-SQL или методов сборок, созданных в среде CLR платформы Microsoft .NET Framework и переданных в экземпляр SQL Server. SQL Server позволяет создавать несколько триггеров для любой инструкции.
 Важно!
Вредоносный программный код внутри триггеров может быть запущен с расширенными правами доступа. Дополнительные сведения о том, как уменьшить эту угрозу, см. в статье Управление безопасностью триггеров.

## INDEX is an optional structure, associated with tables, created to improve  query performance. 
What is an Index in Oracle?
An index is a performance-tuning method of allowing faster retrieval of records. An index creates an entry for each value that appears in the indexed columns. By default, Oracle creates B-tree indexes.
Create an Index
Syntax
The syntax for creating an index in Oracle/PLSQL is:
```
CREATE [UNIQUE] INDEX index_name
  ON table_name (column1, column2, ... column_n)
  [ COMPUTE STATISTICS ];
```
`UNIQUE`
It indicates that the combination of values in the indexed columns must be unique.
`index_name`
The name to assign to the index.
`table_name`
The name of the table in which to create the index.
`column1, column2, ... column_n`
The columns to use in the index.
## COMPUTE STATISTICS
It tells Oracle to collect statistics during the creation of the index. The statistics are then used by the optimizer to choose a "plan of execution" when SQL statements are executed.
Example
Let's look at an example of how to create an index in Oracle/PLSQL.
For example:
```
CREATE INDEX supplier_idx
  ON supplier (supplier_name);
```
In this example, we've created an index on the supplier table called supplier_idx. It consists of only one field - the supplier_name field.
We could also create an index with more than one field as in the example below:
```
CREATE INDEX supplier_idx
  ON supplier (supplier_name, city);
```
We could also choose to collect statistics upon creation of the index as follows:
```
CREATE INDEX supplier_idx
  ON supplier (supplier_name, city)
  COMPUTE STATISTICS;
```
Create a Function-Based Index
In Oracle, you are not restricted to creating indexes on only columns. You can create function-based indexes.
Syntax
The syntax for creating a function-based index in Oracle/PLSQL is:
```
CREATE [UNIQUE] INDEX index_name
  ON table_name (function1, function2, ... function_n)
  [ COMPUTE STATISTICS ];
```
UNIQUE
It indicates that the combination of values in the indexed columns must be unique.
index_name
The name to assign to the index.
table_name
The name of the table in which to create the index.
function1, function2, ... function_n
The functions to use in the index.
COMPUTE STATISTICS
It tells Oracle to collect statistics during the creation of the index. The statistics are then used by the optimizer to choose a "plan of execution" when SQL statements are executed.
Example
Let's look at an example of how to create a function-based index in Oracle/PLSQL.
For example:
CREATE INDEX supplier_idx
  ON supplier (UPPER(supplier_name));
In this example, we've created an index based on the uppercase evaluation of the supplier_name field.
However, to be sure that the Oracle optimizer uses this index when executing your SQL statements, be sure that UPPER(supplier_name) does not evaluate to a NULL value. To ensure this, add UPPER(supplier_name) IS NOT NULL to your WHERE clause as follows:
```
SELECT supplier_id, supplier_name, UPPER(supplier_name)
FROM supplier
WHERE UPPER(supplier_name) IS NOT NULL
ORDER BY UPPER(supplier_name);
Rename an Index
```
Syntax
The syntax for renaming an index in Oracle/PLSQL is:
```
ALTER INDEX index_name
  RENAME TO new_index_name;
  ```
`index_name`
The name of the index that you wish to rename.
`new_index_name`
The new name to assign to the index.
Example
Let's look at an example of how to rename an index in Oracle/PLSQL.
For example:
```
ALTER INDEX supplier_idx
  RENAME TO supplier_index_name;
```
In this example, we're renaming the index called supplier_idx to supplier_index_name.
Collect Statistics on an Index
If you forgot to collect statistics on the index when you first created it or you want to update the statistics, you can always use the ALTER INDEX command to collect statistics at a later date.
Syntax
The syntax for collecting statistics on an index in Oracle/PLSQL is:
```
ALTER INDEX index_name
  REBUILD COMPUTE STATISTICS;
```
index_name
The index in which to collect statistics.
Example
Let's look at an example of how to collect statistics for an index in Oracle/PLSQL.
For example:
```
ALTER INDEX supplier_idx
  REBUILD COMPUTE STATISTICS;
```
In this example, we're collecting statistics for the index called supplier_idx.
Drop an Index
Syntax
The syntax for dropping an index in Oracle/PLSQL is:
```
DROP INDEX index_name;
```
index_name
The name of the index to drop.
Example
Let's look at an example of how to drop an index in Oracle/PLSQL.
For example:
`DROP INDEX supplier_idx;`
In this example, we're dropping an index called supplier_idx.


