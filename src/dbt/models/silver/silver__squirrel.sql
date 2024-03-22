select squirrel_id
from {{ source('parks_n_squirrels', 'squirrels') }} 