USE `northwind`;

-- Ejercicio 1 --- Nombres de las compañias y los id de los clientes en una CTE

SELECT * FROM customers
LIMIT 10;
    
WITH info_customers AS (SELECT customer_id AS CustID, company_name AS CompanyName
							FROM customers)
SELECT *
	FROM info_customers;

-- Ejercicio 2 --- Selecciona solo los de que vengan de "Germany"

WITH info_customers_germany AS (SELECT customer_id AS CustID, company_name AS CompanyName
							FROM customers
                            WHERE country = "Germany")
SELECT * 
	FROM info_customers_germany;
    
-- Ejercicio 3 --- Extraed el id de las facturas y su fecha de cada cliente

SELECT * FROM customers
LIMIT 7;

SELECT * FROM orders
LIMIT 7;

WITH info_customers AS (SELECT customer_id, company_name 
							FROM customers)
SELECT customer_id, company_name, order_id, order_date
	FROM orders
    INNER JOIN info_customers
    USING (customer_id)
    ORDER BY customer_id ASC;

-- Ejercicio 4 --- Contad el número de facturas por cliente

WITH info_customers AS (SELECT customer_id, company_name 
							FROM customers)
SELECT customer_id, company_name, COUNT(order_id) AS numero_facturas 
	FROM orders
    INNER JOIN info_customers
    USING (customer_id)
    GROUP BY customer_id
    ORDER BY customer_id ASC;

-- Ejercicio 5 --- Cuál la cantidad media pedida de todos los productos ProductID: extraer la suma de las cantidades por cada producto y calcular la media

SELECT * FROM products
LIMIT 7;

SELECT * FROM order_details
LIMIT 7;

WITH media_cantidades AS (SELECT ROUND(AVG(quantity),2) AS media_producto, product_id
							FROM order_details
                            GROUP BY product_id)
SELECT product_name, media_producto
	FROM products
	INNER JOIN media_cantidades
    USING (product_id)
    ORDER BY product_name ASC;





