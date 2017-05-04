USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[DeleteDoctor]    Script Date: 5/3/2017 9:52:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteDoctor]

@doctorId int 

AS
BEGIN
	SET NOCOUNT ON;

    DELETE FROM [dbo].[Doctor]
      WHERE DoctorId = @doctorId
END
GO

