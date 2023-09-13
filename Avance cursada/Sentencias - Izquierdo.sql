-- IMPLEMENTACION DE SENTENCIAS

-- Especifico el uso de la db mysql
use mysql; 

-- Consulto los usuarios existentes
select *
from user;

-- Si quisiera eliminar algun usuario
-- DROP USER "ezequiel"@"localhost";

-- Si quisiera quitar todos los permisos a algun usuario
-- REVOKE ALL PRIVILEGES,
-- GRANT OPTION
-- FROM "ezequiel"@"localhost";

-- Crear 2 usuarios con contraseña
CREATE USER "ezequiel"@"localhost" IDENTIFIED BY "abc123";
CREATE USER "felipe"@"localhost" IDENTIFIED BY "abc123";

-- Especifico el uso de la db clubsocial
use clubsocial;
 
-- Otorgo al usuario ezequiel permisos de solo lectura
GRANT SELECT 
ON clubsocial.*
TO 'ezequiel'@'localhost';

-- Otorgo permisos de lectura, insercion y modificacion al usuario felipe
GRANT SELECT, INSERT, UPDATE 
ON clubsocial.*
TO "felipe"@"localhost";

-- Denegar permiso para eliminar a cada usuario
REVOKE DELETE 
ON clubsocial.* 
FROM 'ezequiel'@'localhost';

REVOKE DELETE 
ON clubsocial.* 
FROM 'felipe'@'localhost';

-- Actualizo las ultimas versiones de los privilegios
FLUSH PRIVILEGES;

