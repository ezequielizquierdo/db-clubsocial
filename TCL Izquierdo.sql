use clubsocial;

-- Inicio la transacción
START TRANSACTION;

-- Actualizo la tabla planteles, cambiando primero el profesor con id_profesor 3 que luego será eliminado
UPDATE clubsocial.planteles
SET id_profesor = 4
WHERE id_profesor = 3;  

-- Elimino de la lista de profesores al profesor con id_profesor 3
DELETE FROM clubsocial.profesor
WHERE id_profesor = 3;		

-- ROLLBACK;
COMMIT;		-- Confirmo la transaccion

-- ------------------------------------------------

START TRANSACTION;

INSERT INTO socios (documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, id_direccion, sexo, id_cobertura, id_telefono, id_email)
VALUES
(21986140,"Emiliano","Martinez","1992-09-02",NULL,"M",1,NULL,NULL),
(21226785,"Nicolás","Otamendi","1988-02-12",NULL,"M",1,NULL,NULL),
(21567122,"Cristian","Romero","1998-04-27",NULL,"M",1,NULL,NULL),
(21727852,"Nahuel","Molina","1998-04-06",NULL,"M",1,NULL,NULL);

SAVEPOINT primeros_cuatro;

INSERT INTO socios (documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, id_direccion, sexo, id_cobertura, id_telefono, id_email)
VALUES
(21874969,"Nicolas","Tagliafico","1992-08-31",NULL,"M",1,NULL,NULL),
(21975407,"Rodrigo","De Paul","1994-04-25",NULL,"M",1,NULL,NULL),
(21221933,"Leandro","Paredes","1994-06-29",NULL,"M",1,NULL,NULL),
(21564428,"Enzo","Fernandez","2001-01-27",NULL,"M",1,NULL,NULL);

-- ROLLBACK TO primeros_cuatro;  -- > HAGO UN ROLLBACK HASTA EL SAVEPOINT primeros_cinco

SAVEPOINT ultimos_cuatro;

-- ROLLBACK;
COMMIT;