# Welcome to your new dbt project!

## Using the starter project

- Copy paste `profiles_example.yml` to `.dbt/profiles.yml` and modify informations

- Then create s3 stage and file format directly into snowflake

```sql
create stage s3_data
    url = 's3://mc-snowflake/sample/'
    credentials = (aws_key_id='[AWS_KEY_ID]',
                   aws_secret_key='[AWS_SECRET_KEY]');

CREATE FILE FORMAT CLASSIC_CSV;

ALTER FILE FORMAT "DEMO_DB"."PUBLIC".CLASSIC_CSV 
SET COMPRESSION = 'AUTO' 
RECORD_DELIMITER = '\n'
FIELD_DELIMITER = ',' 
SKIP_HEADER = 1 
DATE_FORMAT = 'AUTO' 
TIMESTAMP_FORMAT = 'AUTO'
FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE'
TRIM_SPACE = FALSE
ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE 
ESCAPE = 'NONE' 
ESCAPE_UNENCLOSED_FIELD = '\134' 
NULL_IF = ('\\N');
```

Check connection with data warehouse:
- `dbt debug`

Use seeder files:
- `dbt seed`

To compile file:
- `dbt build`

Try running the following commands:
- `dbt run`
- `dbt test`


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
