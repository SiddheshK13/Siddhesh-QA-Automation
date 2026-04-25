Create database E_Store_DB
Use E_Store_DB

-- CUSTOMERS TABLE
create table customers
(
	cust_id INT IDENTITY(1,1) PRIMARY KEY,
	cust_name VARCHAR(50) NOT NULL
);

insert into customers (cust_name) values
('Raju'), ('paul'), ('Alex'), ('John'), ('Smith');

-- ORDERS TABLE
create table orders
(
	order_id INT IDENTITY(1,1) PRIMARY KEY,
	order_date DATE NOT NULL,
	cust_id INT NOT NULL,
	FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE
);

INSERT INTO orders (order_date, cust_id)
VALUES
    ('2025-01-01', 1),  -- Raju first order
    ('2025-02-01', 2),  -- Sham first order
    ('2025-03-01', 3),  -- Paul first order
    ('2025-04-04', 2);  -- Sham second order

-- PRODUCTS TABLE

CREATE TABLE products (
    p_id INT IDENTITY(1,1) PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00),
    ('Monitor', 12000.00);

-- ORDER_DETAILS TABLE

CREATE TABLE order_items (
    item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    p_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (p_id) REFERENCES products(p_id)
);

INSERT INTO order_items (order_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Raju ordered 1 Laptop
    (1, 4, 2),  -- Raju ordered 2 Cables
    (2, 1, 1),  -- Sham ordered 1 Laptop
    (3, 2, 1),  -- Paul ordered 1 Mouse
    (3, 4, 5),  -- Paul ordered 5 Cables
    (4, 3, 1);  -- Sham ordered 1 Keyboard

SELECT 
	c.cust_name,
	o.order_date,
	p.p_name,
	p.price,
	oi.quantity,
	(oi.quantity*p.price) AS total_price -- total price for each product in the order
FROM order_items oi
	JOIN
		products p ON oi.p_id=p.p_id
	JOIN
		orders o ON o.order_id=oi.order_id
	RIGHT JOIN
		customers c ON o.cust_id=c.cust_id;

SELECT 
	c.cust_name,
    count(o.order_id) AS total_order, -- total orders placed by each customer
    SUM(oi.quantity) AS total_products, -- total products ordered by each customer
    SUM(p.price * oi.quantity) AS total_spent -- total amount spent by each customer
FROM order_items oi
JOIN products p ON oi.p_id=p.p_id -- Join order_items with products to get product details
JOIN orders o ON o.order_id=oi.order_id -- Join orders to get customer details
JOIN customers c ON c.cust_id=c.cust_id -- Join customers to get customer names
GROUP BY c.cust_name



