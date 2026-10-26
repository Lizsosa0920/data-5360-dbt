select
    d.date_id as sale_date,
    d.year,
    d.quarter,
    d.month,
    d.dayofweek,
    s.store_name,
    s.city as store_city,
    s.state as store_state,
    p.product_name,
    c.firstname || ' ' || c.lastname as customer_name,
    c.state as customer_state,
    e.firstname || ' ' || e.lastname as employee_name,
    e.position as employee_position,
    f.quantity,
    f.unit_price,
    f.dollars_sold
from {{ ref('fact_sales') }} f
join {{ ref('oliver_dim_date') }} d on f.date_key = d.date_key
join {{ ref('oliver_dim_store') }} s on f.store_key = s.store_key
join {{ ref('oliver_dim_product') }} p on f.product_key = p.product_key
join {{ ref('oliver_dim_customer') }} c on f.cust_key = c.cust_key
join {{ ref('oliver_dim_employee') }} e on f.employee_key = e.employee_key