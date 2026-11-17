-- ==========================================
-- Módulo Cassandra / ScyllaDB: Inserción de Eventos
-- Proyecto: CampusCloud (Unidad II)
-- ==========================================

USE campuscloud_events;

-- Insertar 12 eventos distribuidos entre 3 estudiantes (ej. EST-01, EST-02, EST-03)
-- Estudiante 1 (EST-01) - 4 eventos
INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-01', '2026-11-01', now(), 'Infraestructura', 'DEPLOY', 'Despliegue inicial de contenedor Docker Pro');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-01', '2026-11-05', now(), 'Base de Datos', 'QUERY', 'Consulta masiva en colección documental MongoDB');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-01', '2026-11-10', now(), 'Infraestructura', 'RESTART', 'Reinicio de contenedor por actualización de entorno');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-01', '2026-11-15', now(), 'Inteligencia Artificial', 'ACCESS', 'Prueba de endpoints en API de recomendación');

-- Estudiante 2 (EST-02) - 4 eventos
INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-02', '2026-11-02', now(), 'Infraestructura', 'CONFIG', 'Modificación de variables de entorno en Kubernetes');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-02', '2026-11-06', now(), 'Base de Datos', 'INSERT', 'Inserción de nuevos registros en clúster');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-02', '2026-11-11', now(), 'Inteligencia Artificial', 'EXECUTE', 'Ejecución de modelo de clasificación');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-02', '2026-11-14', now(), 'Infraestructura', 'STOP', 'Detención temporal de servicio auxiliar');

-- Estudiante 3 (EST-03) - 4 eventos
INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-03', '2026-11-03', now(), 'Base de Datos', 'CONNECT', 'Conexión a instancia PostgreSQL administrada');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-03', '2026-11-08', now(), 'Base de Datos', 'UPDATE', 'Actualización de esquema de tablas relacionales');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-03', '2026-11-12', now(), 'Infraestructura', 'SCALE', 'Escalado vertical de recursos de red');

INSERT INTO eventos_estudiante (estudiante_id, fecha_evento, evento_id, tipo_servicio, accion, detalles)
VALUES ('EST-03', '2026-11-16', now(), 'Base de Datos', 'BACKUP', 'Generación manual de respaldo de seguridad');