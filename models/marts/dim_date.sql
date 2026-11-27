{{ config(
    materialized='table'
) }}

with date_dim as (

    select distinct
        created_date
    from {{ ref('stg_tickets') }}

)

select

    cast(
        dense_rank() over (
            order by created_date
        ) as bigint
    ) as date_sk,

    created_date,

    year(created_date) as year,
    quarter(created_date) as quarter,
    monthname(created_date) as month_name,
    day(created_date) as day_of_month

from date_dim