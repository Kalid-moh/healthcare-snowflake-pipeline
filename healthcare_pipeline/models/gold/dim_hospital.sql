{{ config(materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['hospital_name']) }} AS hospital_id,
    hospital_name
FROM {{ ref('stg_patient_records') }}
WHERE hospital_name IS NOT NULL
