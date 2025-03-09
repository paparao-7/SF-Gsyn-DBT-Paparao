
  
    

        create or replace transient table gsyn_db.gsyn_dbt.mview_weekly_sales
         as
        (

WITH sales AS (
    SELECT 
        st.pos_site_id,
        st.sku_id,
        fc.fsclwk_id,
        st.price_substate_id,
        st.type,
        SUM(st.sales_units) AS total_sales_units,
        SUM(st.sales_dollars) AS total_sales_dollars,
        SUM(st.discount_dollars) AS total_discount_dollars
    FROM gsyn_db.gsyn_fct.sales_transactions st
    JOIN gsyn_db.gsyn_dim.fiscal_calendar fc 
        ON st.fscldt_id = fc.fscldt_id

    

    GROUP BY st.pos_site_id, st.sku_id, fc.fsclwk_id, st.price_substate_id, st.type
)

SELECT * FROM sales
        );
      
  