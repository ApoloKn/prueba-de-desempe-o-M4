import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { pool } from './connection_db.js';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 3000;

// Get all customers
app.get('/api/customers', async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query('SELECT * FROM customers');
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Create customer
app.post('/api/customers', async (req, res) => {
    const { customer_id, customer_name, email, phone, address } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('INSERT INTO customers (customer_id, customer_name, email, phone, address) VALUES (?, ?, ?, ?, ?)', [customer_id, customer_name, email, phone, address]);
        connection.release();
        res.status(201).json({ message: 'Customer created successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Update customer
app.put('/api/customers/:id', async (req, res) => {
    const { id } = req.params;
    const { customer_name, email, phone, address } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('UPDATE customers SET customer_name=?, email=?, phone=?, address=? WHERE customer_id=?', [customer_name, email, phone, address, id]);
        connection.release();
        res.json({ message: 'Customer updated successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Delete customer
app.delete('/api/customers/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const connection = await pool.getConnection();
        await connection.query('DELETE FROM customers WHERE customer_id=?', [id]);
        connection.release();
        res.json({ message: 'Customer deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// CRUD for invoices
app.get('/api/invoices', async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query('SELECT * FROM invoices');
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post('/api/invoices', async (req, res) => {
    const { invoice_id, billing_period, billed_amount, amount_paid, customer_id } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('INSERT INTO invoices (invoice_id, billing_period, billed_amount, amount_paid, customer_id) VALUES (?, ?, ?, ?, ?)', [invoice_id, billing_period, billed_amount, amount_paid, customer_id]);
        connection.release();
        res.status(201).json({ message: 'Invoice created successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.put('/api/invoices/:id', async (req, res) => {
    const { id } = req.params;
    const { billing_period, billed_amount, amount_paid, customer_id } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('UPDATE invoices SET billing_period=?, billed_amount=?, amount_paid=?, customer_id=? WHERE invoice_id=?', [billing_period, billed_amount, amount_paid, customer_id, id]);
        connection.release();
        res.json({ message: 'Invoice updated successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete('/api/invoices/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const connection = await pool.getConnection();
        await connection.query('DELETE FROM invoices WHERE invoice_id=?', [id]);
        connection.release();
        res.json({ message: 'Invoice deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// CRUD for platforms
app.get('/api/platforms', async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query('SELECT * FROM platforms');
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post('/api/platforms', async (req, res) => {
    const { platform_id, platform_name } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('INSERT INTO platforms (platform_id, platform_name) VALUES (?, ?)', [platform_id, platform_name]);
        connection.release();
        res.status(201).json({ message: 'Platform created successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.put('/api/platforms/:id', async (req, res) => {
    const { id } = req.params;
    const { platform_name } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('UPDATE platforms SET platform_name=? WHERE platform_id=?', [platform_name, id]);
        connection.release();
        res.json({ message: 'Platform updated successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete('/api/platforms/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const connection = await pool.getConnection();
        await connection.query('DELETE FROM platforms WHERE platform_id=?', [id]);
        connection.release();
        res.json({ message: 'Platform deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// CRUD for transactions
app.get('/api/transactions', async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query('SELECT * FROM transactions');
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post('/api/transactions', async (req, res) => {
    const { transaction_id, transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('INSERT INTO transactions (transaction_id, transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id) VALUES (?, ?, ?, ?, ?, ?, ?)', [transaction_id, transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id]);
        connection.release();
        res.status(201).json({ message: 'Transaction created successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.put('/api/transactions/:id', async (req, res) => {
    const { id } = req.params;
    const { transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id } = req.body;
    try {
        const connection = await pool.getConnection();
        await connection.query('UPDATE transactions SET transaction_type=?, transaction_amount=?, transaction_status=?, transaction_datetime=?, platform_id=?, invoice_id=? WHERE transaction_id=?', [transaction_type, transaction_amount, transaction_status, transaction_datetime, platform_id, invoice_id, id]);
        connection.release();
        res.json({ message: 'Transaction updated successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete('/api/transactions/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const connection = await pool.getConnection();
        await connection.query('DELETE FROM transactions WHERE transaction_id=?', [id]);
        connection.release();
        res.json({ message: 'Transaction deleted successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});

// Advanced report endpoints
// 1. Total paid by each customer
app.get('/api/reports/total-paid-by-customer', async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(`
            SELECT c.customer_id, c.customer_name, SUM(i.amount_paid) AS total_paid
            FROM customers c
            JOIN invoices i ON c.customer_id = i.customer_id
            GROUP BY c.customer_id, c.customer_name
        `);
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// 2. Pending invoices with customer and transaction info
app.get('/api/reports/pending-invoices', async (req, res) => {
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(`
            SELECT i.invoice_id, i.billing_period, i.billed_amount, i.amount_paid,
                   c.customer_id, c.customer_name, t.transaction_id, t.transaction_status
            FROM invoices i
            JOIN customers c ON i.customer_id = c.customer_id
            LEFT JOIN transactions t ON i.invoice_id = t.invoice_id
            WHERE i.amount_paid < i.billed_amount
        `);
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// 3. List of transactions by platform
app.get('/api/reports/transactions-by-platform/:platform_id', async (req, res) => {
    const { platform_id } = req.params;
    try {
        const connection = await pool.getConnection();
        const [rows] = await connection.query(`
            SELECT t.transaction_id, t.transaction_type, t.transaction_amount, t.transaction_status, t.transaction_datetime,
                   p.platform_name, c.customer_id, c.customer_name, i.invoice_id, i.billed_amount
            FROM transactions t
            JOIN platforms p ON t.platform_id = p.platform_id
            JOIN invoices i ON t.invoice_id = i.invoice_id
            JOIN customers c ON i.customer_id = c.customer_id
            WHERE t.platform_id = ?
        `, [platform_id]);
        connection.release();
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});