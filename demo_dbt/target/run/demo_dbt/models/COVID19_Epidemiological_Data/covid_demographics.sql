
  create or replace  view DEMO_DB.PUBLIC.covid_demographics
  
   as (
    with pop as (
    select * from COVID19_Epidemiological_Data.PUBLIC.DEMOGRAPHICS
),

final as (
    select * from pop
)

select * from final
  );
