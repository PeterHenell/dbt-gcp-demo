select distinct area_id, area_name from {{ source('parks_n_squirrels', 'parks') }}