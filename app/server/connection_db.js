import mysql2 from 'mysql2/promise';

export const pool = mysql2.createPool({
    host: 'bmxze2zesdpvpxceyezd-mysql.services.clever-cloud.com',
    database: 'bmxze2zesdpvpxceyezd',
    port: 3306,
    user: 'uruz05esbkihv86j',
    password: 'JDKLJu6aZPCWZpFJXCBv',
    connectionLimit: 10,
    waitForConnections: true,
    queueLimit: 0,
});

async function connectionDBTest() {
    try {
        const connection = await pool.getConnection();
        console.log('Database connection established successfully');
        connection.release();
    } catch (error) {
        console.error('Error to connect DataBase:', error.message);
    }
};

connectionDBTest();