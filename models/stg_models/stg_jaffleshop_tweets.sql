with tweets_src as
(
    select * from {{ source('jaffle_shop_src', 'tweets') }}
),

tweets_renamed as
(
    select
        id::varchar as tweet_id
        , user_id::varchar as user_id
        , tweeted_at::varchar as tweeted_at
        , content::varchar as tweet_content

    from tweets_src
)

select
    tweet_id
    , user_id
    , tweeted_at
    , tweet_content

from tweets_renamed