import dotenv from 'dotenv';
dotenv.config();

const PORT = Number(process.env.PORT ?? 3000);

if (!Number.isInteger(PORT) || PORT < 1 || PORT > 65535) {
    throw new Error('PORT debe ser valido entre 1 y 65535');
}

export const env = {
    port: PORT,
    mongo: {
        host: process.env.MONGO_HOST?.trim() || 'localhost',
        port: Number(process.env.MONGO_PORT) || 27017,
        user: process.env.MONGO_USER?.trim(),
        password: process.env.MONGO_PASSWORD?.trim(),
        database: process.env.MONGO_DATABASE?.trim() || 'campuscloud_nosql',
        authSource: process.env.MONGO_AUTH_SOURCE?.trim() || 'admin'
    }
};