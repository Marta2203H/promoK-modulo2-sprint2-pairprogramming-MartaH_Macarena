SELECT  'Hola!'  AS tipo_nombre
	FROM customers;
-- Ejercicio 1

SELECT *
	FROM customers
    LIMIT 10;

SELECT city, company_name, contact_name -- Con REGEX
	FROM customers
    WHERE city REGEXP '^(A|B)'
    ORDER BY city ASC;
    
    SELECT city, company_name, contact_name
	FROM customers
    WHERE city LIKE "A%" OR city LIKE "B%";

-- EJERCICIO 2 : Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT city AS ciudad, company_name AS NombreEmpresa, contact_name AS persona_contacto, COUNT(ship_country) AS numero_pedidos
	FROM customers as c
	INNER JOIN orders as o
	ON c.customer_id = o.customer_id
	WHERE city LIKE "L%" 
	GROUP BY company_name, c.customer_id;

-- EJERCICIO 3

  SELECT country, company_name, contact_name
	FROM customers
    WHERE country NOT LIKE "USA";
    
-- Comprobamos que no está country

SELECT DISTINCT country
	FROM customers
    WHERE country NOT LIKE "USA"
    ORDER BY country DESC;
    
-- EJERCICIO 4

SELECT contact_name
	FROM customers
    WHERE contact_name NOT LIKE "_A%";