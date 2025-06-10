CREATE DATABASE IF NOT EXISTS sales_demo;
USE sales_demo;
CREATE TABLE IF NOT EXISTS online_sales (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50),
    payment_method VARCHAR(50),
    order_status VARCHAR(50)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/new_online_sales_dataset.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM online_sales;
SELECT SUM(quantity * price) AS total_revenue FROM online_sales;
SELECT region, COUNT(order_id) AS total_orders,
       SUM(quantity * price) AS total_sales
FROM online_sales
GROUP BY region;
SELECT order_status, COUNT(*) AS count
FROM online_sales
GROUP BY order_status;
SELECT customer_name, SUM(quantity * price) AS total_spent
FROM online_sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;
SELECT region, AVG(quantity * price) AS avg_order_value
FROM online_sales
GROUP BY region;
SELECT category, SUM(quantity * price) AS revenue
FROM online_sales
GROUP BY category;
SELECT product_name, SUM(quantity) AS total_sold
FROM online_sales
GROUP BY product_name
ORDER BY total_sold DESC
LIMIT 5;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(quantity * price) AS revenue
FROM online_sales
GROUP BY month
ORDER BY month;
SELECT payment_method, COUNT(*) AS method_count
FROM online_sales
GROUP BY payment_method;