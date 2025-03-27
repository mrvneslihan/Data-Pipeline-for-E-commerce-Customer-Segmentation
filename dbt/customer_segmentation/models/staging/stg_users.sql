{{
    config(
        materialized='view'
    )
}}


with userstmp as (

    select * from {{ source('staging', 'users') }}

)

    select
        {{ dbt.safe_cast("id", api.Column.translate_type("integer")) }} as user_id,
        {{ dbt.safe_cast("first_name", api.Column.translate_type("string")) }} as first_name,
        {{ dbt.safe_cast("lastname", api.Column.translate_type("string")) }} as last_name,
        {{ dbt.safe_cast("email", api.Column.translate_type("string")) }} as email,
        {{ dbt.safe_cast("age", api.Column.translate_type("integer")) }} as age,
        {{ dbt.safe_cast(
        "case when gender = 'F' then 'Female' when gender = 'M' then 'Male' else 'unknown' end", 
        api.Column.translate_type("string")
    ) }} as gender,
        {{ dbt.safe_cast("city", api.Column.translate_type("string")) }} as city,
        {{ dbt.safe_cast("country", api.Column.translate_type("string")) }} as country,
        {{ dbt.safe_cast("traffic_source", api.Column.translate_type("string")) }} as traffic_source,
        cast(created_at as timestamp) as registration_date,
        {{ dbt.safe_cast("user_geom", api.Column.translate_type("geography")) }} as user_geom
    
    from userstmp


