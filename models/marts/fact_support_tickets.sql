{{ config(
    materialized='table'
) }}

select

    s.ticket_id,

    d.date_sk,

    e.employee_sk,

    l.location_sk,

    sp.support_sk,

    s.resolution_hours,

    s.hourly_cost,

    s.total_resolution_cost,

    s.batch_id,

    s.ingestion_timestamp

from {{ ref('stg_tickets') }} s

inner join {{ ref('dim_employee') }} e
    on s.employee_id = e.employee_id

inner join {{ ref('dim_location') }} l
    on s.location = l.location

inner join {{ ref('dim_support') }} sp
    on s.support_category = sp.support_category
   and s.priority = sp.priority
   and s.support_engineer = sp.support_engineer
   and s.ticket_status = sp.ticket_status

inner join {{ ref('dim_date') }} d
    on s.created_date = d.created_date