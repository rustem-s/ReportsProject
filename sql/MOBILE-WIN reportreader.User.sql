USE [VLRDatabase]
GO
/****** Object:  User [MOBILE-WIN\reportreader]    Script Date: 28.01.2016 9:15:35 ******/
CREATE USER [MOBILE-WIN\reportreader] FOR LOGIN [MOBILE-WIN\reportreader] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MOBILE-WIN\reportreader]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MOBILE-WIN\reportreader]
GO
