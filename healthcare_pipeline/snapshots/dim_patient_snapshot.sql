{% snapshot dim_patient_snapshot %}

{{
    config(
      target_database='HEALTHCARE_DB',
      target_schema='snapshots',
      unique_key='id',

      strategy='check',
      check_cols=['patient_name', 'age', 'gender', 'blood_type']
    )
}}

SELECT
    id,
    patient_name,
    age,
    gender,
    blood_type
FROM {{ source('silver', 'stg_patient_records') }}

{% endsnapshot %}
