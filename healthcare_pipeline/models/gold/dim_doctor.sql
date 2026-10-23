{{ config(materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['doctor_name']) }} AS doctor_id,
    doctor_name
FROM {{ ref('stg_patient_records') }}
WHERE doctor_name IS NOT NULL