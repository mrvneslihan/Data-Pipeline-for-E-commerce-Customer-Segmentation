CREATE OR REPLACE TABLE `customer-segmentation-123.ecommerce_customer_data.users` 
PARTITION BY DATE(created_at)
AS
SELECT 
  id,
  first_name,
  lastname,
  email,
  age,
  gender,
  city,
  country,
  traffic_source,
  created_at,
  user_geom
FROM `customer-segmentation-123.ecommerce_customer_data.users_ext`;


# created_at has been considered as the time when the membership was created.
