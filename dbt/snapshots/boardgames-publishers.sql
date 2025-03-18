{% snapshot publishers_snapshot %}

{{
    config(
      target_schema='DBT_ICHALANA', 
      unique_key='game_id',              
      strategy='check',            
      check_cols='all'    
    )
}}

select 
    _line,
    game_id             
   

from {{ source('boardgame', 'publishers') }}

{% endsnapshot %}
