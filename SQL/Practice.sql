-- Task Creating a database of employees
Create Database bank_db
use bank_db

CREATE TABLE employees (

    emp_id INT IDENTITY(101,1) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    job_title VARCHAR(50) NOT NULL, 
    department VARCHAR(50),    
    salary DECIMAL(10,2) DEFAULT 30000.00,
    hire_date DATE NOT NULL DEFAULT CONVERT(date, GETDATE()),
    city VARCHAR(50)

);

exec sp_help 'employees'

INSERT INTO employees
(fname, lname, email, job_title, department, salary, hire_date, city)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Director', 'Management', 180000, '2019-02-10', 'Mumbai'),
('Diya', 'Patel', 'diya.patel@example.com', 'Lead Engineer', 'Tech', 120000, '2020-08-15', 'Bengaluru'),
('Rohan', 'Mehra', 'rohan.mehra@example.com', 'Software Engineer', 'Tech', 85000, '2022-05-20', 'Bengaluru'),
('Priya', 'Singh', 'priya.singh@example.com', 'HR Manager', 'Human Resources', 95000, '2019-11-05', 'Mumbai'),
('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Data Scientist', 'Tech', 110000, '2021-07-12', 'Hyderabad'),
('Ananya', 'Gupta', 'ananya.gupta@example.com', 'Marketing Lead', 'Marketing', 90000, '2020-03-01', 'Delhi'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', 'Sales Executive', 'Sales', 75000, '2023-01-30', 'Mumbai'),
('Sameera', 'Rao', 'sameera.rao@example.com', 'Software Engineer', 'Tech', 88000, '2023-06-25', 'Pune'),
('Ishaan', 'Verma', 'ishaan.verma@example.com', 'Recruiter', 'Human Resources', 65000, '2022-09-01', 'Mumbai'),
('Kavya', 'Joshi', 'kavya.joshi@example.com', 'Product Designer', 'Design', 92000, '2021-04-18', 'Bengaluru'),
('Zain', 'Khan', 'zain.khan@example.com', 'Sales Manager', 'Sales', 115000, '2019-09-14', 'Delhi'),
('Nisha', 'Desai', 'nisha.desai@example.com', 'Jr. Data Analyst', 'Tech', 70000, '2024-02-01', 'Hyderabad'),
('Aditya', 'Nair', 'aditya.nair@example.com', 'Marketing Analyst', 'Marketing', 68000, '2022-10-10', 'Delhi'),
('Fatima', 'Ali', 'fatima.ali@example.com', 'Sales Executive', 'Sales', 78000, '2022-11-22', 'Mumbai'),
('Kabir', 'Shah', 'kabir.shah@example.com', 'DevOps Engineer', 'Tech', 105000, '2020-12-01', 'Pune');

INSERT INTO employees
(fname, lname, email, job_title, department, city)
VALUES
('Paul', 'Varma', 'Paul.varma@example.com', 'Director', 'Management', 'Mumbai')

-- Querying the employees table to retrieve data
select * from employees
Select * from employees Where emp_id = 111
Select * from employees where department != 'Tech' -- to get all employees except those in the Tech department
Select * from employees Where salary > 90000 -- to get all employees with salary greater than 90000
select * from employees where city in ('Pune') -- to get all employees located in Pune
select * from employees where hire_date >= '2020-12-31' -- to get all employees hired on or after December 31, 2020

-- Distinct values
Select distinct city from employees -- to get unique cities

--Order by
Select * from employees order by salary desc -- to get all employees ordered by salary in descending order
Select * from employees order by hire_date -- to get all employees ordered by hire date in ascending order
select * from employees order by department, salary desc -- to get all employees ordered by department and then by salary in descending order
Select * from employees order by city, hire_date desc -- to get all employees ordered by city and then by hire date in descending order
Select * from employees order by fname, lname -- to get all employees ordered by first name and then by last name in ascending order
Select department, count(*) as employee_count from employees group by department -- to get the count of employees in each department
Select department, fname From employees  order by department, fname -- to get the department and first name of all employees ordered by departments and then by first name in ascending order

--Like clause
SELECT * FROM employees WHERE fname LIKE 'A%' -- to get all employees whose first name starts with 'A'
SELECT * FROM employees WHERE fname LIKE '%a' -- to get all employees whose first name ends with 'a'
SELECT * FROM employees WHERE department LIKE '%Human%' -- to get all employees whose department contains 'Human'
SELECT * FROM employees WHERE fname LIKE '_A%' -- to get all employees whose first name has 'A' as the second character
SELECT * FROM employees WHERE fname LIKE '[ADF]%' -- to get all employees whose first name starts with 'A', 'D', or 'F'
SELECT * FROM employees WHERE fname LIKE '[^A]%' -- to get all employees whose first name does not start with 'A'
SELECT * FROM employees WHERE fname LIKE '____' -- to get all employees whose first name has exactly four characters


--TOP clause
SELECT TOP 5 * FROM employees -- to get the top 5 employees based on the default order (which is usually the order of insertion)
SELECT TOP 3 * FROM employees ORDER BY salary desc -- to get the top 3 employees ordered by department and then by salary in ascending order
SELECT TOP 3 * FROM employees ORDER BY hire_date ASC -- to get the top 3 earliest hired employees
SELECT TOP 1 * FROM employees WHERE department = 'Marketing' ORDER BY salary DESC -- to get the top employee from the marketing department based on salary

--Exercise: 
--1:  Find Different type of departments in database?
SELECT DISTINCT department FROM employees; -- to get unique departments

--2: Display records with High-low salary

SELECT * FROM employees ORDER BY salary DESC; -- to get all employees ordered by salary in descending order

--3: How to see only top 3 records from a table?

SELECT TOP 3 * FROM employees; -- to get the top 3 records from the employees table

--4: Show records where first name start with letter 'A'

SELECT * FROM employees WHERE fname LIKE 'A%'; -- to get all employees whose first name starts with 'A'

--5: Show records where length of the lname is 4 characters

SELECT * FROM employees WHERE lname LIKE '____' -- to get all employees whose last name has exactly four characters

--LOGICAL Operators - AND, OR, NOT
--AND operator

SELECT * FROM employees WHERE department = 'Tech' AND salary > 90000; -- to get all employees in the Tech department with a salary greater than 90000

--OR operator

SELECT * FROM employees WHERE city = 'Pune' OR department = 'Tech'; -- to get all employees who are either located in Pune or work in the Marketing department

--NOT operator

SELECT * FROM employees WHERE NOT department = 'Tech'; -- to get all employees who are not in the Tech department

--IN operator

SELECT * FROM employees WHERE department IN ('Tech', 'Marketing', 'Management'); -- to get all employees who work in either the Tech, Marketing, or Management department

--BETWEEN operator

SELECT * FROM employees WHERE salary BETWEEN 75000 AND 100000; -- to get all employees with a salary between 75000 and 100000

--not in operator

SELECT * FROM employees WHERE department NOT IN ('Tech', 'Marketing'); -- to get all employees who do not work in the Tech or Marketing department

--CASE statement
--
SELECT 
    fname,
    lname,
    department,
    salary,
    CASE 
        WHEN salary > 100000 THEN 'High Earner' 
        WHEN salary >= 75000 AND salary <= 100000 THEN 'Medium Earner' -- 
        ELSE 'Low Earner'
    END AS Salary_Band
FROM employees order by salary desc; -- to categorize employees based on their salary into High Earner, Medium Earner, and Low Earner bands

--Calculate bonus amount based on department Marketing gets 10% bonus, Tech gets 12% bonus, and all other departments get 5% bonus 

SELECT 
    fname,
    lname,
    department,
    salary,
    CASE 
        WHEN department = 'Marketing' THEN salary * 0.10
        WHEN department = 'Tech' THEN salary * 0.12
        ELSE salary * 0.05
    END AS Bonus_Amount
    from employees order by department; -- to calculate the bonus amount for each employee based on their department and order the results by department

--Aggregate functions
--count, sum, avg, min, max
--Count the number of employees in each department
SELECT COUNT(*) AS Total_Employees FROM employees; -- to get the total number of employees in the employees table

--SUM of salaries of all employees
SELECT SUM(salary) AS Total_Salary FROM employees; -- to get the total sum of salaries of all employees

--Average salary of all employees
SELECT AVG(salary) AS Average_Salary FROM employees; -- to get the average salary of all employees

--Minimum salary among all employees
SELECT MIN(salary) AS Minimum_Salary FROM employees; -- to get the minimum salary among all employees

--Maximum salary among all employees
SELECT MAX(salary) AS Maximum_Salary FROM employees; -- to get the maximum salary among all employees

SELECT emp_id, fname, salary FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees);






