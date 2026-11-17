print("--- 1. ACTUALIZACIÓN ---");
db.detalles_servicios.updateOne({ codigo_servicio: "SRV-IA-01" }, { $set: { costo_mensual: 550.00, activo: true } });
printjson(db.detalles_servicios.findOne({ codigo_servicio: "SRV-IA-01" }));

print("--- 2. ELIMINACIÓN ---");
db.detalles_servicios.insertOne({
  codigo_servicio: "SRV-TMP-99", tipo: "Temporal", nombre: "Borrar", costo_mensual: 10.00, activo: false,
  caracteristicas: ["Borrar"], especificaciones_tecnicas: { version: "1.0" }, fecha_registro: new Date()
});
db.detalles_servicios.deleteOne({ codigo_servicio: "SRV-TMP-99" });
print("Servicio temporal eliminado.");

print("--- 3. AGREGACIÓN ---");
printjson(db.detalles_servicios.aggregate([
  { $group: { _id: "$tipo", total_servicios: { $sum: 1 }, costo_promedio: { $avg: "$costo_mensual" } } }
]).toArray());