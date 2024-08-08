{{
    config(
        unique_key='store_id'
    )
}}

select * from {{ ref('stg_postgres_bike_store_stores')}}
