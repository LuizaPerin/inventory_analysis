
{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        inventoryid AS inventory_id
        , store
        , brand
        , description
        , size
        , salesquantity AS sales_quantity
        , CAST((salesdollars*100) AS INT64) AS sales_dollars
        , CAST((salesprice*100) AS INT64) AS sales_price
        , PARSE_DATE('%m/%d/%Y', salesdate) AS sales_date
        , volume
        , classification
        , CAST((excisetax*100) AS INT64) AS excise_tax
        , vendorno AS vendor_number
        , vendorname AS vendor_name
    FROM
        {{ ref('SalesFINAL12312016') }}
)

SELECT
    *
FROM
    source_data
