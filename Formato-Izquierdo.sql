use clubsocial;  

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

DELIMITER ;

SELECT obtener_socio(3) as apellido_y_nombre;

SELECT obtener_socio_dni(79727852) as apellido_y_nombre;