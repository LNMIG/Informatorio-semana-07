-- DATABASE NorthWind

-- Una lista de los nombres y apellidos de la tabla de EMPLOYEES.
SELECT FirstName, LastName FROM employees;

-- Una lista de todos los nombres de las ciudades que aparecen en la tabla de
-- EMPLOYEES. No mostrar 2 veces un mismo nombre de ciudad.
SELECT DISTINCT City FROM employees;

-- Una lista de los nombres de productos y precios unitarios de la tabla
-- PRODUCTS.
SELECT ProductName, UnitPrice FROM products;

-- En la tabla EMPLOYEES: una lista de los detalles completos de quienes viven
-- en EE.UU.
SELECT LastName, FirstName, Photo, Address, HomePhone, City, PostalCode FROM employees WHERE Country = 'USA';

-- A partir de la tabla ORDERS, listar todos los pedidos que tienen un gasto de
-- envío > 50.
SELECT * FROM orders WHERE Freight > 50;

-- De la tabla de CUSTOMERS: listar nombre de la empresa de clientes donde el
-- cargo es igual a Owner.
SELECT CompanyName FROM customers WHERE ContactTitle = 'Owner';

-- A partir de la tabla CUSTOMERS generar una lista de clientes cuyo nombre comienza
-- con la letra "A”.
SELECT * FROM customers WHERE ContactName LIKE 'A%';

-- Una lista de los nombres de clientes donde la región no está en blanco.
SELECT * FROM customers WHERE Region IS NOT NULL;

-- Una lista de todos los productos, ordenado por precio unitario (el más barato
-- primero).
SELECT * FROM products ORDER BY UnitPrice ASC;

-- Una lista de todos los productos, ordenado por precio unitario (el más caro
-- primero).
SELECT * FROM products ORDER BY UnitPrice DESC;

-- El número total de registros de la tabla EMPLOYEES. Nombre de la columna de
-- salida "TotalEmpleados".
SELECT COUNT(*) AS 'TotalEmpleados' FROM employees;

-- De la tabla de pedidos, el gasto de envío promedio y el máximo gasto de
-- envío.
SELECT ROUND(AVG(Freight),2) AS 'EnvíoPromedio', ROUND(MAX(Freight),2) AS 'MaxGastoEnvío' FROM orders;

