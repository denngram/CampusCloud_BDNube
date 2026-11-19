import { listarCatalogoActivo } from '../services/catalogo.services.js';

export const obtenerCatalogoController = async (req, res, next) => {
    try {
        const catalogo = await listarCatalogoActivo();
        res.status(200).json({
            mensaje: "Catalogo de servicios de CampusCloud",
            total: catalogo.length,
            datos: catalogo
        });   
    } catch (error) {
        next(error);
    }
};