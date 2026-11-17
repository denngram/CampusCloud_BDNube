// 1. Comprobar colecciones existentes antes de crear
console.log("Colecciones actuales en la base de datos:");
printjson(db.getCollectionNames());

// 2. Crear explícitamente la colección con validación opcional
db.createCollection("detalles_servicios", {
   validator: {
      $jsonSchema: {
         bsonType: "object",
         required: [ "codigo_servicio", "tipo", "nombre", "costo_mensual" ],
         properties: {
            codigo_servicio: { bsonType: "string" },
            tipo: { bsonType: "string" },
            nombre: { bsonType: "string" },
            costo_mensual: { bsonType: "numeric" }
         }
      }
   }
});
print("¡Colección 'detalles_servicios' creada exitosamente!");