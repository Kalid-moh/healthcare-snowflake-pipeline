-- Fails if any billing amount is negative
SELECT
    admission_id,
    billing_amount
FROM {{ ref('fact_admissions') }}
WHERE billing_amount < 0
