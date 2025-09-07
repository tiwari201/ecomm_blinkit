SELECT  product_id              as product_id,                  -- primary key
        name                    as product_name,
        brand                   as product_brand,
        category                as product_category,
        subcategory             as product_subcategory,
        is_deleted              as is_deleted,
        insert_date             as insert_date,
        update_date             as update_date
FROM {{ source('db_src_sales', 'product_dim') }}