## ETL and Automatic updating project in PostgreSQL
An ETL process using PostgreSQL to help collect data through DCS system
## Motivation 
Predictive maintenance are believed to reduce the chances of a breakdown by collecting and analyzing data of equipment's performance and conditions. 

## Introduction
This ETL process, or we say the process of extraction, transformation, and loading, is developed to store tables either being downloaded from Distributed Control System (DCS) or being monitored manually in the database system. The focus is to bridge the gap between different data structures between that defined by DCS and by engineers. By this process, the efficiency in updating source and its correspondent data is believed to be improved. Totally, the process will include format transformation, customized functions definition, and synchronizing data updating to guarantee data consistency and integrity.

## Structure
- Sensors:
- PLC: Programmable Logic Controllers
- DCS: Distributed Control System
- SCADA: Supervisory Control and Data Acquisition

## In this project

I will utilized ETL process to convert data coming from DCS and load it into database.
- Extract: The raw data may be managed in a visual way, including too many "NULL" or "TBA", which will be removed, and only data in the specific format will be kept.
- Transform: Will need to automatically find the correspondent tag used in DCS for each sensors or tools.
- Load: Will create a new table to define and record the relationship from sensors on the field and database tag.
- Trigger: To keep consistensy, a trigger function is defined to update the database when tables are modified.



