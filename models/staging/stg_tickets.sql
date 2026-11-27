{{ config(
    materialized='view'
) }}

select
    ticket_id,
    created_date,
    employee_id,
    support_category,
    priority,
    support_engineer,
    location,
    resolution_hours,
    hourly_cost,
    ticket_status,
    total_resolution_cost,
    file_path,
    ingestion_timestamp,
    batch_id
from {{ source('tickets_source', 'silver_table') }}