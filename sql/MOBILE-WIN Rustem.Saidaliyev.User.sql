USE [VLRDatabase]
GO
/****** Object:  User [MOBILE-WIN\Rustem.Saidaliyev]    Script Date: 28.01.2016 9:15:35 ******/
CREATE USER [MOBILE-WIN\Rustem.Saidaliyev] FOR LOGIN [MOBILE-WIN\Rustem.Saidaliyev] WITH DEFAULT_SCHEMA=[db_datareader]
GO
ALTER ROLE [db_owner] ADD MEMBER [MOBILE-WIN\Rustem.Saidaliyev]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [MOBILE-WIN\Rustem.Saidaliyev]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MOBILE-WIN\Rustem.Saidaliyev]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MOBILE-WIN\Rustem.Saidaliyev]
GO
