{{ 
    config(
        materialized='table'
    ) 
}}

with 

order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    order_items.order_item_id,
    order_items.order_id,
    order_items.user_id,
    order_items.product_id,
    order_items.order_time,
    order_items.sale_price,
    products.product_name,
    products.product_brand,
    products.category,
    products.department,
    products.cost,
    order_items.sale_price - products.cost as profit
    
from order_items
left join products
    on order_items.product_id = products.product_id