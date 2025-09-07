SELECT  order_id                                as order_id,                    -- primary key
        user_id                                 as customer_id,                 -- foreign key to customer_dim
        product_id                              as product_id,                  -- foreign key to product_dim
        store_id                                as dark_store_id,               -- foreign key to store_dim
        CAST(order_time AS DATETIME)            as order_time,
        total_amount                            as total_order_amount,
        discount                                as order_discount,
        payment_mode                            as payment_mode
FROM {{ source('db_src_sales', 'orders_fact') }}