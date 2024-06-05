WITH

source_data AS (
    SELECT
        purchases.inventory_id
        , purchases.store
        , purchases.brand
        , purchases.description
        , purchases.size
        , sales.sales_quantity
        , sales.sales_price
        , purchases.purchase_price
    FROM
        {{ ref('stg_purchases') }} AS purchases
    LEFT JOIN
        {{ ref('stg_sales') }} AS sales
        ON
            purchases.inventory_id=sales.inventory_id and purchases.store=sales.store
)

SELECT
    *
FROM
    source_data
