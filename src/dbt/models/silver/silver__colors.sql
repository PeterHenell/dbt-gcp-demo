with colors as (
    select Primary_Fur_Color as color 
    from {{ source('parks_n_squirrels', 'squirrels') }} 

union all

    select Highlights_in_Fur_Color as color 
    from {{ source('parks_n_squirrels', 'squirrels') }} 
),
unnested as (
    select trim(unested_color) as color_name
    from (
        SELECT SPLIT(color, ',') colarr
        FROM colors
    ) as col_arr
    cross join unnest(col_arr.colarr) as unested_color
)
, unique_colors as (
    select distinct 
        color_name
    from unnested 
    where color_name is not null
)

select 
    row_number() over (order by color_name) as color_id,
    lower(color_name) as color_name
from unique_colors