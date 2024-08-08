{% snapshot brand_snapshot %}
{{
    config(
      target_database='warehouse',
      target_schema='staging',
      unique_key='brand_id',

      strategy='timestamp',
      updated_at='_airbyte_extracted_at',
    )
}}
select * from {{ source('bike_store','postgres_bike_store_brands')}}

{% endsnapshot %}