select
    d.date_key,
    e.employee_key,
    c.certification_name,
    c.certification_cost
from {{ ref('stg_employee_certifications') }} c
join {{ ref('oliver_dim_employee') }} e on c.employee_id = e.employeeid
join {{ ref('oliver_dim_date') }} d on c.certification_awarded_date::date = d.date_id