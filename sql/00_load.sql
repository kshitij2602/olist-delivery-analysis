-- Load the raw Olist CSVs into DuckDB tables.
-- Run from the repo root:  python scripts/query.py sql/00_load.sql
-- Raw data lives in data/raw/ (not committed).

CREATE OR REPLACE TABLE customers AS
SELECT * FROM read_csv('data/raw/olist_customers_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE geolocation AS
SELECT * FROM read_csv('data/raw/olist_geolocation_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE order_items AS
SELECT * FROM read_csv('data/raw/olist_order_items_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE order_payments AS
SELECT * FROM read_csv('data/raw/olist_order_payments_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE order_reviews AS
SELECT * FROM read_csv('data/raw/olist_order_reviews_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE orders AS
SELECT * FROM read_csv('data/raw/olist_orders_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE products AS
SELECT * FROM read_csv('data/raw/olist_products_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE sellers AS
SELECT * FROM read_csv('data/raw/olist_sellers_dataset.csv', header = true, sample_size = -1);

CREATE OR REPLACE TABLE category_translation AS
SELECT * FROM read_csv('data/raw/product_category_name_translation.csv', header = true, sample_size = -1);

-- Row counts: compare with the dataset page on Kaggle to confirm the load worked.
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL SELECT 'category_translation', COUNT(*) FROM category_translation;
