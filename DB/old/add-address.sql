USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 5/3/2017 2:03:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddAddress]
	 @Street nvarchar(200)
	,@City nvarchar(200)
	,@State nvarchar(2)
	,@Zip nvarchar(5)
	,@AddressId int out
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Address]
    ([Street]  ,[City] ,[State] ,[Zip]	) VALUES
	 (@Street  ,@City  ,@State  ,@Zip	)

	 set @AddressId = @@IDENTITY

END
GO

