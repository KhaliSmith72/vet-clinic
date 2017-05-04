USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[AddDoctor]    Script Date: 5/4/2017 8:57:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddDoctor] 

 @clinicId int
,@firstName nvarchar(200)
,@lastName nvarchar(200)
,@email nvarchar(200)
,@doctorId int out

AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Doctor]
           ([ClinicId]
           ,[FirstName]
           ,[LastName]
           ,[Email])
     VALUES
           (@clinicId
           ,@firstName
           ,@lastName
           ,@email)

		   SET @DoctorId = @@IDENTITY
END
GO


