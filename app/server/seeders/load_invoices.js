
import fs from 'fs';
import path, { dirname } from 'path';
import csvParser from 'csv-parser';
import { fileURLToPath } from 'url';
import { pool } from '../connection_db.js';

const __dirname = dirname(fileURLToPath(import.meta.url));



export async function loadInvoices() {
    const filePath = path.resolve(__dirname, '../data/invoices.csv');
    const invoices = [];
    return new Promise((resolve, reject) => {
        fs.createReadStream(filePath)
            .pipe(csvParser({ separator: ';' }))
            .on('data', (row) => {
                // Transformar billing_period a formato YYYY-MM-01
                let period = row.billing_period.trim();
                if (/^\d{4}-\d{2}$/.test(period)) {
                    period = `${period}-01`;
                }
                invoices.push([
                    row.invoice_id,
                    period,
                    row.billed_amount,
                    row.amount_paid,
                    row.customer_id
                ]);
            })
            .on('end', async () => {
                try {
                    const connection = await pool.getConnection();
                    const sql = `INSERT INTO invoices (invoice_id, billing_period, billed_amount, amount_paid, customer_id) VALUES ?`;
                    const [result] = await connection.query(sql, [invoices]);
                    console.log(`${result.affectedRows} invoices loaded successfully`);
                    connection.release();
                    resolve();
                } catch (error) {
                    console.error('Error loading invoices data:', error.massage);
                    reject(error);
                }
            })
            .on('error', (error) => {
                console.error('Error reading CSV file:', error.message);
                reject(error);
            });
    });
}