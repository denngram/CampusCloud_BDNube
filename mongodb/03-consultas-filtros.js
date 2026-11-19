print("--- 1. CONSULTA: Servicios de tipo 'Infraestructura' ---");
printjson(db.detalles_servicios.find({ tipo: "Infraestructura" }).toArray());

print("--- 2. CONSULTA: Servicios activos con costo menor a $500 ---");
printjson(db.detalles_servicios.find({ activo: true, costo_mensual: { $lt: 500 } }).toArray());

print("--- 3. CONSULTA: Búsqueda por característica específica ---");
printjson(db.detalles_servicios.find({ caracteristicas: "Alta disponibilidad" }).toArray());

