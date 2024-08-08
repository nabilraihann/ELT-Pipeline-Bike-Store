from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.operators.bash import BashOperator

with DAG(dag_id='airbyte-dbt-dag',
         default_args={'owner': 'nabil'},
         schedule='@daily',
         start_date=days_ago(1)
    ) as dag:

    airbyte_sync = AirbyteTriggerSyncOperator(
        task_id='airbyte-sync-bike-store',
        airbyte_conn_id='airbyte_conn',
        connection_id='797a0320-5c5d-4059-9ba3-1c19c9ebd3a7',
        asynchronous=False,
        timeout=3600,
        wait_seconds=3
    )
    
    dbt_snapshot = BashOperator(
        task_id='dbt-snaphot',
        bash_command='cd /home/nbl/dbt_warehouse/ && dbt snapshot'
    )
    
    dbt_test = BashOperator(
        task_id='dbt-test',
        bash_command='cd /home/nbl/dbt_warehouse/ && dbt test'
    )
    
    dbt_run = BashOperator(
        task_id='dbt-run',
        bash_command='cd /home/nbl/dbt_warehouse/ && dbt run'
    )
    
    airbyte_sync >> [dbt_snapshot, dbt_test]
    dbt_snapshot >> dbt_run << dbt_test
