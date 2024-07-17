with src_customers as
(
    select * from {{ source('jaffle_shop_src', 'customers') }}
),

customers_renamed as
(
    select
        id::varchar as customer_id
        , name::varchar as customer_name

    from src_customers    
)

select
    customer_id
    , customer_name

from customers_renamed