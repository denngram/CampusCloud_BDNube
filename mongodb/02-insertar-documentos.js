db.detalles_servicios.insertMany([
  {
    codigo_servicio: "SRV-INF-01",
    tipo: "Infraestructura",
    nombre: "Contenedores Docker Pro",
    costo_mensual: 450.00,
    activo: true,
    caracteristicas: ["2GB RAM", "1 vCPU", "Almacenamiento SSD"],
    especificaciones_tecnicas: { sistema_operativo: "Ubuntu 22.04 LTS", puerto_base: 3000 },
    fecha_registro: new Date()
  },
  {
    codigo_servicio: "SRV-INF-02",
    tipo: "Infraestructura",
    nombre: "Cluster Kubernetes Escalable",
    costo_mensual: 1200.00,
    activo: true,
    caracteristicas: ["Auto-scaling", "Balanceador de carga"],
    especificaciones_tecnicas: { sistema_operativo: "Container-optimized OS", puerto_base: 8080 },
    fecha_registro: new Date()
  },
  {
    codigo_servicio: "SRV-BD-01",
    tipo: "Base de Datos",
    nombre: "MongoDB Atlas Cloud Instance",
    costo_mensual: 280.00,
    activo: true,
    caracteristicas: ["Backups automáticos", "Alta disponibilidad"],
    especificaciones_tecnicas: { version: "7.0", cluster: "M10" },
    fecha_registro: new Date()
  },
  {
    codigo_servicio: "SRV-BD-02",
    tipo: "Base de Datos",
    nombre: "PostgreSQL Administrado",
    costo_mensual: 350.00,
    activo: true,
    caracteristicas: ["Réplicas de lectura", "Escalado vertical"],
    especificaciones_tecnicas: { version: "15.4", almacenamiento_gb: 100 },
    fecha_registro: new Date()
  },
  {
    codigo_servicio: "SRV-IA-01",
    tipo: "Inteligencia Artificial",
    nombre: "Motor de Recomendación de Cursos",
    costo_mensual: 600.00,
    activo: false,
    caracteristicas: ["Machine Learning", "API REST integrada"],
    especificaciones_tecnicas: { modelo: "NCF", framework: "PyTorch" },
    fecha_registro: new Date()
  },
  {
    codigo_servicio: "SRV-IA-02",
    tipo: "Inteligencia Artificial",
    nombre: "Asistente Virtual Educativo",
    costo_mensual: 500.00,
    activo: true,
    caracteristicas: ["NLP Avanzado", "Soporte multiidioma"],
    especificaciones_tecnicas: { modelo: "LLM Fine-tuned", tokens_maximos: 4096 },
    fecha_registro: new Date()
  }
]);
print("¡6 documentos insertados con éxito!");