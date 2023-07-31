use clubsocial;						

INSERT INTO cobertura (id_cobertura,nombre_cobertura)
VALUES
(NULL,"Federada Salud"),
(NULL,"Galeno"),
(NULL,"Swiss Medical"),
(NULL,"Medicus");

INSERT INTO barrio (id_barrio,nombre_barrio)
VALUES
(NULL,"Palermo"),
(NULL,"Recoleta"),
(NULL,"Belgrano"),
(NULL,"San Telmo"),
(NULL,"La Boca"),
(NULL,"Caballito"),
(NULL,"Villa Crespo"),
(NULL,"Almagro"),
(NULL,"Flores"),
(NULL,"Villa Urquiza"),
(NULL,"Colegiales"),
(NULL,"Nuñez"),
(NULL,"Saavedra"),
(NULL,"Barracas"),
(NULL,"Boedo"),
(NULL,"San Nicolás"),
(NULL,"San Cristobal"),
(NULL,"Villa Devoto"),
(NULL,"Villa del Parque"),
(NULL,"Villa Lugano");

INSERT INTO provincia (id_provincia,nombre_provincia)
VALUES
(NULL,"Buenos Aires"),
(NULL,"Córdoba"),
(NULL,"Santa Fe"),
(NULL,"Mendoza"),
(NULL,"Tucumán"),
(NULL,"Entre Ríos"),
(NULL,"Salta"),
(NULL,"Chaco"),
(NULL,"Corrientes"),
(NULL,"Santiago del Estero"),
(NULL,"Jujuy"),
(NULL,"Río Negro"),
(NULL,"Neuquén"),
(NULL,"Formosa"),
(NULL,"San Juan"),
(NULL,"Chubut"),
(NULL,"Misiones"),
(NULL,"San Luis"),
(NULL,"La Pampa"),
(NULL,"Catamarca"),
(NULL,"La Rioja"),
(NULL,"Tierra del Fuego"),
(NULL,"Santa Cruz");

INSERT INTO disciplina (id_disciplina,nombre_disciplina)
VALUES
(NULL,"Fútbol"),
(NULL,"Basket"),
(NULL,"Natación"),
(NULL,"Taekwondo"),
(NULL,"Futsal");

INSERT INTO profesion (id_profesion,profesion)
VALUES
(NULL,"Traumatologo"),
(NULL,"Director Tecnico"),
(NULL,"Enfermera"),
(NULL,"Profesor"),
(NULL,"Kinesiologo"),
(NULL,"Psicologo");

INSERT INTO telefono (id_telefono, telefono)
VALUES
(NULL,40261719),
(NULL,62459032),
(NULL,88731337),
(NULL,93062148),
(NULL,39029176),
(NULL,12549321),
(NULL,48091815),
(NULL,18275399),
(NULL,60882820),
(NULL,14586242),
(NULL,98286518),
(NULL,69831762),
(NULL,72347857),
(NULL,58053396),
(NULL,91554176),
(NULL,98298639),
(NULL,68742419),
(NULL,48579543),
(NULL,42155533),
(NULL,97493691);

INSERT INTO email (id_email, email)
VALUES
(NULL,'dwharton0@aboutads.info'),
(NULL,'fgrindrod1@mapquest.com'),
(NULL,'cminney2@walmart.com'),
(NULL,'mchallinor3@dropbox.com'),
(NULL,'agoly4@usatoday.com'),
(NULL,'fpatty5@opera.com'),
(NULL,'dscala6@gravatar.com'),
(NULL,'hrowsell7@addthis.com'),
(NULL,'eyepiskopov8@prnewswire.com'),
(NULL,'ccowle9@alexa.com'),
(NULL,'apoytherasa@google.com.uk'),
(NULL,'bfitkinb@ibm.com'),
(NULL,'nklicherc@chron.com'),
(NULL,'fbrunnd@ucsd.edu'),
(NULL,'jnultye@constantcontact.com'),
(NULL,'baddingtonf@fda.gov'),
(NULL,'mtettherg@skype.com'),
(NULL,'bkewzickh@webnode.com'),
(NULL,'jdevoielsi@vimeo.com'),
(NULL,'tmulqueenyj@xrea.com');

INSERT INTO sede (id_sede, nombre_sede, calle,numero, id_barrio, id_provincia)
VALUES
(NULL,"Lionel Messi","Nova",4,19,1),
(NULL,"Diego Maradona","Butterfield",422,18,1),
(NULL,"Gabriel Batistuta","Atwood",78,11,1),
(NULL,"Juan Roman Riquelme","Clemons",0509,1,1);

INSERT INTO direcciones (id_direccion, calle,numero, id_barrio, id_provincia)
VALUES 
(NULL,'Hauk',66010,19,1),
(NULL,'Farwell',7278,19,1),
(NULL,'Mayfield',57643,18,1),
(NULL,'Schurz',684,11,1),
(NULL,'Oak',068,10,1),
(NULL,'Warner',441,19,1),
(NULL,'Dahle',1,17,1),
(NULL,'Eastwood',12,2,1),
(NULL,'Donald',8791,4,1),
(NULL,'Warner',28778,4,1),
(NULL,'Prentice',63414,19,1),
(NULL,'Rigney',3,19,1),
(NULL,'Pawling',52690,18,1),
(NULL,'Arrowood',0284,11,1),
(NULL,'Corry',36384,1,1),
(NULL,'Brown',5,1,1),
(NULL,'Gulseth',5031,2,1),
(NULL,'Corben',7704,18,1),
(NULL,'Continental',0863,18,1);

INSERT INTO socios (id_socio, documento_socio, nombre_socio, apellido_socio, fecha_nacimiento_socio, id_direccion, sexo, id_cobertura, id_telefono, id_email)
VALUES
(NULL,58986140,"Jeana","Phizackarley","1983-04-17",1,"F",1,1,1),
(NULL,34226785,"Nikki","Ledingham","2005-01-24",2,"M",2,2,2),
(NULL,17567122,"Doroteya","Gallanders","1960-08-02",3,"M",3,3,3),
(NULL,79727852,"Vittorio","Bonnick","1994-07-21",4,"M",4,4,4),
(NULL,02874969,"Clemmy","Pauel","1999-10-08",5,"F",1,5,5),
(NULL,18975407,"Eolanda","Vern","2002-03-17",6,"M",2,6,6),
(NULL,95221933,"Bennie","Hundey","1955-10-28",7,"F",3,7,7),
(NULL,88564428,"Nolie","Girardot","1971-10-04",8,"F",4,8,8),
(NULL,00313416,"Lind","Griffin","2002-02-08",9,"M",1,9,9),
(NULL,00602672,"Solly","McCuaig","1985-12-09",10,"M",2,10,10),
(NULL,35518643,"Fleur","Giametti","1964-08-02",11,"M",3,11,11),
(NULL,32115666,"Isa","Clearley","1956-03-19",12,"F",4,12,12),
(NULL,42878546,"Ange","Andrea","1978-08-20",12,"M",4,13,13),
(NULL,40769951,"Kathryn","Tudbald","1971-08-25",13,"F",1,14,14),
(NULL,68180712,"Miner","Ashwood","1978-05-16",14,"M",2,15,15),
(NULL,95816007,"Waiter","Schofield","1979-04-15",15,"M",3,16,16),
(NULL,67958272,"Bary","Elacoate","1984-07-05",16,"M",4,17,17),
(NULL,37037693,"Omar","Vasilyevski","1986-09-25",17,"M",1,18,18),
(NULL,58834314,"Davide","Brouard","1971-01-24",18,"M",2,18,19),
(NULL,11594254,"Spense","Arcase","1971-06-05",19,"M",3,20,20);


INSERT INTO profesor (id_profesor,id_socio,id_disciplina)
VALUES
(NULL,19,1),
(NULL,20,2),
(NULL,14,3),
(NULL,11,4),
(NULL,2,5),
(NULL,3,1);


INSERT INTO medico (id_medico,id_socio,id_profesion)
VALUES
(NULL,1,1),
(NULL,4,6),
(NULL,5,3),
(NULL,6,5),
(NULL,7,6),
(NULL,12,1);

INSERT INTO planteles (id_plantel, id_disciplina, id_socio, id_profesor, id_medico, id_sede)
VALUES
(NULL,1,6,1,6,1),
(NULL,2,17,2,1,2),
(NULL,3,15,3,3,3),
(NULL,4,13,4,4,4),
(NULL,5,10,5,1,1),
(NULL,1,9,1,6,1);