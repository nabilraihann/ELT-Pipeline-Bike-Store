{{
    config(
        unique_key='customer_id'
    )
}}

select * from {{ ref('stg_postgres_bike_store_customers')}}
