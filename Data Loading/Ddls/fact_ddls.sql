use database gsyn_db;
use role dba;

create schema gsyn_fct;


CREATE OR REPLACE TABLE sales_transactions (
    order_id STRING NOT NULL ,          
    line_id STRING NOT NULL,           
    type STRING ,              
    dt TIMESTAMP_NTZ ,          
    pos_site_id STRING ,        
    sku_id STRING ,             
    fscldt_id STRING ,          
    price_substate_id STRING , 
    sales_units INT ,           
    sales_dollars DECIMAL(10,2) , 
    discount_dollars DECIMAL(10,2) , 
    original_order_id STRING,          
    original_line_id STRING,           
    PRIMARY KEY (order_id, line_id)     
);


CREATE OR REPLACE TABLE inventory_costs (
    fscldt_id STRING NOT NULL,               
    sku_id STRING NOT NULL,                  
    average_unit_standardcost DECIMAL(10,2) , 
    average_unit_landedcost DECIMAL(10,2) ,  
    PRIMARY KEY (fscldt_id, sku_id)  
);

