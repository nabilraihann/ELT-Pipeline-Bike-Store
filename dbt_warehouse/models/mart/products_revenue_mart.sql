select date_trunc('week', fct.order_date)::date as start_week_date,
       brnd.brand_name,
       cat.category_name,
       prd.product_name,
       count(fct.quantity)                                           as total_unit,
       sum((fct.list_price - (fct.list_price * (fct.discount / 100)))) as revenue
from {{ ref('fact_orders') }} as fct
         left join {{ ref('dim_brands') }} as brnd on fct.brand_id = brnd.brand_id
         left join {{ ref('dim_products') }} as prd on fct.product_id = prd.product_id
left join  {{ ref('dim_categories') }} cat on fct.category_id = cat.category_id
group by 1, 2, 3,4
order by 1,2,3,4