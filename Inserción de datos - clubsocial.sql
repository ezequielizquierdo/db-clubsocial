use clubsocial;						

INSERT INTO cuotas (valor_cuota, fecha_cuota)
VALUES
(1000, '2023-07-01');

INSERT INTO estados (estado)
VALUES
('Activo'),
('Moroso'),
('Baja');

INSERT INTO cobertura (nombre_cobertura)
VALUES
("Federada Salud"),
("Galeno"),
("Swiss Medical"),
("Medicus");

INSERT INTO barrio (nombre_barrio)
VALUES
("Palermo"),
("Recoleta"),
("Belgrano"),
("San Telmo"),
("La Boca"),
("Caballito"),
("Villa Crespo"),
("Almagro"),
("Flores"),
("Villa Urquiza"),
("Colegiales"),
("Nuñez"),
("Saavedra"),
("Barracas"),
("Boedo"),
("San Nicolás"),
("San Cristobal"),
("Villa Devoto"),
("Villa del Parque"),
("Villa Lugano");

INSERT INTO provincia (nombre_provincia)
VALUES
("Buenos Aires"),
("Córdoba"),
("Santa Fe"),
("Mendoza"),
("Tucumán"),
("Entre Ríos"),
("Salta"),
("Chaco"),
("Corrientes"),
("Santiago del Estero"),
("Jujuy"),
("Río Negro"),
("Neuquén"),
("Formosa"),
("San Juan"),
("Chubut"),
("Misiones"),
("San Luis"),
("La Pampa"),
("Catamarca"),
("La Rioja"),
("Tierra del Fuego"),
("Santa Cruz");

INSERT INTO disciplina (nombre_disciplina)
VALUES
("Fútbol"),
("Basket"),
("Natación"),
("Taekwondo"),
("Futsal");

INSERT INTO profesion (profesion)
VALUES
("Traumatologo"),
("Director Tecnico"),
("Enfermera"),
("Profesor"),
("Kinesiologo"),
("Psicologo");

INSERT INTO telefono (telefono)
VALUES
(40261719),
(62459032),
(88731337),
(93062148),
(39029176),
(12549321),
(48091815),
(18275399),
(60882820),
(14586242),
(98286518),
(69831762),
(72347857),
(58053396),
(91554176),
(98298639),
(68742419),
(48579543),
(42155533),
(97493691);

INSERT INTO email (email)
VALUES
('dwharton0@aboutads.info'),
('fgrindrod1@mapquest.com'),
('cminney2@walmart.com'),
('mchallinor3@dropbox.com'),
('agoly4@usatoday.com'),
('fpatty5@opera.com'),
('dscala6@gravatar.com'),
('hrowsell7@addthis.com'),
('eyepiskopov8@prnewswire.com'),
('ccowle9@alexa.com'),
('apoytherasa@google.com.uk'),
('bfitkinb@ibm.com'),
('nklicherc@chron.com'),
('fbrunnd@ucsd.edu'),
('jnultye@constantcontact.com'),
('baddingtonf@fda.gov'),
('mtettherg@skype.com'),
('bkewzickh@webnode.com'),
('jdevoielsi@vimeo.com'),
('tmulqueenyj@xrea.com');

INSERT INTO sede (nombre_sede, calle,numero, id_barrio, id_provincia)
VALUES
("Lionel Messi","Nova",4,19,1),
("Diego Maradona","Butterfield",422,18,1),
("Gabriel Batistuta","Atwood",78,11,1),
("Juan Roman Riquelme","Clemons",0509,1,1);

INSERT INTO direcciones (calle,numero, id_barrio, id_provincia)
VALUES 
('Hauk',66010,19,1),
('Farwell',7278,19,1),
('Mayfield',57643,18,1),
('Schurz',684,11,1),
('Oak',068,10,1),
('Warner',441,19,1),
('Dahle',1,17,1),
('Eastwood',12,2,1),
('Donald',8791,4,1),
('Warner',28778,4,1),
('Prentice',63414,19,1),
('Rigney',3,19,1),
('Pawling',52690,18,1),
('Arrowood',0284,11,1),
('Corry',36384,1,1),
('Brown',5,1,1),
('Gulseth',5031,2,1),
('Corben',7704,18,1),
('Continental',0863,18,1);

INSERT INTO socios (documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, id_direccion, sexo, id_cobertura, id_telefono, id_email)
VALUES
(58986140,"Jeana","Phizackarley","1983-04-17",1,"F",1,1,1),
(34226785,"Nikki","Ledingham","2005-01-24",2,"M",2,2,2),
(17567122,"Doroteya","Gallanders","1960-08-02",3,"M",3,3,3),
(79727852,"Vittorio","Bonnick","1994-07-21",4,"M",4,4,4),
(02874969,"Clemmy","Pauel","1999-10-08",5,"F",1,5,5),
(18975407,"Eolanda","Vern","2002-03-17",6,"M",2,6,6),
(95221933,"Bennie","Hundey","1955-10-28",7,"F",3,7,7),
(88564428,"Nolie","Girardot","1971-10-04",8,"F",4,8,8),
(00313416,"Lind","Griffin","2002-02-08",9,"M",1,9,9),
(00602672,"Solly","McCuaig","1985-12-09",10,"M",2,10,10),
(35518643,"Fleur","Giametti","1964-08-02",11,"M",3,11,11),
(32115666,"Isa","Clearley","1956-03-19",12,"F",4,12,12),
(42878546,"Ange","Andrea","1978-08-20",12,"M",4,13,13),
(40769951,"Kathryn","Tudbald","1971-08-25",13,"F",1,14,14),
(68180712,"Miner","Ashwood","1978-05-16",14,"M",2,15,15),
(95816007,"Waiter","Schofield","1979-04-15",15,"M",3,16,16),
(67958272,"Bary","Elacoate","1984-07-05",16,"M",4,17,17),
(37037693,"Omar","Vasilyevski","1986-09-25",17,"M",1,18,18),
(58834314,"Davide","Brouard","1971-01-24",18,"M",2,18,19),
(11594254,"Spense","Arcase","1971-06-05",19,"M",3,20,20);


INSERT INTO profesor (id_socio,id_disciplina)
VALUES
(19,1),
(20,2),
(14,3),
(11,4),
(2,5),
(3,1);


INSERT INTO medico (id_socio,id_profesion)
VALUES
(1,1),
(4,6),
(5,3),
(6,5),
(7,6),
(12,1);

INSERT INTO planteles (id_disciplina, id_socio, id_profesor, id_medico, id_sede)
VALUES
(1,6,1,6,1),
(2,17,2,1,2),
(3,15,3,3,3),
(4,13,4,4,4),
(5,10,5,1,1),
(1,9,1,6,1);

INSERT INTO pagos (id_socio, id_cuota, monto_pagado,fecha_pago)
VALUES
(1,1,1000,'2023-08-01'),
(2,1,1000,'2023-08-03'),
(3,1,1000,'2023-08-01'),
(4,1,1000,'2023-07-01'),
(5,1,1000,'2023-08-01'),
(6,1,1000,'2023-08-01'),
(7,1,1000,'2023-02-01'),
(8,1,1000,'2023-08-01'),
(9,1,1000,'2023-08-01'),
(10,1,1000,'2023-08-01'),
(11,1,1000,'2023-08-01'),
(12,1,1000,'2023-05-01'),
(13,1,1000,'2023-08-01'),
(14,1,1000,'2023-08-01'),
(15,1,1000,'2023-02-01'),
(16,1,1000,'2023-08-01'),
(17,1,1000,'2023-08-01'),
(18,1,1000,'2023-07-01'),
(19,1,1000,'2023-08-01'),
(20,1,1000,'2023-06-01');

    
UPDATE socios
SET id_estado = 
    CASE
        WHEN DATEDIFF(CURDATE(), (SELECT fecha_pago FROM pagos WHERE pagos.id_socio = socios.id_socio)) > 90 THEN 3
        WHEN DATEDIFF(CURDATE(), (SELECT fecha_pago FROM pagos WHERE pagos.id_socio = socios.id_socio)) > 40 THEN 2
        ELSE 1
    END;
    
-- Consulta para obtener socio moroso por id
SELECT * FROM socios 
WHERE id_estado = 2;

-- Consulta para obtener el historial de pagos de un socio
SELECT * FROM pagos 
WHERE id_socio = 2;