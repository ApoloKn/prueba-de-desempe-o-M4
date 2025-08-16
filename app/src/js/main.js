const API_URL = 'http://localhost:3000/api/customers';

const form = document.getElementById('customer-form');
const tableBody = document.querySelector('#customers-table tbody');
const resetBtn = document.getElementById('reset-btn');

function fetchCustomers() {
	fetch(API_URL)
		.then(res => res.json())
		.then(data => {
			tableBody.innerHTML = '';
			data.forEach(c => {
				const row = document.createElement('tr');
				row.innerHTML = `
					<td>${c.customer_id}</td>
					<td>${c.customer_name}</td>
					<td>${c.email}</td>
					<td>${c.phone}</td>
					<td>${c.address}</td>
					<td>
						<button onclick="editCustomer('${c.customer_id}')">Edit</button>
						<button onclick="deleteCustomer('${c.customer_id}')">Delete</button>
					</td>
				`;
				tableBody.appendChild(row);
			});
		});
}

window.editCustomer = function(id) {
	fetch(`${API_URL}`)
		.then(res => res.json())
		.then(data => {
			const customer = data.find(c => c.customer_id == id);
			if (customer) {
				document.getElementById('customer_id').value = customer.customer_id;
				document.getElementById('customer_name').value = customer.customer_name;
				document.getElementById('email').value = customer.email;
				document.getElementById('phone').value = customer.phone;
				document.getElementById('address').value = customer.address;
			}
		});
}

window.deleteCustomer = function(id) {
	if (confirm('Are you sure you want to delete this customer?')) {
		fetch(`${API_URL}/${id}`, { method: 'DELETE' })
			.then(() => fetchCustomers());
	}
}

form.addEventListener('submit', function(e) {
	e.preventDefault();
	const customer_id = document.getElementById('customer_id').value;
	const customer_name = document.getElementById('customer_name').value;
	const email = document.getElementById('email').value;
	const phone = document.getElementById('phone').value;
	const address = document.getElementById('address').value;

	const method = customer_id ? 'PUT' : 'POST';
	const url = customer_id ? `${API_URL}/${customer_id}` : API_URL;
	const body = JSON.stringify({ customer_id, customer_name, email, phone, address });

	fetch(url, {
		method,
		headers: { 'Content-Type': 'application/json' },
		body
	})
	.then(() => {
		form.reset();
		fetchCustomers();
	});
});

resetBtn.addEventListener('click', () => form.reset());

fetchCustomers();
