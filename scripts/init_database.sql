-- Switch to the master database
USE MASTER;
GO

-- Create the Data Warehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the newly created DataWarehouse database
USE DataWarehouse;
GO

-- Create the Bronze schema
-- Used for storing raw data extracted from source systems
CREATE SCHEMA bronze;
GO

-- Create the Silver schema
-- Used for cleaned and transformed data
CREATE SCHEMA silver;
GO

-- Create the Gold schema
-- Used for business-ready and analytical data
CREATE SCHEMA gold;
GO
