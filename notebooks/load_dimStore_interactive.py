# Databricks notebook source
# MAGIC %md
# MAGIC ## Load the delta table dimStore from stage.Store
# MAGIC ####-----------------------------------------------------------------------
# MAGIC 1. Connect to Azure Sql DB
# MAGIC 2. Load stage.Store as temporary view
# MAGIC 3. Create the delta table dimStore in the Curated database
# MAGIC 4. Use SCD Type 1 to load dimStore using stage.Store
# MAGIC 5. Review dimStore results
# MAGIC 
# MAGIC ####-----------------------------------------------------------------------

# COMMAND ----------

# MAGIC %md
# MAGIC ### Import relevant libraries 

# COMMAND ----------

from pyspark.sql.functions import *

# COMMAND ----------

# MAGIC %md
# MAGIC ### Connect to Azure Sql DB
# MAGIC ### Replace Sql Config values with the relevant config values. 
# MAGIC ### 
# MAGIC ### <sql username> 	  replace with your sql username
# MAGIC ### <sql servername>	replace with your sql server name
# MAGIC ### <sql dbname>	    replace with the sql database name
# MAGIC ### <password>		    replace with the password for the sql database

# COMMAND ----------


jdbcusername = <sql username>
jdbchostname = <sql servername>
jdbcdatabase = <sql dbname>

jdbcport = 1433
user = <sql username> 
jdbcpassword= <password>

jdbcurl = "jdbc:sqlserver://{0}:{1};database={2}".format(jdbchostname, jdbcport, jdbcdatabase) 
connectionProperties = {
    "user": jdbcusername,
    "password": jdbcpassword,
    "driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver"
}


# COMMAND ----------

# MAGIC %md
# MAGIC ### Read the stage.Store and Create a temporary View in databricks

# COMMAND ----------

query = "(select * from stage.Store) As stageStore"
dfSource = spark.read.jdbc(url=jdbcurl, table=query, properties=connectionProperties)
dfSource.createOrReplaceTempView("dbr_stageStore")


# COMMAND ----------

# MAGIC %md
# MAGIC ### Browse the temporary view of the stage.Store table

# COMMAND ----------

%sql
SELECT * FROM dbr_stageStore


# COMMAND ----------

# MAGIC %md
# MAGIC ### Create the database Curated if it doesn't exist

# COMMAND ----------

%sql
CREATE DATABASE IF NOT EXISTS curated


# COMMAND ----------

# MAGIC %md
# MAGIC ### Drop the dimStore Table if it exists 

# COMMAND ----------

%sql 
DROP TABLE IF EXISTS curated.dimStore

# COMMAND ----------

# MAGIC %md
# MAGIC ### Create the delta table dimStore in database Curated  

# COMMAND ----------

%sql
CREATE OR REPLACE TABLE dimStore (
  StoreId BIGINT GENERATED ALWAYS AS IDENTITY, 
  StoreName STRING NOT NULL,
  StoreType STRING NOT NULL,
  Description STRING,
  InsertedDate DATE NOT NULL,
  UpdatedDate DATE NOT NULL
  ) 
USING DELTA
LOCATION  '/mnt/adlsvinoworlddev/curated/dimStore'


# COMMAND ----------

# MAGIC %md
# MAGIC ### Upsert to the dimStore delta Table from the stage.Source table in Azure Sql

# COMMAND ----------

%sql
MERGE INTO dimStore AS Target
        USING ( SELECT  StoreName, 
                        StoreType, 
                        Description 
                FROM    dbr_stageStore
              ) AS Source 
    ON  Target.StoreName = Source.StoreName --- specifies the condition
    WHEN MATCHED THEN
        UPDATE SET 
                Target.StoreType = Source.StoreType, 
                Target.Description = Source.Description,
                Target.UpdatedDate = getdate()
    WHEN NOT MATCHED THEN
        INSERT (StoreName, StoreType, Description, InsertedDate, UpdatedDate ) 
        VALUES (Source.StoreName, Source.StoreType, Source.Description, getdate(), getdate() ); --INSERT STATEMENT

# COMMAND ----------

# MAGIC %md
# MAGIC ### Describe the history of the dimStore Table

# COMMAND ----------

%sql
DESCRIBE HISTORY dimStore;

# COMMAND ----------

# MAGIC %md
# MAGIC ### Time Travel
# MAGIC ### Review the different versions of the dimStore Table

# COMMAND ----------

%sql
SELECT * FROM dimStore VERSION AS OF 2

# COMMAND ----------

# MAGIC %md
# MAGIC ### Optimize a Table
# MAGIC ### Several changes implies several files in ADLS. Use OPTIMIZE to collapse small files into larger ones to improve query speed

# COMMAND ----------

%sql
OPTIMIZE dimStore

# COMMAND ----------

# MAGIC %md
# MAGIC ### Z-Order by Columns
# MAGIC ### Read performance within a file can be improved using Z-Order. Specify the columns to order in the Z-Order clause

# COMMAND ----------

%sql
OPTIMIZE dimStore
ZORDER BY (StoreName)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Cleanup Snapshots with VACUUM
# MAGIC ### Important to cleanup old snapshots. Can be done by running the VACUUM command

# COMMAND ----------

%sql
VACUUM dimStore