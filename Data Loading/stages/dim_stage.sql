use database gsyn_db;
create schema gsyn_dim;
use schema gsyn_dim;

create or replace stage gsyn_stg_dim
url = 's3://gsyn-bkt-paparao/datalake/'
storage_integration = GSYN_S3;
