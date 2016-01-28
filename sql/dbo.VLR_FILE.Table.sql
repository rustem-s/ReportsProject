USE [VLRDatabase]
GO
/****** Object:  Table [dbo].[VLR_FILE]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VLR_FILE](
	[ID] [bigint] NOT NULL,
	[LOAD_TIME] [datetime] NOT NULL CONSTRAINT [DF__VLR_FILE__LOAD_T__54CB950F]  DEFAULT (sysdatetime()),
	[FILE_PATH] [varchar](4000) NOT NULL,
	[FILE_NAME] [varchar](500) NOT NULL,
	[FILE_DATE] [date] NULL,
 CONSTRAINT [PK_VLR_FILE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_VLR_FILE_FN]    Script Date: 28.01.2016 9:15:35 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_VLR_FILE_FN] ON [dbo].[VLR_FILE]
(
	[FILE_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
