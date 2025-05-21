-- creat table

CREATE TABLE customers (
     customer_id INT PRIMARY KEY,
     name VARCHAR(100),
     city VARCHAR(100)
     );
     
CREATE TABLE orders1 (
     order_id INT PRIMARY KEY,
     orderdate DATE,
     customer_id INT,
     amount DECIMAL(10,2),
     FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
 );
 
 INSERT INTO customers (customer_id, name, city) VALUES 
 (1,'alice','new york'),
 (2,'bob','los angeles'),
 (3,'charlie','chicago');
 
INSERT INTO orders1 (order_id, orderdate, customer_id, amount ) VALUES
 (101, '2025-05-01',1, 250.00),
 (102, '2025-05-03',1, 350.00),
 (103, '2025-05-04', 2,200.00);

-- inner joint
SELECT * 
FROM customers 
INNER JOIN orders1 
ON customers.customer_id = orders1.customer_id;


-- left joint 
SELECT * 
FROM customers 
LEFT JOIN orders1 
ON customers.customer_id = orders1.customer_id;

-- right joint
SELECT * 
FROM customers 
RIGHT JOIN orders1 
ON customers.customer_id = orders1.customer_id;

-- full joint
SELECT customer_id, 'From Customers' AS source 
FROM customers

UNION

SELECT customer_id, 'From Orders' AS source 
FROM orders1;






 
