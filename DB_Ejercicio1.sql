CREATE DATABASE ejercicio1;

USE ejercicio1;

CREATE TABLE empresa (
empresa_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
nombre VARCHAR(60) NOT NULL,
ciudad VARCHAR(60) NOT NULL
);

CREATE TABLE empleado (
empleado_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
nombre VARCHAR(60) NOT NULL,
direccion VARCHAR(60) NOT NULL,
ciudad VARCHAR(60) NOT NULL,
es_supervisor BOOLEAN DEFAULT false
);

CREATE TABLE trabaja (
trabaja_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
empresa_id INT UNSIGNED NOT NULL,
empleado_id INT UNSIGNED NOT NULL,
nombre_empleado VARCHAR(60) NOT NULL,
nombre_empresa VARCHAR(60) NOT NULL,
sueldo DOUBLE,
FOREIGN KEY (`empresa_id`) REFERENCES empresa(`empresa_id`),
FOREIGN KEY (`empleado_id`) REFERENCES empleado(`empleado_id`)
);

CREATE TABLE supervisa (
supervisa_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
empleado_id INT NOT NULL,
empleado_id INT NOT NULL,
nombre_empleado VARCHAR(60) NOT NULL,
nombre_supervisor VARCHAR(60) NOT NULL
);