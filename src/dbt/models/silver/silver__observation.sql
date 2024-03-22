select area_id, park_id, squirrel_id, Squirrel_Latitude__DD_DDDDDD_ as latitude, Squirrel_Longitude___DD_DDDDDD_ as longitude
from {{ source('parks_n_squirrels', 'squirrels') }}