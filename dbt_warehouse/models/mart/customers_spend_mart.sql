select
    date_trunc('week', fct.order_date)::date as start_week_date,
    fct.customer_id,
    concat(cust.first_name,' ',cust.last_name) as customer_name,
    sum(fct.quantity) as unit,
    sum((fct.list_price - (fct.list_price * (fct.discount / 100)))) as spend
from {{ ref('fact_orders') }} as fct
left join {{ ref('dim_customer') }} as cust on fct.customer_id = cust.customer_id
group by 1,2,3
order by 1,2,3