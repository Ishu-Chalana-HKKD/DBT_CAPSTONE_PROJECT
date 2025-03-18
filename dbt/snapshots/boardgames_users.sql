{% snapshot users %}

{{
    config(
      target_schema='DBT_KBhatia',
      unique_key='_line',
      strategy='check',
      check_cols = 'all'
    )
}}

select 
    _line,
    users,
    url,
    country,
    _fivetran_synced
 
from {{ source('boardgame', 'users') }}

{% endsnapshot %}