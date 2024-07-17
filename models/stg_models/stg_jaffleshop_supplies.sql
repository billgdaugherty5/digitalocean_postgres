with supplies_src as
(
    select * from {{ source('jaffle_shop_src', 'supplies') }}
),

supplies_renamed as
(
    select
        id::varchar as supply_id
        , name::varchar as supply_name
        , cost::int as supply_cost
        , perishable::varchar as perishable
        , sku::varchar as supply_sku

    from supplies_src
)
select
    supply_id
    , supply_name
    , supply_cost
    , perishable
    , supply_sku

from supplies_renamed