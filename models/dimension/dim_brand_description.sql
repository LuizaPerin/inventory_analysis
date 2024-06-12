WITH

source_data AS (
    SELECT
        distinct brand
        , description
    FROM
        {{ ref('int_purchases_sales_merge') }}
)

SELECT
    *
FROM
    source_data
ORDER BY
    brand
