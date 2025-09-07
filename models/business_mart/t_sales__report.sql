{{
  config(
    materialized = 'incremental',
    database = 'blinkit_business_marts',
    unique_key = 'sales_surrogate_key',
    incremental_strategy = 'delete+insert',
    on_schema_change = 'sync_all_columns',
    tags = ['daily','sales']
  )
}}

SELECT  sales_surrogate_key,
        customer_id,
        product_name,
        product_brand,
        product_category,
        product_subcategory,
        order_id,
        dark_store_id,
        order_time,
        total_order_amount,
        order_discount,
        payment_mode,
        max_update_date
FROM  {{ref('core_logic__sales_daily') }}

{% if is_incremental() %}
  -- (If max_update_date is NULL or the table is truncated, the condition will always be true and load all records)
where max_update_date >= (select coalesce(max(max_update_date),'2024-08-03') from {{ this }} )

{% endif %}