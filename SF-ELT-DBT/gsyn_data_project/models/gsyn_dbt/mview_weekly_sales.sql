{{ 
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key=['pos_site_id', 'sku_id', 'fsclwk_id', 'price_substate_id', 'type']
    ) 
}}

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
    FROM {{ source('gsyn_fct', 'sales_transactions') }} st
    JOIN {{ source('gsyn_dim', 'fiscal_calendar') }} fc 
        ON st.fscldt_id = fc.fscldt_id

    {% if is_incremental() %}
        WHERE st.dt >= (SELECT COALESCE(MAX(dt), '1900-01-01') FROM {{ this }})
    {% endif %}

    GROUP BY st.pos_site_id, st.sku_id, fc.fsclwk_id, st.price_substate_id, st.type
)

SELECT * FROM sales
