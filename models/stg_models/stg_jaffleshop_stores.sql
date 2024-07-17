with src_stores as
(
    select * from {{ source('jaffle_shop_src', 'stores') }}
),

stores_renamed as(
    select
        id::varchar as store_id
        , name::varchar as store_name
        , opened_at::date as store_opened_date
        , tax_rate::numeric(10, 4) as store_tax_rate
    from
        src_stores
)

select
    store_id
    , store_name
    , store_opened_date
    , store_tax_rate

from stores_renamed