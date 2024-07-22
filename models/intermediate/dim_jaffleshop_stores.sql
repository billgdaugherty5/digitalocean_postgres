with stg_stores as
(
    select * from {{ ref('stg_jaffleshop_stores') }}
), 

usa_cities as
(
    select * from {{ ref('usa_cities') }}
),

stores_transformation as
(
    select
        stg_stores.store_id
        , stg_stores.store_city
        , usa_cities.state_id
        , usa_cities.lat as city_latitude
        , usa_cities.lng as city_longitude
        , stg_stores.store_opened_date
        , stg_stores.store_tax_rate
        
    from stg_stores
    left join usa_cities on (usa_cities.city = stg_stores.store_city) 
    where (usa_cities.state_id in ('PA', 'IL', 'NY', 'CA', 'LA'))
)

select
    store_id
    , store_city
    , state_id
    , city_latitude
    , city_longitude
    , store_opened_date
    , store_tax_rate
    
from stores_transformation