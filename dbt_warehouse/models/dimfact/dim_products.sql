{{
    config(
        unique_key='product_id'
    )
}}

select * from {{ ref('stg_postgres_bike_store_products')}}
