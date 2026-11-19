-- 1. Gestión de Roles Fijos

-- A A nivel de Servidor

USE master;

CREATE LOGIN admin_sql2
WITH PASSWORD = 'p@SSWORD';

-- AGREGAR UN INICIO DE SESION (LOGIN) AL ROL DE ADMINISTRADOR DE SERVIDOR
ALTER SERVER ROLE sysadmin 
ADD MEMBER admin_sql2;


CREATE LOGIN admin_sql3
WITH PASSWORD = 'p@SSWORD';

-- AGREGAR AL ROL DE CREADOR DE BASE DE DATOS 
ALTER SERVER ROLE dbcreator ADD MEMBER admin_sql3;


-- B. A nivel de base de datos
-- 1. Asegurarnos de estar en la base de datos correcta
USE CampusCloud;
GO

-- 2. Crear el usuario en la base de datos si es que aún no existe
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'admin_sql3')
BEGIN
    CREATE USER admin_sql3 FOR LOGIN admin_sql3;
END
GO

-- 3. Agregar el usuario al rol de solo lectura
ALTER ROLE db_datareader 
ADD MEMBER admin_sql3;
GO

-- 4. Probar la suplantación (Impersonation)
EXECUTE AS USER = 'admin_sql3';
GO

DELETE FROM Servicios WHERE id_servicio = 1

ALTER ROLE db_datareader
DROP MEMBER admin_sql3;

ALTER ROLE db_writer
DROP MEMBER admin_sql3;



-- Esto debe funcionar (Lectura permitida)
SELECT * FROM servicios;
GO

-- Esto debe fallar por permisos (Escritura denegada por db_datareader)
DELETE FROM servicios WHERE id_servicio = 1;
GO

-- 5. Revertir la suplantación de identidad
REVERT;
GO

-- 6. Quitar al usuario del rol (si deseas probar esa parte)
ALTER ROLE db_datareader
DROP MEMBER admin_sql3;
GO

EXECUTE AS USER = 'admin_sql3';

SELECT SUSER_NAME() AS [LOGIN],
SUSER_NAME() AS [USUARIO_ACTUAL]

SELECT * FROM Servicios;

INSERT INTO Servicios
VALUES (3, 'Cafeteria', 'Pura comida buena');

UPDATE Servicios
SET nombre = 'Cafeteria2'
WHERE id_servicio = 3;

UPDATE Servicios
SET nombre = 'Cafeteria10'
WHERE id_servicio = 3;

DELETE FROM Servicios;

SELECT 
pr.name AS Principal
pe.permission_name AS Permiso,
pe.state_desc AS Estado,
OBJECT_NAME (pe.major_id) AS Objecto
FROM sys.database_permissions AS pe
INNER JOIN sys.database_principals AS pr
ON pe.grantee_principal_id = pr.principal_id
WHERE pr.name = 'adminsql3' AND pr.type = 'R';


--- permite administración de objetos (DDL. CREATE, ALTER, DROP)
ALTER ROLE db_ddladmin
ADD MEMBER admin_sql3;

CREATE TABLE prueba (
id INT NOT NULL
nombre VARCHAR (100)
)

--quitar permiso a el rol adminsql3 el rol db_ddladmin



DROP TABLE prueba;

REVERT;
GO

