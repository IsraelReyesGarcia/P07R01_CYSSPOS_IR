--=============================================
--Script para crear usuario 'sa' con contraseña
--para la base de datos SysPos
--=============================================

USE [master]
GO

-- 1. Hailitar la cuenta 'sa' si está deshabilitada
ALTER LOGIN [sa] ENABLE
GO

-- 2. Establecer la contraseña para el usuario 'sa'
ALTER LOGIN [sa] WITH PASSWORD = 'isdev100'
GO

-- 3. Establecer CyssposBd como base de datos principal
ALTER LOGIN [sa] WITH DEFAULT_DATABASE = [CyssposBD]
GO

-- 4. Asegurar que la autenticación SQL Server esté habilitada
-- (Esto requiere reiniciar el servicio de SQL Server)
EXEC xp_instance_regwrite
	N'HKEY_LOCAL_MACHINE',
	N'Software\Microsoft\MSSQLServer\MSSQLServer',
	N'LoginMode',
	REG_DWORD,
	2
GO

-- 5. Cambiar a la base de datos CyssposBD
USE [CyspossBd]
GO

-- 6. Dar permisos de propietario
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'sa')
BEGIN
	CREATE USER [sa] FOR LOGIN [sa]
END
GO

-- 7. Dar permisos de propietario
ALTER ROLE [db_owner] ADD MEMBER [sa]
GO

PRINT ''
PRINT '============================================'
PRINT 'USUARIO SA CONFIGURADO EXITOSAMENTE'
PRINT '============================================'
PRINT 'Usuario: sa'
PRINT 'Password: isdev100'
PRINT 'Server: ISRAEL'
PRINT 'Database: CyssPosBD'
PRINT 'Port: 1433'
PRINT '============================================='
PRINT ''
PRINT 'IMPORTANTE: Reinicia el servicio de SQL Server'
PRINT 'para que los cambios de autenticación surtan efecto.'
PRINT '============================================='
GO

