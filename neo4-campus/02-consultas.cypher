// ==========================================
// Módulo Neo4j: Consultas Cypher
// Proyecto: CampusCloud (Unidad II)
// ==========================================

// 1. CONSULTA 1: Servicios usados por un estudiante específico (ej. Denisse Ramírez)
MATCH (e:Estudiante {nombre: "Denisse Ramírez"})-[:UTILIZA]->(s:Servicio)
RETURN e.nombre AS Estudiante, s.nombre AS Servicio, s.tipo AS Categoria;


// 2. CONSULTA 2: Estudiantes que comparten un mismo servicio (conteo y nombres)
MATCH (e1:Estudiante)-[:UTILIZA]->(s:Servicio)<-[:UTILIZA]-(e2:Estudiante)
WHERE e1.id < e2.id
RETURN s.nombre AS Servicio, e1.nombre AS Estudiante_1, e2.nombre AS Estudiante_2;


// 3. CONSULTA 3: Recomendación básica basada en relaciones (Amigos que usan servicios que tú no usas)
MATCH (e:Estudiante {nombre: "Denisse Ramírez"})-[:AMIGO_DE]-(amigo:Estudiante)-[:UTILIZA]->(s:Servicio)
WHERE NOT (e)-[:UTILIZA]->(s)
RETURN DISTINCT e.nombre AS Usuario, amigo.nombre AS Recomendado_Por, s.nombre AS Servicio_Recomendado;