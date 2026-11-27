{% snapshot support_ticket_snapshot %}

{{
    config(
        target_schema='dbt_dev',
        unique_key='ticket_id',
        strategy='check',
        check_cols=[
            'ticket_status',
            'priority',
            'support_engineer',
            'location'
        ]
    )
}}

select *
from {{ ref('stg_tickets') }}

{% endsnapshot %}