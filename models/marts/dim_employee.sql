{{ config(
    materialized='table'
) }}

select
    cast(
        dense_rank() over(order by employee_id)
        as bigint
    ) as employee_sk,

    employee_id

from (
    select distinct
        employee_id
    from {{ ref('stg_tickets') }}
)