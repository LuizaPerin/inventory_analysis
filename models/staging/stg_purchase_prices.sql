
{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        brand AS brand_id
        , description
        , classification
        , CAST((price*100) AS INT64) AS sell_price
        , CAST((purchaseprice*100) AS INT64) AS purchase_price
        , size
        , volume
        , vendornumber AS vendor_number
        , vendorname AS vendor_name
    FROM
        {{ source('raw-data', '2017PurchasePricesDec') }}
)

SELECT
    *
FROM
    source_data
