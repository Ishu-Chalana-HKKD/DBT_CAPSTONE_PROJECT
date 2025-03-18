with final as (
    select
        game_id as boardgame_id,
        case
            when artists = '0' then 'Unknown'
            else artists
        end as artist_name
    from {{source('boardgame','artists') }}
)
select * from final