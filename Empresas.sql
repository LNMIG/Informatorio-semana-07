CREATE DATABASE  IF NOT EXISTS `empresas`;
USE `empresas`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: empresas
-- ------------------------------------------------------
-- Server version	8.0.33
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
    `NOMBRE_EMPLEADO` VARCHAR(100) NOT NULL,
    `DIRECCION` VARCHAR(100) DEFAULT NULL,
    `CIUDAD` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`NOMBRE_EMPLEADO`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;


LOCK TABLES `empleado` WRITE;

INSERT INTO `empleado` VALUES ('Ana Lopez','Carrera 321','Madrid'),('Carlos Gomez','Calle Mayor 555','Sevilla'),('Juan Perez','Calle 123','Madrid'),('Laura Sanchez','Avenida 987','Valencia'),('Lucia Morales','Calle del Rio 321','Sevilla'),('Luis Torres','Callejon 654','Barcelona'),('Manuel Ramirez','Avenida del Sol 789','Madrid'),('Maria Garcia','Avenida 456','Barcelona'),('Pedro Rodriguez','Plaza 789','Valencia'),('Sofia Fernandez','Paseo del Mar 246','Barcelona');

UNLOCK TABLES;

DROP TABLE IF EXISTS `empresa`;

CREATE TABLE `empresa` (
    `NOMBRE_EMPRESA` VARCHAR(100) NOT NULL,
    `CIUDAD` VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (`NOMBRE_EMPRESA`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;


LOCK TABLES `empresa` WRITE;

INSERT INTO `empresa` VALUES ('Amazon','Seattle'),('Apple','Cupertino'),('Facebook','Menlo Park'),('Google','Mountain View'),('IBM','Armonk'),('Microsoft','Redmond'),('Netflix','Los Gatos'),('Oracle','Redwood City'),('Tesla','Palo Alto'),('Twitter','San Francisco');

UNLOCK TABLES;



DROP TABLE IF EXISTS `supervisa`;

CREATE TABLE `supervisa` (
    `NOMBRE_EMPLEADO` VARCHAR(100) NOT NULL,
    `NOMBRE_SUPERVISOR` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`NOMBRE_EMPLEADO` , `NOMBRE_SUPERVISOR`),
    KEY `NOMBRE_SUPERVISOR` (`NOMBRE_SUPERVISOR`),
    CONSTRAINT `supervisa_ibfk_1` FOREIGN KEY (`NOMBRE_EMPLEADO`)
        REFERENCES `empleado` (`NOMBRE_EMPLEADO`),
    CONSTRAINT `supervisa_ibfk_2` FOREIGN KEY (`NOMBRE_SUPERVISOR`)
        REFERENCES `empleado` (`NOMBRE_EMPLEADO`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

LOCK TABLES `supervisa` WRITE;

INSERT INTO `supervisa` VALUES ('Laura Sanchez','Ana Lopez'),('Ana Lopez','Juan Perez'),('Laura Sanchez','Juan Perez'),('Manuel Ramirez','Juan Perez'),('Carlos Gomez','Maria Garcia'),('Juan Perez','Maria Garcia'),('Pedro Rodriguez','Maria Garcia'),('Lucia Morales','Pedro Rodriguez'),('Luis Torres','Pedro Rodriguez'),('Sofia Fernandez','Pedro Rodriguez');

UNLOCK TABLES;


DROP TABLE IF EXISTS `trabaja`;
CREATE TABLE `trabaja` (
    `NOMBRE_EMPLEADO` VARCHAR(100) NOT NULL,
    `NOMBRE_EMPRESA` VARCHAR(100) NOT NULL,
    `SUELDO` DECIMAL(10 , 2 ) DEFAULT NULL,
    PRIMARY KEY (`NOMBRE_EMPLEADO` , `NOMBRE_EMPRESA`),
    KEY `NOMBRE_EMPRESA` (`NOMBRE_EMPRESA`),
    CONSTRAINT `trabaja_ibfk_1` FOREIGN KEY (`NOMBRE_EMPLEADO`)
        REFERENCES `empleado` (`NOMBRE_EMPLEADO`),
    CONSTRAINT `trabaja_ibfk_2` FOREIGN KEY (`NOMBRE_EMPRESA`)
        REFERENCES `empresa` (`NOMBRE_EMPRESA`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

LOCK TABLES `trabaja` WRITE;
INSERT INTO `trabaja` VALUES ('Ana Lopez','Amazon',1800.00),('Carlos Gomez','Google',1900.00),('Juan Perez','Google',2000.00),('Laura Sanchez','Microsoft',2100.00),('Lucia Morales','Facebook',2600.00),('Luis Torres','Facebook',2400.00),('Manuel Ramirez','Amazon',1700.00),('Maria Garcia','Microsoft',2500.00),('Pedro Rodriguez','Apple',2200.00),('Sofia Fernandez','Apple',2300.00);
UNLOCK TABLES;