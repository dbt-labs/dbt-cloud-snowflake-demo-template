/* This model is an example of a non-transient Snowflake model. By default, dbt creates all objects in Snowflake as transient to 
save on storage costs. Non-transient Snowflake objects store the history of the table which is unnecessary when your models 
as idempotent (https://discourse.getdbt.com/t/understanding-idempotent-data-transformations/518)

Full documentation: https://docs.getdbt.com/reference/resource-configs/snowflake-configs#transient-tables

*/


{{
    config(
        materialized = 'table',
        transient=false
    )
}}

with customer as (

    select * from {{ ref('stg_tpch_customers') }}

),
nation as (

    select * from {{ ref('stg_tpch_nations') }}
),
region as (

    select * from {{ ref('stg_tpch_regions') }}

),
final as (
    select 
        customer.customer_key,
        customer.name,
        customer.address,
        {# nation.nation_key as nation_key, #}
        nation.name as nation,
        {# region.region_key as region_key, #}
        region.name as region,
        customer.phone_number,
        customer.account_balance,
        customer.market_segment
        -- new column
    from
        customer
        inner join nation
            on customer.nation_key = nation.nation_key
        inner join region
            on nation.region_key = region.region_key
)
select 
    *
from
    final
order by
    customer_key