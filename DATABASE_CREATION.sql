CREATE DATABASE ecommerce;
USE ecommerce;

-- Creating Table customers
CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
email VARCHAR(150) UNIQUE,
city VARCHAR(50),
signup_date DATE
);

-- Creating Table product
CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2),
stock INT
);

-- Creating Table orders
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE,
order_status VARCHAR(30),

FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- Creating Table order_items
CREATE TABLE order_item(
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
product_id INT,
quantity INT,

FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id) REFERENCES product(product_id)
);

-- Creating Table payments
CREATE TABLE payments(
payment_id  INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
payment_mode VARCHAR(30),
amount DECIMAL(10,2),
payment_date DATE,

FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- NOW WE INSERT SOME SAMPLE DATA TO CHECK THE FUNCTIONALITY AND DO SOME ANALYSIS IN THE NEXT SCRIPT