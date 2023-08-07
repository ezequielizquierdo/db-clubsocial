use clubsocial;

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

-- Ejecutar los Store Procedures

call clubsocial.sp_ordenamiento_socios("nombre_socio", "asc");
call clubsocial.sp_nueva_profesion("Mantenimiento");
