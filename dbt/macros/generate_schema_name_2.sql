{% macro generate_schema_name(custom_schema_name, node) -%}

    {% if node.resource_type == 'seed' %}
        {{ custom_schema_name | trim | upper }}
    {% else %}
        {{ target.schema }}
    {% endif %}

{%- endmacro %}