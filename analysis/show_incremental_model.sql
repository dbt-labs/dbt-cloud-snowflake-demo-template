/* This is an analysis model. Models in the analysis folder are compiled by dbt but not executed. These sql queries allows you to use 
dbt functionalities like ref to select from environment-specific locations and version control without the need to create an object in 
Snowflake. These are useful for shared audit queries, potential dashboard queries, etc. 
For full documentation: https://docs.getdbt.com/docs/building-a-dbt-project/analyses

*/

select * from {{ ref('incremental_dim_orders') }}


/* 
Stats you should expect to see:

- With a full rebuild (meaning either the first execution of the model or using --full-refresh) 
 of the `incremental_dim_orders` model, there will only be 7 rows of 1992-02-01 for the query results.

- With an incremental run, you will see 7 rows of orders with the order_date `1992-02-01` and 6 rows of orders with the order_date of `1992-02-02`


 */