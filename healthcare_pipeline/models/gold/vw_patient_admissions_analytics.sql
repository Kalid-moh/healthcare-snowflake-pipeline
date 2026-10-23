{{ config(
    materialized='view',
    schema='gold'
) }}

SELECT
    -- Identifiers
    f.admission_id,
    f.patient_id,

    -- Patient Demographics
    p.name AS patient_name,
    p.age AS patient_age,
    p.gender AS patient_gender,
    p.blood_type,

    -- Facility & Provider Details
    d.doctor_name,
    h.hospital_name,
    i.provider_name AS insurance_provider,

    -- Admission & Clinical Details
    f.admission_date,
    f.discharge_date,
    DATEDIFF('day', f.admission_date, f.discharge_date) AS length_of_stay_days,
    f.admission_type,
    f.room_number,
    f.medical_condition,
    f.medication,
    f.test_results,

    -- Financial Metrics
    ROUND(f.billing_amount, 2) AS billing_amount

FROM {{ ref('fact_admissions') }} f
LEFT JOIN {{ ref('dim_patient') }} p
    ON f.patient_id = p.patient_id
LEFT JOIN {{ ref('dim_doctor') }} d
    ON f.doctor_id = d.doctor_id
LEFT JOIN {{ ref('dim_hospital') }} h
    ON f.hospital_id = h.hospital_id
LEFT JOIN {{ ref('dim_insurance') }} i
    ON f.insurance_id = i.insurance_id
