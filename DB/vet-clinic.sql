USE [master]
GO

/****** Object:  Database [VetClinic]    Script Date: 5/2/2017 4:11:47 PM ******/
CREATE DATABASE [VetClinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VetClinic', FILENAME = N'C:\src\VetClinic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VetClinic_log', FILENAME = N'C:\src\VetClinic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VetClinic] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VetClinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VetClinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VetClinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VetClinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VetClinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VetClinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [VetClinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VetClinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VetClinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VetClinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VetClinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VetClinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VetClinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VetClinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VetClinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VetClinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VetClinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VetClinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VetClinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VetClinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VetClinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VetClinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VetClinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VetClinic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VetClinic] SET  MULTI_USER 
GO
ALTER DATABASE [VetClinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VetClinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VetClinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VetClinic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VetClinic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VetClinic] SET QUERY_STORE = OFF
GO
USE [VetClinic]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [VetClinic]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/2/2017 4:11:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](200) NOT NULL,
	[City] [nvarchar](200) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[Zip] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 5/2/2017 4:11:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[ClinicId] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Hours] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 5/2/2017 4:11:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [int] NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 5/2/2017 4:11:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Species] [nvarchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clinic]  WITH CHECK ADD  CONSTRAINT [FK_Clinic_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Clinic] CHECK CONSTRAINT [FK_Clinic_Address]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([ClinicId])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Clinic]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Address]
GO
USE [master]
GO
ALTER DATABASE [VetClinic] SET  READ_WRITE 
GO

-- ************************************************************************************************
-- Begin Address stored procs
-- ************************************************************************************************

USE [VetClinic]
GO

CREATE PROCEDURE [dbo].[GetAddresses] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [AddressId] ,[Street] ,[City] ,[State] ,[Zip]
	FROM [dbo].[Address]
END
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



-- ************************************************************************************************
-- Begin Clinic stored procs
-- ************************************************************************************************

USE [VetClinic]
GO

CREATE PROCEDURE [dbo].[GetClinic] 
AS
BEGIN
	SET NOCOUNT ON;
    SELECT * FROM dbo.Clinic
END
GO

CREATE PROCEDURE [dbo].[AddClinic] 
	 @AddressId int
	,@Name nvarchar(200)
	,@Hours nvarchar(200)
	,@ClinicId int out
AS
BEGIN
	INSERT INTO [dbo].[Clinic]
	([AddressId] ,[Name] ,[Hours]	) VALUES
	(@AddressId  ,@Name  ,@Hours	)
	SET @ClinicId = @@IDENTITY
END
GO



-- ************************************************************************************************
-- Begin Doctor stored procs
-- ************************************************************************************************

USE [VetClinic]
GO

CREATE PROCEDURE [dbo].[GetDoctor]
AS
BEGIN
	SET NOCOUNT ON;
    SELECT [DoctorId] ,[ClinicId] ,[FirstName] ,[LastName] ,[Email]
	FROM [dbo].[Doctor]
END
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
    ([ClinicId] ,[FirstName] ,[LastName] ,[Email]	) VALUES
    (@clinicId  ,@firstName  ,@lastName  ,@email		)
	SET @DoctorId = @@IDENTITY
END
GO



-- ************************************************************************************************
-- Begin Patient stored procs
-- ************************************************************************************************

USE [VetClinic]
GO

CREATE PROCEDURE [dbo].[GetPatients]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [PatientId] ,[AddressId] ,[Name] ,[Species] ,[DOB]
	FROM [dbo].[Patient]
END
GO

CREATE PROCEDURE [dbo].[AddPatients] 
	 @AddressId int
	,@Name nvarchar(200)
	,@Species nvarchar(200)
	,@DOB datetime
	,@PatientId int out
AS
BEGIN
INSERT INTO [dbo].[Patient]
	([AddressId] ,[Name] ,[Species] ,[DOB]	) VALUES
	(@AddressId  ,@Name  ,@Species  ,@DOB	)
	set @PatientId = @@IDENTITY
END
GO



-- ************************************************************************************************
-- Add some data...
-- ************************************************************************************************

USE [VetClinic]
GO
SET IDENTITY_INSERT [dbo].[Address]  ON
GO
INSERT INTO [dbo].[Address]
([AddressId]	,[Street]					,[City]			,[State]	,[Zip]	) VALUES
 (1				,'123 Main St'				,'Scottsdale'	,'AZ'		,'85255')
,(2				,'2770 Doubletree Rd'		,'Scottsdale'	,'AZ'		,'85255')
,(3				,'1440 Mountain View Ln'	,'Scottsdale'	,'AZ'		,'85255')
,(4				,'14430 N 83rd Ave'			,'Scottsdale'	,'AZ'		,'85255')
,(5				,'1220 Shea Blvd'			,'Scottsdale'	,'AZ'		,'85255')
,(6				,'1660 N Scottsdale Rd'		,'Scottsdale'	,'AZ'		,'85255')
GO
SET IDENTITY_INSERT [dbo].[Address]  OFF
GO

USE [VetClinic]
GO
SET IDENTITY_INSERT [dbo].[Clinic]  ON
GO
INSERT INTO [dbo].[Clinic]
([ClinicId] ,[AddressId] ,[Name]		   ,[Hours]			) VALUES
 (1			,1			 ,'Birds N Beasts' ,'10AM to 5PM'	)
,(2			,2			 ,'Pets N Stuff'   ,'8AM to 7PM'	)
,(3			,3			 ,'The Last Walk'  ,'11AM to 2PM'	)
SET IDENTITY_INSERT [dbo].[Clinic]  OFF
GO

USE [VetClinic]
GO
SET IDENTITY_INSERT [dbo].[Doctor]  ON
GO
INSERT INTO [dbo].[Doctor]
([DoctorId] ,[ClinicId] ,[FirstName] ,[LastName] ,[Email]					) VALUES
 (1         ,1			,'John'		,'Smith'	 ,'john.smith@gmail.com'	)
,(2         ,2			,'Mary'		,'Johnson'	 ,'mary.johnson@yahoo.com'	)
,(3         ,3			,'Nancy'	,'Jones'	 ,'nancy.jones@hotmail.com'	)
SET IDENTITY_INSERT [dbo].[Doctor]  OFF
GO

USE [VetClinic]
GO
SET IDENTITY_INSERT [dbo].[Patient]  ON
GO
INSERT INTO [dbo].[Patient]
([PatientId] ,[AddressId] ,[Name]		,[Species] ,[DOB]						) VALUES
 (1			 ,4			  ,'Killer'		,'cat'	   ,'1980-01-01 00:00:00.000'	)
,(2			 ,5			  ,'Pinkie Pie'	,'pony'	   ,'1995-02-02 00:00:00.000'	)
,(3			 ,6			  ,'Nemo'		,'fish'	   ,'2015-03-03 00:00:00.000'	)
SET IDENTITY_INSERT [dbo].[Patient]  OFF
GO


