{{
    config(
        unique_key='category_id'
    )
}}

select * from {{ ref('stg_postgres_bike_store_categories')}}
