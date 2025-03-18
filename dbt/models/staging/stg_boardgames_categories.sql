
with final as (

    select
        game_id as boardgame_id,
        case
            when categories = '0' then '{{ var("unknown") }}'
            else categories
        end as category_name

    from {{ source('boardgame', 'categories') }}

)

select * from final