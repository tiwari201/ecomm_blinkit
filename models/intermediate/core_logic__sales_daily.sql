with ini_data as 
(
SELECT MD5(CONCAT(dim_customer.customer_id,agg_orders.order_id, agg_orders.order_time)) as sales_surrogate_key, -- surrogate key for testing
       dim_customer.customer_id,
       dim_products.product_name,
       dim_products.product_brand,
       dim_products.product_category,
       dim_products.product_subcategory,
       agg_orders.order_id,
       agg_orders.dark_store_id,
       agg_orders.order_time,
       agg_orders.total_order_amount,
       agg_orders.order_discount,
       agg_orders.payment_mode,
       GREATEST(dim_customer.update_date, dim_products.update_date, dim_stores.update_date) AS max_update_date
FROM {{ ref('stg_dim_customer') }} AS dim_customer
LEFT JOIN {{ref('stg_orders_agg_fact') }} AS agg_orders
    ON dim_customer.customer_id = agg_orders.customer_id
LEFT JOIN {{ref('stg_dim_products') }} AS dim_products
    ON dim_products.product_id = agg_orders.product_id
LEFT JOIN {{ ref('stg_dim_stores') }} AS dim_stores
    ON dim_stores.dark_store_id = agg_orders.dark_store_id
)

select *
from ini_data 
