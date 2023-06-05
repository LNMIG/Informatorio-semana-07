CREATE DATABASE Ejercicio3;

USE Ejercicio3;

CREATE TABLE fabricante (
codigo_fabricante INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
);

CREATE TABLE producto (
codigo_producto INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
codigo_fabricante INT(10) NOT NULL,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE(6,2) NOT NULL,
stock INT NOT NULL DEFAULT 0,
FOREIGN KEY (`codigo_fabricante`) REFERENCES fabricante(`codigo_fabricante`),
);

INSERT INTO fabricante VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

INSERT INTO producto VALUES
(1, 5, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 6, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 5, 'Disco SSD 1 TB', 150.99, 4),
(4, 1, 'GeForce GTX 1050Ti', 185, 7),
(5, 1, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 4, 'Monitor 24 LED Full HD', 202, 1),
(7, 4, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 2, 'Portátil Yoga 520', 559, 2),
(9, 2, 'Portátil Ideapd 320', 444, 2),
(10, 3, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 3, 'Impresora HP Laserjet Pro M26nw', 180, 3);

UPDATE producto SET codigo_fabricante = 5 WHERE codigo_producto = 3;
UPDATE producto SET codigo_fabricante = 1 WHERE codigo_producto = 4;
UPDATE producto SET codigo_fabricante = 1 WHERE codigo_producto = 5;
UPDATE producto SET codigo_fabricante = 4 WHERE codigo_producto = 6;
UPDATE producto SET codigo_fabricante = 4 WHERE codigo_producto = 7;
