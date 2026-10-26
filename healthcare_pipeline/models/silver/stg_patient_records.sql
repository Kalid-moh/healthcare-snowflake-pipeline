{{ config(materialized='view') }}

SELECT *
FROM {{ source('silver', 'stg_patient_records') }}
