CREATE DATABASE store_db;
USE store_db;

CREATE TABLE Customers ( 

    customer_id INT IDENTITY(100,1) PRIMARY KEY, 
    customer_name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE 

);

CREATE TABLE Orders ( 

    order_id INT IDENTITY(500,1) PRIMARY KEY, 
    order_date DATE NOT NULL, 
    total_amount DECIMAL(10, 2), 
    customer_id INT, 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 

);

INSERT INTO Customers (customer_name, email) 
VALUES 
('Raju', 'raju@example.com'), 
('Sham', 'sham@example.com'), 
('Baburao', 'baburao@example.com');

EXEC sp_help 'orders';

INSERT INTO Orders (order_date, total_amount, customer_id) 
VALUES 
('2025-09-15', 1500.00, 100), -- This links to Raju (customer_id 100) 
('2025-09-28', 800.00, 101), -- This links to Sham (customer_id 101) 
('2025-10-05', 2200.00, 100), -- This links to Raju (customer_id 100) 
('2025-10-12', 500.00, 102), -- This links to Baburao (customer_id 102) 
('2025-10-17', 1200.00, 101); -- New order for Sham (customer_id 101)

select * from Customers;
select * from Orders;

INSERT INTO Customers (customer_name, email)
Values ('Paul', 'paul@example.com');

INSERT INTO Orders (order_date, total_amount)
Values ('2025-10-18', 3500.00);

--JOINS--
--Cross Joins--
SELECT * FROM Customers CROSS JOIN Orders; -- This will return the Cartesian product of Customers and Orders, meaning every combination of customer and order.

--INNER JOIN--
SELECT * FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id; -- This will return only the rows where there is a match between Customers and Orders based on customer_id.

Select c.customer_name, count(o.order_id) as order_count, sum(o.total_amount) as total_amount FROM 
customers c INNER JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--LEFT JOIN--
SELECT * FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id; -- This will return all rows from Customers and the matched rows from Orders. If there is no match, the result is NULL on the Orders side.

Select c.customer_name, count(o.order_id) as order_count, sum(o.total_amount) as total_amount FROM 
customers c LEFT JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--RIGHT JOIN--
SELECT * FROM Customers RIGHT JOIN Orders ON Customers.customer_id = Orders.customer_id; -- This will return all rows from Orders and the matched rows from Customers. If there is no match, the result is NULL on the Customers side.

Select c.customer_name, count(o.order_id) as order_count, sum(o.total_amount) as total_amount FROM 
customers c RIGHT JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--FULL OUTER JOIN--
SELECT * FROM Customers FULL OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id; -- This will return all rows when there is a match in either Customers or Orders. If there is no match, the result is NULL on the side that does not have a match.

Select c.customer_name, count(o.order_id) as order_count, sum(o.total_amount) as total_amount FROM 
customers c Full outer JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

--outer apply--

SELECT 
    c.customer_id, c.customer_name,
    o.order_id, o.order_date, o.total_amount
FROM Customers AS c

OUTER APPLY (
    SELECT TOP 1 *
    FROM Orders AS o
    WHERE o.customer_id = c.customer_id
    ORDER BY o.order_date DESC
) AS o; -- This query retrieves each customer along with their most recent order (if any). The OUTER APPLY allows us to get the top 1 order for each customer based on the order date. If a customer has no orders, the order details will be NULL.







