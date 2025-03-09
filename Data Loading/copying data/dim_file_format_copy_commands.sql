use database gsyn_db;
create schema gsyn_dim;
use schema gsyn_dim;

show integrations;

desc integration GSYN_S3   ;

--External Stage 

list @gsyn_stg_dim;

create or replace file format csv_gzip_dim
    TYPE = 'CSV',
    FIELD_DELIMITER = '|',
    SKIP_HEADER = 1,
    COMPRESSION = 'GZIP';
    
----copying to stores table

COPY INTO stores
FROM @gsyn_stg_dim/hier.rtlloc.dlm.gz
FILE_FORMAT = csv_gzip_dim;

----copying to product_catalog table

COPY INTO product_catalog
FROM @gsyn_stg_dim/hier.prod.dlm.gz
FILE_FORMAT  = csv_gzip_dim;

----copying to pricing_states table

COPY INTO pricing_states
FROM @gsyn_stg_dim/hier.pricestate.dlm.gz
--PATTERN = '.*hier.*[.]dlm[.]gz'
FILE_FORMAT = csv_gzip_dim;

----copying to sales_channels table

COPY INTO sales_channels
FROM @gsyn_stg_dim/hier.possite.dlm.gz
FILE_FORMAT = csv_gzip_dim ;

----copying to inventory_status table

COPY INTO inventory_status
FROM @gsyn_stg_dim/hier.invstatus.dlm.gz
FILE_FORMAT = csv_gzip_dim;

----copying to inventory_locations table

COPY INTO inventory_locations
FROM @gsyn_stg_dim/hier.invloc.dlm.gz
FILE_FORMAT =csv_gzip_dim;

----copying to holidays table

copy into holidays 
from @gsyn_stg_dim/hier.hldy.dlm.gz
file_format = csv_gzip_dim;

----copying to fiscal_calendar table

copy into fiscal_calendar 
from @gsyn_stg_dim/hier.clnd.dlm.gz
file_format = csv_gzip_dim;






