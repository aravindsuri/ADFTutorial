# Databricks notebook source
# MAGIC %md
# MAGIC ## Mount the following azure data lake storage gen2 containers
# MAGIC 1. cleansed
# MAGIC 2. curated

# COMMAND ----------

# MAGIC %md
# MAGIC ### Setup the config values
# MAGIC #### following config values need to be updated in the script
# MAGIC - <application-id>
# MAGIC - <service-credential>
# MAGIC - <directory-id>

# COMMAND ----------

configs = {"fs.azure.account.auth.type": "OAuth",
           "fs.azure.account.oauth.provider.type": "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
           "fs.azure.account.oauth2.client.id": "<application-id>",
           "fs.azure.account.oauth2.client.secret": "<service-credential>",
           "fs.azure.account.oauth2.client.endpoint": "https://login.microsoftonline.com/<directory-id>/oauth2/token"}

# COMMAND ----------

# MAGIC %md
# MAGIC ### Mount the cleansed container
# MAGIC #### Update the <storage account name> before executing

# COMMAND ----------

dbutils.fs.mount(
  source = "abfss://cleansed@<storage account name>.dfs.core.windows.net/",
  mount_point = "/mnt/<storage account name>/cleansed",
  extra_configs = configs)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Mount the curated container
# MAGIC #### Update the <storage account name> before executing

# COMMAND ----------

dbutils.fs.mount(
  source = "abfss://curated@<storage account name>.dfs.core.windows.net/",
  mount_point = "/mnt/<storage account name>/curated",
  extra_configs = configs)

# COMMAND ----------

# MAGIC %md
# MAGIC ### Check that the storage accounts have been properly mounted
# MAGIC #### List the contents of the storage account

# COMMAND ----------

dbutils.fs.ls('/mnt/<storage account name>/cleansed')
