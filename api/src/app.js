import express from "express";
import saludRouter from "./routes/salud.routes.js";
import catalogoRoutes from "./routes/catalogo.routes.js";

const app = express();

app.use(express.json());

// Registra la ruta
app.use(saludRouter);
app.use(catalogoRoutes);

export default app;