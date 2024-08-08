{{
    config(
        unique_key='brand_id'
    )
}}

select * from {{ ref('stg_postgres_bike_store_brands')}}
