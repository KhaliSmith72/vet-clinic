USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[GetPatients]    Script Date: 5/2/2017 8:20:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetPatients]

AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT [PatientId]
      ,[AddressId]
      ,[Name]
      ,[Species]
      ,[DOB]
  FROM [dbo].[Patient]

 
END

GO

