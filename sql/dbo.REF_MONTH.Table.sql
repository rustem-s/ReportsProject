USE [VLRDatabase]
GO
/****** Object:  Table [dbo].[REF_MONTH]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REF_MONTH](
	[ID] [numeric](18, 0) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [pk_ref_month] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
