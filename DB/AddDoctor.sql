USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[AddDoctor]    Script Date: 5/3/2017 9:52:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddDoctor] 

 @clinicId int
,@firstName nvarchar(200)
,@lastName nvarchar(200)
,@email nvarchar(200)

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
END
GO

