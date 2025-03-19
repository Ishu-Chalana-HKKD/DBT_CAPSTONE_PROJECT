with final as (

    select
        user as review_username,
        id as boardgame_id,
        cast(rating as int) as review_rating

    from {{ source('boardgame', 'reviews') }}


)

select * from final