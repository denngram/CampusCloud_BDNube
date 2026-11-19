import app from './app.js';
import { env } from './config/env.js'; 
import { connectDB } from './database/connection.js';
import {conectarMongoDB, 
    cerrarMongoDB} from './config/mongodb.js';

const iniciarServidor = async () => {
    try {
            await conectarMongoDB();
            app.listen(env.port, () => {
                console.log(`CampusCloud API ejecutandose en http://localhost:${env.port}`);
            });
        } catch (error) {
            console.error('No se pudo iniciarCampusCloud API: ', error.message);
            await cerrarMongoDB();
            process.exit= 1; // Salir del proceso con un código de error
        }
    };

const PORT = env.port || 3003;

// Conectar a MongoDB y luego iniciar el servidor
connectDB().then(() => {
    app.listen(PORT, '0.0.0.0', () => {
        console.log(`CampusCloud API ejecutandose en http://localhost:${PORT}`);
    });
});

iniciarServidor();