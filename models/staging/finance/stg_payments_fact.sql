SELECT  order_id                as order_id, -- Primary key added for dbt
        user_id                 as customer_id,
        total_amount            as total_order_amount,
        payment_mode            as payment_mode,
        payment_id              as transaction_id,
        payment_status          as payment_status,
        current_timestamp()      as dbt_updated_at
FROM {{ source('db_src_finance', 'payment_fact') }}