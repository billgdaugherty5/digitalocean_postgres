with src_items as
(
    select * from {{ source('jaffle_shop_src', 'items') }}
),

items_renamed as
(
    select
        id::varchar as item_id
        , order_id::varchar as order_id
        , sku::varchar as item_sku
    from src_items
)

select 
    item_id
    , order_id
    , item_sku

from items_renamed