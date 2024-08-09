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

## Project Structure
```
├── airflow/            # DAGs and scripts for Airflow orchestration
└── dbt_warehouse/      # dbt project 
```

## Airflow DAG
<p align="center">
<img src="https://github.com/nabilraihann/ELT-Pipeline-Bike-Store/blob/main/airflow%20dags.png" alt="airflow-dag" width="800">
</p>

## dbt DAG

<p align="center">
<img src="https://github.com/nabilraihann/ELT-Pipeline-Bike-Store/blob/main/dbt-dag.png" alt="dbt-dag" width="800">
</p>
