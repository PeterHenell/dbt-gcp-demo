select distinct park_conditions 
from {{ source('parks_n_squirrels', 'parks') }}