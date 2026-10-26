{{ config(
    materialized = 'table',
    schema = 'dw_insurance'
    )
}}

with cte_date as (
{{ dbt_utils.date_spine(
    datepart = "day",
    start_date = "cast('1990-01-01' as date)",
    end_date = "cast('2051-01-01' as date)"
) }}
)

SELECT
cast(date_day as date) as date_key,
cast(date_day as date) as date_day,
dayofweek(date_day) as day_of_week,
month(date_day) as month_of_year,
monthname(date_day) as month_name,
quarter(date_day) as quarter_of_year,
year(date_day) as year_number
from cte_date