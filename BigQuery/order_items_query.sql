

CREATE OR REPLACE TABLE `customer-segmentation-123.ecommerce_customer_data.order_items`
PARTITION BY DATE(order_time) 
AS
SELECT 
id, 
order_id, 
user_id, 
product_id, 
shipped_at AS order_time, 
sale_price,
FROM `customer-segmentation-123.ecommerce_customer_data.order_items_ext`
WHERE status IN ('Complete', 'Shipped');
 

## This query selects orders with 'Completed' and 'Shipped' statuses from the 'order_items_ext' table, renames the 'shipped_at' date to 'order_time', and creates a new 'order_items' table partitioned by the 'order_time' field.

## Since there is no reliable order time information in the processed data, the 'shipped_at' value, which may intersect with other tables, has been renamed as 'order_time' and accepted as the time the order was created.