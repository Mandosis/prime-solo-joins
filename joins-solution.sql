-- 1. Get all customers and their addresses

SELECT customers.first_name AS "First Name",
	   customers.last_name AS "Last Name",
	   addresses.street AS "Street",
	   addresses.city AS "City",
	   addresses.state AS "State",
	   addresses.zip AS "Zip",
	   addresses.address_type AS "Address Type"
FROM addresses
JOIN customers ON addresses.customer_id = customers.id;

-- 2. Get all orders and thier line items.

SELECT orders.order_date AS "Order Date",
	   orders.total AS "Total",
	   line_items.unit_price AS "Unit Price",
	   line_items.quantity AS "Quantity"
FROM line_items
JOIN orders on line_items.order_id = orders.id;


-- 3. Which warehouses have cheetos?

SELECT warehouse.warehouse, products.description
FROM warehouse
JOIN warehouse_product ON warehouse_product.warehouse_id = warehouse.id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'cheetos';


-- 4. Which warehouses have diet pepsi
SELECT warehouse.warehouse, products.description
FROM warehouse
JOIN warehouse_product ON warehouse_product.warehouse_id = warehouse.id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';


-- 5. Get the number of orders for each customer.
SELECT customers.first_name AS "First Name",
	   customers.last_name AS "Last Name",
	   sum(orders.total) AS "# Orders"
FROM customers
JOIN addresses ON addresses.customer_id = customers.id
JOIN orders on orders.address_id = addresses.id
GROUP BY customers.first_name, customers.last_name;


-- 6. How many customers do we have?
SELECT count(customers.id) AS "# Customers" FROM customers;


-- 7. How many products do we carry?
SELECT count(products.id) AS "# Products" FROM products;


-- 8. What is the total available on-hand quantity of diet pepsi
SELECT products.description, sum(warehouse_product.on_hand)
FROM products
JOIN warehouse_product ON warehouse_product.product_id = products.id
GROUP BY products.description;
