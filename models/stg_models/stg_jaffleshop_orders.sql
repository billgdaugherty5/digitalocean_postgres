with orders_src as
(
    select * from {{ source('jaffle_shop_src', 'orders') }}
), 

orders_renamed as
(
    select
        id::varchar as order_id
        , customer::varchar as customer_id
        , ordered_at::timestamp as ordered_at
        , store_id::varchar as store_id
        , subtotal::int as order_subtotal
        , tax_paid::int as order_tax_paid
        , order_total::int as order_total

    from orders_src
)

select 
    order_id
    , customer_id
    , ordered_at
    , store_id
    , order_subtotal
    , order_tax_paid
    , order_total
    
from orders_renamed