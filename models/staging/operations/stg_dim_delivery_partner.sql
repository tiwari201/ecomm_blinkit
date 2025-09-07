SELECT  partner_id              as delivery_partner_id,
        name                    as delivery_partner_name,
        contact                 as delivery_partner_contact_number,
        join_date               as delivery_partner_join_date,
        rating                  as delivery_partner_rating,
        is_deleted              as is_deleted,
        insert_date             as insert_date,
        update_date             as update_date
FROM {{ source('db_src_operations', 'delivery_partner_dim') }}