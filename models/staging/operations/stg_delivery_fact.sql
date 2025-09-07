SELECT  order_id                        as order_id,
        delivery_partner_id             as delivery_partner_id,
        delivery_status                 as delivery_status,
        pickup_time                     as pickup_time,
        drop_time                       as drop_time,
        delivery_duration               as delivery_duration
FROM {{ source('db_src_operations', 'delivery_fact') }}