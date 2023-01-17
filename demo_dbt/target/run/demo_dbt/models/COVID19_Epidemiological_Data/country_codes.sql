
  create or replace  view DEMO_DB.PUBLIC.country_codes
  
   as (
    with demographics as (
    select * from COVID19_Epidemiological_Data.PUBLIC.DEMOGRAPHICS
),
country_codes as (
    select * from DEMO_DB.PUBLIC.country_code
),
final as (
    select
        demographics.total_population,
        country_codes.name
    from demographics
    left join country_codes
        on country_codes.code = demographics.ISO3166_1
)
select * from final
  );
