USE [VLRDatabase]
GO
/****** Object:  Table [dbo].[REP_01_DAY_t]    Script Date: 28.01.2016 9:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REP_01_DAY_t](
	[ACCESSING_DATE] [date] NOT NULL,
	[ID_REF_OPERATOR] [int] NOT NULL,
	[MSISDN_COUNT] [numeric](18, 0) NOT NULL,
	[MSISDN_ADDS_COUNT] [numeric](18, 0) NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[REP_01_DAY_t]  WITH CHECK ADD  CONSTRAINT [FK_REP_01_DAY_t_O] FOREIGN KEY([ID_REF_OPERATOR])
REFERENCES [dbo].[REF_OPERATOR] ([ID])
GO
ALTER TABLE [dbo].[REP_01_DAY_t] CHECK CONSTRAINT [FK_REP_01_DAY_t_O]
GO
