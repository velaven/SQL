CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary INT,
    department_id INT 
);

SELECT * FROM employees;
INSERT INTO employees (employee_id, name, age, salary, department_id)
VALUES
(1, 'John', 30, 60000, 101),
(2, 'Emily', 25, 48000, 102),
(3, 'Michael', 40, 75000, 103),
(4, 'Sara', 35, 56000, 101),
(5, 'David', 28, 49000, 102);

CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
price INT NOT NULL
);

SELECT * FROM products;
INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Laptop', 1000),
(2, 'Mobile', 500),
(3, 'Table', 300),
(4, 'Headphones', 100),
(5, 'Smartwatch', 200);


CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL
    );

SELECT * FROM customers;
-- Insert Sample Data
INSERT INTO customers (customer_id, customer_name)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Alice Johnson'),
(104, NULL),
(105, 'Robert Brown');


-- Create the sales table
CREATE TABLE sales(
sale_id INT PRIMARY KEY AUTO_INCREMENT,
FOREIGN KEY customers(customer_id) REFERENCES customers (customer_id),
amount DECIMAL(10, 2),
sale_date DATE NOT NULL
);
SELECT * FROM sales;
-- Insert sample data
INSERT INTO sales (sale_id, customer_id, amount, sale_date) 
VALUES
(1, 101, 4500.00, '2023-03-15'),
(2, 102, 5500.00, '2023-03-16'),
(3, 103, 7000.00, '2023-03-17'),
(4, 104, 3000.00, '2023-03-18'),
(5, 105, 6000.00, '2023-03-19');

CREATE TABLE departments(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);


SELECT * FROM departments;
INSERT INTO departments (department_id, department_name)
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing');



CREATE TABLE orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    order_amount INT
    );
    
    
    
    SELECT * FROM orders;
    INSERT INTO orders(order_id, customer_name, order_date, order_amount)
    VALUES
    (1, 'John', '2023-05-01', 500),
    (2, 'Emily', '2023-05-02', 700),
    (3, 'Michael', '2023-05-03', 1200),
    (4, 'Sara', '2023-05-04', 450),
    (5, 'David', '2023-05-05', 900);
   -- syntax error identification 
    SELECT name, age
    FROM employees
    WHERE salary >= 50000;
    
    -- logical error detection using OR for multiple dates
   SELECT * FROM orders
   WHERE order_date = '2023-05-01' OR order_date = '2023-05-02';
   
   -- Create index and select only required columns
   CREATE INDEX idx_amount ON sales(amount);
   SELECT amount, customer_id FROM sales 
   WHERE amount > 5000;
   
   
   -- correct use numeric value without quotes
   SELECT * FROM products 
   WHERE price = 100;
   
   -- joining using the proper primary and foreign keys
   SELECT e. name, d.depaerment_name
   FROM employees e
   INNER JOIN departments d ON e.department_id = d.department_id;
   

-- properly checking for non_null values
SELECT * FROM customers
 WHERE customer_name IS NOT NULL;
    
-- using GROUP BY for accurate aggregation
SELECT customer_is, SUM(amount) AS total_amount
FROM sales
GROUP BY customer_id;
-- Select existing columns only
SELECT order_id, customer_name
FROM orders;



-- Query Ans Retrieve Employee Detail whose salary is greater than 60000.
SELECT * FROM employees
WHERE salary > 60000;

-- Find total sales pee customer
-- calculatr the total sales amount for each customer from the sales table. 
SELECT customer_id, SUM(amount) AS total_sales
FROM sales 
GROUP BY customer_id;

-- Retrieve the names and salaries of all employees working in the 'Finanace department
SELECT e.name, e.salary
FROM employees e
JOIN department d ON e.department_id = d.deparment_id
WHERE d.department_name = 'Finance';

-- Get the names of customers who have placed an order of more than 600
SELECT customer_name
FROM orders
WHERE order_amount > 600;
