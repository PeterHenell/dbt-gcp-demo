select obs.*, park.park_name, area.area_name,
    -- lat 40.748817, long -73.985428 -- location of empire state building
    case when exists (
        select 1 from {{ ref('silver__squirrel_colors') }} sc
        inner join {{ ref('silver__colors') }} col on col.color_id = sc.color_id
        where squirrel_id = obs.squirrel_id and col.color_name = 'gray'
    ) then true else false end as is_gray,
     case when exists (
        select 1 from {{ ref('silver__squirrel_colors') }} sc
        inner join {{ ref('silver__colors') }} col on col.color_id = sc.color_id
        where squirrel_id = obs.squirrel_id and col.color_name = 'cinnamon'
    ) then true else false end as is_cinnamon,
    case when exists (
        select 1 from {{ ref('silver__squirrel_colors') }} sc
        inner join {{ ref('silver__colors') }} col on col.color_id = sc.color_id
        where squirrel_id = obs.squirrel_id and col.color_name = 'black'
    ) then true else false end as is_black
from {{ ref('silver__observation') }} obs
inner join {{ ref('silver__squirrel') }} sq on sq.squirrel_id = obs.squirrel_id
inner join {{ ref('silver__park') }} park on park.park_id = obs.park_id
inner join {{ ref('silver__area') }} area on area.area_id = obs.area_id
