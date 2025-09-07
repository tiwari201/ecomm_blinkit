SELECT  user_id         as customer_id,                 -- primary key
        age             as cust_age,
        gender          as cust_gender,
        location        as cust_city,
        signup_date     as cust_onboarding_date,
        is_deleted      as is_deleted,
        insert_date     as insert_date,
        update_date     as update_date
FROM {{ source('db_src_sales', 'customer_dim') }}