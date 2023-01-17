
  create or replace  view DEMO_DB.PUBLIC.my_for_loop
  
   as (
    select
count(case when name = 'France' then name end) as France_amount,
count(case when name = 'Spain' then name end) as Spain_amount,
count(case when name = 'Germany' then name end) as Germany_amount,
count(case when name = 'United States' then name end) as United_States_amount
from DEMO_DB.PUBLIC.country_codes
  );
