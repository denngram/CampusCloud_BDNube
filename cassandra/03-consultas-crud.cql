-- ==========================================
-- Módulo Cassandra / ScyllaDB: Consultas y Operaciones CRUD
-- Proyecto: CampusCloud (Unidad II)
-- ==========================================

USE campuscloud_events;

-- 1. CONSULTA PRINCIPAL: Obtener la actividad de un estudiante específico ordenada por fecha
SELECT estudiante_id, fecha_evento, tipo_servicio, accion, detalles 
FROM eventos_estudiante 
WHERE estudiante_id = 'EST-01';

-- 2. CONSULTA POR RANGO DE FECHAS: Filtrar eventos de un estudiante dentro de un intervalo
SELECT estudiante_id, fecha_evento, tipo_servicio, accion, detalles 
FROM eventos_estudiante 
WHERE estudiante_id = 'EST-01' 
  AND fecha_evento >= '2026-11-01' 
  AND fecha_evento <= '2026-11-10';

-- 3. ACTUALIZACIÓN (UPDATE): Modificar un campo no clave (ej. detalles de un evento)
-- Nota: En Cassandra/ScyllaDB se requiere especificar la Clave Primaria completa para actualizar.
UPDATE eventos_estudiante 
SET detalles = 'Actualización: Despliegue optimizado de contenedor Docker Pro con réplicas'
WHERE estudiante_id = 'EST-01' 
  AND fecha_evento = '2026-11-01' 
  AND evento_id = f9432600-a436-11ef-8080-808080808080; -- Reemplazar con un timeuuid real generado en tu prueba

-- 4. ELIMINACIÓN (DELETE): Borrar un registro específico mediante su clave primaria completa
DELETE FROM eventos_estudiante 
WHERE estudiante_id = 'EST-01' 
  AND fecha_evento = '2026-11-15' 
  AND evento_id = f9432821-a436-11ef-8080-808080808080; -- Reemplazar con un timeuuid real generado en tu prueba