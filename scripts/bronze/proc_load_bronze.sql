/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the BULK INSERT command to load data from CSV files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
exec bronze.load_bronze
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
declare @start_time datetime,@end_time datetime;
begin try
set @start_time=getdate();
truncate table bronze.crm_cust_info;
bulk insert bronze.crm_cust_info
from 'C:\Users\abhin\OneDrive\Desktop\datasets\source_crm\cust_info.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);
select count(*) from bronze.crm_cust_info
set @end_time=GETDATE();
print '<<load duration'+ cast(datediff(second,@start_time,@end_time)as nvarchar)+'seconds';

set @start_time=getdate();

truncate table bronze.crm_prd_info
bulk insert bronze.crm_prd_info
from 'C:\Users\abhin\OneDrive\Desktop\datasets\source_crm\prd_info.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);
select count(*) from bronze.crm_prd_info
set @end_time=GETDATE();
print '<<load duration'+ cast(datediff(second,@start_time,@end_time)as nvarchar)+'seconds';


set @start_time=getdate();
truncate table bronze.crm_sales_details
bulk insert bronze.crm_sales_details
from 'C:\Users\abhin\OneDrive\Desktop\datasets\source_crm\sales_details.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);
select count(*) from bronze.crm_sales_details

set @end_time=GETDATE();
print '<<load duration'+ cast(datediff(second,@start_time,@end_time)as nvarchar)+'seconds';


set @start_time=getdate();
truncate table bronze.erp_cust_az12
bulk insert bronze.erp_cust_az12
from 'C:\Users\abhin\OneDrive\Desktop\datasets\source_erp\CUST_AZ12.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);
select count(*) from bronze.erp_cust_az12
set @end_time=GETDATE();
print '<<load duration'+ cast(datediff(second,@start_time,@end_time)as nvarchar)+'seconds';

set @start_time=getdate();
truncate table bronze.erp_loc_a101
bulk insert bronze.erp_loc_a101
from 'C:\Users\abhin\OneDrive\Desktop\datasets\source_erp\LOC_A101.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);
select count(*) from bronze.erp_loc_a101
set @end_time=GETDATE();
print '<<load duration'+ cast(datediff(second,@start_time,@end_time)as nvarchar)+'seconds';

set @start_time=getdate();
truncate table bronze.erp_px_cat_g1v2
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\abhin\OneDrive\Desktop\datasets\source_erp\PX_CAT_G1V2.csv'
with(
firstrow=2,
fieldterminator=',',
tablock
);
select count(*) from bronze.erp_px_cat_g1v2
set @end_time=GETDATE();
print '<<load duration'+ cast(datediff(second,@start_time,@end_time)as nvarchar)+'seconds';

end try
begin catch
print '======================='
print 'error occured loading bronze layer'
print 'error message' + error_message();
print 'error message'+ cast(error_number() as nvarchar);
print 'error message'+ cast(error_state() as nvarchar);
print '==========================================';

end catch
END
