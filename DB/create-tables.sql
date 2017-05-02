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
