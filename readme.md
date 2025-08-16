
## ExpertSoft Project

This project is a Node.js backend application for managing customers, invoices, platforms, and transactions. It uses Express, MySQL, and CSV seeders for initial data loading. A simple frontend CRUD for customers is also included.

### Features
- REST API for CRUD operations on customers
- Endpoints for invoices, platforms, and transactions
- CSV seeders to populate the database
- Environment configuration with dotenv
- Frontend CRUD for customers (HTML, CSS, JS)

### Installation & Usage
1. Clone the repository
2. Install dependencies:
	 ```bash
	 npm install
	 ```
3. Configure your `.env` file with MySQL credentials
4. Run the seeders to populate the database:
	 ```bash
	 node app/server/seeders/run_seeders.js
	 ```
5. Start the backend server:
	 ```bash
	 node app/server/index.js
	 ```
6. Open `index.html` in your browser to use the frontend CRUD for customers.
	 - Make sure the backend server is running and accessible at `http://localhost:3000`.

### API Endpoints


#### Customers
- `GET /api/customers` — Get all customers
- `POST /api/customers` — Create a new customer
- `PUT /api/customers/:id` — Update a customer
- `DELETE /api/customers/:id` — Delete a customer

#### Invoices
- `GET /api/invoices` — Get all invoices
- `POST /api/invoices` — Create a new invoice
- `PUT /api/invoices/:id` — Update an invoice
- `DELETE /api/invoices/:id` — Delete an invoice

#### Platforms
- `GET /api/platforms` — Get all platforms
- `POST /api/platforms` — Create a new platform
- `PUT /api/platforms/:id` — Update a platform
- `DELETE /api/platforms/:id` — Delete a platform


#### Transactions
- `GET /api/transactions` — Get all transactions
- `POST /api/transactions` — Create a new transaction
- `PUT /api/transactions/:id` — Update a transaction
- `DELETE /api/transactions/:id` — Delete a transaction

### Advanced Queries

1. Total paid by each customer
	- `GET /api/reports/total-paid-by-customer`
	- Returns the total amount paid by each customer.

2. Pending invoices with customer and transaction info
	- `GET /api/reports/pending-invoices`
	- Returns invoices not fully paid, including customer and transaction details.

3. List of transactions by platform
	- `GET /api/reports/transactions-by-platform/:platform_id`
	- Returns all transactions for a specific platform, including customer and invoice info.

### Frontend

- The frontend is a simple HTML/CSS/JS app for managing customers.
- Located in `index.html`, `app/src/css/main.css`, and `app/src/js/main.js`.
- Supports create, read, update, and delete operations for customers.

### Folder Structure

```
app/
	server/
		connection_db.js      # MySQL connection
		index.js              # Express server
		seeders/              # CSV seeders
		data/                 # CSV files
	docs/
		ExpertSoft.sql        # Database schema
	src/
		css/
			main.css            # Frontend styles
		js/
			main.js             # Frontend logic
index.html                # Frontend entry point
```

### Technologies
- Node.js
- Express
- MySQL
- dotenv
- csv-parser
- cors
- HTML, CSS, JavaScript

### License
MIT
