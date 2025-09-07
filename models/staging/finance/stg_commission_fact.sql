SELECT  order_id                    as order_id,
        delivery_partner_id         as delivery_partner_id,
        commission_amount           as commission_amount,
        payout_status               as delivery_partner_payout_status
FROM {{ source('db_src_finance', 'commission_fact') }}