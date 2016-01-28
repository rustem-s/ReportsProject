USE [VLRDatabase]
GO
/****** Object:  StoredProcedure [dbo].[fill_rep_01_month_by_period]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rustem Saidaliyev
-- Create date: 16.09.2015
-- Description:	Fill total by MONTH data of REP_01 report
-- =============================================
CREATE PROCEDURE [dbo].[fill_rep_01_month_by_period] @start_date date, @end_date date
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
		@msisdn_count varchar(10), 
		@msisdn_adds_count numeric(18,0),
		@id_ref_operator_win int,
		@id_ref_operator_mtsr int,
		@id_ref_operator_mtsr_new int,
		@id_ref_operator_others int,
		@id_ref_operator_mts int


	set @id_ref_operator_win =
	(
		select id
		from ref_operator
		where ltrim(rtrim(prefix)) = '79789'
	);

	set @id_ref_operator_mtsr =
	(
		select id
		from ref_operator
		where ltrim(rtrim(prefix)) = '7978(0,7,8)'
	);

	set @id_ref_operator_mtsr_new =
	(
		select id
		from ref_operator
		where ltrim(rtrim(prefix)) = '79781'
	);

	set @id_ref_operator_others =
	(
		select id
		from ref_operator
		where ltrim(rtrim(prefix)) = 'not 7978(0,7,8,9)'
	);

	set @id_ref_operator_mts =
	(
		select id
		from ref_operator
		where ltrim(rtrim(prefix)) = '79782'
	);

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

	delete from rep_01_month
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

		-- WIN
		set @msisdn_count =
		(
			select count(distinct msisdn)
			from
				vlr
			where
				msisdn like '79789%'
				and year(accessing_date) between @min_year and @year
				and month(accessing_date) between @min_month and @month
		);

		set @msisdn_adds_count =
		(
			select sum(msisdn_adds_count)
			from rep_01_day
			where 
				month(accessing_date) = @month
				and year(accessing_date) = @year
				and ID_REF_OPERATOR = @id_ref_operator_win
		)

		insert into rep_01_month(id_ref_year, id_ref_month, id_ref_operator, msisdn_count, msisdn_adds_count)
		values(@year, @month, @id_ref_operator_win, @msisdn_count, @msisdn_adds_count);


		-- MTS Russia
		set @msisdn_count =
		(
			select count(distinct msisdn)
			from
				vlr
			where
				substring(MSISDN, 1, 5) in ('79780', '79787', '79788')
				and year(accessing_date) between @min_year and @year
				and month(accessing_date) between @min_month and @month
		);

		set @msisdn_adds_count =
		(
			select sum(msisdn_adds_count)
			from rep_01_day
			where 
				month(accessing_date) = @month
				and year(accessing_date) = @year
				and ID_REF_OPERATOR = @id_ref_operator_mtsr
		)

		insert into rep_01_month(id_ref_year, id_ref_month, id_ref_operator, msisdn_count, msisdn_adds_count)
		values(@year, @month, @id_ref_operator_mtsr, @msisdn_count, @msisdn_adds_count);


		-- MTS Russia New
		set @msisdn_count =
		(
			select count(distinct msisdn)
			from
				vlr
			where
				msisdn like '79781%'
				and year(accessing_date) between @min_year and @year
				and month(accessing_date) between @min_month and @month
		);

		set @msisdn_adds_count =
		(
			select sum(msisdn_adds_count)
			from rep_01_day
			where 
				month(accessing_date) = @month
				and year(accessing_date) = @year
				and ID_REF_OPERATOR = @id_ref_operator_mtsr_new
		)

		insert into rep_01_month(id_ref_year, id_ref_month, id_ref_operator, msisdn_count, msisdn_adds_count)
		values(@year, @month, @id_ref_operator_mtsr_new, @msisdn_count, @msisdn_adds_count);

		-- Others
		set @msisdn_count =
		(
			select count(distinct msisdn)
			from
				vlr
			where
				substring(MSISDN, 1, 5) not in ('79780', '79787', '79788', '79789') --'79781', 
				and year(accessing_date) between @min_year and @year
				and month(accessing_date) between @min_month and @month
		);

		set @msisdn_adds_count =
		(
			select sum(msisdn_adds_count)
			from rep_01_day
			where 
				month(accessing_date) = @month
				and year(accessing_date) = @year
				and ID_REF_OPERATOR = @id_ref_operator_others
		)

		insert into rep_01_month(id_ref_year, id_ref_month, id_ref_operator, msisdn_count, msisdn_adds_count)
		values(@year, @month, @id_ref_operator_others, @msisdn_count, @msisdn_adds_count);


		-- MTS 
		set @msisdn_count =
		(
			select count(distinct msisdn)
			from
				vlr
			where
				msisdn like '79782%'
				and year(accessing_date) between @min_year and @year
				and month(accessing_date) between @min_month and @month
		);

		set @msisdn_adds_count =
		(
			select sum(msisdn_adds_count)
			from rep_01_day
			where 
				month(accessing_date) = @month
				and year(accessing_date) = @year
				and ID_REF_OPERATOR = @id_ref_operator_mtsr
		)

		insert into rep_01_month(id_ref_year, id_ref_month, id_ref_operator, msisdn_count, msisdn_adds_count)
		values(@year, @month, @id_ref_operator_mts, @msisdn_count, @msisdn_adds_count);

		fetch next from month_cursor into @year, @month;
	end;

	close month_cursor;
	deallocate month_cursor;


END


GO
