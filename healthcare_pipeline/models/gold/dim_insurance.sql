{{ config(materialized='table') }}

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['insurance_provider']) }} AS insurance_id,
    insurance_provider AS provider_name
FROM {{ ref('stg_patient_records') }}
WHERE insurance_provider IS NOT NULL
