select distinct 
    cast(park_id as int) as park_id,
    park_name 
from {{ source('parks_n_squirrels', 'parks') }}