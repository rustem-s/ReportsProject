USE [VLRDatabase]
GO
/****** Object:  Table [dbo].[REP_03]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REP_03](
	[msisdn] [varchar](40) NOT NULL,
	[id_ref_area_group] [bigint] NOT NULL,
	[accessing_count] [int] NOT NULL,
	[month] [int] NOT NULL,
	[year] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
