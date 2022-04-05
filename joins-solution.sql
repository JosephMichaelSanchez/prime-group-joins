-- 1) GET ALL CUSTOMERS AND THEIR ADDRESSES
SELECT * FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id

-- 2) Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id

--3) Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 5;

--4) Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6;

--5) Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, COUNT ("orders".address_id) FROM "orders"
JOIN "addresses" ON "orders".address_id = "addresses".customer_id
JOIN "customers" ON "addresses".customer_id = "customers".id
GROUP BY "customers".first_name


--6) How many customers do we have?
SELECT count(*) FROM "customers"

--7) How many products do we carry?
SELECT count(*) FROM "products"

--8) What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6;