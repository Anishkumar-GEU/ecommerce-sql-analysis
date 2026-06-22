USE ecommerce;

-- Problem Statement:- Find the total revenue of the company
SELECT SUM(amount) AS Total_Revenue FROM payments;
-- Insight:- The total revenue of the company is 21225.00

-- Problem Statement:- Find the revenue of the company product wise(consider only those are delivered)
SELECT p.product_name AS Product, SUM(p.price * oi.quantity)AS Revenue FROM product p 
JOIN order_item oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name 
ORDER BY Revenue DESC;
-- Insight:- "Python Hoodie" and "AI Nerd T-Shirt" are the most contributed items to the revenue. "Sticker Pack" is the least contributed item to the revenue

-- Problem Statement:- Find out the top customers of our company by Expenditure
SELECT c.customer_id AS Id, c.name AS Name, SUM(p.amount) AS Expenditure 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id
ORDER BY Expenditure DESC;
-- Insight:- "Simran Kaur" is the top customer of the company on the basis of Expenditure

-- Problem Statement:- Find out the most selling products
SELECT p.product_name AS Product, SUM(oi.quantity) AS Quantity_Sold 
FROM product p 
JOIN order_item oi ON oi.product_id = p.product_id 
GROUP BY p.product_name
ORDER BY Quantity_Sold DESC;
-- Insight:- "DSA Notebook", "SQL Cheat Sheet", "Terminal Stickers" are the most selling products of the company

-- Problem Statement:- How many total cancelled orders
SELECT COUNT(*) AS Cancelled_Orders FROM orders WHERE order_status = 'Cancelled';



-- DECISIONS CAN BE TAKEN ON THE BEHALF OF THE COMPANY
-- 1. INCREASE THE PRODUCTION OF "DSA Notebook", "SQL Cheat Sheet" AND "Terminal Stickers" 
-- 2. LAUNCH OFFER COUPONS FOR OUR TOP CUSTOMERS TO HOLD THEIR INTEREST AND TRUST
-- 3. FOCUS ON THE PRICE SCHEMES OF "Python Hoodie" and "AI Nerd T-Shirt" AS THEY ARE THE TOP CONTRIBUTORS OF THE COMPANY
-- 4. EFFORTS TO MAKE "Sticker Pack" BY THE TEAM CAN BE REDUCED A LITTLE TO FOCUS ON OTHER GROWING AREAS
