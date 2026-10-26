with dates as (
    select dateadd(day, row_number() over (order by seq4()) - 1, '2020-01-01'::date) as date_id
    from table(generator(rowcount => 3650))
)
select
    to_number(to_char(date_id, 'YYYYMMDD')) as date_key,
    date_id,
    dayname(date_id) as dayofweek,
    monthname(date_id) as month,
    quarter(date_id) as quarter,
    year(date_id) as year
from dates