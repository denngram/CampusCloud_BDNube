-- ==========================================
-- Módulo Cassandra / ScyllaDB: Keyspace y Tabla
-- Proyecto: CampusCloud (Unidad II)
-- ==========================================

-- 1. Crear el Keyspace con estrategia SimpleStrategy (para entorno local)
CREATE KEYSPACE IF NOT EXISTS campuscloud_events
WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': 1
};

-- 2. Seleccionar el keyspace
USE campuscloud_events;

-- 3. Crear la tabla de eventos de uso orientada a consultas por estudiante y fecha
-- Justificación: 
-- - Partition Key (estudiante_id): Distribuye los datos uniformemente por nodo según el estudiante.
-- - Clustering Key (fecha_evento, evento_id): Ordena cronológicamente los eventos dentro de la partición del estudiante, 
--   permitiendo consultas eficientes por rangos de tiempo.
CREATE TABLE IF NOT EXISTS eventos_estudiante (
    estudiante_id text,
    fecha_evento date,
    evento_id timeuuid,
    tipo_servicio text,
    accion text,
    detalles text,
    PRIMARY KEY ((estudiante_id), fecha_evento, evento_id)
) WITH CLUSTERING ORDER BY (fecha_evento DESC, evento_id DESC);