
{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        vendornumber AS vendor_number
        , vendorname AS vendor_name
        , invoicedate AS invoice_date
        , ponumber AS PO_number
        , podate AS PO_date
        , paydate AS pay_date
        , quantity
        , CAST((dollars*100) AS INT64) AS dollars
        , CAST((freight*100) AS INT64) AS freight
        , approval
    FROM
        {{ ref('InvoicePurchases12312016') }}
)

SELECT
    *
FROM
    source_data
