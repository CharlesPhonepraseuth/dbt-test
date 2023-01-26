

with source_data as (
    select
        t.$1::varchar as artistId,
        t.$2::varchar as name,
        t.$3::varchar as birthYear,
        t.$4::varchar as country
    from @s3_data/Artist (file_format => classic_csv) t
)

select *
from source_data