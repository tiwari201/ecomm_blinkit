SELECT  order_id            as order_id,                -- primary key
        product_id          as product_id,              -- foreign key to product_dim
        quantity            as item_quantity,
        item_price          as item_price
FROM {{ source('db_src_sales', 'order_items_fact') }}