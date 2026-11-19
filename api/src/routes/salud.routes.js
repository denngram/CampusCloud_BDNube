import { Router } from "express";
import { getSalud } from "../controllers/salud.controllers.js";

const router = Router();

router.get("/salud", getSalud);

// Exporta el router por defecto
export default router;