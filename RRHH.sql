-- ==========================================================
-- Creación de la Base de Datos
-- ==========================================================

CREATE DATABASE IF NOT EXISTS RRHH;

-- ==========================================================
-- Seleccionar la Base de Datos
-- ==========================================================

USE RRHH;

-- ==========================================================
-- Crear la Tabla de Puestos de Trabajo: car;
-- ==========================================================

CREATE TABLE car (
    idcar     CHAR(3) NOT NULL,
    nombre      VARCHAR(50) NOT NULL,
    sueldo_min  DECIMAL NOT NULL,
    sueldo_max  DECIMAL NOT NULL,
    CONSTRAINT pk_car PRIMARY KEY ( idcar )
);


-- ==========================================================
-- Crear la Tabla de Oficinas: ubicacion
-- ==========================================================

CREATE TABLE ubicacion (
    idubicacion   CHAR(3) NOT NULL,
    ciudad        VARCHAR(50) NOT NULL,
    direccion     VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ubicacion PRIMARY KEY ( idubicacion )
);


-- ==========================================================
-- Crear la Tabla de Departamentos: departamento
-- ==========================================================

CREATE TABLE departamento (
    iddepartamento  INT NOT NULL,
    nombre          VARCHAR(100) NOT NULL,
    idubicacion     CHAR(3) NOT NULL,
    CONSTRAINT pk_departamento 
		PRIMARY KEY ( iddepartamento ),
    CONSTRAINT fk_departamento_ubicacion 
        FOREIGN KEY ( idubicacion ) 
        REFERENCES ubicacion ( idubicacion )
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION
);

-- ==========================================================
-- Crear la Tabla de Empleados: empleado
-- ==========================================================

CREATE TABLE empleado (
    idempleado     CHAR(5)        NOT NULL,
    apellido       VARCHAR(50)    NOT NULL,
    nombre         VARCHAR(50)    NOT NULL,
    fecingreso     DATETIME		  NOT NULL,
    email          VARCHAR(50)    NULL,
    telefono       VARCHAR(20)    NULL,
    idcar	       CHAR(3)        NOT NULL,
    iddepartamento INT            NOT NULL,
    sueldo         DECIMAL        NOT NULL,
    comision       DECIMAL		  NULL,
    jefe           CHAR(5)        NULL,
    CONSTRAINT pk_empleado 
        PRIMARY KEY ( idempleado ),
    CONSTRAINT fk_empleado_car
        FOREIGN KEY ( idcar ) 
        REFERENCES car ( idcar )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT fk_empleado_departamento 
        FOREIGN KEY ( iddepartamento ) 
        REFERENCES departamento ( iddepartamento )
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION,
    CONSTRAINT fk_empleado_empleado 
        FOREIGN KEY ( jefe ) 
        REFERENCES empleado ( idempleado )
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- ==========================================================
-- Crear la Tabla de Parámetros: control
-- ==========================================================

CREATE TABLE control (
    parametro   VARCHAR(20) NOT NULL,
    valor       VARCHAR(20) NOT NULL,
    CONSTRAINT pk_control PRIMARY KEY ( parametro )
);

-- ==========================================================
-- Cargar datos a la tabla: car;
-- ==========================================================

INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C01', 'Gerente General', 15000, 50000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C02', 'Gerente', 10000, 15000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C03', 'Empleado', 7000, 10000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C04', 'Analista', 5000, 7000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C05', 'Vendedor', 3000, 5000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C06', 'Oficinista', 1500, 3000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C07', 'Programador', 2500, 6000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C08', 'Investigador', 6000, 8000 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C09', 'Digitador', 1000, 1500 );
INSERT INTO car ( idcar, nombre, sueldo_min, sueldo_max ) VALUES ( 'C10', 'Anfitriona', 1300, 1800 );

-- ==========================================================
-- Cargar datos a la tabla: ubicacion
-- ==========================================================

INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U01', 'Lima', 'Av. Benavides 534 - Miraflores' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U02', 'Trujillo', 'Calle Primavera 1235 - Cercado' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U03', 'Arequipa', 'Av. Central 2517 - Cercado' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U04', 'Lima', 'Av. La Marina 3456 - San Miguel' );

-- ==========================================================
-- Cargar datos a la tabla: departamento
-- ==========================================================

INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 100, 'Gerencia', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 101, 'Contabilidad', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 102, 'Investigacion', 'U03' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 103, 'Ventas', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 104, 'Operaciones', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 105, 'Sistemas', 'U04' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 106, 'Recursos Humanos', 'U04' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 107, 'Finanzas', 'U01' );

-- ==========================================================
-- Cargar datos a la tabla: empleado
-- ==========================================================

INSERT INTO empleado (idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0001', 'Coronel', 'Gustavo', '20000401', 'gcoronelc@gmail.com', '996-664-457', 'C01', 100, 25000, NULL, NULL );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0002', 'Fernandez', 'Claudia', '20000501', 'cfernandez@perudev.com', '9345-8365', 'C03', 100, 8000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0003', 'Matsukawa', 'Sergio', '20000401', 'smatsukawa@perudev.com', '9772-8369', 'C02', 102, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0004', 'Diaz', 'Mariela', '20000410', 'mdiaz@perudev.com', '8654-6734', 'C06', 102, 1800, NULL, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0005', 'Martinez', 'Roberto', '20000405', 'rmartinez@perudev.com', NULL, 'C08', 102, 9000, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0006', 'Espinoza', 'Miguel', '20000406', 'mespinoza@perudev.com', NULL, 'C08', 102, 7500, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0007', 'Ramos', 'Vanessa', '20020406', 'vramos@perudev.com', '9456-3456', 'C08', 102, 7000, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0008', 'Flores', 'Julio', '20000401', 'jflores@perudev.com', NULL, 'C07', 102, 3500, 1000, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0009', 'Marcelo', 'Ricardo', '20000401', 'rmarcelo@perudev.com', '9936-2966', 'C02', 101, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0010', 'Barrios', 'Guisella', '20010115', 'gbarrios@perudev.com', '9023-4512', 'C03', 101, 8000, NULL, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0011', 'Cuellar', 'Lucy', '20030218', 'lcuellar@perudev.com', NULL, 'C06', 101, 2000, NULL, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0012', 'Valencia', 'Hu;', '20000501', 'hvalencia@perudev.com', '9732-5601', 'C02', 105, 18000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0013', 'Veliz', 'Fortunato', '20000505', 'fveliz@perudev.com', '9826-7603', 'C04', 105, 6000, NULL, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0014', 'Aguero', 'Octavio', '20000515', 'oaguero@perudev.com', NULL, 'C07', 105, 3000, 300, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0015', 'Rosales', 'Cesar', '20030315', 'crosales@perudev.com', NULL, 'C07', 105, 2500, 300, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0016', 'Villarreal', 'Nora', '20000501', 'nvillarreal@perudev.com', '9371-3641', 'C02', 103, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0017', 'Romero', 'Alejandra', '20000503', 'aromero@perudev.com', '8345-9526', 'C03', 103, 7500, NULL, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0018', 'Valdiviezo', 'Jennifer', '20000612', 'jvaldiviezo@perudev.com', '9263-5172', 'C06', 103, 2000, NULL, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0019', 'Muchotri;', 'Omar', '20000512', 'omuchotri;@perudev.com', '9963-5542', 'C05', 103, 3500, 500, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0020', 'Baltazar', 'Victor', '20000518', 'vbaltazar@perudev.com', '9893-4433', 'C05', 103, 3000, 800, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0021', 'Castillo', 'Ronald', '20010518', 'rcastillo@perudev.com', '9234-3487', 'C05', 103, 3000, 800, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcar, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0022', 'Espilco', 'Luis', '20020417', 'lespilco@perudev.com', '9554-3456', 'C05', 103, 3000, 300, 'E0016' );

-- ==========================================================
-- Cargar datos a la tabla: control
-- ==========================================================

INSERT INTO control ( parametro, valor ) VALUES ( 'Car', '10' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Ubicacion', '4' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Departamento', '107' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Empleado', '22' );
INSERT INTO control ( parametro, valor ) VALUES ( 'Empresa', 'PeruDev' );