/* This is a macro. Macros are written in a pythonic templating language called Jinja. 
You can think of them as functions or snippets of code that you can then call all over your dbt project. 
Macros like this grant_all_on_schema macro can be called either as run operation (https://docs.getdbt.com/docs/building-a-dbt-project/hooks-operations#operations) 
or as a hook (https://docs.getdbt.com/docs/building-a-dbt-project/hooks-operations). As seen on the dbt_project.yml file, this macro needs two inputs passed to it in order 
work.
Learn more about macros and jinja here: https://docs.getdbt.com/docs/building-a-dbt-project/jinja-macros
*/

{% macro grant_all_on_schemas(schemas, role) %}
  {% for schema in schemas %}
    grant usage on schema {{ schema }} to role {{ role }};
    grant select on all tables in schema {{ schema }} to role {{ role }};
    grant select on all views in schema {{ schema }} to role {{ role }};
    grant select on future tables in schema {{ schema }} to role {{ role }};
    grant select on future views in schema {{ schema }} to role {{ role }};
  {% endfor %}
{% endmacro %}