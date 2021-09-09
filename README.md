Welcome to the dbt Labs Snowflake Demo Project! 

This dbt project is intended to showcase key Snowflake + dbt functionalities in terms of 
workflow, modeling, and operationalizing. 

### Requirements
In order to successfully run this project, you will need the following: 

- A Snowflake account
- dbt Cloud account
- Snowflake Sample Data [The TPC-H dataset that is standard with every account](https://docs.snowflake.com/en/user-guide/sample-data-tpch.html)
- Default Snowflake warehouse named compute_wh 

### Using the demo project

This project was built with the intent to be used with the dbt Cloud IDE and the UserFlow guided tour but 
if you're unable to do this, here are the steps. 

1. Read the entire README
2. Check out the dbt_project.yml file. There you will find where we have defined our materializations, query tags, warehouse sizes, and hooks.
3. Go to models/staging/tpch/stg_tpch_customers.sql. Read about how we write our models 
4. Compile the code for stg_tpch_customers 
5. Run `dbt deps` to install all the packages in the packages.yml 
6. Run `dbt run` to run all of your dbt models.
7. Look at the logs (under details) to see what SQL was ran.
8. Run the show_incremental_model query in the analysis folder by clicking on `Preview Data`
9. Run `dbt run -m incremental_dim_orders` to run the model incrementally 
10. Run the show_incremental_model query in the analysis folder again with Preview Data. 
11. Take a look at the incremental logic in incremental_dim_orders 
12. Run `dbt test` to run the tests on your dbt models. Check out the models/staging/tcph/stg_tpch.yml file to see how tests are applied.
13. Generate docs by running `dbt docs generate` and click on the `View Docs` on the left hand side. 
14. Check out the docs site and click on the blue button on the botton to view the DAG. Right click on a node to refocus. Then right click again to view the docs.
15. Create a production environment by clicking on the hamburger menu > environments. 
16. Create a production job by clicking on the hamburger menu > jobs > create the job.
17. Run the production job. 

If you have time, take a look at other aspects of the project. We have included other fun features for you to see, including:
- How to change output based on environments 
- How to dynamically pivot vs hardcoding your pivot

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Help out:
This is a open source project. If you want to contribute to this project/find any issues, [interact with us on the repository](https://github.com/dbt-labs/dbt-cloud-snowflake-demo-template)
