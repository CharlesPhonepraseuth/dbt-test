

with validation as (

    select
        name as name

    from DEMO_DB.PUBLIC.my_first_join

),

validation_errors as (

    select
        name

    from validation

    where name = 'Switzerland'

)

select *
from validation_errors

