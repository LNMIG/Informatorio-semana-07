-- Base de Datos empresas
USE empresas;


INSERT INTO empresa (empresa_id, nombre, ciudad)
VALUES
(1, 'Oracle', 'New York'),
(2, 'Netflix', 'Michigan'),
(3, 'Google', 'California');

INSERT INTO empleado(empleado_id, nombre, direccion, ciudad, es_supervisor)
VALUES
(1, 'Luis', 'Villa Seria', 'Resistencia', false),
(2, 'Marcelo', 'Villa Seria', 'Resistencia', false),
(3, 'Ariel', 'Villa Seria', 'Resistencia', false),
(4, 'Daniel', 'Villa Seria', 'Resistencia', false),
(5, 'Maximiliano', 'Villa Seria', 'Resistencia', false),
(6, 'Pablo', 'Villa Seria', 'Resistencia', false),
(7, 'Enrique', 'Villa Seria', 'Resistencia', false),
(8, 'Javier', 'Villa Seria', 'Resistencia', false),
(9, 'Julio', 'Villa Seria', 'Resistencia', false);

INSERT INTO trabaja (empresa_id, empleado_id, nombre_empleado, nombre_empresa, sueldo)
VALUES
 (1, 1, 'Luis', 'Oracle', 1000.00),
 (1, 2, 'Marcelo', 'Oracle', 1050.00),
 (1, 3, 'Ariel', 'Oracle', 1350.00),
 (2, 4, 'Daniel', 'Netflix', 2000.00),
 (2, 5, 'Maximiliano', 'Netflix', 2500.00),
 (2, 6, 'Pablo', 'Netflix', 2100.50),
 (3, 7, 'Enrique', 'Google', 1500.00),
 (3, 8, 'Julio', 'Google', 1760.80),
 (3, 9, 'Javier', 'Google', 1150.30);

-- Modificar la base de datos para registrar que `Luis Torres' se mudó a `Málaga'.
UPDATE empleado SET ciudad = 'Málaga' WHERE nombre = 'LUIS TORRES';

-- Dar a todos los empleados de la empresa `Oracle' un 10 % de aumento.
UPDATE empleado SET sueldo = sueldo * 1.10 WHERE nombre_empresa = 'Oracle';
UPDATE trabaja SET sueldo = sueldo * 1.10 WHERE empresa_id = 1;

-- Dar a todos los supervisores de la empresa `Netflix' un 10 % de aumento
UPDATE empleado SET sueldo = sueldo * 1.10 WHERE nombre_empresa = 'Netflix' AND is_supervisor = true;

UPDATE trabaja
SET SUELDO = SUELDO * 1.10
WHERE NOMBRE_EMPRESA = 'Netflix' AND NOMBRE_EMPLEADO IN (SELECT NOMBRE_SUPERVISOR FROM supervisa);

-- Dar a todos los supervisores de la empresa `Google' un 10 % de aumento, a
-- menos que su salario supere los $1900, en ese caso, dar sólo un 3 % de
-- aumento.
UPDATE empleado
SET sueldo = IF(sueldo < 1900.00, sueldo * 1.10, sueldo * 1.03)
WHERE nombre_empresa = 'Google' AND is_supervisor = true;

UPDATE trabaja
SET SUELDO = IF(SUELDO < 1900.00, SUELDO * 1.10, SUELDO * 1.03)
WHERE NOMBRE_EMPRESA = 'Google' AND NOMBRE_EMPLEADO IN (SELECT NOMBRE_SUPERVISOR FROM supervisa);



