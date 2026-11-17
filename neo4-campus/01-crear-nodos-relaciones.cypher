// ==========================================
// Módulo Neo4j: Creación de Nodos y Relaciones
// Proyecto: CampusCloud (Unidad II)
// ==========================================

// 1. Limpiar base de datos de prueba 
// MATCH (n) DETACH DELETE n;

// 2. Crear nodos Estudiante
CREATE (e1:Estudiante {id: "EST-01", nombre: "Denisse Ramírez", carrera: "Ingeniería en Sistemas"})
CREATE (e2:Estudiante {id: "EST-02", nombre: "Brandon Pérez", carrera: "Tecnologías de la Información"})
CREATE (e3:Estudiante {id: "EST-03", nombre: "Andy García", carrera: "Desarrollo de Software"})
CREATE (e4:Estudiante {id: "EST-04", nombre: "Alan Martínez", carrera: "Infraestructura Cloud"})
CREATE (e5:Estudiante {id: "EST-05", nombre: "Chuy Hernández", carrera: "Ciberseguridad"});

// 3. Crear nodos Servicio 
CREATE (s1:Servicio {id: "SRV-INF-01", nombre: "Contenedores Docker Pro", tipo: "Infraestructura"})
CREATE (s2:Servicio {id: "SRV-BD-01", nombre: "MongoDB Atlas Cloud", tipo: "Base de Datos"})
CREATE (s3:Servicio {id: "SRV-IA-01", nombre: "Motor de Recomendación", tipo: "Inteligencia Artificial"})
CREATE (s4:Servicio {id: "SRV-BD-02", nombre: "PostgreSQL Administrado", tipo: "Base de Datos"});

// 4. Crear relaciones (:USA, :COMPARTE_AFINIDAD, etc., al menos 8 requeridas)
MATCH (e1:Estudiante {id: "EST-01"}), (s1:Servicio {id: "SRV-INF-01"})
CREATE (e1)-[:UTILIZA {desde: "2026-01-10", rol: "Administrador"}]->(s1);

MATCH (e1:Estudiante {id: "EST-01"}), (s2:Servicio {id: "SRV-BD-01"})
CREATE (e1)-[:UTILIZA {desde: "2026-02-15", rol: "Desarrollador"}]->(s2);

MATCH (e2:Estudiante {id: "EST-02"}), (s1:Servicio {id: "SRV-INF-01"})
CREATE (e2)-[:UTILIZA {desde: "2026-01-12", rol: "Colaborador"}]->(s1);

MATCH (e2:Estudiante {id: "EST-02"}), (s3:Servicio {id: "SRV-IA-01"})
CREATE (e2)-[:UTILIZA {desde: "2026-03-01", rol: "Tester"}]->(s3);

MATCH (e3:Estudiante {id: "EST-03"}), (s2:Servicio {id: "SRV-BD-01"})
CREATE (e3)-[:UTILIZA {desde: "2026-02-20", rol: "Analista"}]->(s2);

MATCH (e3:Estudiante {id: "EST-03"}), (s4:Servicio {id: "SRV-BD-02"})
CREATE (e3)-[:UTILIZA {desde: "2026-01-05", rol: "DBA"}]->(s4);

MATCH (e4:Estudiante {id: "EST-04"}), (s4:Servicio {id: "SRV-BD-02"})
CREATE (e4)-[:UTILIZA {desde: "2026-03-10", rol: "Soporte"}]->(s4);

MATCH (e5:Estudiante {id: "EST-05"}), (s3:Servicio {id: "SRV-IA-01"})
CREATE (e5)-[:UTILIZA {desde: "2026-03-15", rol: "Investigador"}]->(s3);

// Relación de amistad o afinidad entre estudiantes
MATCH (e1:Estudiante {id: "EST-01"}), (e2:Estudiante {id: "EST-02"})
CREATE (e1)-[:AMIGO_DE {nivel: "Alto"}]->(e2);

MATCH (e2:Estudiante {id: "EST-02"}), (e3:Estudiante {id: "EST-03"})
CREATE (e2)-[:AMIGO_DE {nivel: "Medio"}]->(e3);