SELECT * FROM Estudiantes;

INSERT INTO Estudiantes
	VALUES 
	(3, '204601', 'Maximina Buen Rostro', 'maxi@universidad.com');

UPDATE Estudiantes
SET nombre = 'Maximina Mal Rostro'
WHERE id_estudiantes = 3;

DELETE Estudiantes
WHERE id_estudiantes = 3

-- CAMBIAR AL CONTEXTO DEL USUARIO

EXECUTE AS USER = 'consulta_campus';
GO

SELECT * FROM Estudiantes;

INSERT INTO Estudiantes
	VALUES 
	(4, '204601', 'Maximina Buen Rostro', 'maxi@universidad.com');

UPDATE Estudiantes
SET nombre = 'Maximina Mal Rostro'
WHERE id_estudiantes = 3;

DELETE Estudiantes
WHERE id_estudiantes = 3


REVERT;
GO

-- CAMBIAR AL CONTEXTO DE USUARIO DE operador_campus

EXECUTE AS USER = 'operador_campus'
GO

SELECT 
	SYSTEM_USER AS [Login Original],
	CURRENT_USER AS [USUARIO_BD_ACTUAL],
	USER_NAME() AS [NOMBRE_USUARIO]

	SELECT * FROM Servicios

INSERT INTO Estudiantes
	VALUES 
	(4, '204601', 'Maximina Buen Rostro', 'maxi@universidad.com');

UPDATE Estudiantes
SET nombre = 'Maximina Mal Rostro'
WHERE id_estudiantes = 4;

DELETE Estudiantes
WHERE id_estudiantes = 4

REVERT;
GO

