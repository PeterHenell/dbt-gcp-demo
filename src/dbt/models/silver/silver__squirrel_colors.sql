-- resultat: squirrel_id, color_id, 'Primary|HighLight]' many to many


with squirrel_colors as (
    select squirrel_id, Primary_Fur_Color as color, 'primary' as color_type
    from {{ source('parks_n_squirrels', 'squirrels') }} 
union all
    select squirrel_id, Highlights_in_Fur_Color as color, 'highlight' as color_type
    from {{ source('parks_n_squirrels', 'squirrels') }} 
),
unnested as (
    select lower(trim(unested_color)) as color_name, squirrel_id, color_type
    from (
        SELECT SPLIT(color, ',') colarr, squirrel_id, color_type
        FROM squirrel_colors
    ) as col_arr
    cross join unnest(col_arr.colarr) as unested_color
)
select 
    u.squirrel_id,
    c.color_id,
    color_type
from unnested u
inner join {{ ref('silver__colors') }} c on c.color_name = u.color_name