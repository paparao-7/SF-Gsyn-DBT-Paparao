use role accountadmin;

--storage integration for data access from aws s3 to snowflake
create storage integration gsyn_s3
type = external_stage
storage_provider = s3
enabled= true
storage_aws_role_arn = 'arn:aws:iam::121099482063:role/gsyn-sf-paparao'
storage_allowed_locations = ('s3://gsyn-bkt-paparao');

show integrations;

desc integration gsyn_s3;

grant usage on integration gsyn_s3 to role dba; 