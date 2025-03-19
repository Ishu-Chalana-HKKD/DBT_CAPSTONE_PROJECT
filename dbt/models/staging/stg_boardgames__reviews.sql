with final as (

    select
        user as review_username,
        id as boardgame_id,
        round(
            cast(
                case
                    when cast(rating as float) < 1 then 1
                    else rating
                end as int
            ), 0
        ) as review_rating

    from {{ source('boardgame', 'reviews') }}

)

select * from final