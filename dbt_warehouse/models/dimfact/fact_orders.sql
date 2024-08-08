{{
    config(
        unique_key='order_id'
    )
}}
select 
or_id.id as id,
ord.order_id ,
cust.customer_id ,
ord.order_status ,
cast(ord.order_date as date) as order_date,
ord.required_date ,
cast(ord.shipped_date as date) as shipped_date ,
str.store_id ,
stf.staff_id ,
or_id.item_id ,
brnd.brand_id,
cat.category_id,
or_id.product_id ,
or_id.quantity ,
or_id.list_price ,
or_id.discount 
from {{ ref ('stg_postgres_bike_store_orders')}} as ord
left join {{ ref('stg_postgres_bike_store_order_items')}} as or_id on ord.order_id = or_id.order_id 
left join {{ ref('stg_postgres_bike_store_products')}} as prd on or_id.product_id = prd.product_id
left join {{ ref('stg_postgres_bike_store_categories') }} as cat on prd.category_id = cat.category_id
left join {{ ref('stg_postgres_bike_store_brands')}} as brnd on prd.brand_id = brnd.brand_id
left join {{ ref('stg_postgres_bike_store_stores')}} as str on ord.store_id = str.store_id
left join {{ ref('stg_postgres_bike_store_staffs')}} as stf on ord.staff_id = stf.staff_id
left join {{ ref('stg_postgres_bike_store_customers')}} as cust on ord.customer_id = cust.customer_id