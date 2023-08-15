-- CREACION DE VISTAS
    
use clubsocial;

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