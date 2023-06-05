-- DATABASE VERDULERIA

-- Obtener la lista de las ventas, pero con el nombre de la persona que lo vende
-- en lugar de su identificador.
SELECT ven.NombreVendedor, Producto, Kilos 
FROM ventas AS ve
JOIN vendedores AS ven
ON ve.Vendedor = ven.IdVendedor;


-- Obtener la lista de las ventas pero con el nombre del producto en lugar del
-- código.
SELECT Vendedor, p.NomProducto, Kilos 
FROM ventas AS ve
JOIN productos AS p
ON ve.Producto = p.IdProducto;


-- Obtener la lista de las ventas pero con el nombre del producto y quién lo
-- vendió.
SELECT ven.NombreVendedor, p.NomProducto, Kilos 
FROM ventas AS ve
JOIN vendedores AS ven
JOIN productos AS p
ON ve.Vendedor = ven.IdVendedor AND ve.Producto = p.IdProducto;


-- Obtener el nombre de quien más kilos vendió.
SELECT * FROM ventas WHERE Kilos IN (SELECT MAX(Kilos) FROM ventas);


-- Cuántos Kilos de Tomates se han vendido.
SELECT SUM(v.Kilos)
FROM ventas AS v
JOIN producto AS p
ON v.Producto = p.IdProducto
WHERE p.NomProducto = 'Pimientos';


-- Obtener todos los datos de cada venta, que haya superado el promedio de
-- kilos vendidos en total.
SELECT *
FROM ventas
WHERE Kilos >= ANY (SELECT AVG(Kilos) FROM ventas);


-- Obtener cuál fue el producto más vendido del grupo de "Hortalizas"
SELECT p.NomProducto AS 'Hortaliza más vendida'
FROM productos AS p
WHERE p.IdProducto = (	SELECT Producto
						FROM (	SELECT Producto, COUNT(Producto) AS 'MasVendido'
								FROM ventas
								GROUP BY Producto ) AS MS1
						WHERE MasVendido IN (	SELECT MAX(MasVendido2)
												FROM (	SELECT Producto, COUNT(Producto) AS 'MasVendido2'
														FROM ventas
														GROUP BY Producto ) AS MV2
											)
);

SELECT p.NomProducto AS 'Hortaliza más vendida'
FROM productos AS p
WHERE p.IdProducto = (	SELECT Producto AS 'Hortaliza más vendida'
						FROM ventas
						GROUP BY Producto
						HAVING COUNT(*) = (	SELECT MAX(MasVendido)
											FROM (	SELECT Producto, COUNT(*) AS 'MasVendido'
													FROM ventas
													GROUP BY Producto ) AS MV
											)
);