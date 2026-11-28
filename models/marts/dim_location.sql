{{ config(
    materialized='table'
) }}

with location_dim as (

    select distinct
        location
    from {{ ref('stg_tickets') }}

)

select

    cast(
        dense_rank() over (
            order by location
        ) as bigint
    ) as location_sk,

    location

from location_dim