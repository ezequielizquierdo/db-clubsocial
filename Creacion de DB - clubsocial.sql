create database clubsocial;						-- creo base de datos

use clubsocial;									-- especifico la db clubsocial como predeterminada

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
    sexo ENUM('F', 'M', 'X') UNIQUE,
    id_cobertura INT,
    id_telefono INT,
    id_email INT,
    PRIMARY KEY (id_socio),
    FOREIGN KEY (id_direccion) REFERENCES direcciones (id_direccion),
    FOREIGN KEY (id_cobertura) REFERENCES cobertura (id_cobertura),
    FOREIGN KEY (id_telefono) REFERENCES telefono (id_telefono),
    FOREIGN KEY (id_email) REFERENCES email (id_email)
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
    id_disciplina INT,
    id_profesion INT,
    PRIMARY KEY (id_medico),
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
    FOREIGN KEY (id_profesion) REFERENCES profesion (id_profesion)
);





create table if not exists clubsocial.equipo (
	id_equipo INT AUTO_INCREMENT,
    id_disciplina INT,
    id_socio INT,
    id_profesor INT,
    id_medico INT,
    id_sede INT,
    PRIMARY KEY (id_equipo),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
    FOREIGN KEY (id_socio) REFERENCES socios (id_socio),
    FOREIGN KEY (id_profesor) REFERENCES profesor (id_profesor),
    FOREIGN KEY (id_medico) REFERENCES medico (id_medico),
    FOREIGN KEY (id_sede) REFERENCES sede (id_sede)
);


DROP database clubsocial;
