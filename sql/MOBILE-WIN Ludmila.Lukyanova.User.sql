USE [VLRDatabase]
GO
/****** Object:  User [MOBILE-WIN\Ludmila.Lukyanova]    Script Date: 28.01.2016 9:15:35 ******/
CREATE USER [MOBILE-WIN\Ludmila.Lukyanova] FOR LOGIN [MOBILE-WIN\Ludmila.Lukyanova] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [MOBILE-WIN\Ludmila.Lukyanova]
GO
