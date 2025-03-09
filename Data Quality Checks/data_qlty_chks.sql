use database gsyn_db;
use schema gsyn_dim;
use role dba;

show tables;



----dimesions dupliacte checks


select str, count(*) from stores group by str having count(*) > 1;

select substate_id,count(*) from pricing_states group by substate_id having count(*) >1;

select code_id,count(*) from inventory_status group by code_id having count(*) >1;

select loc,count(*) from inventory_locations group by loc having count(*) >1;

select hldy_id,count(*) from holidays group by hldy_id having count(*) >1;

select sku_id,count(*) from product_catalog group by sku_id having count(*) >1;

select site_id,count(*) from sales_channels group by site_id having count(*) >1;

select fscldt_id,count(*) from fiscal_calendar group by fscldt_id having count(*) >1;


----not null check 


select * from stores where str  is null;

select * from pricing_states where substate_id is null;

select * from inventory_status where code_id  is null;

select * from inventory_locations where loc  is null;

select * from holidays where hldy_id  is null;

select * from product_catalog where sku_id  is null;

select * from sales_channels where site_id  is null;

select * from fiscal_calendar where fscldt_id  is null;


----reference cheks 
select * from gsyn_fct.sales_transactions
where pos_site_id in (select site_id from sales_channels);

select * from gsyn_fct.sales_transactions
where sku_id in (select sku_id from product_catalog);


select * from gsyn_fct.sales_transactions
where fscldt_id  in (select fscldt_id  from fiscal_calendar );


select * from gsyn_fct.sales_transactions
where price_substate_id   in (select substate_id  from pricing_states  );


---final dbt model 

select pos_site_id,sku_id,fsclwk_id,price_substate_id,type,count(*) from mview_weekly_sales
group by 1,2,3,4,5 having count(*) >1;

--not null check 


select * from mview_weekly_sales
where 
pos_site_id is null or
sku_id is null or
fsclwk_id is null or
price_substate_id is null or
type is null ;






