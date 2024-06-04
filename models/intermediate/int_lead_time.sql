WITH

source_data AS (
    SELECT
        brand
        , description
        , DATE_DIFF(receving_date, PO_date, DAY) AS lead_time
        , DATE_DIFF (invoice_date, receving_date, DAY) AS invoice_process_time
        , DATE_DIFF(pay_date, invoice_date, DAY) AS payment_time
        , DATE_DIFF(pay_date ,PO_date, DAY) AS total_process_time
    FROM
        {{ ref('stg_purchases') }}
)

SELECT
    *
FROM
    source_data
