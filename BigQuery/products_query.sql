

CREATE OR REPLACE TABLE `customer-segmentation-123.ecommerce_customer_data.products` AS
SELECT 
id, 
cost,
category,
name,
brand,
retail_price,
department,
FROM `customer-segmentation-123.ecommerce_customer_data.products_ext`;
 
