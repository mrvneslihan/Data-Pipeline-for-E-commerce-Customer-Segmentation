 {{
    config(
        materialized='table'
    )
}}

with 

users as (
    select * from {{ ref('stg_users') }}
),

sales_data as (
    select 
        user_id,
        sum(sale_price) as total_spent,        --(Monetary)
        count(distinct order_id) as frequency, --(Frequency)
        max(order_time) as last_purchase_date  --(Recency)
    from {{ ref('fact_sales') }} 
    where
        cast(order_time as date) <= current_date()  
        AND sale_price > 0           
    group by user_id
    having max(order_time) IS NOT NULL
),

rfm_calculation as (
    select
        user_id,
        ntile(3) over (order by date_diff(current_date(), cast(last_purchase_date as date), day) asc) as recency,
        ntile(3) over (order by frequency desc) as frequency,
        ntile(3) over (order by total_spent desc) as monetary
    from sales_data
)

select
    users.*,
    case
        when (rfm_calculation.recency + rfm_calculation.frequency + rfm_calculation.monetary) >= 8 then 'Champions'
        when (rfm_calculation.recency + rfm_calculation.frequency + rfm_calculation.monetary) >= 5 then 'Loyal Customers'
        else 'Need Attention'
    end as rfm_segment,
    case
        when (rfm_calculation.recency + rfm_calculation.frequency + rfm_calculation.monetary) >= 8 then '#2ECC71' 
        when (rfm_calculation.recency + rfm_calculation.frequency + rfm_calculation.monetary) >= 5 then '#3498DB' 
        else '#E74C3C'
    end as segment_color,
from users
left join rfm_calculation 
on users.user_id = rfm_calculation.user_id
