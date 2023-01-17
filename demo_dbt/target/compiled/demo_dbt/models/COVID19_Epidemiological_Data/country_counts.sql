select
count(case when name = 'France' then name end) as France_amount,
count(case when name = 'Spain' then name end) as Spain_amount,
count(case when name = 'Germany' then name end) as Germany_amount,
count(case when name = 'United States' then name end) as United_States_amount
from 'country_count'