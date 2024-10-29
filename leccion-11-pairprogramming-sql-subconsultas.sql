USE `northwind`;

-- Ejercicio 1 -- Con Cesar en clase

USE `tienda`;
SELECT product_line, product_name, buy_price
	FROM products AS p1
    WHERE buy_price > (SELECT AVG(buy_price)
							FROM products AS p2
							WHERE p1.product_line = p2.product_line);

-- Ejercicio 1 -- 
    /*
		- pedidos con el máximo "order_date" para cada empleado
    */
SELECT *
	FROM employees
    LIMIT 8;
    
SELECT *
	FROM orders
    LIMIT 8;
    

SELECT order_id, customer_id, employee_id, order_date, required_date
	FROM orders as o1
	WHERE order_date = (SELECT MAX(order_date)
							FROM orders as o2
							WHERE o2.employee_id = o1.employee_id);


-- Ejercicio 2 DE PAIR

    /*
		- max de unit_price de cada product_id que este en la tabla order_details
    */
    
SELECT product_id, MAX(unit_price) AS max_unit_price_sold
		FROM products
        WHERE product_id IN (SELECT product_id
								FROM order_details)
        GROUP BY product_id;
        
-- Ejercicio 3 DE PAIR    

    /*
		- id de producto, nombre producto e id de categoria de Beverages
        
    */

SELECT *
	FROM products
    LIMIT 8;

SELECT *
	FROM categories
    LIMIT 8;

SELECT product_id, product_name, category_id
		FROM products
        WHERE category_id = (SELECT category_id
								FROM categories
                                WHERE category_name = 'Beverages');

-- Ejercicio 4 DE PAIR    

    /*
		- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
        
    */


SELECT *
	FROM customers
    LIMIT 8;

SELECT *
	FROM suppliers
    LIMIT 8;

SELECT DISTINCT country
	FROM customers
    WHERE country NOT IN (SELECT DISTINCT country
							FROM suppliers);

-- Ejercicio 5 DE PAIR    

    /*
		- Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
        - OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido
    */
    
    SELECT *
		FROM order_details
		LIMIT 8;
    
	SELECT *
		FROM products
		LIMIT 8;
    
	SELECT *
	FROM customers
	LIMIT 8;
    
	SELECT *
	FROM orders
	LIMIT 8;
    
    
    
    
    
    