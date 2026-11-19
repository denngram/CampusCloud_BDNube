
export const getSalud = (req, res) => {
    res.status(200).json({ 
            estado: "ok",
        applicacion: "CampusCloud API",
            mensaje: "El servidor esta funcionando",
        });
};