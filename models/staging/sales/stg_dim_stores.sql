SELECT  store_id                as dark_store_id,               -- primary key
        city                    as dark_store_city,
        state                   as dark_store_state,
        pincode                 as dark_store_pincode,
        store_type              as dark_store_type,
        is_deleted              as is_deleted,
        insert_date             as insert_date,
        update_date             as update_date
FROM {{ source('db_src_sales', 'store_dim') }}