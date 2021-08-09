Welcome to the dbt Labs Snowflake Demo Project! 

This project is intended to showcase key Snowflake + dbt functionalities in terms of 
workflow, modeling, and operationalizing. 

### Requirements
- A Snowflake account 
- Snowflake Partner Connect dbt Cloud account
- Snowflake Sample Data (The TPC-H dataset that is standard with every account)
- Default Snowflake warehouse named compute_wh (that the Snowflake Partner connect dbt role has access to)

### Using the demo project

This project was built in the intention to be used with the dbt Cloud IDE. You can follow the UserFlow guided tour but 
if you're unable to do this, here are the steps. 

1. Read the entire README
2. Check out the dbt_project.yml file. There you will find where we have defined our materializations, query tags, warehouse sizes, and hooks.
3. Go to models/staging/tpch/stg_tpch_customers.sql. Read about how we write our models 
4. Run `dbt deps` to install all the packages in the packages.yml
5. Run `dbt seed` to load the snowflake_contract_rates.csv into your data warehouse. 
6. Run `dbt run` to run all of your dbt models.
7. Look at the logs (under details) to see what SQL was ran.
8. Run `dbt test` to run the tests on your dbt models. Check out the models/staging/tcph/stg_tpch.yml file to see how tests are applied.
9. Query the sample_incremental_model in the Snowflake either in a new tab or in Snowflake. Pay attention to how many rows there are. 
10. Run `dbt run -m sample_incremental_model`. 
11. Query the sample_incremental_model in Snowflake again. Did you see how many rows there are now?
12. Look at the sample_incremental_model and the is_incremental macro.
13. Generate docs by running `dbt docs generate` and click on the `View Docs` on the left hand side. 
14. Check out the docs site and click on the blue button on the botton to view the DAG. Right click on a node to refocus. Then right click again to view the docs.

Be sure to take a look around the project outside of the flow. We have included other fun features for you to see, including:
- How to change output based on environments 
- How to dynamically pivot vs hardcoding your pivot

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
