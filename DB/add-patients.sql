USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[AddPatients]    Script Date: 5/3/2017 5:56:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddPatients] 
	@AddressId int,
	@Name nvarchar(200),
	@Species nvarchar(200),
	@DOB datetime,
	@PatientId int out
AS
BEGIN
	INSERT INTO [dbo].[Patient]
           ([AddressId],
          [Name]
           ,[Species]
           ,[DOB])
     VALUES
           (
           @AddressId,
           @Name,
           @Species,
		   @DOB
		   )
		   set @PatientId = @@IDENTITY
END

GO

