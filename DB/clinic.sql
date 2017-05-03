USE [VetClinic]
GO

/****** Object:  StoredProcedure [dbo].[GetClinic]    Script Date: 5/2/2017 5:20:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetClinic] 

AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM dbo.Clinic
END
GO

