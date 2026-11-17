USE CampusCloud;
GO

-- 1. Crear la tabla Estudiantes
CREATE TABLE Estudiantes (
    id_estudiantes INT NOT NULL,
    CONSTRAINT pk_estudiantes PRIMARY KEY (id_estudiantes),
    matricula VARCHAR(20) NOT NULL CONSTRAINT uq_matricula UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL
);
GO

-- 2. Crear la tabla Servicios (por si no la tenías creada)
CREATE TABLE Servicios (
    id_servicio INT NOT NULL,
    CONSTRAINT pk_servicios PRIMARY KEY (id_servicio),
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NULL
);
GO

-- 3. Crear la tabla Solicitudes
CREATE TABLE Solicitudes (
    id_solicitud INT NOT NULL,
    id_estudiante INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha DATE NOT NULL,
    estado VARCHAR(30) NOT NULL,
    CONSTRAINT pk_solicitudes PRIMARY KEY (id_solicitud),
    CONSTRAINT fk_solicitudes_estudiantes FOREIGN KEY (id_estudiante)
        REFERENCES Estudiantes (id_estudiantes),
    CONSTRAINT fk_solicitudes_servicios FOREIGN KEY (id_servicio)
        REFERENCES Servicios (id_servicio)
);
GO

-- 4. Insertar datos en Estudiantes
INSERT INTO Estudiantes (id_estudiantes, matricula, nombre, correo)
VALUES 
    (1, '2026001', 'Ana Lopez', 'ana@universidad.com'),
    (2, '2026002', 'Carlos Hernandez', 'carlos@universidad.com');
GO

-- 5. Insertar datos en Servicios
INSERT INTO Servicios (id_servicio, nombre, descripcion)
VALUES 
    (1, 'Constancia de Estudios', 'Solicitud de Constancia Académica'),
    (2, 'Prestamo de Laboratorio', 'Se reservo equipo y/o espacio de laboratorio');
GO

-- 6. Insertar datos en Solicitudes
INSERT INTO Solicitudes (id_solicitud, id_estudiante, id_servicio, fecha, estado)
VALUES 
    (1001, 1, 1, '2026-10-22', 'Pendiente'),
    (1002, 2, 2, '2026-10-22', 'Pendiente');
GO

-- 7. Consultas de verificación
SELECT * FROM Estudiantes;
SELECT * FROM Servicios;
SELECT * FROM Solicitudes;
GO