# Terms:
+ Database (dB) is an organized collection of data;
+ Relational databases use tables to store information and specify the 
relations between those tables;
   + Schema is a logical container for database objects (tables, views, 
triggers) that user creates;
   + Table is a container for data elements and relations.  It’s using columns 
(fields) and rows (records);
   + Field is a database storage simplest unit (table column);
   + Record is a row and it represents a single structured data set in table;
   + Query is your  request to the database to retrieve information;
   + Report is the returned information to the specified query;
+ DBMS (Database Management System) is a software that controls the 
organization, storage, retrieval, security and integrity of data in dB; 
+ SQL (Structured Query Language) is a dB computer language, designed to 
retrieve and manage data, create and modify dB schema, etc. 
+ NORMALIZATION is the dB process of organizing fields and tables of a 
relationship database to minimize redundancy and dependency.  Divide 
large tables into smaller tables and defining relationships between them; 
+ PRIMARY KEY (PK) is a unique identifier of every record in database;
+ FOREIGN KEY (FK) is a column (or combination of columns) that is used to 
establish a relationship between the tables;  Foreign key is usually not unique 
(one-to-many relation) and shall always point to a primary key.
+ CONSTRAINT is used to define data integrity (restrict the values in dB):  
   + NOT NULL constraint  - dB value can’t be null
   + Unique constraint - multiple rows can’t have the same value in the same 
column
   + Primary Key constraint - combines a NOT NULL and Unique constraints
   + Foreign Key constraint - values in one table match values in another 
table
+ `/*…*/` - Oracle comments
+ `--` - PostgreSQL comments
Wonderful amasing article about relations in tables https://habr.com/ru/articles/488054/
+ Examples of transaction(s): CREATE, ALTER, DELETE, INSERT, UPDATE
+ COMMIT - permanently update the database changes 
+ ROLL BACK - undo your database changes (transaction failed, etc)
+ Alias – ‘nicknames’ for table and columns names. Giving an alias we are    
NOT renaming the column or table; 
## DDL (Data Definition Language) statements are defining database schema: 
+ CREATE  - to create objects in the database (TABLE, VIEW, INDEX)
+ ALTER  - alters the structure of the database (TABLE, VIEW, INDEX)
+ DROP  - delete objects from the database (TABLE, VIEW, INDEX)
+ TRUNCATE - remove all records from a table
+ COMMENT - add comments to the data dictionary
+ RENAME  - rename an object
## DML (Data Manipulation Language) statements are managing data within schema:
+ SELECT  - retrieve data from the a database
+ INSERT  - insert data into a table
+ UPDATE  - updates existing data within a table
+ DELETE  - deletes all or specific (+WHERE) records from a table
## DCL (Data Control Language) statements:
+ GRANT  - gives user's access privileges to database
+ REVOKE  - withdraw access privileges given with the GRANT command
+ DENY - withdraw access privileges given with the GRANT command, higher level than grant
## TCL ( Transaction Control Language) statements:
 + BEGIN TRANSACTION  - defines start of transaction
 + COMMIT TRANSACTION - complete the transaction
 + ROLLBACK TRANSACTION - roll back the transaction changes
 + SAVE TRANSACTION - stands a middle saving state inside the transaction

## Data Types Examples: 
+ CHAR( ) A fixed section from 0 to 255 characters long
+ VARCHAR( )    A variable section from 0 to 255 characters long
+ INT( ) -2147483648 to 2147483647 normal unsigned 
+ FLOAT A small number with a floating decimal point
+ NUMERIC( , )   Number stored as a string, with fixed decimal point
+ DATE YYYY-MM-DD
+ DATETIME      YYYY-MM-DD HH:MM:SS
+ TIMESTAMP    YYYYMMDDHHMMSS
  
## Popular DBMS:
+ Oracle
+ MySQL
+ PostgreSQL
+ DB2
+ MS SQL Server
+ ASE

## Popular IDE:
+ DBeaver
+ pgAdmin

## Forms of normallization
 
### First normal form
Eliminate duplicate groups in individual tables.
Create a separate table for each set of related data.
Identify each set of related data with a primary key.
Don't use multiple fields in the same table to store similar data. For example, to keep track of an item that is purchased from two different vendors, you could create a record with fields that define the first vendor ID and the second vendor ID.

What happens when a third supplier is added? Adding a field is not the answer; it requires program and table changes and does not accommodate a dynamic number of vendors smoothly. Instead, you can put all vendor information in a separate Vendors table and link items to vendors using item codes, or vendors to items using vendor codes.


  
### Second normal form
Create separate tables for sets of values that apply to multiple records.
Link these tables with a foreign key.
Records should not depend on anything other than the table's primary key (composite key if needed). Take, for example, the address of a customer in an accounting system. This address is required not only for the Customers table, but also for the Orders, Shipping, Invoices, Accounts Receivable, and Collections tables. Instead of storing the customer's address as a separate element in each of these tables, store it in one place, either in the Customers table or in a separate Addresses table.

### Third normal form
Exclude fields that do not depend on the key.
Values in a record that are not part of that record's key do not belong in the table. If the contents of a field group can relate to more than one record in a table, consider placing those fields in a separate table.

For example, in the Employee Recruitment table, you can include the address of the candidate and the name of the university where he received his education. However, to organize a group mailing list, a complete list of universities is required. If information about universities is stored in the Candidates table, it will not be possible to list universities in the absence of candidates. So instead, create a separate Universities table and link it to the Candidates table using the key, the university code.

EXCEPTION: Adhering to third normal form, while desirable in theory, is not always practical. For example, to remove all possible dependencies between the fields in the Customers table, you would create separate tables to store information about cities, zip codes, sales representatives, customer categories, and any other information that might be duplicated across multiple records. Theoretically, normalization is worth doing. However, a significant increase in the number of small tables can lead to a decrease in DBMS performance or exhaustion of memory and the number of open file descriptors.

Normalizing to third normal form may only make sense for data that changes frequently. If you keep dependent fields, design your application so that when one of these fields changes, the user must check all related fields.

Other forms of normalization
Fourth normal form, also called Boyce-Codd normal form (BCNF), and fifth normal form exist but are rarely considered in practical design. Ignoring these rules may result in a less than ideal database design, but should not affect functionality.

## SQL Commands: 
 + Create, modify, delete, and view tables (CREATE, ALTER, DROP (delete table), DESC)
 +  Populate tables with data (INSERT, DELETE, TRUNCATE (delete data, but not table), etc)
 +  Query the table(s) data (SELECT)
 + CREATE - creates a table (index, view) in a database.
   
 ` CREATE TABLE table1 (ID int, Last_Name varchar(255)) `
   
+ ALTER - used to add, delete, or modify columns in an existing table.
```
ALTER TABLE table1 ADD COLUMN column1 varchar(255)
ALTER TABLE table1 DROP COLUMN column1
ALTER TABLE table1 MODIFY COLUMN column1 varchar(255)
ALTER TABLE table1 RENAME COLUMN column1 to column2
```
  
+ DROP – deletes a table (index, view).
  
` DROP TABLE table1 `
  
+ TRUNCATE - deletes data in the table, but not table itself
  
`TRUNCATE TABLE table1 `
  
+ INSERT - inserts record into a table (don’t violate constraints)
  
` INSERT into  table1 VALUES (value1, value2, etc.)`
  
+ UPDATE - modifies record in a table (no primary keys update)
  
```
UPDATE  table1 
SET column1 = ‘Smith’  
WHERE   column1 = ‘Allins’
```
  
+ DELETE - deletes record from a table (all records, if there is no WHERE)
  
```
DELETE FROM table1 
[WHERE   column1 = ‘Allins’]
```
  
+ SELECT - retrieves data from one or more dB tables or views. Most often used statement

```
SELECT [ALL | DISTINCT] column1[,column2] 
FROM <table1> [,<table2>] 
[WHERE  "conditions"] 
[GROUP BY  "column-list"] 
[HAVING  "conditions] 
[ORDER BY  "column-list" [ASC | DESC]]
```
```
SELECT… FROM… are the only two required keywords; 
WHERE, GROUP BY, HAVING, ORDER BY are optional, but must be in the 
specific order;
FROM - must contain at least one table from where we are retrieving 
information; 
WHERE – optional. If used, specify any condition(s) by using operators: 
=, >, <, >=, <=, <> (not equal);  
AND (both conditions), 
OR (one or another, or both); 
IN  (specify multiple values); 
BETWEEN (select a range of data between two values); 
LIKE  (search for a specified pattern in a column: % or _ (one character))
IS NULL / IS NOT NULL (operator for an unknown (NULL) value)
WHERE – examples: 
WHERE (DEPARTMENT_ID > 50 AND <> 100) OR (DEPARTMENT_ID = 20 )
WHERE DEPARTMENT_ID IN (80, 90, 100)
WHERE DEPARTMENT_ID BETWEEN 80 AND 120
WHERE DEPARTMENT_ID LIKE ‘LIN%
WHERE DEPARTMENT_ID IS NOT NULL
```
Numeric values should not be enclosed in quotes, but text values should: 

(SALARY > 200 and NAME = ‘Smith’ )
GROUP BY – optional, allow to group the results by some criteria;
```
SELECT  DEPARTMENT_ID, COUNT(*)  
FROM  EMPLOYEES 
GROUP BY  DEPARTMENT_ID 
HAVING – optional. WHERE doesn’t work for aggregate functions (avg, 
count, sum, max, etc). Use HAVING instead; 
SELECT   DEPARTMENT_ID, MAX(SALARY)
FROM  EMPLOYEES
GROUP BY  DEPARTMENT_ID
HAVING  MAX(SALARY) > 10000
ORDER BY – optional, allow to order the results in specific order (ASC,
default, sorts in A-Z, DESC sorts in Z-A)
```
```
SELECT commands: 
SELECT * FROM…                     All columns; 
SELECT <column1>, <column2> Data in specified columns (1, 2, etc); 
SELECT DISTINCT <column1>  Unique values in Column1; 
SELECT ROWNUM FROM…           Number of each row;  
Agregate functions: 
Any Datatype: 
SELECT COUNT() FROM…  Total count of rows; 
SELECT MAX()   FROM…  Largest value; 
SELECT MIN()  FROM…            Smallest value; 
SELECT FIRST() FROM…  First value; 
SELECT LAST()  FROM…            Last value; 
Numeric Datatype Only: 
SELECT SUM()  FROM…            Sum value; 
SELECT AVG()  FROM…            Average value; 
```
Dual table is a temporary table with one dummy column and single row 
```
SELECT SYSDATE FROM DUAL; System Date
SELECT USER FROM DUAL; System User
```
+ `VIEW` is a virtual table which is created by executing a query. It is an 
abbreviation of SELECT statement (tableA_v)
+ `MATERIALIZED VIEW` – contain physical data. For big tables, frequently use 
only some data. Helps execute queries faster; 
+ `TRIGGER` is a piece of SQL code that is activated when a certain event   
happens. A common usage is when a new record is added to a database, this 
triggers is invoked; 
+ `INDEX` is an optional structure, associated with tables, created to improve 
query performance. 
+ `JOIN` - Get information from related tables
+ OUTER JOIN - A join that includes rows even if they do not have related rows in the joined table. There are 3 types of outer (unmatched rows to be included) joins:
+ LEFT [OUTER] JOIN  show all matched rows of left and right tables (as in inner join) and leftovers of left table (where there is no value would be null).
+ RIGHT [OUTER] JOIN show all matched rows of left and right tables (as in inner join) and leftovers of right table (where there is no value would be null)
+ FULL [OUTER] JOIN show all rows of right and left tables (as in inner join) and leftovers of both tables (where there is no value would be null)

--CROSS JOIN - A join whose result set includes one row for each possible pairing of rows from the two tables. 
[Inner] JOIN most common (default) – same as SELECT with WHERE clause: 
```
SELECT          * 
FROM  EMPLOYEES
[INNER] JOIN  DEPARTMENTS
ON EMPLOYEES.Department_ID = DEPARTMENTS. Department_ID
```
`UNION`- Combine results of 2 or more select statements (distinct only results)
`UNION ALL` – return all (including duplicates) data back
```
SELECT column_name(s) FROM table_name1
UNION (ALL)
SELECT column_name(s) FROM table_name2
```
Select must have: same columns number, column order, selected columns of the 
same types; 
## `UNION vs. JOIN: `
+ `UNION` combines the results of two or more queries into a single result set that 
includes all the rows that belong to all queries in the union.
+ `JOINs` retrieve data from two or more tables based on logical relationships between
+ the tables. Joins indicate how SQL should use data from one table to select the rows 
in another table. 

## Joins
![joins](https://github.com/MariaDash/SQL/blob/main/SQL_Additional/image.PNG)
## SQL Create Constraints
Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.
SQL Constraints
SQL constraints are used to specify rules for the data in a table.

Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.

Constraints can be column level or table level. Column level constraints apply to a column, and table level constraints apply to the whole table.

The following constraints are commonly used in SQL:

+ NOT NULL - Ensures that a column cannot have a NULL value
+ UNIQUE - Ensures that all values in a column are different
+ PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
+ FOREIGN KEY - Prevents actions that would destroy links between tables
+ CHECK - Ensures that the values in a column satisfies a specific condition
+ DEFAULT - Sets a default value for a column if no value is specified
+ CREATE INDEX - Used to create and retrieve data from the database very quickly

## Table Relations
One of the goals of creating a good database structure is to eliminate redundancy (repetition) of data. To do this, you need to distribute the data into several separate thematically organized tables so that each fact is presented once. Access will provide a way to collect scattered data - this is done by putting common fields in related tables. To correctly perform this action, you need to understand the relationships between tables and describe these relationships in the database.

After you create a table for each topic in your database, you need to provide Access with the means to combine information as needed. This is done by creating common fields in related tables and setting relationships between tables. You can then create queries, forms, and reports that display information from multiple tables at the same time. For example, the following form contains information from several tables:

Orders form with related information from five tables

1. This form contains data from the customer table,

2. orders,

3. goods

4. and order details.

The customer name in the Payer field is from the Customers table, the order ID and order date values ​​are from the Orders table, the product name is from the Items table, and the price and quantity are from the Ordered table. To be able to submit data to the form, these tables are related to each other in several ways.

In the example above, the fields in the tables must be matched to display information about the same order. This reconciliation is carried out by establishing relationships between tables. A table relationship establishes relationships between values ​​in key fields—often between fields that have the same name in both tables. In most cases, the primary key of one table, which is the unique identifier for each record, is associated with the foreign key of another table. For example, to associate employees with the orders they are responsible for, you can create a relationship between the Employee ID fields in the Employees and Orders tables.

"Employee ID" is used as the primary key in the "Employees" table and as a foreign key in the "Orders" table.

1. The "Employee Code" field is displayed in two tables: as a primary key...

2. and as a foreign key.


## Types of relationships between tables
There are three types of relationships between tables in Access.

## One-to-Many Relationship

Consider a database that records orders, including the "Customers" and "Orders" tables as an example. The customer can place any number of orders. Therefore, any customer represented in the "Customers" table can have many orders represented in the "Orders" table. Therefore, the relationship between the Customers and Orders tables is a one-to-many relationship.

To create a one-to-many relationship in the database structure, add the primary key on the "one" side of the table on the "many" side as an additional field or fields. In this example, you need to add a new field - the "Code" field from the "Customers" table - to the "Orders" table and name it "Customer Code". Access can then use the Customer ID number from the Orders table to find the customer for each order.

## Many-to-Many Relationship

Consider the relationship between the tables "Products" and "Orders". A single order may include multiple items. On the other hand, one product can be included in several orders. Thus, for each record in the "Orders" table, there can be several records in the "Products" table. Thus, for each record in the Orders table, there can be multiple records in the Orders table. This relationship is called a many-to-many relationship. Note that in order to determine the existing many-to-many relationship schema between your tables, it is very important to consider both sides of the relationship.

To represent a many-to-many relationship, you need to create a third (junction) table that splits it into two one-to-many relationships. The primary keys of two tables are inserted into a third table. As a result, all instances of the relationship are stored in the third table. For example, the Orders and Products tables have a many-to-many relationship defined by creating two one-to-many relationships in the Ordered table. There can be many products in one order, and each product can be listed in many orders.

## One-to-one communication

In a one-to-one relationship, each entry in the first table can have at most one associated entry in the second table, and vice versa. Relationships of this type are not often used because information related in this way is usually stored in a single table. A one-to-one relationship is used to partition a table that contains many fields in order to separate part of the table for security reasons, and to store information related to a subset of the records in the main table. After defining such a relationship, both tables must have a common field.

Wonderful amaizing article about relations between tables: https://habr.com/ru/articles/488054/ 
