create database test2;
use test2;
CREATE TABLE salesman(
    salesman_id INT PRIMARY KEY,
    salesman_name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(5, 2)
);
INSERT INTO salesman(salesman_id, salesman_name, city, commission) VALUES
    (1, 'Shoisob', 'Noakhali', 0.15),
    (2, 'jahid', 'Cumilla', 0.12),
    (3, 'Utsob', 'Cumilla', 0.10),
    (4, 'Emon', 'Houston', 0.18),
    (5, 'Mamun', 'Miami', 0.14),
    (6, 'Antu', 'Miami', 0.20),
    (7, 'Debi', 'Noakhali', 0.15),
    (8, 'Sara', 'Miami', 0.12),
    (9, 'Tithee', 'Houston', 0.16),
    (10, 'Green', 'Miami', 0.13);
    select *from salesman;
CREATE TABLE customer (
    customer_id int primary key, 
    customer_name VARCHAR(255),
    city VARCHAR(255),
    grade VARCHAR(255),
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);
drop table salesman,customer,orders;
INSERT INTO customer (customer_id,customer_name, city, grade, salesman_id) VALUES
    (10,'Shakib', 'Noakhali', 'High', 1),
    (11,'Tamim', 'Cumilla', 'Medium', 2),
    (12,'Soumyo', 'Cumilla', 'Low', 3),
    (13,'Mostafiz', 'Houston', 'Low', 4),
    (14,'Liton', 'Miami', 'High', 5),
    (15,'Mehedi', 'Miami', 'Low', 6),
    (16,'Rahim', 'Noakhali', 'Medium', 7),
    (17,'Taskin', 'Cumilla', 'Avarage', 8),
    (18,'Shanto', 'Miami', 'Avarage', 9),
    (19,'Emon', 'Atlanta', 'Avarage', 10);
     select *from customer;
  CREATE TABLE orders(
    order_no INT PRIMARY KEY,
    purch_amt DECIMAL(8, 2),
    city VARCHAR(255),
    order_date DATE,
    customer_id int,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);
INSERT INTO orders (order_no, purch_amt, city, order_date, customer_id, salesman_id) VALUES
    (1, 100.00, 'Noakhali', '2023-01-01',10, 1),
    (2, 150.00, 'Cumilla', '2023-02-01',11, 2),
    (3, 200.00, 'Cumilla', '2023-03-01',12, 3),
    (4, 120.00, 'Houston', '2023-04-01', 13, 4),
    (5, 180.00, 'Miami', '2023-05-01', 14, 5),
    (6, 90.00, 'Noakhali', '2023-06-01', 15, 6),
    (7, 110.00, 'Cumilla', '2023-07-01', 16, 7),
    (8, 130.00, 'Miami', '2023-08-01', 17, 8),
    (9, 160.00, 'Boston', '2023-09-01', 18, 9),
    (10, 140.00, 'Atlanta', '2023-10-01',19, 10);
SELECT *FROM orders;

-- 1
SELECT s.salesman_name, c.customer_name, s.city AS same_city
FROM salesman s
JOIN customer c ON s.city = c.city;

-- 2
SELECT o.order_no, o.purch_amt, c.customer_name, o.city
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 100 AND 200;

-- 3
SELECT c.customer_name, c.city, s.salesman_name, s.commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id;

-- 4
SELECT c.customer_name, c.city AS customer_city, s.salesman_name, s.commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.15;

-- 5
SELECT c.customer_name, c.city AS customer_city, s.salesman_name, s.city AS salesman_city, s.commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.city != c.city AND s.commission < 0.18;

-- 6
SELECT
    o.order_no,o.order_date,o.purch_amt,c.customer_name,s.salesman_name,c.grade,s.commission FROM orders o
JOIN
    customer c ON o.customer_id = c.customer_id
JOIN
    salesman s ON o.salesman_id = s.salesman_id;
-- 7
SELECT customer_id,customer_name,city, grade FROM customer
ORDER BY customer_id DESC;

-- 8
SELECT 
    c.customer_name,
    c.city,
    c.grade,
    s.salesman_name,
    o.city AS order_city
FROM 
    customer c
JOIN 
    salesman s ON c.salesman_id = s.salesman_id
JOIN 
    orders o ON c.customer_id = o.customer_id
WHERE 
    c.grade = 'High'
ORDER BY 
    c.customer_id DESC;

-- 9
SELECT DISTINCT s.salesman_id, s.salesman_name
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
WHERE c.salesman_id IS NOT NULL OR c.salesman_id IS NULL
ORDER BY s.salesman_id ASC;

-- 10
SELECT
    s.salesman_name,
    s.city AS salesman_city,
    c.customer_name,
    c.city AS customer_city,
    c.grade,
    o.order_no,
    o.order_date,
    o.purch_amt
FROM
    salesman s
JOIN
    customer c ON s.salesman_id = c.salesman_id
JOIN
    orders o ON c.customer_id = o.customer_id AND c.salesman_id = o.salesman_id;





