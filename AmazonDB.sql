
USE AmazonDB;

-- 2) Creating Tables
-- create a table named  'users'
CREATE TABLE users (

user_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE NOT NULL,
registered_date DATE NOT NULL,
membership ENUM ('BASIC', 'Prime') DEFAULT "Basic"
);
select * from users;
INSERT INTO users (name, email, registered_date, membership)
VALUES
 ('Alice Johnson','Alice.J@example.com','2024-01-15','Prime'),
 ('Bob Smith', 'Bob.S@example.com','2024-02-01','Basic'),
 ('Charlie Brown','Charlie.B@example.com','2024-03-10','Prime'),
 ('Daisy Ridley','Daisy.R@example.com','2024-04-12','Basic');
 
SHOW TABLES;

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(200) NOT NULL,
price DECIMAL(10,2) NOT NULL,
category VARCHAR(100) NOT NULL,
stock INT NOT NULL
);
select * from products;
INSERT INTO products(name,price,category,stock)
VALUES
('Echo Dot',49.99,'Electronics',120),
('kindle Paperwhite',129.99,'Books',50),
('Fire Stick',39.99,'Electronics',80),
('Yoga Mat',19.99,'Fitness',200),
('Wireless Nouse',24.99,'Electronics',150);
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
FOREIGN KEY (user_id) REFERENCES users(user_id),
order_date DATE NOT NULL,
total_amount DECIMAL(10, 2) NOT NULL
);
select * from orders;
INSERT INTO orders(user_id,order_date,total_amount)
VALUES
(1,'2024-05-01',79.98),
(2,'2024-05-03',129.99),
(1,'2024-05-04',49.99),
(3,'2024-05-05',24.99);
CREATE TABLE order_details(
order_details_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
FOREIGN KEY orders(order_id) REFERENCES orders(order_id),
product_id INT,
FOREIGN KEY products(product_id) REFERENCES products(product_id),
quantity INT NOT NULL,


select * from order_details;
INSERT INTO order_details(order_id,product_id,quantity)
VALUES
(1,1,2),
(2,2,1),
(3,1,1),
(4,5,1);