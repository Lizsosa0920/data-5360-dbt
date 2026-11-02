with source as (
    select * from {{ source('oliver_certifications', 'employee_certifications') }}
)

select
    "certification_completion_id" as certification_completion_id,
    "employee_id" as employee_id,
    "first_name" as first_name,
    "last_name" as last_name,
    "email" as email,
    PARSE_JSON("certification_json"):certification_name::string as certification_name,
    PARSE_JSON("certification_json"):certification_cost::number(10,2) as certification_cost,
    PARSE_JSON("certification_json"):certification_awarded_date::date as certification_awarded_date
from source