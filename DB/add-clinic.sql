USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[AddClinic]    Script Date: 5/3/2017 4:10:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddClinic] 
		@AddressId int
	,	@Name nvarchar(200)
	,	@Hours nvarchar(200)
	,	@ClinicId int out

AS
BEGIN

	INSERT INTO [dbo].[Clinic]
           ([AddressId]
           ,[Name]
           ,[Hours])
     VALUES
           (@AddressId
		   ,@Name
		   ,@Hours)

		   SET @ClinicId = @@IDENTITY

END
GO

