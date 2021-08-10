/* This model is an example of an incremental model. It defaults to the Snowflake merge behavior (https://docs.getdbt.com/reference/resource-configs/snowflake-configs#merge-behavior-incremental-models)
when it is rebuilding only the latest roles.

Full documentation: https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models

*/


{{
    config(
        materialized = 'incremental',
        unique_key = 'order_key',
        tags=['finance']
    )
}}

with orders as (
    
    select * from {{ ref('stg_tpch_orders') }} 

),
order_item as (
    
    select * from {{ ref('order_items') }}

),
order_item_summary as (

    select 
        order_key,
        sum(gross_item_sales_amount) as gross_item_sales_amount,
        sum(item_discount_amount) as item_discount_amount,
        sum(item_tax_amount) as item_tax_amount,
        sum(net_item_sales_amount) as net_item_sales_amount
    from order_item
    group by
        1
),
final as (

    select 

        orders.order_key, 
        orders.order_date,
        orders.customer_key,
        orders.status_code,
        orders.priority_code,
        orders.clerk_name,
        orders.ship_priority,
                
        1 as order_count,                
        order_item_summary.gross_item_sales_amount,
        order_item_summary.item_discount_amount,
        order_item_summary.item_tax_amount,
        order_item_summary.net_item_sales_amount
    from
        orders
        inner join order_item_summary
            on orders.order_key = order_item_summary.order_key
)
select 
    *
from
    final

  where order_date = '1992-02-01'

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run. Incremental models can be used to only rebuild the defined latest rows without rebuilding the entire table. 
  -- full documentation: https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models#understanding-the-is_incremental-macro

or  order_date = '1992-02-02'


{% endif %}