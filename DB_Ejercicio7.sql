-- DATABASE RRHH

-- En base a la tabla EMPLEADO, listar datos de quienes tengan un sueldo mayor
-- a 10000.
SELECT * FROM empleado WHERE sueldo > 10000;

-- En base a la tabla EMPLEADO, contar cuántas personas, al aplicar un
-- aumento de 5%, su sueldo supere los 15000.
SELECT COUNT(*) FROM empleado WHERE sueldo * 1.05 > 15000;

-- Listar los nombres de todos los departamentos.
SELECT nombre FROM departamento;

-- Listar la cantidad de personas de la tabla EMPLEADO, que tengan el cargo de
-- Programador. Y cuantas de estas personas superen el sueldo mínimo en esa
-- categoría.
SELECT COUNT(*) AS 'Programadores con sueldo mayor al mínimo'  
FROM empleado AS e, car AS C
WHERE e.idcar IN (SELECT c.idcar FROM car WHERE c.nombre = 'Programador')
  AND e.sueldo > c.sueldo_min; 