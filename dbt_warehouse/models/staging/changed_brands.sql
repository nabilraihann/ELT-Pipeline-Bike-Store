{{
    config(
        unique_key='brand_id',
        incremental_strategy='delete+insert'
    )
}}

select * from {{ ref('brand_snapshot') }}