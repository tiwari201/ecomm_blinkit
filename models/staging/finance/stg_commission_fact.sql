SELECT  order_id                    as order_id,  -- Primary Key added for dbt
        delivery_partner_id         as delivery_partner_id,
        commission_amount           as commission_amount,
        payout_status               as delivery_partner_payout_status,
        current_timestamp()          as dbt_updated_at,
        null as placeholdeer_column -- Placeholder column to ensure at least one transformation
FROM {{ source('db_src_finance', 'commission_fact') }}