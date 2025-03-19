with final as (

    select
        game_id as boardgame_id,
        case
            when designers = '0' then '{{ var("unknown") }}'
            else designers
        end as designer_name

    from {{ source('boardgame', 'designers') }}

)

select * from final