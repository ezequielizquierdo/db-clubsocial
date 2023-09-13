use clubsocial;

-- Creo nueva tabla de auditoria para los nuevos socios

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

-- Eliminacion de trigger
-- drop trigger tr_agregar_nuevo_socio;
-- drop trigger tr_agregar_nuevo_socio;

-- Creo Trigger para agregar nuevos socios

CREATE TRIGGER tr_agregar_nuevo_socio
AFTER INSERT ON socios
FOR EACH ROW														
INSERT INTO log_nuevo_socio (id_socio, documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, usuario, fechahora)
VALUES(
NEW.id_socio, NEW.documento_socio, NEW.nombre_socio, NEW.apellido_socio, NEW.fecha_nacimiento_socio, USER(), NOW()
);

-- Inserto datos de los socios

INSERT INTO socios (documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, id_direccion, sexo, id_cobertura, id_telefono, id_email)
VALUES
(33333333, 'Ezequiel', 'Izquierdo', "1984-10-25", 1, "M", 3, 1, 3),
(44444444, 'Mario', 'Baracus', "1950-05-20", 1, "M", 3, 2, 4 );

-- ------------------------------------------------------------

-- Creo nueva tabla de auditoria para las nuevas sedes

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

-- Eliminacion de trigger
-- drop trigger tr_nueva_sede;

-- Creo Trigger para agregar nuevas sedes

CREATE TRIGGER tr_agregar_nueva_sede
AFTER INSERT ON sede
FOR EACH ROW														
INSERT INTO log_nueva_sede (id_sede, nombre_sede, calle, numero, id_barrio, id_provincia, usuario, fechahora)
VALUES(
NEW.id_sede, NEW.nombre_sede, NEW.calle, NEW.numero, NEW.id_barrio, NEW.id_provincia, USER(), NOW()
);

-- Inserto datos de los socios

INSERT INTO sede (nombre_sede, calle, numero, id_barrio, id_provincia)
VALUES
('Ricardo Bochini', 'Bochini', '751', 6, 1)
;

-- -------------------------------------

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

-- Creo Trigger para las nuevas cuotas

CREATE TRIGGER tr_agregar_nueva_cuota
AFTER INSERT ON cuotas
FOR EACH ROW														
INSERT INTO log_registro_de_cuotas (id_cuota, valor_cuota, fecha_cuota, usuario, fechahora)
VALUES(
NEW.id_cuota, NEW.valor_cuota, NEW.fecha_cuota, USER(), NOW()
);

-- Inserto datos de los socios

INSERT INTO cuotas (valor_cuota, fecha_cuota)
VALUES
(1500, '2023-08-11');