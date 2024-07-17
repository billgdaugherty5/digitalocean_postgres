with stg_stores as
(
    select * from {{ ref('stg_jaffleshop_stores') }}
)

select
    store_id
    , store_name
    , store_opened_date
    , store_tax_rate
    
from stg_stores