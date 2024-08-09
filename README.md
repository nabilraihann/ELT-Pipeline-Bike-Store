# ELT Pipeline Bike Store with Airflow, Aribyte, dbt, and Snowflake

This repository contains the implementation of an ELT (Extract, Load, Transform) pipeline for a Bike Store dataset using modern data tools. The pipeline integrates Airbyte for data extraction, dbt for data transformation, Airflow for orchestration, and Snowflake as the data warehouse.

## Overview
The purpose of this project is to demonstrate a complete ELT pipeline setup, where:

- Airbyte extracts data from various sources and loads it into Snowflake.
- dbt (Data Build Tool) transforms the raw data into a usable format for analytics.
- Airflow orchestrates the data workflow, ensuring that tasks are executed in the correct order and on schedule.
- Snowflake acts as the centralized data warehouse where all data is stored and queried.

<p align="center">
<img src="https://github.com/nabilraihann/ELT-Pipeline-Bike-Store/blob/main/Pipeine%20design.png" alt="elt-pipeline-design" width="800">
</p>

## Airflow DAG
<p align="center">
<img src="https://github.com/nabilraihann/ELT-Pipeline-Bike-Store/blob/main/airflow%20dags.png" alt="airflow-dag" width="800">
</p>

### Task Definition
- **airbyte-sync-bike-store** = This task triggers a sync operation in Airbyte, which is used to extract data from Bike Store OLTP database and load it into Snowflake data warehouse.
- **dbt-test** = This task triggers the dbt test command within the dbt project. It runs tests on your data models to ensure their validity and accuracy, identifying any issues before data transformations are applied.
- **dbt-snapshot** =  This task triggers the dbt snapshot command within the dbt project. It captures and stores the current state of your data, allowing you to track historical changes over time.
- **dbt-run** = This task triggers the dbt run command within the dbt project. It executes the data transformation models defined in dbt, applying them to the data to prepare it for analysis.

### Task Dependencies
- airbyte_sync >> [dbt_snapshot, dbt_test]: This defines the dependencies, where airbyte_sync must complete successfully before both dbt_snapshot and dbt_test can start.
- dbt_snapshot >> dbt_run << dbt_test: This indicates that both dbt_snapshot and dbt_test must complete before dbt_run starts. It also shows that dbt_snapshot and dbt_test are parallel tasks.
## dbt DAG

<p align="center">
<img src="https://github.com/nabilraihann/ELT-Pipeline-Bike-Store/blob/main/dbt-data-lineage.png" width="800">
</p>
