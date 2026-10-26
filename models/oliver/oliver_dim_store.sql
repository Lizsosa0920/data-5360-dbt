select
    row_number() over (order by store_id) as store_key,
    store_id,
    store_name,
    street,
    city,
    state
from {{ source('oliver', 'store') }}
qualify row_number() over (partition by store_id order by "_fivetran_synced" desc) = 1