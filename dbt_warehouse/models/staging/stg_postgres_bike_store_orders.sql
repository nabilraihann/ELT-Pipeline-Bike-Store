{{
    config(
        unique_key='order_id',
        incremental_strategy='delete+insert'
    )
}}

select * from {{ source('bike_store','postgres_bike_store_orders')}}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later on the same day as the last run of this model)
  where _airbyte_extracted_at >= (select coalesce(max(_airbyte_extracted_at), '1900-01-01') from {{ this }})

{% endif %}