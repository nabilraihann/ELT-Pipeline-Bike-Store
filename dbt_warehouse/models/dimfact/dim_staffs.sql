{{
    config(
        unique_key='staff_id'
    )
}}

select * from {{ ref('stg_postgres_bike_store_staffs')}}
