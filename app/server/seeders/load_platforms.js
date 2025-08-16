

import fs from 'fs';
import path, { dirname } from 'path';
import csvParser from 'csv-parser';
import { fileURLToPath } from 'url';
import { pool } from '../connection_db.js';

const __dirname = dirname(fileURLToPath(import.meta.url));

export async function loadPlatforms() {
	const filePath = path.resolve(__dirname, '../data/platforms.csv');
	const platforms = [];
	return new Promise((resolve, reject) => {
		fs.createReadStream(filePath)
			.pipe(csvParser({ separator: ';' }))
			.on('data', (row) => {
				if (row.platform_id && row.platform_name) {
					platforms.push([
						row.platform_id,
						row.platform_name.trim()
					]);
				}
			})
			.on('end', async () => {
				try {
					const connection = await pool.getConnection();
					const sql = `INSERT INTO platforms (platform_id, platform_name) VALUES ?`;
					const [result] = await connection.query(sql, [platforms]);
					console.log(`${result.affectedRows} platforms loaded successfully`);
					connection.release();
					resolve();
				} catch (error) {
					console.error('Error loading platforms data:', error.massage);
					reject(error);
				}
			})
			.on('error', (error) => {
				console.error('Error reading CSV file:', error.message);
				reject(error);
			});
	});
}
