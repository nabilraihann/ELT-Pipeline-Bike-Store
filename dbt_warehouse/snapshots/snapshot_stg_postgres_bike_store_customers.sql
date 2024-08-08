{% snapshot customer_snapshot %}
{{
    config(
      target_database='warehouse',
      target_schema='staging',
      unique_key='customer_id',

      strategy='timestamp',
      updated_at='_airbyte_extracted_at',
    )
}}
select * from {{ source('bike_store','postgres_bike_store_customers')}}

{% endsnapshot %}