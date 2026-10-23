{{ config(materialized='view') }}

SELECT
    id,
    INITCAP(REGEXP_REPLACE(name, '[0-9]', '')) as patient_name,
    age,
    gender,
    blood_type,
    medical_condition,
    date_of_admission,
    doctor AS doctor_name,
    hospital AS hospital_name,
    insurance_provider,
    billing_amount,
    room_number,
    admission_type,
    discharge_date,
    medication,
    test_results,
    ingested_at
FROM {{ source('bronze', 'patient_records') }}
