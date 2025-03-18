with final as (

    select
        game_id as boardgame_id,
        case
            when publishers = '0' then 'Unknown'
            else publishers
        end as publisher_name

    from {{source('boardgame','publishers')}}

)

select * from final