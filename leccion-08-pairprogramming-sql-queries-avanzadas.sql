CREATE SCHEMA `northwind`;

USE `northwind`;

SELECT * 
	FROM products
    LIMIT 10;
    
-- Ejercicio 1

SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
	FROM products;
    
-- Ejercicio 2

SELECT COUNT(product_id) AS totalProductos, ROUND(AVG(unit_price),2) AS precioMedio
	FROM products;
    
-- Ejercicio 3

SELECT * 
	FROM orders
    LIMIT 10;
SELECT DISTINCT(ship_country)
		FROM orders;
        
SELECT MIN(freight) AS lowestcarga, MAX(freight) AS highestcarga
	FROM orders
    WHERE ship_country = 'UK';
    
-- Ejercio 4
SELECT * 
	FROM products
    LIMIT 10;

SELECT COUNT(product_id) AS totalProductos, ROUND(AVG(unit_price),2) AS precioMedio
	FROM products;