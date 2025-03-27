{{
    config(
        materialized='view'
    )
}}


with orderitems as
(

    select *,
     row_number() over(partition by id, order_time) as rn
     from {{ source('staging', 'order_items') }}
     where id is not null
)

    select
        {{ dbt.safe_cast("id", api.Column.translate_type("integer")) }} as order_item_id,
        {{ dbt.safe_cast("order_id", api.Column.translate_type("integer")) }} as order_id,
        {{ dbt.safe_cast("user_id", api.Column.translate_type("integer")) }} as user_id,
        {{ dbt.safe_cast("product_id", api.Column.translate_type("integer")) }} as product_id,
        cast(order_time as timestamp) as order_time,
        cast(sale_price as numeric) as sale_price

    from orderitems
    where rn=1
    




