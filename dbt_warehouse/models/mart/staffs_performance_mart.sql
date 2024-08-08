select
    date_trunc('week', fct.order_date)::date as start_week_date,
    str.store_name,
    concat(stf.first_name,' ',stf.last_name) as staff_name,
    count(distinct fct.order_id) as order_count,
    sum(fct.quantity) as product_count,
    count(distinct fct.customer_id) as customer_count
from {{ ref('fact_orders') }} as fct
left join {{ ref('dim_staffs') }} as stf on fct.staff_id = stf.staff_id
left join {{ ref('dim_stores') }} str on fct.store_id = str.store_id
where stf.manager_id is not null
group by 1,2,3
order by 1,2,3