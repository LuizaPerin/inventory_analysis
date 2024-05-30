
{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        InventoryId AS invetory_id
        , store
        , brand
        , description
        , size
        , vendornumber AS vendor_number
        , vendorname AS vendor_name
        , ponumber AS PO_number
        , podate AS PO_date
        , ReceivingDate AS receving_date
        , InvoiceDate AS invoice_date
        , PayDate AS pay_date
        , CAST((PurchasePrice*100) AS INT64) AS purchase_price
        , quantity
        , CAST((dollars*100) AS INT64) dollars
        , classification
    FROM
        {{ source('raw-data', 'PurchasesFINAL') }}
)

SELECT
    *
FROM
    source_data
