﻿/*
Deployment script for Webstore

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Webstore"
:setvar DefaultFilePrefix "Webstore"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 00da6fdd-f313-4053-95a2-4ed494a32074 is skipped, element [dbo].[Customer].[Id] (SqlSimpleColumn) will not be renamed to CustomerID';


GO
PRINT N'Creating [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [CustomerID]      INT        NOT NULL,
    [Name]            NCHAR (10) NULL,
    [DiscountPercent] NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '00da6fdd-f313-4053-95a2-4ed494a32074')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('00da6fdd-f313-4053-95a2-4ed494a32074')

GO

GO
PRINT N'Update complete.';


GO