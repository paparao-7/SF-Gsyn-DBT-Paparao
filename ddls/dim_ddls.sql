use database gsyn_db;
create schema gsyn_dim;
use schema gsyn_dim;


    

CREATE OR REPLACE TABLE stores (
    str STRING NOT NULL PRIMARY KEY,     
    str_label STRING,           
    dstr STRING,                        
    dstr_label STRING,                  
    rgn STRING,                         
    rgn_label STRING                      
);



CREATE OR REPLACE TABLE product_catalog (
    sku_id STRING NOT NULL PRIMARY KEY,
    sku_label STRING,
    stylclr_id STRING,
    stylclr_label STRING,
    styl_id STRING,
    styl_label STRING,
    subcat_id INT,
    subcat_label STRING,
    cat_id INT,
    cat_label STRING,
    dept_id INT,
    dept_label STRING,
    issvc BOOLEAN,
    isasmbly BOOLEAN,
    isnfs BOOLEAN
);


CREATE OR REPLACE TABLE pricing_states (
    substate_id STRING NOT NULL PRIMARY KEY, 
    substate_label STRING ,         
    state_id STRING ,               
    state_label STRING               
);



CREATE OR REPLACE TABLE sales_channels (
    site_id STRING NOT NULL PRIMARY KEY,   
    site_label STRING ,          
    subchnl_id STRING ,            
    subchnl_label STRING ,        
    chnl_id STRING,               
    chnl_label STRING         
);



CREATE OR REPLACE TABLE inventory_status (
    code_id STRING NOT NULL PRIMARY KEY,   
    code_label STRING ,          
    bckt_id STRING ,             
    bckt_label STRING ,           
    ownrshp_id STRING ,           
    ownrshp_label STRING        
);


CREATE OR REPLACE TABLE inventory_locations (
    loc STRING NOT NULL PRIMARY KEY,  
    loc_label STRING ,        
    loctype STRING ,           
    loctype_label STRING 
);



CREATE OR REPLACE TABLE holidays (
    hldy_id STRING NOT NULL PRIMARY KEY,   
    hldy_label STRING            
);


CREATE OR REPLACE TABLE fiscal_calendar (
    fscldt_id STRING NOT NULL PRIMARY KEY,  
    fscldt_label STRING ,           
    fsclwk_id STRING ,              
    fsclwk_label STRING ,           
    fsclmth_id STRING ,             
    fsclmth_label STRING ,          
    fsclqrtr_id STRING ,            
    fsclqrtr_label STRING ,         
    fsclyr_id STRING ,              
    fsclyr_label STRING ,          
    ssn_id STRING,                          
    ssn_label STRING,                      
    ly_fscldt_id STRING,                    
    lly_fscldt_id STRING,                   
    fscldow INT,                            
    fscldom INT,                           
    fscldoq INT,                            
    fscldoy INT,                           
    fsclwoy INT,                            
    fsclmoy INT,                            
    fsclqoy INT,                           
    date DATE                      
);







