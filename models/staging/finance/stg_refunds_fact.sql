SELECT  refund_id                   as refund_id, -- Primary key, unique and not null
        order_id                    as order_id, -- Foreign key
        amount_refunded             as amount_refunded,
        refund_reason               as refund_reason,
        current_timestamp()          as dbt_updated_at
FROM {{ source('db_src_finance', 'refunds_fact') }}