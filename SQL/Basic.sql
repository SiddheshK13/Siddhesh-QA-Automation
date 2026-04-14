--- List down existing dbs
EXEC sp_databases;
SELECT name FROM sys.databases

-- Creating a db

Create database school_db
Create database demo
Create database demo2

-- Selecting a DB
USE school_db
select DB_NAME()

-- Deleting a DB
DROP DATABASE demo2

-- Creating a table
CREATE TABLE students (
students_id INT,
name VARCHAR(100),
age INT,
grade INT
);

-- Checking existing tables in a DB
EXEC sp_help 'Students'

-- Inserting Data into table
INSERT INTO students (students_id, name, age, grade)
values (100, 'Raju', 12, 5)

INSERT INTO students (students_id, name, age, grade)
values (102, 'Shyam', 13, 6), (102, 'Baburao', 14, 5)

INSERT INTO students (students_id, age, grade)
values (101, 15, 8)

INSERT INTO students values (104, 'Jethalal', 13, 6)

INSERT INTO students values (103, 'Luffy', 15, 8)

INSERT INTO students values (102, 'Zoro', 15, 8)


-- Reading a data

SELECT * FROM students
select name from students
SELECT * FROM students WHERE students_id=103


-- Updating a Data

update students
SET grade = 9
where students_id = 102 

update students
SET name = 'Jack Sparrow'
where students_id = 100

-- Deleting a data

Delete FROM students
where students_id = 101

DELETE FROM students
where students_id = 103

-- Truncate( Deleting and cleaning of whole table)
TRUNCATE TABLE students;

