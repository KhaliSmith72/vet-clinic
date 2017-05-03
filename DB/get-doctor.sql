USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[GetDoctor]    Script Date: 5/2/2017 5:35:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetDoctor]
 
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [DoctorId]
      ,[ClinicId]
      ,[FirstName]
      ,[LastName]
      ,[Email]
  FROM [dbo].[Doctor]
END
GO

