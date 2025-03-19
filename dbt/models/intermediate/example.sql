{{
    config(
        materialized = "view"
    )
}}

{{ 
    simple_cte(
        [
            ('reviews', 'stg_boardgames_reviews'),
            ('users', 'stg_boardgames_users')
        ]
    )

}} 
select 
    *
from reviews
join users
    on reviews.review_username = users.user_username