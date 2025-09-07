SELECT  refund_id                   as refund_id,
        order_id                    as order_id,
        amount_refunded             as amount_refunded,
        refund_reason               as refund_reason
FROM {{ source('db_src_finance', 'refunds_fact') }}