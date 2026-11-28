{{ config(
    materialized='table'
   
) }}

with support_dim as (

    select distinct
        support_category,
        priority,
        support_engineer,
        ticket_status
    from {{ ref('stg_tickets') }}

)

select

    cast(
        dense_rank() over (
            order by
                support_category,
                priority,
                support_engineer,
                ticket_status
        ) as bigint
    ) as support_sk,

    support_category,
    priority,
    support_engineer,
    ticket_status

from support_dim