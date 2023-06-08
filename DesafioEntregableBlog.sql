-- Equipo PyDev. Entregable 7

-- ===============================================================================================
-- Creación de la Base de Datos: BLOG
-- ===============================================================================================

CREATE DATABASE IF NOT EXISTS BLOG;

-- ===============================================================================================
-- Selección de la Base de Datos: BLOG
-- ===============================================================================================

USE BLOG;

-- ===============================================================================================
-- Descartamos las tablas si existen
-- ===============================================================================================

DROP TABLE IF EXISTS categoria_articulo;
DROP TABLE IF EXISTS comentario;
DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS categoria;

-- ===============================================================================================
-- Creación de la Tabla de Usuarios: usuario
-- ===============================================================================================

CREATE TABLE usuario(
  id_usuario INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  telefono VARCHAR(20) NULL,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  contrasenia VARCHAR(20) NOT NULL,
  estado enum('activo', 'inactivo') DEFAULT 'activo',
  fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  avatar VARCHAR(500) DEFAULT NULL,
  es_publico BOOLEAN DEFAULT TRUE,
  es_colaborador BOOLEAN DEFAULT FALSE,
  es_admin BOOLEAN DEFAULT FALSE
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- ===============================================================================================
-- Creación de la Tabla de Artículos: articulo
-- ===============================================================================================

CREATE TABLE articulo(
  id_articulo INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT UNSIGNED NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  resumen VARCHAR(200) DEFAULT NULL,
  contenido TEXT NOT NULL,
  fecha_publicacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado BOOLEAN DEFAULT TRUE,
  imagen VARCHAR(500) DEFAULT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES usuario(`id_usuario`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- ===============================================================================================
-- Creación de la Tabla de Categorías: categoria
-- ===============================================================================================

CREATE TABLE categoria(
  id_categoria INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_categoria_padre INT UNSIGNED DEFAULT NULL,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(200) DEFAULT NULL,
  imagen VARCHAR(500) DEFAULT NULL,
  estado enum('activo', 'inactivo') DEFAULT 'activo',
  FOREIGN KEY (`id_categoria_padre`) REFERENCES categoria(`id_categoria`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- ===============================================================================================
-- Creación de la Tabla de Comentarios: comentario
-- ===============================================================================================

CREATE TABLE comentario(
  id_comentario INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_articulo INT UNSIGNED NOT NULL,
  id_usuario INT UNSIGNED NOT NULL,
  contenido VARCHAR(500) DEFAULT '¡El artículo es estupendo!',
  fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado enum('activo', 'inactivo') DEFAULT 'activo',
  FOREIGN KEY (`id_articulo`) REFERENCES articulo(`id_articulo`),
  FOREIGN KEY (`id_usuario`) REFERENCES usuario(`id_usuario`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- ===============================================================================================
-- Creación de la Tabla de Relación entre Categorías y Artículos: categoria_articulo
-- ===============================================================================================

CREATE TABLE categoria_articulo(
  id_articulo INT UNSIGNED NOT NULL,
  id_categoria INT UNSIGNED NOT NULL,
  FOREIGN KEY (`id_articulo`) REFERENCES articulo(`id_articulo`),
  FOREIGN KEY (`id_categoria`) REFERENCES categoria(`id_categoria`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

-- ===============================================================================================
-- Agregar el comando necesario que introduzca en la tabla usuario, 1 usuario con rol de admin,
-- 4 con rol de colaborador y 5 con rol de público. Donde los campos: es_publico, es_colaborador
-- y es_admin son booleanos.
-- ===============================================================================================

INSERT INTO usuario(id_usuario, nombre, apellido, telefono, username, email, contrasenia, es_publico, es_colaborador, es_admin)
VALUES
(1,'Alejandro', 'Camacho', '1111111111111', 'alecamacho', 'alecamacho@email.com', 'Ale11Camacho22', false, false, true),
(2,'Luka', 'Romero', '2222222222222', 'lukaromero', 'lukaromero@email.com', 'Luk22Rom33', false, true, false),
(3,'Federico', 'Redondo', '33333333333333', 'federedondo', 'federedondo@email.com', 'Fede33Red44', false, true, false),
(4,'Alejo', 'Véliz', '4444444444444', 'aleveliz', 'aleveliz@email.com', 'Ale44Vel55', false, true, false),
(5,'Valentín', 'Carboni', '55555555555555', 'valcarboni', 'valecarboni@email.com', 'Valen55Car66', false, true, false),
(6,'Nicolás', 'Paz', '66666666666666', 'nicopaz', 'nicopaz@email.com', 'Nico66Paz77', true, false, false),
(7,'Valentín', 'Barco', '777777777777777', 'valbarco', 'valebarco@email.com', 'Valen77Bar88', true, false, false),
(8,'Agustín', 'Giay', '888888888888888', 'agusgiay', 'agusgiay@email.com', 'Agus88Giay99', true, false, false),
(9,'Juan', 'Gauto', '999999999999999', 'juangauto', 'juangauto@email.com', 'Juan12Gau34', true, false, false),
(10,'Brian', 'Aguirre', '1010101010101', 'brianaguirre', 'brianaguirre@email.com', 'Brian34Agui56', true, false, false);

-- ===============================================================================================
-- Agregar el comando necesario para actualizar el rol a admin de uno de los usuarios agregado
-- con rol de colaborador.
-- ===============================================================================================

UPDATE usuario SET es_colaborador = false, es_admin = true WHERE email = 'aleveliz@email.com';

-- ===============================================================================================
-- Agregar el comando necesario que introduzca en la tabla articulo, 3 artículos con estado TRUE
-- y uno con estado FALSE. Donde el campo estado en todas las tablas es Booleano.
-- ===============================================================================================

INSERT INTO articulo(id_articulo, id_usuario, titulo, resumen, contenido, estado)
VALUES
(1, 3, 'Las mochilas más seguras y resistentes',
'A la hora de elegir una mochila en la que trasladar el portátil u otro objeto, es necesario tener en cuenta algunas consideraciones',
'A la hora de elegir una mochila en la que trasladar el portátil, la tableta y cualquier otro objeto, es necesario tener en cuenta 
algunas consideraciones. Así, además de optar por un diseño cómodo y un tamaño concreto, no está de más seleccionar modelos que apuesten 
por la seguridad y mantengan a salvo todo lo que se guarda en ellas. Estas propuestas son efectivas ante los ladrones, pero también 
resisten la lluvia, entre otros.', true),
(2, 7, 'Nuevos auriculares Yamaha YH-E700A', 
'Disfruta aún más de tu música favorita con tecnología de canselación de ruido', 
'La experiencia de escuchar nuestra música favorita sin que el ruido del entorno nos moleste, para disfrutar más si cabe de ese instante, 
explica que los auriculares provistos de tecnología de cancelación de ruido -conocida también por sus siglas ANC- se hayan popularizado 
en los últimos años. A este grupo pertenecen los Yamaha YH-E700A, un modelo de gama alta disponible en los colores blanco y negro, que 
es la versión que hemos analizado. ', true),
(3, 9, 'Cursos sobre gestión de plataformas e-learning', 
'Selección de cursos para aquellos que quieran añadir estas cualidades a su currículum.', 
'Con la implantación general del modelo online en la educación, las plataformas de e-learning han visto aumentada su popularidad y, 
con ello, ha incrementado la cantidad de profesionales que quieren manejarlas de forma adecuada. Para formarse y adquirir competencias 
en este campo, hemos recopilado esta selección de cursos de gestión de plataformas e-learning, destinados a docentes que quieran añadir 
estas cualidades a su currículum.', true),
(4, 10, 'Visitas virtuales del Museo Guggenheim de Bilbao',
'El Museo Guggenheim en Bilbao apotó a aumentar su oferta formativa con diversas actividades online',
'En los años de pandemia, 2019 a 2020, se han limitado las diferentes actividades complementarias que los centros educativos 
suelen hacer habitualmente, como puede ser visitar un museo o realizar un taller experimental en sus instalaciones.
Por esta razón, el Museo Guggenheim en Bilbao apostó en esos años por ser el que continuara "visitando" los centros y las aulas aumentando, 
así, su oferta formativa con diversas actividades online. Asimismo, un total de unos 70 colegios de todo el mundo, 
con más de 1400 estudiantes, han podido "visitar" el museo beneficiándose de su oferta educativa digital.', false);

-- ===============================================================================================
-- Agregar el comando necesario para eliminar el artículo que tenga estado FALSE.
-- ===============================================================================================

-- funciona en modo no safe
--DELETE FROM articulo WHERE NOT estado;

-- para saltearse el modo seguro de MySQL
DELETE FROM articulo WHERE estado = false AND id_articulo > 0;

-- para saltearse el modo seguro de MySQL
--SET SQL_SAFE_UPDATES = 0;
--DELETE FROM articulo WHERE estado = false AND id_articulo > 0;
--SET SQL_SAFE_UPDATES = 1;

-- ===============================================================================================
-- Agregar el comando necesario que introduzca 3 comentarios al primer artículo agregado y
-- 2 comentarios al segundo artículo.
-- ===============================================================================================

INSERT INTO comentario(id_comentario, id_articulo, id_usuario, contenido, estado) 
VALUES
(1, 1, 3,'El artículo me ayudó para tomar una decisión de compra. Es genial!', 'activo'),
(2, 2, 8,'Ahora podré escuchar la música que me gusta sin que me molesten los ruidos en mi casa.', 'activo'),
(3, 1, 4,'Muy buenas elecciones sobre todo para viajeros.', 'activo'),
(4, 2, 9,'Un producto muy superior al de Sony WH-1000X', 'activo'),
(5, 1, 5,'Me sorprendió el grado de segurdad que aportan algunos modelos.', 'activo');


-- ===============================================================================================
-- Agregar el comando necesario para listar todos los artículos que tengan comentarios,
-- mostrando el título del artículo, la fecha_publicacion del artículo, el nombre del usuario que
-- realizo el comentario y la fecha_hora que realizó dicho comentario, agrupados por artículos.
-- ===============================================================================================

-- Option 1
SELECT a.titulo AS 'Títulos:', a.fecha_publicacion AS 'Publicado el:',
c.contenido AS 'Comentario:', u.username AS 'Usuario que comentó:', c.fecha_hora AS 'Comentario realizado el:'
FROM comentario AS c
JOIN articulo AS a
  ON a.id_articulo = c.id_articulo
JOIN usuario AS u
  ON u.id_usuario = c.id_usuario
GROUP BY a.titulo, a.fecha_publicacion, c.contenido, u.username, c.fecha_hora;

-- Option 2
SELECT a.titulo AS 'Títulos:', a.fecha_publicacion AS 'Publicado el:',
c.contenido AS 'Comentario:', u.username AS 'Usuario que comentó:', c.fecha_hora AS 'Comentario realizado el:'
FROM comentario AS c, articulo AS a, usuario AS u
WHERE a.id_articulo = c.id_articulo AND u.id_usuario = c.id_usuario
GROUP BY a.titulo, a.fecha_publicacion, c.contenido, u.username, c.fecha_hora;