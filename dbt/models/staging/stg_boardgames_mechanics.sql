with final as (

    select
        game_id as boardgame_id,
        case
            when mechanics = '0' then 'Unknown'
            else mechanics
        end as mechanic_name

    from {{source('boardgame','mechanics')}}

)

select * from final