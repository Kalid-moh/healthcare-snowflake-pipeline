{{ config(materialized='table') }}

SELECT DISTINCT
    id AS patient_id,
    patient_name AS name,
    age,
    gender,
    blood_type
FROM {{ ref('stg_patient_records') }}
WHERE id IS NOT NULL
