
-- Permisos sobre tablas y vistas
-- Asignación idrecta  a usuarios o roles sobre tablas específicas

EXECUTE AS USER = 'admin_sql3';

SELECT SUSER_NAME() AS [LOGIN],
SUSER_NAME() AS [USUARIO_ACTUAL]

SELECT * FROM Servicios;


USE CampusCloud;

CREATE VIEW v_solicitudes_2026
AS
SELECT e.nombre, s.fecha, s.estado
FROM Estudiantes AS e
INNER JOIN Solicitudes AS s
ON e.id_estudiantes = s.id_estudiante 
WHERE DATEPART (YEAR, S.fecha) = '2026';

SELECT * FROM v_solicitudes_2026

-- PERMITIR LA LECTURA EN UNA TABLA ESPECÍFICA

GRANT SELECT ON dbo.Alumnos TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT * FROM dbo.Solicitudes;

SELECT * FROM dbo.Servicios;

REVERT;
GO

-- PERMITIR, INSERCIÓN Y ACTUALIZACIÓN EN UNA TABLA (SERVICIOS)

GRANT INSERT, UPDATE ON dbo.Servicios TO admin_sql3;

GRANT SELECT ON dbo.Servicio TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

SELECT*FROM Estudiantes;

INSERT INTO Servicios
VALUES (5, 'Becas', 'Mucho dinero');

UPDATE Servicios 
SET descripcion = 'Poco Dinero'
WHERE id_servicio = 5

REVERT;
GO

-- PERMISO TOTAL DE CÓDIGO SQL DML sobre una tabla 

GRANT, SELECT, INSERT, UPDATE, DELETE ON dbo.solicitudes TO admin_sql3;

SELECT * FROM Solicitudes;
INSERT INTO Solicitudes
VALUES (1003, 2, 1, '2026-10-23', 'Terminado');

UPDATE Solicitudes
SET estado = 'Pendiente'
WHERE id_solicitud = 1003;

DELETE Solicitudes
WHERE id_solicitud = 1003;

--DENEGAR EXPLICÍTAMENTE LA ELIMINACIÓ N DE REGISTROS (BLOQUEO)
DENY DELETE ON dbo.Solicitudes TO admin_sql3;

EXECUTE AS USER = 'admin_sql3';

-- QUITAR PERMISOS 
REVOKE UPDATE UPDATE, DELETE, INSERT, SELECT ON dbo.Solicitudes FROM admin_sql3

REVERT;
GO



