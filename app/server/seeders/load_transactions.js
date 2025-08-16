

import fs from 'fs';
import path, { dirname } from 'path';
import csvParser from 'csv-parser';
import { fileURLToPath } from 'url';
import { pool } from '../connection_db.js';

const __dirname = dirname(fileURLToPath(import.meta.url));

export async function loadTransactions() {
	const filePath = path.resolve(__dirname, '../data/transactions.csv');
	const transactions = [];
	return new Promise((resolve, reject) => {
		fs.createReadStream(filePath)
			.pipe(csvParser({ separator: ';' }))
			.on('data', (row) => {
				transactions.push([
					row.transaction_id,
					row.transaction_type.trim(),
				    row.transaction_amount,
					row.transaction_status.trim(),
					row.transaction_datetime,
					row.platform_id,
					row.invoice_id
				]);
			})
			.on('end', async () => {
				try {
					const connection = await pool.getConnection();
					const sql = `INSERT INTO transactions (transaction_id, transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id) VALUES ?`;
					const [result] = await connection.query(sql, [transactions]);
					console.log(`${result.affectedRows} transactions loaded successfully`);
					connection.release();
					resolve();
				} catch (error) {
					console.error('Error loading transactions data:', error.massage);
					reject(error);
				}
			})
			.on('error', (error) => {
				console.error('Error reading CSV file:', error.message);
				reject(error);
			});
	});
}
