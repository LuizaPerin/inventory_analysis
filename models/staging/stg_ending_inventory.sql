
{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        inventoryid AS inventory_id
        , store
        , city
        , brand
        , description
        , size
        , onhand AS on_hand
        , CAST((price*100) AS INT64) AS price
        ,enddate AS end_date
    FROM
        {{ source('raw-data', 'EndInvFINAL12312016') }}
)

SELECT
    *
FROM
    source_data
