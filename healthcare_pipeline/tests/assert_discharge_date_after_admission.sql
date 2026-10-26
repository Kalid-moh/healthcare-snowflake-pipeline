-- Fails if any discharge_date is earlier than admission_date
SELECT
    admission_id,
    admission_date,
    discharge_date
FROM {{ ref('fact_admissions') }}
WHERE discharge_date < admission_date
