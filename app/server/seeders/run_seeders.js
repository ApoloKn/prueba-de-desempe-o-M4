import { loadCustomers } from "./load_customers.js";
import { loadInvoices } from "./load_invoices.js";
import { loadPlatforms } from "./load_platforms.js";
import { loadTransactions } from "./load_transactions.js";


(async () => {
    try {
    console.log('🚀 Starting seeders...');

        await loadCustomers();
        await loadInvoices();
        await loadPlatforms(); 
        await loadTransactions();

    console.log('✅ Seeders executed successfully');
    } catch (error) {
        console.error('❌ Error running seeders:', error);
    } finally {
        process.exit();
    }
})()