USE [VLRDatabase]
GO
/****** Object:  Table [dbo].[REP_01_TOTAL_BY_DAY]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REP_01_TOTAL_BY_DAY](
	[accessing_date] [date] NOT NULL,
	[msisdn_count] [numeric](18, 0) NOT NULL
) ON [PRIMARY]

GO
