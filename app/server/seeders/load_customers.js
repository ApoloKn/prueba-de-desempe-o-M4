
import fs from 'fs';
import path, { dirname } from 'path';
import csvParser from 'csv-parser';
import { fileURLToPath } from 'url';
import { pool } from '../connection_db.js';

const __dirname = dirname(fileURLToPath(import.meta.url));



export async function loadCustomers() {
    const filePath = path.resolve(__dirname, '../data/customers.csv');
    const customers = [];
    return new Promise((resolve, reject) => {
        fs.createReadStream(filePath)
            .pipe(csvParser({ separator: ';' }))
            .on('data', (row) => {
                customers.push([
                    row.customer_id,
                    row.customer_name.trim(),
                    row.email,
                    row.phone,
                    row.address
                ]);
            })
                .on('end', async () => {
                    try {
                        const connection = await pool.getConnection();
                        // Delete data in the correct order to avoid foreign key errors
                        await connection.query('DELETE FROM transactions');
                        await connection.query('DELETE FROM invoices');
                        await connection.query('DELETE FROM platforms');
                        await connection.query('DELETE FROM customers');
                        const sql = `INSERT INTO customers (customer_id, customer_name, email, phone, address) VALUES ?`;
                        const [result] = await connection.query(sql, [customers]);
                        console.log(`${result.affectedRows} customers loaded successfully`);
                        connection.release();
                        resolve();
                    } catch (error) {
                        console.error('Error loading customers data:', error.massage);
                        reject(error);
                    }
                })
            .on('error', (error) => {
                console.error('Error reading CSV file:', error.message);
                reject(error);
            });
    });
}