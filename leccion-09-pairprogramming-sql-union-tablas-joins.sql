-- CREATE SCHEMA `northwind`;

USE `northwind`;

/*
	EJERCICIO 1
	Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos
    Cuántos pedidos ha realizado cada empresa cliente de UK
*/     

SELECT * FROM orders
LIMIT 5;

SELECT * FROM customers
LIMIT 5;

SELECT * FROM order_details
LIMIT 5;

-- paso 1 -> selecciono lo que necesito de la tabla customers
SELECT customer_id, company_name
	FROM customers;
    
 SELECT customer_id, ship_country
	FROM orders;   
    
-- paso 2 -> me doy cuenta de que necesito unir con la tabla orders

SELECT *
	FROM customers as c
    INNER JOIN orders as o
    ON c.customer_id = o.customer_id;    
    
-- paso 3 -> limpio el select

SELECT company_name AS NombreEmpresa, c.customer_id AS Identificador, ship_country
	FROM customers as c
    INNER JOIN orders as o
    ON c.customer_id = o.customer_id;

-- paso 4 -> contar num clientes que hacen pedidos en UK

SELECT company_name AS NombreEmpresa, c.customer_id AS Identificador, COUNT(ship_country) AS NumeroPedidos
	FROM customers as c
    INNER JOIN orders as o
    ON c.customer_id = o.customer_id
    GROUP BY company_name, c.customer_id;
    
-- PASO 5 -> filtrar el grupo creado para que devuelva los datos de los clientes de UK
SELECT company_name AS NombreEmpresa, c.customer_id AS Identificador, COUNT(ship_country) AS NumeroPedidos
	FROM customers as c
    INNER JOIN orders as o
    ON c.customer_id = o.customer_id
    GROUP BY company_name, c.customer_id, ship_country
    HAVING ship_country = "UK";
    
    -- Seria mas correcto con el where primero !!
SELECT company_name AS NombreEmpresa, c.customer_id AS Identificador, COUNT(ship_country) AS NumeroPedidos
	FROM customers as c
	INNER JOIN orders as o
	ON c.customer_id = o.customer_id
	WHERE ship_country = "UK"
	GROUP BY company_name, c.customer_id;
		

-- PASO FINAL -> limpiar la query para que se ajuste a lo que nos pide el ejercicio en caso necesario, ahora no nos hace falta

/*
	EJERCICIO 2
	Productos pedidos por empresa en UK por año
    Nombre de la empresa, el año, y la cantidad de objetos que han pedido
*/     
SELECT * FROM orders
LIMIT 5;

SELECT * FROM customers
LIMIT 5;

SELECT * FROM order_details
LIMIT 5;

-- paso 1 -> selecciono lo que necesito de las tablas

SELECT order_id, customer_id, YEAR(order_date), ship_country
	FROM orders
	LIMIT 5;

SELECT customer_id, company_name
	FROM customers; 
    
SELECT order_id, quantity
	FROM order_details; 

-- paso 2 -> unir las 3 tablas con doble inner join usando order_id y customer_id que son las tablas union

SELECT *
	FROM orders AS o
    INNER JOIN customers AS e
    ON o.customer_id = e.customer_id
    INNER JOIN order_details AS o_d
    ON o.order_id = o_d.order_id;
    
    
 -- paso 3 -> limpio el select
SELECT company_name AS NombreEmpresa, YEAR(order_date) AS Año, quantity 
	FROM orders AS o
    INNER JOIN customers AS e
    ON o.customer_id = e.customer_id
    INNER JOIN order_details AS o_d
    ON o.order_id = o_d.order_id;
    
-- paso 4 y 5 -> agrupo por clientes de UK y hacemos SUM de quantity

SELECT company_name AS NombreEmpresa, YEAR(order_date) AS Año, SUM(quantity) AS NumObjetos
	FROM orders AS o
    INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
    INNER JOIN order_details AS o_d
    ON o.order_id = o_d.order_id
    WHERE c.country = "UK"
    GROUP BY company_name, YEAR(order_date)