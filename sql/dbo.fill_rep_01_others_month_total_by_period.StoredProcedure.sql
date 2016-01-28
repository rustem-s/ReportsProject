USE [VLRDatabase]
GO
/****** Object:  StoredProcedure [dbo].[fill_rep_01_others_month_total_by_period]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rustem Saidaliyev
-- Create date: 17.09.2015
-- Description:	Fill OTHERS total by MONTH data of REP_01 report
-- =============================================
CREATE PROCEDURE [dbo].[fill_rep_01_others_month_total_by_period] @start_date date, @end_date date
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare 
		@min_year int,
		@min_month int,
		@year int,
		@month int,
		@msisdn_count varchar(10);

	set @min_year = 
	(
		select 
		min(year(accessing_date))
		from vlr
	);

	set @min_month = 
	(
		select 
		min(month(accessing_date))
		from vlr
	);

	delete from rep_01_others_total_by_month
	where
		id_ref_year between year(@start_date) and year(@end_date)
		and id_ref_month between month(@start_date) and month(@end_date);

	declare month_cursor cursor for
		select
			year(accessing_date) year,
			month(accessing_date) month
		from vlr
		where
			accessing_date between @start_date and @end_date
		group by year(accessing_date), month(accessing_date)
		order by year(accessing_date), month(accessing_date)
	open month_cursor;

	fetch next from month_cursor into @year, @month;
	while @@fetch_status = 0
	begin

		insert into rep_01_others_total_by_month(id_ref_year, id_ref_month, msisdn_prefix, msisdn_count)
		select 
			@year,
			@month,
			substring(msisdn, 1, 4),
			count(distinct MSISDN)
		from 
			VLR
		where 
			year(accessing_date) between @min_year and @year
			and month(accessing_date) between @min_month and @month
			and substring(MSISDN,1,5) not in ('79780', '79787', '79788', '79789') --'79781', 
		group by substring(msisdn, 1, 4)
		order by substring(msisdn, 1, 4);

		fetch next from month_cursor into @year, @month;
	end;

	close month_cursor;
	deallocate month_cursor;

END


GO
