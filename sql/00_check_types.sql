-- Check that the date columns loaded as timestamps, not text.
-- If order_purchase_timestamp shows VARCHAR, date math will break: cast it in your staging step.
-- Run:  python scripts/query.py sql/00_check_types.sql

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders'
ORDER BY ordinal_position;
