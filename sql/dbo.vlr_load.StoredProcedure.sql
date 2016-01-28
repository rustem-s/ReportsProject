USE [VLRDatabase]
GO
/****** Object:  StoredProcedure [dbo].[vlr_load]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rustem Saidaliyev
-- Create date: 11.01.2016
-- Description:	DB side logic of loading data of VLR
-- Prerequisites: Load VLR data into tables VLR_TEMP and VLR
-- =============================================
CREATE PROCEDURE [dbo].[vlr_load] @date date
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare 
		@msisdn_table msisdn_table_type;

	insert into @msisdn_table(msisdn)
	select
		distinct msisdn
	from 
		vlr_temp_t
	where
		msisdn != ''
		and accessing_time != '';
	
	/*
	-- insert into VLR from VLR_TEMP
    insert into vlr_t (id, codreg, codarea, coddistr, imsi, msisdn, imei, accessing_date, accessing_time, id_vlr_file)
    select
	    next value for vlr_seq,
	    substring(t.gcisai, 1, 5),
	    substring(t.gcisai, 7, 4),
	    substring(t.gcisai, 12, 4),
	    t.imsi,
	    t.msisdn,
	    t.imei,
	    convert(date, accessing_time) accessing_date,
	    convert(time, accessing_time) accessing_time,
	    t.id_vlr_file
    from vlr_temp_t t
    where
	    t.msisdn <> ''
	    and t.accessing_time <> '';
	*/

	-- fill REP_01 tables
	exec fill_rep_01 @date, @msisdn_table;

	-- update msisdn table
	MERGE msisdn AS target
    USING (select msisdn from @msisdn_table) AS source (msisdn)
    ON (target.msisdn = source.msisdn)
	WHEN NOT MATCHED THEN
    INSERT (msisdn, create_date)
    VALUES (source.msisdn, @date);

END


GO
