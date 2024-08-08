{{
    config(
        unique_key='customer_id',
        incremental_strategy='delete+insert'
    )
}}

select * from {{ ref('customer_snapshot') }}