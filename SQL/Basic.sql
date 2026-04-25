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


--Institute database
Create DATABASE Institute
USE Institute

-- Courses table
CREATE TABLE courses ( 
  course_id INT IDENTITY(1,1) PRIMARY KEY, 
  course_name VARCHAR(100) NOT NULL, 
  course_fee NUMERIC(10, 2) NOT NULL 
);

INSERT INTO courses (course_name, course_fee)
VALUES
('Mathematics', 500.00),
('Physics', 600.00),
('Chemistry', 700.00);

-- Students table
CREATE TABLE students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

INSERT INTO Students (student_name) VALUES
('Raju'),
('Sham'),
('Baburao'),
('Alex');

-- Enrollments table
CREATE TABLE enrollment (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
 
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollment (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-01'), -- Raju enrolled in Mathematics
(1, 2, '2025-01-15'), -- Raju enrolled in Physics
(2, 1, '2025-02-01'), -- Sham enrolled in Mathematics
(2, 3, '2025-02-15'), -- Sham enrolled in Chemistry
(3, 3, '2025-03-25'); -- Alex enrolled in Chemistry

create view enrollment_details AS
SELECT s.student_name, c.course_name, e.enrollment_date, c.course_fee 
FROM enrollment e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS

SELECT c.course_name, COUNT(s.student_id), SUM(c.course_fee)
FROM enrollment e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name

DROP VIEW enrollment_vie;