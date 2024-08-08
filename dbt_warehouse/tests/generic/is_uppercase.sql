{% test is_uppercase(model, column_name) %}
{{ config(severity = 'warn') }}
WITH test_data AS (
    SELECT
        {{ column_name }} AS col
    FROM {{ model }}
)
SELECT
    COUNT(*) AS num_violations
FROM test_data
WHERE col != UPPER(col)
{% endtest %}