{{ config(materialized='table') }}

SELECT 
    {{ dbt_utils.generate_surrogate_key(['id', 'date_of_admission']) }} AS admission_id,
    id AS patient_id,
    {{ dbt_utils.generate_surrogate_key(['doctor_name']) }} AS doctor_id,
    {{ dbt_utils.generate_surrogate_key(['hospital_name']) }} AS hospital_id,
    {{ dbt_utils.generate_surrogate_key(['insurance_provider']) }} AS insurance_id,
    date_of_admission AS admission_date,
    discharge_date,
    billing_amount,
    room_number,
    admission_type,
    medical_condition,
    medication,
    test_results
FROM {{ ref('stg_patient_records') }}
