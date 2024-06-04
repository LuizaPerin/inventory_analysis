WITH

source_data AS (
    SELECT
        MAX(lead_time) AS max_lead_time
        , MIN(lead_time) AS min_lead_time
        , AVG(lead_time) AS avg_lead_time
    FROM
        {{ ref('int_lead_time') }}
)

SELECT
    *
FROM
    source_data
