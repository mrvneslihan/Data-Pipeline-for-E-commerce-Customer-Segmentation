{{
    config(
        materialized='view'
    )
}}

with productstmp as (

    select * from {{ source('staging', 'products') }}

)

    select
        {{ dbt.safe_cast("id", api.Column.translate_type("integer")) }} as product_id,
        cast(cost as numeric) as cost,
        cast(category as string) as category,
        cast(name as string) as product_name,
        cast(brand as string) as product_brand,
        cast(retail_price as numeric) as sale_price,
        cast(department as string) as department

    from productstmp



