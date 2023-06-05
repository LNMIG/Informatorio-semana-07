CREATE DATABASE ejercicio5;
USE ejercicio5;

CREATE TABLE departamento (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo CHAR NOT NULL,
    tipo VARCHAR(12) NOT NULL
);
 
CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    curso TINYINT NOT NULL,
    cuatrimestre TINYINT NOT NULL,
    id_profesor INT,
    id_grado INT NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT PRIMARY KEY,
    anyo_inicio INTEGER NOT NULL,
    anyo_fin INTEGER NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT NOT NULL,
    id_asignatura INT NOT NULL,
    id_curso_escolar INT NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
 
 /* Departamento */
INSERT INTO departamento VALUES
(1, 'Informática'),
(2, 'Matemáticas'),
(3, 'Economía y Em,resa'),
(4, 'Educación'),
(5, 'Agronomía'),
(6, 'Química y Fís,ca'),
(7, 'Filología'),
(8, 'Derecho'),
(9, 'Biología y Geología');
 
 /* Persona */
INSERT INTO persona VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno'),
(2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor'),
(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno'),
(5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor'),
(6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno'),
(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno'),
(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor'),
(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno'),
(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor'),
(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno'),
(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor'),
(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor'),
(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'profesor'),
(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor'),
(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno'),
(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno'),
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
/* Profesor */
INSERT INTO profesor VALUES
(3, 1),
(5, 2),
(8, 3),
(10, 4),
(12, 4),
(13, 6),
(14, 1),
(15, 2),
(16, 3),
(17, 4),
(18, 5),
(20, 6);
 
 /* Grado */
INSERT INTO grado VALUES
(1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
(2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
(3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
(4, 'Grado en Ingeniería Informática (Plan 2015)'),
(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
(7, 'Grado en Biotecnología (Plan 2015)'),
(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
(9, 'Grado en Matemáticas (Plan 2010)'),
(10, 'Grado en Química (Plan 2009)');
 
/* Asignatura */
INSERT INTO asignatura VALUES
(1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4),
(2, 'Cálculo', 6, 'básica', 1, 1, 14, 4),
(3, 'Física para informática', 6, 'básica', 1, 1, 3, 4),
(4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4),
(5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4),
(6, 'Estadística', 6, 'básica', 1, 2, 14, 4),
(7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4),
(8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4),
(9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4),
(10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4),
(11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
(12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
(13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
(14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
(15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
(16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
(17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
(18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4),
(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
(20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
(21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
(22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
(25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
(26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
(27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
(29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
(30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
(32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
(33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
(34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
(35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
(36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
(37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
(38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
(39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
(40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
(41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
(42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
(43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
(44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
(45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
(46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
(47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
(49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
(50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
(51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
(52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
(53, 'Física', 6, 'básica', 1, 1, NULL, 7),
(54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
(55, 'Química general', 6, 'básica', 1, 1, NULL, 7),
(56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
(57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
(58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
(59, 'Genética', 6, 'básica', 1, 2, NULL, 7),
(60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
(61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
(62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
(63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
(64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
(65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
(66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
(67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
(68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
(69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
(70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
(71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
(72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
(75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
(76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
(79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
(80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
(81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
(82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
(83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES
(1, 2014, 2015),
(2, 2015, 2016),
(3, 2016, 2017),
(4, 2017, 2018),
(5, 2018, 2019);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(24, 1, 5),
(24, 2, 5),
(24, 3, 5),
(24, 4, 5),
(24, 5, 5),
(24, 6, 5),
(24, 7, 5),
(24, 8, 5),
(24, 9, 5),
(24, 10, 5),
(23, 1, 5),
(23, 2, 5),
(23, 3, 5),
(23, 4, 5),
(23, 5, 5),
(23, 6, 5),
(23, 7, 5),
(23, 8, 5),
(23, 9, 5),
(23, 10, 5),
(19, 1, 5),
(19, 2, 5),
(19, 3, 5),
(19, 4, 5),
(19, 5, 5),
(19, 6, 5),
(19, 7, 5),
(19, 8, 5),
(19, 9, 5),
(19, 10, 5);

-- Lista las asignaturas del tipo "optativa".
SELECT * FROM asignatura WHERE tipo = 'optativa';

-- Lista los nombres de Departamento de la Universidad.
SELECT nombre FROM departamento;

-- Listar apellidos y nombre de las Personas, convirtiendo ambos elementos a
-- mayúsculas
SELECT CONCAT(UCASE(nombre),' ', UCASE(apellido1),' ', UCASE(apellido2))
AS 'Nombre completo'
FROM persona;

-- Listar apellidos y nombres de Profesores mayores a 40 años en la
-- Universidad.
SELECT CONCAT(nombre,' ', UCASE(apellido1),' ', UCASE(apellido2)) AS 'Profesores mayores de 40 años',
 fecha_nacimiento AS 'Fecha Nacimiento',
 CURRENT_DATE() AS 'Fecha Actual',
 TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURRENT_DATE()) AS 'Años de edad'
FROM persona, profesor
WHERE profesor.id_profesor = persona.id AND TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURRENT_DATE()) > 40;