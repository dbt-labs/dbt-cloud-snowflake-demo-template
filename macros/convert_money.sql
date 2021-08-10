/* This is a macro. Macros are written in a pythonic templating language called Jinja. 
You can think of them as functions or snippets of code that you can then call all over your dbt project. 
Macros like this are sql snippets that you can call into your dbt model. Check out `order_items` in the marts/intermediate to see
how this macro is applied.
Learn more about macros and jinja here: https://docs.getdbt.com/docs/building-a-dbt-project/jinja-macros
*/


{% macro money(col) -%}
::decimal(16,4)
{%- endmacro %}
