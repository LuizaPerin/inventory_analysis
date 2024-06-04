WITH

source_data AS (
    SELECT
        brand,
        description
        , MAX(lead_time) AS max_lead_time
        , MIN(lead_time) AS min_lead_time
        , AVG(lead_time) AS avg_lead_time
    FROM
        {{ ref('int_lead_time') }}
    GROUP BY
        brand, description
)

SELECT
    *
FROM
    source_data
