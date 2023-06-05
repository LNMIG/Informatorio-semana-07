
SELECT nombre FROM producto;
SELECT * FROM producto;
SELECT nombre AS 'Nombre', precio AS 'Precio en USD' FROM producto;
SELECT UPPER(nombre) AS 'Nombre', precio AS 'Precio en USD' FROM producto;
SELECT nombre AS 'Nombre', ROUND(precio) AS 'Precio en USD' FROM producto;

SELECT DISTINCT f.codigo_fabricante AS 'Código de Fabricante'
FROM fabricante as f
JOIN producto as p
ON p.codigo_fabricante = f.codigo_fabricante
WHERE p.codigo_fabricante = f.codigo_fabricante
SELECT DISTINCT fabricante.codigo_fabricante AS 'Código de Fabricante'
FROM fabricante, producto WHERE producto.codigo_fabricante = fabricante.codigo_fabricante;

SELECT nombre AS 'Nombre de Fabricante' FROM fabricante ORDER BY nombre ASC;
SELECT nombre AS 'Nombre de Productos', precio AS Precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT nombre FROM producto WHERE precio <= 120;
SELECT producto.nombre, fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante = 2 AND fabricante.codigo_fabricante = 2;

SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);

SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2);

SELECT nombre FROM fabricante
WHERE codigo_fabricante = ANY (SELECT codigo_fabricante FROM producto WHERE producto.codigo_fabricante = fabricante.codigo_fabricante);


