{{ config(materialized='table', tags=['unique']) }}

with artist_csv as (
    select
        t.$1::integer as artistId,
        t.$2::varchar as name,
        t.$3::integer as birthYear,
        t.$4::varchar as country
    from @s3_data/Artist (file_format => classic_csv) t
),

album_csv as (
    select
        t.$1::integer as albumId,
        t.$2::varchar as title,
        t.$3::integer as artistId,
        t.$4::integer as productionYear,
        t.$5::integer as CD_number
    from @s3_data/Album (file_format => classic_csv) t
),

final as (
    select
        album.albumId,
        album.title,
        album.productionYear,
        artist.artistId,
        artist.name,
        artist.birthYear,
        artist.country
    from artist_csv as artist
    join album_csv as album on artist.artistId = album.artistId
)

select *
from final
