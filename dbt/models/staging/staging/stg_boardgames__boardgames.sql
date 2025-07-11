with

boardgames as (

    select * from {{ source('boardgame', 'boardgames') }}

),

final as (

    select
        game_id as boardgame_id,
        name as boardgame_name,
        case
            when type = 'boardgame' then '{{ var("boardgame_type") }}'
            else 'not boardgame'
        end as boardgame_type,
        cast (
            case
                when rating = 'nan' then '{{ var("min_accepted_num") }}'
                when rating = 0 then '{{ var("min_accepted_num") }}'
                else rating
            end as float
        ) as boardgame_avg_rating,
        cast (
            case
                when weight = 'nan' then '{{ var("min_accepted_num") }}'
                when weight = 0 then '{{ var("min_accepted_num") }}'
                else weight
            end as float
        ) as boardgame_avg_weight,
        year_published as boardgame_year_published,
        case
            when min_players = 0 then '{{ var("min_accepted_num") }}'
            else min_players
        end as boardgame_min_players,
        case
            when max_players = 0 then '{{ var("min_accepted_num") }}'
            else max_players
        end as boardgame_max_players,
        case
            when min_play_time = 0 then '{{ var("min_accepted_num") }}'
            else min_play_time
        end as boardgame_min_play_time_in_mins,
        case
            when max_play_time = 0 then '{{ var("min_accepted_num") }}'
            else max_play_time
        end as boardgame_max_play_time_in_mins,
        case
            when min_age = 0 then '{{ var("min_accepted_num") }}'
            else min_age
        end as boardgame_min_age,
        cast(owned_by as int) as boardgame_total_owners

    from boardgames

)

select * from final
