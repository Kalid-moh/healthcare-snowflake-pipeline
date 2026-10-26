{{ config(materialized='table') }}

SELECT 
    id AS patient_id,
    patient_name AS name,
    age,
    gender,
    blood_type
FROM {{ ref('dim_patient_snapshot') }}
WHERE dbt_valid_to is null
