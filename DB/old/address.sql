-- 
-- Begin create the GetAddresses stored proc
--
USE [VetClinic]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAddresses] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [AddressId] ,[Street] ,[City] ,[State] ,[Zip]
	FROM [dbo].[Address]

END
GO

--
-- End create the GetAddresses stored proc 
--

