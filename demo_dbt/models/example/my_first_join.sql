{{ config(materialized='table', tags=['unique']) }}

with apple_mobility as (

    select * from {{ source('COVID19_Epidemiological_Data', 'APPLE_MOBILITY') }}

),

country_codes as (

    select * from {{ ref('country_code' ) }}

),

final as (

    select
        apple_mobility.country_region,
        country_codes.name

    from apple_mobility

    left join country_codes
        on country_codes.code = apple_mobility.ISO3166_1

)

select * from final
