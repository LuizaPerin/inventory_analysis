WITH

source_data AS (
    SELECT
        brand
        , AVG(purchase_price) as cost_per_unit
        , AVG(sales_price) as profit_per_unit
        , SUM(sales_quantity) as demand
    FROM
        {{ ref('int_purchases_sales_merge') }}
    GROUP BY
        brand, description
)

SELECT
    *
FROM
    source_data
