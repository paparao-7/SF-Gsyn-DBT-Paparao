use database gsyn_db;
use role dba;

create schema gsyn_fct;


list @gsyn_stg_fct;

create or replace file format csv_gzip_fct
type = 'csv',
field_delimiter = '|',
skip_header = 1,
compression = 'gzip';

----copying to sales_transactions table

copy into sales_transactions
from  @gsyn_stg_fct/fact.transactions.dlm.gz
file_format = csv_gzip_fct;

----copying to inventory_costs table

copy into inventory_costs
from  @gsyn_stg_fct/fact.averagecosts.dlm.gz
file_format = csv_gzip_fct;
