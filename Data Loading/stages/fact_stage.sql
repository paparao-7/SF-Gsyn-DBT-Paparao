use database gsyn_db;
use role dba;

create schema gsyn_fct;

create or replace stage gsyn_stg_fct
url ='s3://gsyn-bkt-paparao/datalake-facts/'
storage_integration = gsyn_S3;

list @gsyn_stg_fct;
