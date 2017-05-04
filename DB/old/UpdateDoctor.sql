USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDoctor]    Script Date: 5/3/2017 9:53:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateDoctor]
 
 @doctorId int
,@clinicId int
,@firstName nvarchar(200)
,@lastName nvarchar(200)
,@email nvarchar(200)

AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [dbo].[Doctor]
   SET [ClinicId] = @clinicId
      ,[FirstName] = @firstName
      ,[LastName] = @lastName
      ,[Email] = @email
 WHERE DoctorId = @doctorId

END
GO

