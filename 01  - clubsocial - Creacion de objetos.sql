create database clubsocial;						

use clubsocial;									

create table if not exists clubsocial.cuotas (
	id_cuota INT AUTO_INCREMENT,
    valor_cuota DECIMAL(10, 2) NOT NULL,
    fecha_cuota DATE,
    PRIMARY KEY (id_cuota)
);

create table if not exists clubsocial.estados (
	id_estado INT AUTO_INCREMENT,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_estado)
);

create table if not exists clubsocial.email (
	id_email INT AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_email)
);

create table if not exists clubsocial.telefono (
	id_telefono INT AUTO_INCREMENT,
	telefono INT NOT NULL,
    PRIMARY KEY (id_telefono)
);

create table if not exists clubsocial.profesion (
	id_profesion INT AUTO_INCREMENT,
	profesion VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_profesion)
);

create table if not exists clubsocial.disciplina (
	id_disciplina INT AUTO_INCREMENT,
	nombre_disciplina VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_disciplina)
);

create table if not exists clubsocial.provincia (
	id_provincia INT AUTO_INCREMENT,
	nombre_provincia VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_provincia)
);

create table if not exists clubsocial.barrio (
	id_barrio INT AUTO_INCREMENT,
	nombre_barrio VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_barrio)
);

create table if not exists clubsocial.cobertura(
	id_cobertura INT AUTO_INCREMENT,
    nombre_cobertura VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_cobertura)
);

create table if not exists clubsocial.sede (
	id_sede INT AUTO_INCREMENT,
    nombre_sede VARCHAR(20) NOT NULL,
    calle VARCHAR(20) NOT NULL,
    numero INT NOT NULL,
    id_barrio INT,
    id_provincia INT,
    PRIMARY KEY (id_sede),
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio),
    FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia)
);

create table if not exists clubsocial.direcciones (
	id_direccion INT AUTO_INCREMENT,
	calle VARCHAR(20) NOT NULL,
    numero INT NOT NULL,
    id_barrio INT,
    id_provincia INT,
    PRIMARY KEY (id_direccion),
    FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio),
    FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia)
);

create table if not exists clubsocial.socios (
	id_socio INT AUTO_INCREMENT,
    documento_socio INT NOT NULL UNIQUE,
    nombre_socio VARCHAR(40) NOT NULL,
    apellido_socio VARCHAR(40) NOT NULL,
    fecha_nacimiento_socio DATE NOT NULL,
    id_direccion INT,
    sexo ENUM('F', 'M', 'X'),
    id_cobertura INT,
    id_telefono INT,
    id_email INT,
    id_estado INT,
    PRIMARY KEY (id_socio),
    FOREIGN KEY (id_direccion) REFERENCES direcciones (id_direccion),
    FOREIGN KEY (id_cobertura) REFERENCES cobertura (id_cobertura),
    FOREIGN KEY (id_telefono) REFERENCES telefono (id_telefono),
    FOREIGN KEY (id_email) REFERENCES email (id_email),
    FOREIGN KEY (id_estado) REFERENCES estados (id_estado)
);

create table if not exists clubsocial.profesor (
	id_profesor INT AUTO_INCREMENT,
	id_socio INT,
    id_disciplina INT,
    PRIMARY KEY (id_profesor),
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina)
);

create table if not exists clubsocial.medico (
	id_medico INT AUTO_INCREMENT,
    id_socio INT,
    id_profesion INT,
    PRIMARY KEY (id_medico),
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
    FOREIGN KEY (id_profesion) REFERENCES profesion (id_profesion)
);

create table if not exists clubsocial.planteles (
	id_plantel INT AUTO_INCREMENT,
    id_disciplina INT,
    id_socio INT,
    id_profesor INT,
    id_medico INT,
    id_sede INT,
    PRIMARY KEY (id_plantel),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
    FOREIGN KEY (id_profesor) REFERENCES profesor (id_profesor),
    FOREIGN KEY (id_medico) REFERENCES medico (id_medico),
    FOREIGN KEY (id_sede) REFERENCES sede (id_sede)
);

create table if not exists clubsocial.pagos (
	id_pago INT AUTO_INCREMENT,
    id_socio INT,
    id_cuota INT,
    monto_pagado DECIMAL(10, 2) NOT NULL,
    fecha_pago DATE,
    PRIMARY KEY (id_pago),
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
    FOREIGN KEY (id_cuota) REFERENCES cuotas (id_cuota)
);


DELIMITER $$

CREATE PROCEDURE `sp_ordenamiento_socios` (IN campo_orden CHAR(20), IN orden VARCHAR(4))
BEGIN
	IF campo_orden <> '' THEN
		SET @ordenamiento = CONCAT(' ORDER BY ', campo_orden, ' ', orden);				
	ELSE 
		SET @ordenamiento = '';
	END IF;

	SET @consulta = CONCAT( 'SELECT id_socio, nombre_socio, apellido_socio, FLOOR(DATEDIFF(CURDATE(), fecha_nacimiento_socio) / 365) AS edad FROM socios', @ordenamiento);

	PREPARE statement FROM @consulta;
	EXECUTE statement;
	DEALLOCATE PREPARE statement;

END$$

CREATE PROCEDURE `sp_nueva_profesion`(IN profesion_param VARCHAR(50))
BEGIN
    INSERT INTO clubsocial.profesion (profesion)
    VALUES (profesion_param);
END$$;

DELIMITER ;

DELIMITER $$

-- FUNCION PARA OBTENER SOCIO POR ID

CREATE FUNCTION obtener_socio(id INT)		
RETURNS VARCHAR(50)							
DETERMINISTIC								
BEGIN
	DECLARE apellido_y_nombre VARCHAR(50);
	SET apellido_y_nombre = (
		SELECT CONCAT(apellido_socio, ", ", nombre_socio)
		FROM socios
        WHERE id_socio = id
			);
	RETURN apellido_y_nombre;
END$$

-- FUNCION PARA OBTENER SOCIO POR DNI

CREATE FUNCTION obtener_socio_dni(dni INT)		
RETURNS VARCHAR(50)							
DETERMINISTIC								
BEGIN
	DECLARE apellido_y_nombre VARCHAR(50);
	SET apellido_y_nombre = (
		SELECT CONCAT(apellido_socio, ", ", nombre_socio)
		FROM socios
        WHERE documento_socio = dni
			);
	RETURN apellido_y_nombre;
END$$

-- FUNCION PARA SABER ESTADO DE CUOTA POR SOCIO

CREATE FUNCTION obtener_estado_socio(dni INT)		
RETURNS VARCHAR(50)							
DETERMINISTIC								
BEGIN
	DECLARE estado_socio VARCHAR(50);
	SET estado_socio = (
		SELECT e.estado
		FROM estados e
        JOIN socios s ON s.id_estado = e.id_estado
        WHERE s.documento_socio = dni
			);
	RETURN estado_socio;
END$$

-- NUEVA TABLA DE AUDITORIA PARA LOS NUEVOS SOCIOS

CREATE TABLE IF NOT EXISTS log_nuevo_socio (
id_nuevo_socio INT NOT NULL AUTO_INCREMENT,
id_socio INT NOT NULL,
documento_socio INT NOT NULL UNIQUE,
nombre_socio VARCHAR(100) NOT NULL,
apellido_socio VARCHAR(100) NOT NULL,
fecha_nacimiento_socio DATE NOT NULL,
usuario VARCHAR(40),
fechahora DATETIME DEFAULT NOW(),
PRIMARY KEY (id_nuevo_socio),
FOREIGN KEY (id_socio) REFERENCES socios (id_socio)
);

-- TRIGGER PARA AGREGAR NUEVOS SOCIOS

CREATE TRIGGER tr_agregar_nuevo_socio
AFTER INSERT ON socios
FOR EACH ROW														
INSERT INTO log_nuevo_socio (id_socio, documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, usuario, fechahora)
VALUES(
NEW.id_socio, NEW.documento_socio, NEW.nombre_socio, NEW.apellido_socio, NEW.fecha_nacimiento_socio, USER(), NOW()
);


-- NUEVA TABLA DE AUDITORIA PARA LAS NUEVAS SEDES

CREATE TABLE IF NOT EXISTS log_nueva_sede (
id_nueva_sede INT NOT NULL AUTO_INCREMENT,
id_sede INT NOT NULL,
nombre_sede VARCHAR(20) NOT NULL,
calle VARCHAR(20) NOT NULL,
numero INT NOT NULL,
id_barrio INT NOT NULL,
id_provincia INT NOT NULL,
usuario VARCHAR(40),
fechahora DATETIME DEFAULT NOW(),
PRIMARY KEY (id_nueva_sede),
FOREIGN KEY (id_sede) REFERENCES sede (id_sede),
FOREIGN KEY (id_barrio) REFERENCES barrio (id_barrio),
FOREIGN KEY (id_provincia) REFERENCES provincia (id_provincia)
);

-- TRIGGER PARA AGREGAR NUEVAS SEDES

CREATE TRIGGER tr_agregar_nueva_sede
AFTER INSERT ON sede
FOR EACH ROW														
INSERT INTO log_nueva_sede (id_sede, nombre_sede, calle, numero, id_barrio, id_provincia, usuario, fechahora)
VALUES(
NEW.id_sede, NEW.nombre_sede, NEW.calle, NEW.numero, NEW.id_barrio, NEW.id_provincia, USER(), NOW()
);

-- TABLA PARA REGISTRO DE CUOTAS

CREATE TABLE IF NOT EXISTS log_registro_de_cuotas (
	id_registro_de_cuotas INT AUTO_INCREMENT,
    id_cuota INT,
    valor_cuota DECIMAL(10, 2) NOT NULL,
    fecha_cuota DATE,
    usuario VARCHAR(40),
	fechahora DATETIME DEFAULT NOW(),
    PRIMARY KEY (id_registro_de_cuotas),
    FOREIGN KEY (id_cuota) REFERENCES cuotas (id_cuota)
);

-- TRIGGER PARA NUEVAS CUOTAS

CREATE TRIGGER tr_agregar_nueva_cuota
AFTER INSERT ON cuotas
FOR EACH ROW														
INSERT INTO log_registro_de_cuotas (id_cuota, valor_cuota, fecha_cuota, usuario, fechahora)
VALUES(
NEW.id_cuota, NEW.valor_cuota, NEW.fecha_cuota, USER(), NOW()
);

-- VISTA DE SOCIOS HOMBRES QUE NO SEAN PROFESORES
CREATE OR REPLACE VIEW socios_hombres_vw AS (
SELECT id_socio, nombre_socio, apellido_socio
FROM socios
WHERE SEXO LIKE UPPER('%M%')
AND id_socio NOT IN (
	SELECT id_socio
	FROM profesor
    )
);

-- VISTA DE SOCIAS MUJERES QUE NO SEAN PROFESORAS
CREATE OR REPLACE VIEW socios_mujeres_vw AS (
SELECT id_socio, nombre_socio, apellido_socio
FROM socios
WHERE SEXO LIKE UPPER('%F%')
AND id_socio NOT IN (
	SELECT id_socio
	FROM profesor
    )
);

-- VISTA DEL PLANTEL DE FUTBOL
CREATE OR REPLACE VIEW plantel_futbol_vw AS (
SELECT s.id_socio, s.nombre_socio, s.apellido_socio, d.nombre_disciplina
FROM socios s
JOIN planteles pl ON s.id_socio = pl.id_socio
JOIN disciplina d ON pl.id_disciplina = d.id_disciplina
WHERE pl.id_disciplina = 1
);    

-- VISTA DE SOCIOS POR EDAD
CREATE OR REPLACE VIEW socios_por_edad_vw AS (	
SELECT id_socio, nombre_socio, apellido_socio, FLOOR(DATEDIFF(CURDATE(), fecha_nacimiento_socio) / 365) AS edad
FROM socios
);			

-- VISTA DE SOCIOS QUE VIVEN EN VILLA DEL PARQUE
CREATE OR REPLACE VIEW socios_villa_del_parque_vw AS (					
SELECT s.id_socio, s.nombre_socio, s.apellido_socio, b.nombre_barrio
FROM socios s										
JOIN direcciones d ON s.id_direccion = d.id_direccion					
JOIN barrio b ON d.id_barrio = b.id_barrio
WHERE b.id_barrio = 19
);

-- VISTA DE SOCIOS MEDICOS
CREATE OR REPLACE VIEW socios_medicos_vw AS (					
SELECT s.id_socio, m.id_medico, s.nombre_socio, s.apellido_socio, p.profesion
FROM medico m								
JOIN socios s ON m.id_socio = s.id_socio
JOIN profesion p ON p.id_profesion = m.id_profesion
);

-- VISTA DE PROFESORES
CREATE OR REPLACE VIEW socios_profesores_vw AS (					
SELECT s.id_socio, p.id_profesor, s.nombre_socio, s.apellido_socio, d.nombre_disciplina
FROM profesor p								
JOIN socios s ON p.id_socio = s.id_socio
JOIN planteles pl ON pl.id_disciplina = p.id_disciplina
JOIN disciplina d ON d.id_disciplina = pl.id_disciplina
GROUP BY p.id_profesor	
);

-- VISTA DE SOCIOS POR ESTADO DE PAGO
CREATE OR REPLACE VIEW socios_estado_cuota_vw AS (					
SELECT s.id_socio, p.id_profesor, s.nombre_socio, s.apellido_socio, d.nombre_disciplina
FROM profesor p								
JOIN socios s ON p.id_socio = s.id_socio
JOIN planteles pl ON pl.id_disciplina = p.id_disciplina
JOIN disciplina d ON d.id_disciplina = pl.id_disciplina
GROUP BY p.id_profesor	
);

-- VISTA DE SOCIOS AGRUPADOS POR BARRIO
CREATE VIEW socios_por_barrio_vw AS (
SELECT b.nombre_barrio, COUNT(s.id_socio) AS cantidad_socios
FROM clubsocial.socios s
INNER JOIN clubsocial.direcciones d ON s.id_direccion = d.id_direccion
INNER JOIN clubsocial.barrio b ON d.id_barrio = b.id_barrio
GROUP BY b.nombre_barrio
);

-- VISTA DE SOCIOS AGRUPADOS POR SEXO
CREATE VIEW socios_por_genero_vw AS (
SELECT sexo, COUNT(*) AS cantidad_socios
FROM clubsocial.socios
GROUP BY sexo
);

-- VISTA DE SOCIOS AGRUPADOS MOROSIDAD
CREATE VIEW socios_por_estado_vw AS (
SELECT e.estado, COUNT(s.id_socio) AS cantidad_socios
FROM clubsocial.socios s
INNER JOIN clubsocial.estados e ON s.id_estado = e.id_estado
GROUP BY e.estado
);

