select 
    *
from {{ ref('rankings') }}
where "Year" > 2020