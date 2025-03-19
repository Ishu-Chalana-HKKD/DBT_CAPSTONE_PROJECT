with final as (

    select
        country_code,
        country_name

    from {{ ref('country_codes_users_ref') }}

)

select * from final