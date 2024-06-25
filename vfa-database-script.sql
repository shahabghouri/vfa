USE [master]
GO
/****** Object:  Database [VfASol]    Script Date: 24-Jun-24 9:37:56 PM ******/
CREATE DATABASE [VfASol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VfASol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\VfASol.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VfASol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\VfASol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VfASol] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VfASol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VfASol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VfASol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VfASol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VfASol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VfASol] SET ARITHABORT OFF 
GO
ALTER DATABASE [VfASol] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VfASol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VfASol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VfASol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VfASol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VfASol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VfASol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VfASol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VfASol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VfASol] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VfASol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VfASol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VfASol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VfASol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VfASol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VfASol] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VfASol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VfASol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VfASol] SET  MULTI_USER 
GO
ALTER DATABASE [VfASol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VfASol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VfASol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VfASol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VfASol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VfASol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VfASol] SET QUERY_STORE = ON
GO
ALTER DATABASE [VfASol] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VfASol]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[AboutId] [int] NOT NULL,
 CONSTRAINT [PK_AboutImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Topic] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](21) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[CompanyId] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[CountryId] [int] NULL,
	[Gender] [nvarchar](max) NULL,
	[Job] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[IsExporter] [bit] NULL,
	[IsImporter] [bit] NULL,
	[StateProvinceId] [int] NULL,
	[SubscribedPlanId] [bigint] NULL,
	[LastPaymentDate] [datetime2](7) NULL,
	[NextPaymentDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StreetAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[CategoryId] [int] NULL,
	[CompanyActivityId] [int] NULL,
	[CountryId] [int] NULL,
	[StateProvinceId] [int] NULL,
	[CEOName] [nvarchar](max) NULL,
	[WilayaId] [int] NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyActivites]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyActivites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CompanyActivites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyImage]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_CompanyImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ISO] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[InfoId] [int] NOT NULL,
 CONSTRAINT [PK_InfoImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infos]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Topic] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Infos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[SenderUserId] [nvarchar](450) NOT NULL,
	[ReceiverUserId] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[AttachmentUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[PartnerId] [int] NOT NULL,
 CONSTRAINT [PK_PartnerImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PaymentIdentifier] [nvarchar](max) NOT NULL,
	[PaidAmount] [decimal](18, 2) NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[SubscriptionPlanId] [bigint] NOT NULL,
	[Tenure] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOrders]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SubscriptionPlanId] [bigint] NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[Amount] [bigint] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Months] [int] NOT NULL,
 CONSTRAINT [PK_PaymentOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privacies]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privacies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Topic] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Privacies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrivacyImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivacyImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[PrivacyId] [int] NOT NULL,
 CONSTRAINT [PK_PrivacyImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ProductionCapacity] [int] NOT NULL,
	[CapacityUnit] [nvarchar](max) NOT NULL,
	[Certificates] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[RequestId] [int] NOT NULL,
 CONSTRAINT [PK_RequestImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateProvinces]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateProvinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountryId] [bigint] NOT NULL,
 CONSTRAINT [PK_StateProvinces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubsciptionPlans]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubsciptionPlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PlanType] [int] NOT NULL,
	[MonthlyAmount] [decimal](18, 2) NOT NULL,
	[_3MonthAmount] [decimal](18, 2) NOT NULL,
	[_6MonthAmount] [decimal](18, 2) NOT NULL,
	[_12MonthAmount] [decimal](18, 2) NOT NULL,
	[NumberOfProducts] [int] NOT NULL,
	[NumberOfServices] [int] NOT NULL,
	[NumberOfRequests] [int] NOT NULL,
	[NumberOfImagesForProducts] [int] NOT NULL,
	[NumberOfImagesForServices] [int] NOT NULL,
	[NumberOfImagesForRequests] [int] NOT NULL,
 CONSTRAINT [PK_SubsciptionPlans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionPlans]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionPlans](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PlanType] [int] NOT NULL,
	[MonthlyAmount] [decimal](18, 2) NOT NULL,
	[_3MonthAmount] [decimal](18, 2) NOT NULL,
	[_6MonthAmount] [decimal](18, 2) NOT NULL,
	[_12MonthAmount] [decimal](18, 2) NOT NULL,
	[NumberOfProducts] [int] NOT NULL,
	[NumberOfServices] [int] NOT NULL,
	[NumberOfRequests] [int] NOT NULL,
	[NumberOfImagesForProducts] [int] NOT NULL,
	[NumberOfImagesForServices] [int] NOT NULL,
	[NumberOfImagesForRequests] [int] NOT NULL,
 CONSTRAINT [PK_SubscriptionPlans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrustImages]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrustImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[TrustId] [int] NOT NULL,
 CONSTRAINT [PK_TrustImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trusts]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trusts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Trusts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wilayas]    Script Date: 24-Jun-24 9:37:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wilayas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Wilayas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240420230754_CreateAllTables', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240604163943_intialmodel', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240605184018_updateApplicationUser', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240605184651_updateCompanyEntity', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240605190359_addCEONameCompany', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240606161156_updatePropertyInCountry', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240606164009_updatePropertyInStateProvince', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240608121721_updateApplicationUserEntity', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240608172811_addingWilayas', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240608174343_addWilayaInCountryENtity', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240608180008_addCompanyNameASNull', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240608180259_addCompanyNameASNullRemoveRequireAttr', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240615162830_addUserIdInProductRequestandService', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240620153304_message', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622101442_setFieldsNullable', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622104716_Payment', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622110654_setFieldsRequired', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622112253_typo-s', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622123141_companyImages', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622155923_paymentOrder', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622210516_Desc', N'8.0.4')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622214455_tenure', N'8.0.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1f881f59-0320-46b8-b09d-a70330b5fd1f', N'Basic', N'BASIC', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2eeb62c6-456c-4361-ad59-c46bf03fb088', N'Company', N'COMPANY', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8a91f8e6-a218-450d-9428-ef11d7f0f5ff', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8b6e8307-a80c-42f6-a30a-5f7c214b725f', N'Importer', N'IMPORTER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9f82a270-1859-4bcb-b4c4-f9cfa27bc6b1', N'Visitor', N'VISITOR', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd7f8c7cd-eab4-466d-9ec9-f7787668f1f4', N'Gold', N'GOLD', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ddcb8f53-74a7-436e-a52d-690ac0e7b2a0', N'Employee', N'EMPLOYEE', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e98d50c7-90fa-4d75-9e09-f1ad51329815', N'Silver', N'SILVER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e98d50c7-90fa-4d75-9e09-f1ad51329816', N'Expoter', N'EXPOTER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a1ca504a-16da-457d-b52a-7a655af17dae', N'8a91f8e6-a218-450d-9428-ef11d7f0f5ff')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5c025007-a959-437d-b7fc-d531e03646dc', N'8b6e8307-a80c-42f6-a30a-5f7c214b725f')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [CountryId], [Gender], [Job], [MiddleName], [IsExporter], [IsImporter], [StateProvinceId], [SubscribedPlanId], [LastPaymentDate], [NextPaymentDate]) VALUES (N'240958b8-0f24-4e9a-85d9-13147e0e3f02', N'ApplicationUser', N'Muhammad Abdullah Shahab', N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', N'Punjab', N'47040', 18, N'ashahab315@gmail.com', N'ASHAHAB315@GMAIL.COM', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEL3bLC8WVRoDplhHzP4QNQmevi6AisguRfVgpLUTmi8zo55VbkQXA4Md1oG8WvsH0g==', N'KF7Z33XYM5K6H6EP4MKW233V3RUIQQUI', N'd8280da2-4b8e-4785-a469-d64af3f51f0d', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [CountryId], [Gender], [Job], [MiddleName], [IsExporter], [IsImporter], [StateProvinceId], [SubscribedPlanId], [LastPaymentDate], [NextPaymentDate]) VALUES (N'5c025007-a959-437d-b7fc-d531e03646dc', N'ApplicationUser', N'Ahmed', N'Gulberg', N'Islamabad', NULL, N'47040', 19, N'Ahmed1@mailinator.com', N'AHMED1@MAILINATOR.COM', NULL, NULL, 0, N'AQAAAAIAAYagAAAAEGo4+3mPQgIaJXd1uNhdLrnbnDwdXOROZuZ3kLjCph7P4iaBCOAqBmHG0+lImzdD4g==', N'U4RSQY3HKREOC4GPM2FAD4Z5LF7KB7Q4', N'60f35b57-0864-4d27-95e4-3231263b0958', NULL, 0, 0, NULL, 1, 0, 1163, N'male', N'SEO Expert', NULL, 0, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [Name], [StreetAddress], [City], [State], [PostalCode], [CompanyId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [CountryId], [Gender], [Job], [MiddleName], [IsExporter], [IsImporter], [StateProvinceId], [SubscribedPlanId], [LastPaymentDate], [NextPaymentDate]) VALUES (N'a1ca504a-16da-457d-b52a-7a655af17dae', N'ApplicationUser', N'Bhrugen Patel', N'test 123 Ave', N'Chicago', N'IL', N'23422', NULL, N'admin@dotnetmastery.com', N'ADMIN@DOTNETMASTERY.COM', N'admin@dotnetmastery.com', N'ADMIN@DOTNETMASTERY.COM', 1, N'AQAAAAIAAYagAAAAEKuKi1aEGgiivZTeSXqGc8UqxXtA6wTZmPKx8fSOBqEop3/nvOOaCmatmKSmWWrVBA==', N'NOM23VDM67Q4FJPBPAZ2XS6GTW3PHIFV', N'c2220a1d-cc6b-494c-aabf-1f3279a0c1c2', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Agriculture Food')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Accessories')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Clothing')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (1, N'ARK IT Services', N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, 3, 1, 1163, 1, N'Yasir Rehman', NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (2, N'ARK IT Services', N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, 1, 1, 1163, 1, N'Yasir Rehman', NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (3, N'ARK IT Services', N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, 1, 1, 1163, 1, N'Yasir Rehman', NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (4, N'ARK IT Services', N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, 1, 1, 1163, 1, N'Yasir Rehman', NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (12, N'Google', N'Mountain View, California, United States', N'California', NULL, N'94043', NULL, 1, 1, 1228, 5, N'Suner RajPijai', NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (13, N'META', N'One Hacker Way Menlo Park, CA 94025 USA', N'California', NULL, N'94025', NULL, 1, 1, NULL, NULL, N'Mark Zuckerberg', 1)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (14, N'Meyers and Gray Co', N'Ut aspernatur fugiat', N'Architecto et tenetu', NULL, N'92965', NULL, 3, 3, 1101, 82, N'Cantu and Odonnell Trading', NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (15, NULL, N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (16, NULL, N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (17, NULL, N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (18, NULL, N'House#185/3, Street 4, Nishtar Road, Lalazar Colony', N'Wah Cantt', NULL, N'47040', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Companies] ([Id], [Name], [StreetAddress], [City], [State], [PostalCode], [PhoneNumber], [CategoryId], [CompanyActivityId], [CountryId], [StateProvinceId], [CEOName], [WilayaId]) VALUES (19, N'ARK IT Services', N'Gulberg', N'Islamabad', NULL, N'47040', NULL, 1, 5, 1163, 1, N'Yasir Rehman', NULL)
GO
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyActivites] ON 
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (1, N'Service Provider')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (3, N'clothing')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (4, N'marketting')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (5, N'SEO')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (6, N'Equipments')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (7, N'Others')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (8, N'A')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (9, N'B')
GO
INSERT [dbo].[CompanyActivites] ([Id], [Name]) VALUES (10, N'C')
GO
SET IDENTITY_INSERT [dbo].[CompanyActivites] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyImage] ON 
GO
INSERT [dbo].[CompanyImage] ([Id], [ImageUrl], [CompanyId]) VALUES (1, N'\images\companies\company-19\6589985b-4ce9-4f46-b9e0-e562d7068c3f.png', 19)
GO
SET IDENTITY_INSERT [dbo].[CompanyImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1001, N'Afghanistan', N'AF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1002, N'Albania', N'AL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1003, N'Algeria', N'DZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1004, N'American Samoa', N'AS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1005, N'Andorra', N'AD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1006, N'Angola', N'AO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1007, N'Anguilla', N'AI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1008, N'Antarctica', N'AQ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1009, N'Antigua and Barbuda', N'AG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1010, N'Argentina', N'AR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1011, N'Armenia', N'AM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1012, N'Aruba', N'AW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1013, N'Australia', N'AU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1014, N'Austria', N'AT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1015, N'Azerbaijan', N'AZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1016, N'Bahrain', N'BH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1017, N'Bangladesh', N'BD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1018, N'Barbados', N'BB')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1019, N'Belarus', N'BY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1020, N'Belgium', N'BE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1021, N'Belize', N'BZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1022, N'Benin', N'BJ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1023, N'Bermuda', N'BM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1024, N'Bhutan', N'BT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1025, N'Bolivia', N'BO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1026, N'Bosnia and Herzegovina', N'BA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1027, N'Botswana', N'BW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1028, N'Bouvet Island', N'BV')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1029, N'Brazil', N'BR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1030, N'British Indian Ocean Territory', N'IO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1031, N'Virgin Islands, British', N'VG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1032, N'Brunei Darussalam', N'BN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1033, N'Bulgaria', N'BG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1034, N'Burkina Faso', N'BF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1035, N'Myanmar', N'MM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1036, N'Burundi', N'BI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1037, N'Cambodia', N'KH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1038, N'Cameroon', N'CM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1039, N'Canada', N'CA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1040, N'Cape Verde', N'CV')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1041, N'Cayman Islands', N'KY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1042, N'Central African Republic', N'CF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1043, N'Chad', N'TD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1044, N'Chile', N'CL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1045, N'China', N'CN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1046, N'Christmas Island', N'CX')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1047, N'Cocos (Keeling) Islands', N'CC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1048, N'Colombia', N'CO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1049, N'Comoros', N'KM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1050, N'Congo, The Democratic Republic of the', N'CD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1051, N'Congo', N'CG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1052, N'Cook Islands', N'CK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1053, N'Costa Rica', N'CR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1054, N'Côte Ivoire', N'CI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1055, N'Croatia', N'HR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1056, N'Cuba', N'CU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1057, N'Cyprus', N'CY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1058, N'Czech Republic', N'CZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1059, N'Denmark', N'DK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1060, N'Djibouti', N'DJ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1061, N'Dominica', N'DM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1062, N'Dominican Republic', N'DO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1063, N'Timor-Leste', N'TL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1064, N'Ecuador', N'EC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1065, N'Egypt', N'EG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1066, N'El Salvador', N'SV')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1067, N'Equatorial Guinea', N'GQ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1068, N'Eritrea', N'ER')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1069, N'Estonia', N'EE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1070, N'Ethiopia', N'ET')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1072, N'Falkland Islands (Malvinas)', N'FK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1073, N'Faroe Islands', N'FO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1074, N'Fiji', N'FJ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1075, N'Finland', N'FI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1076, N'France', N'FR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1077, N'French Guiana', N'GF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1078, N'French Polynesia', N'PF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1079, N'French Southern Territories', N'TF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1080, N'Gabon', N'GA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1081, N'Georgia', N'GE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1082, N'Germany', N'DE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1083, N'Ghana', N'GH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1084, N'Gibraltar', N'GI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1085, N'Greece', N'GR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1086, N'Greenland', N'GL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1087, N'Grenada', N'GD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1088, N'Guadeloupe', N'GP')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1089, N'Guam', N'GU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1090, N'Guatemala', N'GT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1091, N'Guinea', N'GN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1092, N'Guinea-Bissau', N'GW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1093, N'Guyana', N'GY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1094, N'Haiti', N'HT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1095, N'Heard Island and McDonald Islands', N'HM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1096, N'Holy See (Vatican City State)', N'VA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1097, N'Honduras', N'HN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1098, N'Hong Kong', N'HK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1099, N'Hungary', N'HU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1100, N'Iceland', N'IS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1101, N'India', N'IN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1102, N'Indonesia', N'ID')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1103, N'Iran, Islamic Republic of', N'IR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1104, N'Iraq', N'IQ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1105, N'Ireland', N'IE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1106, N'Israel', N'IL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1107, N'Italy', N'IT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1108, N'Jamaica', N'JM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1109, N'Japan', N'JP')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1110, N'Jordan', N'JO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1111, N'Kazakhstan', N'KZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1112, N'Kenya', N'KE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1113, N'Kiribati', N'KI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1114, N'Korea, Democratic Peoples Republic of', N'KP')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1115, N'Korea, Republic of', N'KR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1116, N'Kuwait', N'KW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1117, N'Kyrgyzstan', N'KG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1118, N'Lao Peoples Democratic Republic', N'LA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1119, N'Latvia', N'LV')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1120, N'Lebanon', N'LB')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1121, N'Lesotho', N'LS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1122, N'Liberia', N'LR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1123, N'Libyan Arab Jamahiriya', N'LY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1124, N'Liechtenstein', N'LI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1125, N'Lithuania', N'LT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1126, N'Luxembourg', N'LU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1127, N'Macao', N'MO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1128, N'Macedonia, Republic of', N'MK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1129, N'Madagascar', N'MG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1130, N'Malawi', N'MW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1131, N'Malaysia', N'MY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1132, N'Maldives', N'MV')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1133, N'Mali', N'ML')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1134, N'Malta', N'MT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1135, N'Marshall Islands', N'MH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1136, N'Martinique', N'MQ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1137, N'Mauritania', N'MR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1138, N'Mauritius', N'MU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1139, N'Mayotte', N'YT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1140, N'Mexico', N'MX')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1141, N'Micronesia, Federated States of', N'FM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1142, N'Moldova', N'MD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1143, N'Monaco', N'MC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1144, N'Mongolia', N'MN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1145, N'Montserrat', N'MS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1146, N'Morocco', N'MA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1147, N'Mozambique', N'MZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1148, N'Namibia', N'NA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1149, N'Nauru', N'NR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1150, N'Nepal', N'NP')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1151, N'Netherlands Antilles', N'AN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1152, N'Netherlands', N'NL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1153, N'New Caledonia', N'NC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1154, N'New Zealand', N'NZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1155, N'Nicaragua', N'NI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1156, N'Niger', N'NE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1157, N'Nigeria', N'NG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1158, N'Niue', N'NU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1159, N'Norfolk Island', N'NF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1160, N'Northern Mariana Islands', N'MP')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1161, N'Norway', N'NO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1162, N'Oman', N'OM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1163, N'Pakistan', N'PK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1164, N'Palau', N'PW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1165, N'Palestinian Territory, Occupied', N'PS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1166, N'Panama', N'PA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1167, N'Papua New Guinea', N'PG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1168, N'Paraguay', N'PY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1169, N'Peru', N'PE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1170, N'Philippines', N'PH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1171, N'Pitcairn', N'PN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1172, N'Poland', N'PL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1173, N'Portugal', N'PT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1174, N'Puerto Rico', N'PR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1175, N'Qatar', N'QA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1176, N'Romania', N'RO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1177, N'Russian Federation', N'RU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1178, N'Rwanda', N'RW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1179, N'Reunion', N'RE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1180, N'Saint Helena', N'SH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1181, N'Saint Kitts and Nevis', N'KN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1182, N'Saint Lucia', N'LC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1183, N'Saint Pierre and Miquelon', N'PM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1184, N'Saint Vincent and the Grenadines', N'VC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1185, N'Samoa', N'WS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1186, N'San Marino', N'SM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1187, N'Saudi Arabia', N'SA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1188, N'Senegal', N'SN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1189, N'Seychelles', N'SC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1190, N'Sierra Leone', N'SL')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1191, N'Singapore', N'SG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1192, N'Slovakia', N'SK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1193, N'Slovenia', N'SI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1194, N'Solomon Islands', N'SB')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1195, N'Somalia', N'SO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1196, N'South Africa', N'ZA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1197, N'South Georgia and the South Sandwich Islands', N'GS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1198, N'Spain', N'ES')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1199, N'Sri Lanka', N'LK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1200, N'Sudan', N'SD')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1201, N'Suriname', N'SR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1202, N'Svalbard and Jan Mayen', N'SJ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1203, N'Swaziland', N'SZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1204, N'Sweden', N'SE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1205, N'Switzerland', N'CH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1206, N'Syrian Arab Republic', N'SY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1207, N'Sao Tome and Principe', N'ST')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1208, N'Taiwan', N'TW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1209, N'Tajikistan', N'TJ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1210, N'Tanzania, United Republic of', N'TZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1211, N'Thailand', N'TH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1212, N'Bahamas', N'BS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1213, N'Gambia', N'GM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1214, N'Togo', N'TG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1215, N'Tokelau', N'TK')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1216, N'Tonga', N'TO')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1217, N'Trinidad and Tobago', N'TT')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1218, N'Tunisia', N'TN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1219, N'Turkey', N'TR')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1220, N'Turkmenistan', N'TM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1221, N'Turks and Caicos Islands', N'TC')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1222, N'Tuvalu', N'TV')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1223, N'Uganda', N'UG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1224, N'Ukraine', N'UA')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1225, N'United Arab Emirates', N'AE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1226, N'United Kingdom', N'GB')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1227, N'United States Minor Outlying Islands', N'UM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1228, N'United States', N'US')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1229, N'Uruguay', N'UY')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1230, N'Uzbekistan', N'UZ')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1231, N'Vanuatu', N'VU')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1232, N'Venezuela', N'VE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1233, N'Viet Nam', N'VN')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1234, N'Virgin Islands, U.S.', N'VI')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1235, N'Wallis and Futuna', N'WF')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1236, N'Western Sahara', N'EH')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1237, N'Yemen', N'YE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1238, N'Serbia and Montenegro', N'CS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1239, N'Zambia', N'ZM')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1240, N'Zimbabwe', N'ZW')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1241, N'Åland Islands', N'AX')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1242, N'Serbia', N'RS')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1243, N'Montenegro', N'ME')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1244, N'Jersey', N'JE')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1245, N'Guernsey', N'GG')
GO
INSERT [dbo].[Countries] ([Id], [Name], [ISO]) VALUES (1246, N'Isle of Man', N'IM')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerImages] ON 
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (4, N'\images\partners\partner-1\46d65f48-1c81-4d70-85c8-6148fcbee3e5.png', 1)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (5, N'\images\partners\partner-2\f5e8909b-4c04-41f6-9558-1f90ca5277fa.png', 2)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (6, N'\images\partners\partner-3\94ff62d0-f51d-4366-8b55-54b479274cd5.png', 3)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (7, N'\images\partners\partner-4\bb288d07-4099-41cd-8c43-884694012e32.png', 4)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (8, N'\images\partners\partner-5\e6035fee-7105-47ee-95ee-4625b46e9fc2.jpg', 5)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (9, N'\images\partners\partner-6\528dc216-4c23-4624-ab81-37778e2664d7.png', 6)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (10, N'\images\partners\partner-7\24264f5e-9855-425d-8c5c-45a7c8c166fb.png', 7)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (11, N'\images\partners\partner-8\5cf2e29e-bcc8-4ef1-8143-bcce938d547d.png', 8)
GO
INSERT [dbo].[PartnerImages] ([Id], [ImageUrl], [PartnerId]) VALUES (12, N'\images\partners\partner-9\8c8fbf06-0c8a-4fe8-aee9-10fe039cd5f9.png', 9)
GO
SET IDENTITY_INSERT [dbo].[PartnerImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (1, N'Apple')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (2, N'Microsoft')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (3, N'New Balance')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (4, N'addidas')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (5, N'Lumber 1')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (6, N'PCB')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (7, N'uniliver')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (8, N'nestle')
GO
INSERT [dbo].[Partners] ([Id], [Name]) VALUES (9, N'meta')
GO
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 
GO
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId]) VALUES (1, N'\images\products\product-2\6f702836-fa47-4d76-931a-b4970ab7d7de.jpg', 2)
GO
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId]) VALUES (2, N'\images\products\product-3\84a24547-153f-426b-973f-f6c22a7c21e4.png', 3)
GO
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId]) VALUES (3, N'\images\products\product-4\c538bd03-4856-4b1a-a96e-35aacac9e2db.png', 4)
GO
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId]) VALUES (4, N'\images\products\product-5\f4629e61-e5d7-417e-b1c7-c77026e355ee.png', 5)
GO
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId]) VALUES (5, N'\images\products\product-6\67f3091b-c183-43c1-94db-fc05b8add967.png', 6)
GO
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductionCapacity], [CapacityUnit], [Certificates], [CategoryId], [UserId]) VALUES (1, N'Product A', N'<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', 10, N'2', N'yes', 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductionCapacity], [CapacityUnit], [Certificates], [CategoryId], [UserId]) VALUES (2, N'Screw Driver Set', N'<ul><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Set Includes: Phillips #000, #00, #0, #1</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Ergonomics: Cushion grip tapered handle for rapid rotation and precise torque</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Extra-long handle for optimal hand positions and smooth turning</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Tip profile labeled on handle for easy identification</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Exact fit precision machined tip for reduced cam-out</span></li></ul>', 1, N'2', N'yes', 3, N'184eabac-4940-4b2e-b97f-6bd30d5d4120')
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductionCapacity], [CapacityUnit], [Certificates], [CategoryId], [UserId]) VALUES (3, N'Product C', N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae dolor turpis. In porta felis ac est efficitur, eget elementum tortor congue. Quisque cursus dictum nunc, ac eleifend ipsum laoreet auctor. Aenean quis neque id ipsum porttitor consequat ac id tellus. Curabitur commodo dui vel tellus congue malesuada. Donec aliquam sollicitudin ante in egestas. In hac habitasse platea dictumst. Nullam interdum vehicula augue aliquet varius. Proin quis mattis nulla, a eleifend neque. Duis eu ligula at odio bibendum ultricies at et velit. Duis lorem ante, commodo ullamcorper sagittis vel, bibendum vel lorem. Donec venenatis imperdiet arcu, vitae auctor nunc dapibus quis. Nam mattis lectus nunc, et placerat neque pellentesque non. Duis eget enim at leo tristique gravida in ut urna.</span><br></p>', 5, N'5', N'No', 3, N'184eabac-4940-4b2e-b97f-6bd30d5d4120')
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductionCapacity], [CapacityUnit], [Certificates], [CategoryId], [UserId]) VALUES (4, N'Product C', N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae dolor turpis. In porta felis ac est efficitur, eget elementum tortor congue. Quisque cursus dictum nunc, ac eleifend ipsum laoreet auctor. Aenean quis neque id ipsum porttitor consequat ac id tellus. Curabitur commodo dui vel tellus congue malesuada. Donec aliquam sollicitudin ante in egestas. In hac habitasse platea dictumst. Nullam interdum vehicula augue aliquet varius. Proin quis mattis nulla, a eleifend neque. Duis eu ligula at odio bibendum ultricies at et velit. Duis lorem ante, commodo ullamcorper sagittis vel, bibendum vel lorem. Donec venenatis imperdiet arcu, vitae auctor nunc dapibus quis. Nam mattis lectus nunc, et placerat neque pellentesque non. Duis eget enim at leo tristique gravida in ut urna.</span><br></p>', 6, N'6', N'no', 3, N'184eabac-4940-4b2e-b97f-6bd30d5d4120')
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductionCapacity], [CapacityUnit], [Certificates], [CategoryId], [UserId]) VALUES (5, N'Product D', N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae dolor turpis. In porta felis ac est efficitur, eget elementum tortor congue. Quisque cursus dictum nunc, ac eleifend ipsum laoreet auctor. Aenean quis neque id ipsum porttitor consequat ac id tellus. Curabitur commodo dui vel tellus congue malesuada. Donec aliquam sollicitudin ante in egestas. In hac habitasse platea dictumst. Nullam interdum vehicula augue aliquet varius. Proin quis mattis nulla, a eleifend neque. Duis eu ligula at odio bibendum ultricies at et velit. Duis lorem ante, commodo ullamcorper sagittis vel, bibendum vel lorem. Donec venenatis imperdiet arcu, vitae auctor nunc dapibus quis. Nam mattis lectus nunc, et placerat neque pellentesque non. Duis eget enim at leo tristique gravida in ut urna.</span><br></p>', 7, N'7', N'yes', 3, N'184eabac-4940-4b2e-b97f-6bd30d5d4120')
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ProductionCapacity], [CapacityUnit], [Certificates], [CategoryId], [UserId]) VALUES (6, N'Product E', N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae dolor turpis. In porta felis ac est efficitur, eget elementum tortor congue. Quisque cursus dictum nunc, ac eleifend ipsum laoreet auctor. Aenean quis neque id ipsum porttitor consequat ac id tellus. Curabitur commodo dui vel tellus congue malesuada. Donec aliquam sollicitudin ante in egestas. In hac habitasse platea dictumst. Nullam interdum vehicula augue aliquet varius. Proin quis mattis nulla, a eleifend neque. Duis eu ligula at odio bibendum ultricies at et velit. Duis lorem ante, commodo ullamcorper sagittis vel, bibendum vel lorem. Donec venenatis imperdiet arcu, vitae auctor nunc dapibus quis. Nam mattis lectus nunc, et placerat neque pellentesque non. Duis eget enim at leo tristique gravida in ut urna.</span><br></p>', 10, N'10', N'Yes', 3, N'184eabac-4940-4b2e-b97f-6bd30d5d4120')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestImages] ON 
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (1, N'\images\requests\request-3\34a2e4d3-e0c1-4733-abb0-d9b822da06a8.jpg', 3)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (2, N'\images\requests\request-4\e6ea4944-2775-44e3-8612-8f623f0dc6ed.png', 4)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (3, N'\images\requests\request-5\b3bdf356-42f9-4848-a3d1-1a7c718fac3a.png', 5)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (4, N'\images\requests\request-6\c2d4eec5-8b1a-4440-9da5-81d71fedda49.png', 6)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (5, N'\images\requests\request-7\2216ee34-4276-4d44-b443-67f86329a8bb.gif', 7)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (8, N'\images\requests\request-10\33e20cb4-da6a-44a7-a087-3c42513a23e0.jpg', 10)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (10, N'\images\requests\request-11\2676c60e-45b2-47fd-b8cd-94b3e72dddc5.png', 11)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (11, N'\images\requests\request-12\1deb8947-6376-4100-aff7-269d0d9511ff.png', 12)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (12, N'\images\requests\request-13\254c0492-c0ce-457f-9d82-096f8b68ab34.png', 13)
GO
INSERT [dbo].[RequestImages] ([Id], [ImageUrl], [RequestId]) VALUES (13, N'\images\requests\request-14\7acdd2e0-5bff-42b1-bbcd-4a1b2955db59.png', 14)
GO
SET IDENTITY_INSERT [dbo].[RequestImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Requests] ON 
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (1, N'Looking for shipping Company', 1, N'<p>Need Shipping from Algeria to Canada</p><p>sdfn</p><p>ash</p><p>asfja</p><p>sfja</p><p>sfkias</p><p>faisf</p>', NULL)
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (2, N'Tax', 1, N'Need Commissionnaire de douane', NULL)
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (3, N'Request Aasdf', 1, N'<p><span style="font-weight: bolder; color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</span><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (4, N'Request B', 1, N'<p><span style="font-weight: bolder; color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</span><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (5, N'Request C', 1, N'<p><span style="font-weight: bolder; color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</span><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (6, N'Request D', 1, N'<p><span style="font-weight: bolder; color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</span><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (7, N'Request E', 1, N'<p><span style="font-weight: bolder; color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem Ipsum</span><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</span><br></p>', NULL)
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (10, N'vending machine', 3, N'<ul><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Frost-free Air Cooling: The built-in wine cooler simulates the temperature and humidity of the original wine cellar, keeping a constant temperature all year round. With a circulating air-cooling system, it can take care of every bottle of your treasured wine and care for the mellow taste.</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Constant Temperature Setting: You can set the temperature by touching the electronic screen (41~71.6℉ adjustable), even if there is an accidental power failure, there is no need to worry, the original setting temperature will be restored automatically after the power is turned on.</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Adjustable Shelves: After opening the irreversible cabinet door, there are adjustable shelves made of beech wood, flexible and sturdy. Not only can you adjust the size of the space according to the needs of use, but the built-in sliding track also makes it convenient for you to access your wine and food.</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Quiet and Non-intrusive: Adopting an upgraded Huayi brand compressor, it provides strong and stable power for the wine fridge, while controlling the noise below 39bd. The soft blue LED light is highly ornamental, providing a quiet and stylish environment for your house.</span></li><li class="a-spacing-mini" style="list-style: disc; overflow-wrap: break-word; margin: 0px;"><span class="a-list-item" style="color: rgb(15, 17, 17);">Security &amp; Versatile: The wine refrigerator is equipped with child lock function, protecting the safety of your family while also protecting your precious wine. Not only can it store treasured wines such as red wine, but also beverages, fruits and other food that need to be refrigerated.</span></li></ul>', N'184eabac-4940-4b2e-b97f-6bd30d5d4120')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (11, N'Gazelle Shoes Brown', 4, N'<p>Made of soft nubuck, the sneakers are lined in a neutral tone to complement the classic low-key style. The same soft suede upper with contrast 3-Stripes and a heel tab that echoes early-''90s style still look fresh thirty years later. A metallic-gold "Gazelle" adds the final authentic touch.<br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (12, N'Addidas Jacket', 4, N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ipsum placerat, euismod velit vitae, interdum nibh. Aenean in ipsum vulputate, posuere mi ac, auctor justo. Nulla aliquet eros vestibulum pharetra sollicitudin. Pellentesque enim elit, aliquet quis laoreet id, vehicula ac metus. Praesent vehicula sagittis nisi, id egestas elit elementum id. Vestibulum mollis risus at justo iaculis malesuada. Etiam mauris nulla, vulputate eget sapien quis, consectetur consequat nisi. Sed tempor mauris quis nibh sollicitudin vestibulum. Mauris ac quam a ligula volutpat aliquam. Donec ex ante, laoreet eu mattis a, sagittis non magna. Fusce tempor malesuada ligula, eu scelerisque diam pretium ut. Donec placerat eget urna sit amet mattis.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (13, N'New Balance 223 men', 4, N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ipsum placerat, euismod velit vitae, interdum nibh. Aenean in ipsum vulputate, posuere mi ac, auctor justo. Nulla aliquet eros vestibulum pharetra sollicitudin. Pellentesque enim elit, aliquet quis laoreet id, vehicula ac metus. Praesent vehicula sagittis nisi, id egestas elit elementum id. Vestibulum mollis risus at justo iaculis malesuada. Etiam mauris nulla, vulputate eget sapien quis, consectetur consequat nisi. Sed tempor mauris quis nibh sollicitudin vestibulum. Mauris ac quam a ligula volutpat aliquam. Donec ex ante, laoreet eu mattis a, sagittis non magna. Fusce tempor malesuada ligula, eu scelerisque diam pretium ut. Donec placerat eget urna sit amet mattis.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
INSERT [dbo].[Requests] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (14, N'sweston bullston', 4, N'<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi non ipsum placerat, euismod velit vitae, interdum nibh. Aenean in ipsum vulputate, posuere mi ac, auctor justo. Nulla aliquet eros vestibulum pharetra sollicitudin. Pellentesque enim elit, aliquet quis laoreet id, vehicula ac metus. Praesent vehicula sagittis nisi, id egestas elit elementum id. Vestibulum mollis risus at justo iaculis malesuada. Etiam mauris nulla, vulputate eget sapien quis, consectetur consequat nisi. Sed tempor mauris quis nibh sollicitudin vestibulum. Mauris ac quam a ligula volutpat aliquam. Donec ex ante, laoreet eu mattis a, sagittis non magna. Fusce tempor malesuada ligula, eu scelerisque diam pretium ut. Donec placerat eget urna sit amet mattis.</span><br></p>', N'29dbb94b-7809-4fca-8c24-503a6e66a4ee')
GO
SET IDENTITY_INSERT [dbo].[Requests] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceImages] ON 
GO
INSERT [dbo].[ServiceImages] ([Id], [ImageUrl], [ServiceId]) VALUES (1, N'\images\services\service-2\6f30a0ab-9492-4cfa-9062-3860d4315865.jpg', 2)
GO
INSERT [dbo].[ServiceImages] ([Id], [ImageUrl], [ServiceId]) VALUES (2, N'\images\services\service-2\8ba6a3f6-41c7-4df7-a43e-ca71d969686e.jpg', 2)
GO
SET IDENTITY_INSERT [dbo].[ServiceImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 
GO
INSERT [dbo].[Services] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (1, N'Tourism', 1, N'Business Trip', NULL)
GO
INSERT [dbo].[Services] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (2, N'Service 1', 1, N'<div class="c-article-card" style="padding: 4rem 7rem 2rem; color: rgb(33, 39, 33); font-family: Outfit, sans-serif; font-size: 20px;"><h1 style="font-weight: 600; margin-bottom: 2rem; line-height: 1.1; font-size: 7.2rem;">Long descriptions for images - part 1</h1><p style="margin-bottom: 2.5rem; font-size: 2.4rem; max-width: 110rem;">In this article, we look at the role of long descriptions for images. Why you need them and how to implement them.</p></div><div class="c-page-builder c-page-builder--content" style="padding: 0px 4rem 0px 7rem; color: rgb(33, 39, 33); font-family: Outfit, sans-serif; font-size: 20px;"><h2 style="font-weight: 600; margin-bottom: 2rem; margin-top: 3rem; line-height: 1.1; font-size: 3.6rem; padding-top: 2rem;">What are long descriptions?</h2><p style="margin-bottom: 2.5rem;">Long descriptions are text versions of the information provided in a detailed or complex image.</p><p style="margin-bottom: 2.5rem;">Most web writers are familiar with short descriptions for images, often called text alternatives or ALT text. We use them when an image conveys a brief message or acts as a link.</p><p style="margin-bottom: 2.5rem;">However, when we use diagrams, maps or graphs, the ALT text is not usually enough to provide an adequate text alternative. To present a long description, we might need to use headings, dot points or data tables. While ALT text can be long (there''s no technical limit), long text usually needs structure. And ALT text can only be text.</p><h2 style="font-weight: 600; margin-bottom: 2rem; margin-top: 3rem; line-height: 1.1; font-size: 3.6rem; padding-top: 2rem;">Benefits of long descriptions</h2><p style="margin-bottom: 2.5rem;">Long descriptions are important for people with vision impairments. If someone can''t see an image, or can''t see the detail in it, they can''t access the information it provides.</p><p style="margin-bottom: 2.5rem;">Long descriptions sometimes help people with learning disabilities. If someone can''t interpret the image or listens to web pages with a voice browser because they have problems reading, the text version can help.</p><p style="margin-bottom: 2.5rem;">Another benefit of long descriptions is discovery. Search engines can only index information contained in an image if there is text that identifies and describes it.</p></div>', NULL)
GO
INSERT [dbo].[Services] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (3, N'Service 1', 1, N'<p>ethehergqwrhwer</p>', NULL)
GO
INSERT [dbo].[Services] ([Id], [Name], [CategoryId], [Description], [UserId]) VALUES (4, N'2334', 3, N'<p>sfgdfsgergergrbrgoewjrghworihw ihjtewoihg&nbsp; egi hweipgh ewpigjpephgpeqrijgqper gjpqrijgpqwrighwqpwr ghqwpighwprihpwri jwpritrjpwrihjergo eohgihgwrih ghwrhrgoewkhno o orghjgjeowrirgj ewporgj&nbsp; wprwpirgj ewgkjewrgj ewrperipegjjwri igerjgpew ewjgewr ewrkgjwp grewpg nebetbh cvjb,mdbn dlbnl</p>', NULL)
GO
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[StateProvinces] ON 
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (1, N'Punjab', 1163)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (2, N'Alaska', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (3, N'Arizona', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (4, N'Arkansas', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (5, N'California', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (6, N'Colorado', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (7, N'Connecticut', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (8, N'Delaware', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (9, N'Florida', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (10, N'Georgia', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (11, N'Hawaii', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (12, N'Idaho', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (13, N'Illinois', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (14, N'Indiana', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (15, N'Iowa', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (16, N'Kansas', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (17, N'Kentucky', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (18, N'Louisiana', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (19, N'Maine', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (20, N'Maryland', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (21, N'Massachusetts', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (22, N'Michigan', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (23, N'Minnesota', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (24, N'Mississippi', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (25, N'Missouri', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (26, N'Montana', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (27, N'Nebraska', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (28, N'Nevada', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (29, N'New Hampshire', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (30, N'New Jersey', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (31, N'New Mexico', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (32, N'New York', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (33, N'North Carolina', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (34, N'North Dakota', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (35, N'Ohio', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (36, N'Oklahoma', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (37, N'Oregon', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (38, N'Pennsylvania', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (39, N'Rhode Island', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (40, N'South Carolina', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (41, N'South Dakota', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (42, N'Tennessee', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (43, N'Texas', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (44, N'Utah', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (45, N'Vermont', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (46, N'Virginia', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (47, N'Washington', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (48, N'West Virginia', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (49, N'Wisconsin', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (50, N'Wyoming', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (51, N'District of Columbia', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (52, N'American Samoa', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (53, N'Guam', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (54, N'Northern Mariana Islands', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (55, N'Puerto Rico', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (56, N'Virgin Islands', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (57, N'United States Minor Outlying Islands', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (58, N'Armed Forces Europe', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (59, N'Armed Forces Americas', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (60, N'Armed Forces Pacific', 1228)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (61, N'Alberta', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (62, N'British Columbia', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (63, N'Manitoba', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (64, N'New Brunswick', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (65, N'Newfoundland and Labrador', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (66, N'Northwest Territories', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (67, N'Nova Scotia', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (68, N'Nunavut', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (69, N'Ontario', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (70, N'Prince Edward Island', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (71, N'Quebec', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (72, N'Saskatchewan', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (73, N'Yukon Territory', 1039)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (74, N'Maharashtra', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (75, N'Karnataka', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (76, N'Andhra Pradesh', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (77, N'Arunachal Pradesh', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (78, N'Assam', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (79, N'Bihar', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (80, N'Chhattisgarh', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (81, N'Goa', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (82, N'Gujarat', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (83, N'Haryana', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (84, N'Himachal Pradesh', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (85, N'Jammu and Kashmir', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (86, N'Jharkhand', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (87, N'Kerala', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (88, N'Madhya Pradesh', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (89, N'Manipur', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (90, N'Meghalaya', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (91, N'Mizoram', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (92, N'Nagaland', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (93, N'Orissa', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (94, N'Punjab', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (95, N'Rajasthan', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (96, N'Sikkim', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (97, N'Tamil Nadu', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (98, N'Tripura', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (99, N'Uttaranchal', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (100, N'Uttar Pradesh', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (101, N'West Bengal', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (102, N'Andaman and Nicobar Islands', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (103, N'Dadra and Nagar Haveli', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (104, N'Daman and Diu', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (105, N'Delhi', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (106, N'Lakshadweep', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (107, N'Pondicherry', 1101)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (108, N'mazowieckie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (109, N'pomorskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (110, N'dolnoslaskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (111, N'kujawsko-pomorskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (112, N'lubelskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (113, N'lubuskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (114, N'lódzkie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (115, N'malopolskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (116, N'opolskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (117, N'podkarpackie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (118, N'podlaskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (119, N'slaskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (120, N'swietokrzyskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (121, N'warminsko-mazurskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (122, N'wielkopolskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (123, N'zachodniopomorskie', 1172)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (124, N'Abu Zaby', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (125, N'Ajman', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (126, N'Al Fujayrah', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (127, N'Ash Shariqah', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (128, N'Dubayy', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (129, N'Ras al Khaymah', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (130, N'Dac Lac', 1233)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (131, N'Umm al Qaywayn', 1225)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (132, N'Badakhshan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (133, N'Badghis', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (134, N'Baghlan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (135, N'Balkh', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (136, N'Bamian', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (137, N'Farah', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (138, N'Faryab', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (139, N'Ghazni', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (140, N'Ghowr', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (141, N'Helmand', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (142, N'Herat', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (143, N'Jowzjan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (144, N'Kabul', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (145, N'Kandahar', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (146, N'Kapisa', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (147, N'Khowst', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (148, N'Konar', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (149, N'Kondoz', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (150, N'Laghman', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (151, N'Lowgar', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (152, N'Nangrahar', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (153, N'Nimruz', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (154, N'Nurestan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (155, N'Oruzgan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (156, N'Paktia', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (157, N'Paktika', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (158, N'Parwan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (159, N'Samangan', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (160, N'Sar-e Pol', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (161, N'Takhar', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (162, N'Wardak', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (163, N'Zabol', 1001)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (164, N'Berat', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (165, N'Bulqizë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (166, N'Delvinë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (167, N'Devoll', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (168, N'Dibër', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (169, N'Durrsës', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (170, N'Elbasan', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (171, N'Fier', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (172, N'Gramsh', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (173, N'Gjirokastër', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (174, N'Has', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (175, N'Kavajë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (176, N'Kolonjë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (177, N'Korcë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (178, N'Krujë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (179, N'Kuçovë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (180, N'Kukës', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (181, N'Kurbin', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (182, N'Lezhë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (183, N'Librazhd', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (184, N'Lushnjë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (185, N'Malësi e Madhe', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (186, N'Mallakastër', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (187, N'Mat', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (188, N'Mirditë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (189, N'Peqin', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (190, N'Përmet', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (191, N'Pogradec', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (192, N'Pukë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (193, N'Sarandë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (194, N'Skrapar', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (195, N'Shkodër', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (196, N'Tepelenë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (197, N'Tiranë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (198, N'Tropojë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (199, N'Vlorë', 1002)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (200, N'Erevan', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (201, N'Aragacotn', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (202, N'Ararat', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (203, N'Armavir', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (204, N'Gegarkunik', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (205, N'Kotayk', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (206, N'Lory', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (207, N'Sirak', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (208, N'Syunik', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (209, N'Tavus', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (210, N'Vayoc Jor', 1011)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (211, N'Bengo', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (212, N'Benguela', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (213, N'Bie', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (214, N'Cabinda', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (215, N'Cuando-Cubango', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (216, N'Cuanza Norte', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (217, N'Cuanza Sul', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (218, N'Cunene', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (219, N'Huambo', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (220, N'Huila', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (221, N'Luanda', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (222, N'Lunda Norte', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (223, N'Lunda Sul', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (224, N'Malange', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (225, N'Moxico', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (226, N'Namibe', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (227, N'Uige', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (228, N'Zaire', 1006)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (229, N'Capital federal', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (230, N'Buenos Aires', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (231, N'Catamarca', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (232, N'Cordoba', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (233, N'Corrientes', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (234, N'Chaco', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (235, N'Chubut', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (236, N'Entre Rios', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (237, N'Formosa', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (238, N'Jujuy', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (239, N'La Pampa', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (240, N'Mendoza', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (241, N'Misiones', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (242, N'Neuquen', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (243, N'Rio Negro', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (244, N'Salta', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (245, N'San Juan', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (246, N'San Luis', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (247, N'Santa Cruz', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (248, N'Santa Fe', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (249, N'Santiago del Estero', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (250, N'Tierra del Fuego', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (251, N'Tucuman', 1010)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (252, N'Burgenland', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (253, N'Kärnten', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (254, N'Niederosterreich', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (255, N'Oberosterreich', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (256, N'Salzburg', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (257, N'Steiermark', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (258, N'Tirol', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (259, N'Vorarlberg', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (260, N'Wien', 1014)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (261, N'Australian Antarctic Territory', 1008)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (262, N'Australian Capital Territory', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (263, N'Northern Territory', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (264, N'New South Wales', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (265, N'Queensland', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (266, N'South Australia', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (267, N'Tasmania', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (268, N'Victoria', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (269, N'Western Australia', 1013)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (270, N'Naxcivan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (271, N'Ali Bayramli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (272, N'Baki', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (273, N'Ganca', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (274, N'Lankaran', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (275, N'Mingacevir', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (276, N'Naftalan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (277, N'Saki', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (278, N'Sumqayit', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (279, N'Susa', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (280, N'Xankandi', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (281, N'Yevlax', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (282, N'Abseron', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (283, N'Agcabadi', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (284, N'Agdam', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (285, N'Agdas', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (286, N'Agstafa', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (287, N'Agsu', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (288, N'Astara', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (289, N'Babak', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (290, N'Balakan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (291, N'Barda', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (292, N'Beylagan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (293, N'Bilasuvar', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (294, N'Cabrayll', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (295, N'Calilabad', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (296, N'Culfa', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (297, N'Daskasan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (298, N'Davaci', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (299, N'Fuzuli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (300, N'Gadabay', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (301, N'Goranboy', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (302, N'Goycay', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (303, N'Haciqabul', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (304, N'Imisli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (305, N'Ismayilli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (306, N'Kalbacar', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (307, N'Kurdamir', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (308, N'Lacin', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (309, N'Lerik', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (310, N'Masalli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (311, N'Neftcala', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (312, N'Oguz', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (313, N'Ordubad', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (314, N'Qabala', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (315, N'Qax', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (316, N'Qazax', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (317, N'Qobustan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (318, N'Quba', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (319, N'Qubadli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (320, N'Qusar', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (321, N'Saatli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (322, N'Sabirabad', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (323, N'Sadarak', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (324, N'Sahbuz', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (325, N'Salyan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (326, N'Samaxi', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (327, N'Samkir', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (328, N'Samux', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (329, N'Sarur', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (330, N'Siyazan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (331, N'Tartar', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (332, N'Tovuz', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (333, N'Ucar', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (334, N'Xacmaz', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (335, N'Xanlar', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (336, N'Xizi', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (337, N'Xocali', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (338, N'Xocavand', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (339, N'Yardimli', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (340, N'Zangilan', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (341, N'Zaqatala', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (342, N'Zardab', 1015)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (343, N'Federacija Bosna i Hercegovina', 1026)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (344, N'Republika Srpska', 1026)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (345, N'Bagerhat zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (346, N'Bandarban zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (347, N'Barguna zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (348, N'Barisal zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (349, N'Bhola zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (350, N'Bogra zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (351, N'Brahmanbaria zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (352, N'Chandpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (353, N'Chittagong zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (354, N'Chuadanga zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (355, N'Comilla zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (356, N'Coxs Bazar zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (357, N'Dhaka zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (358, N'Dinajpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (359, N'Faridpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (360, N'Feni zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (361, N'Gaibandha zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (362, N'Gazipur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (363, N'Gopalganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (364, N'Habiganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (365, N'Jaipurhat zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (366, N'Jamalpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (367, N'Jessore zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (368, N'Jhalakati zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (369, N'Jhenaidah zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (370, N'Khagrachari zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (371, N'Khulna zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (372, N'Kishorganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (373, N'Kurigram zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (374, N'Kushtia zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (375, N'Lakshmipur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (376, N'Lalmonirhat zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (377, N'Madaripur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (378, N'Magura zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (379, N'Manikganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (380, N'Meherpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (381, N'Moulvibazar zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (382, N'Munshiganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (383, N'Mymensingh zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (384, N'Naogaon zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (385, N'Narail zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (386, N'Narayanganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (387, N'Narsingdi zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (388, N'Natore zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (389, N'Nawabganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (390, N'Netrakona zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (391, N'Nilphamari zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (392, N'Noakhali zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (393, N'Pabna zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (394, N'Panchagarh zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (395, N'Patuakhali zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (396, N'Pirojpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (397, N'Rajbari zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (398, N'Rajshahi zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (399, N'Rangamati zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (400, N'Rangpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (401, N'Satkhira zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (402, N'Shariatpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (403, N'Sherpur zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (404, N'Sirajganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (405, N'Sunamganj zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (406, N'Sylhet zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (407, N'Tangail zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (408, N'Thakurgaon zila', 1017)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (409, N'Antwerpen', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (410, N'Brabant Wallon', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (411, N'Hainaut', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (412, N'Liege', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (413, N'Limburg', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (414, N'Luxembourg', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (415, N'Namur', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (416, N'Oost-Vlaanderen', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (417, N'Vlaams-Brabant', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (418, N'West-Vlaanderen', 1020)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (419, N'Bale', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (420, N'Bam', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (421, N'Banwa', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (422, N'Bazega', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (423, N'Bougouriba', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (424, N'Boulgou', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (425, N'Boulkiemde', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (426, N'Comoe', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (427, N'Ganzourgou', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (428, N'Gnagna', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (429, N'Gourma', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (430, N'Houet', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (431, N'Ioba', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (432, N'Kadiogo', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (433, N'Kenedougou', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (434, N'Komondjari', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (435, N'Kompienga', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (436, N'Kossi', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (437, N'Koulpulogo', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (438, N'Kouritenga', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (439, N'Kourweogo', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (440, N'Leraba', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (441, N'Loroum', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (442, N'Mouhoun', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (443, N'Nahouri', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (444, N'Namentenga', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (445, N'Nayala', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (446, N'Noumbiel', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (447, N'Oubritenga', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (448, N'Oudalan', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (449, N'Passore', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (450, N'Poni', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (451, N'Sanguie', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (452, N'Sanmatenga', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (453, N'Seno', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (454, N'Siasili', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (455, N'Soum', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (456, N'Sourou', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (457, N'Tapoa', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (458, N'Tui', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (459, N'Yagha', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (460, N'Yatenga', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (461, N'Ziro', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (462, N'Zondoma', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (463, N'Zoundweogo', 1034)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (464, N'Blagoevgrad', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (465, N'Burgas', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (466, N'Dobric', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (467, N'Gabrovo', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (468, N'Haskovo', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (469, N'Jambol', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (470, N'Kardzali', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (471, N'Kjstendil', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (472, N'Lovec', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (473, N'Montana', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (474, N'Pazardzik', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (475, N'Pernik', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (476, N'Pleven', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (477, N'Plovdiv', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (478, N'Razgrad', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (479, N'Ruse', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (480, N'Silistra', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (481, N'Sliven', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (482, N'Smoljan', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (483, N'Sofia', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (484, N'Stara Zagora', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (485, N'Sumen', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (486, N'Targoviste', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (487, N'Varna', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (488, N'Veliko Tarnovo', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (489, N'Vidin', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (490, N'Vraca', 1033)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (491, N'Al Hadd', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (492, N'Al Manamah', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (493, N'Al Mintaqah al Gharbiyah', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (494, N'Al Mintagah al Wusta', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (495, N'Al Mintaqah ash Shamaliyah', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (496, N'Al Muharraq', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (497, N'Ar Rifa', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (498, N'Jidd Hafs', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (499, N'Madluat Jamad', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (500, N'Madluat Isa', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (501, N'Mintaqat Juzur tawar', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (502, N'Sitrah', 1016)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (503, N'Bubanza', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (504, N'Bujumbura', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (505, N'Bururi', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (506, N'Cankuzo', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (507, N'Cibitoke', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (508, N'Gitega', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (509, N'Karuzi', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (510, N'Kayanza', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (511, N'Makamba', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (512, N'Muramvya', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (513, N'Mwaro', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (514, N'Ngozi', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (515, N'Rutana', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (516, N'Ruyigi', 1036)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (517, N'Alibori', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (518, N'Atakora', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (519, N'Atlantique', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (520, N'Borgou', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (521, N'Collines', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (522, N'Donga', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (523, N'Kouffo', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (524, N'Littoral', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (525, N'Mono', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (526, N'Oueme', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (527, N'Plateau', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (528, N'Zou', 1022)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (529, N'Belait', 1032)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (530, N'Brunei-Muara', 1032)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (531, N'Temburong', 1032)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (532, N'Tutong', 1032)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (533, N'Cochabamba', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (534, N'Chuquisaca', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (535, N'El Beni', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (536, N'La Paz', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (537, N'Oruro', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (538, N'Pando', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (539, N'Potosi', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (540, N'Tarija', 1025)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (541, N'Acre', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (542, N'Alagoas', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (543, N'Amazonas', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (544, N'Amapa', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (545, N'Baia', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (546, N'Ceara', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (547, N'Distrito Federal', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (548, N'Espirito Santo', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (549, N'Fernando de Noronha', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (550, N'Goias', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (551, N'Maranhao', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (552, N'Minas Gerais', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (553, N'Mato Grosso do Sul', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (554, N'Mato Grosso', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (555, N'Para', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (556, N'Paraiba', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (557, N'Pernambuco', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (558, N'Piaui', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (559, N'Parana', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (560, N'Rio de Janeiro', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (561, N'Rio Grande do Norte', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (562, N'Rondonia', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (563, N'Roraima', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (564, N'Rio Grande do Sul', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (565, N'Santa Catarina', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (566, N'Sergipe', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (567, N'Sao Paulo', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (568, N'Tocatins', 1029)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (569, N'Acklins and Crooked Islands', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (570, N'Bimini', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (571, N'Cat Island', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (572, N'Exuma', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (573, N'Freeport', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (574, N'Fresh Creek', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (575, N'Governors Harbour', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (576, N'Green Turtle Cay', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (577, N'Harbour Island', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (578, N'High Rock', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (579, N'Inagua', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (580, N'Kemps Bay', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (581, N'Long Island', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (582, N'Marsh Harbour', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (583, N'Mayaguana', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (584, N'New Providence', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (585, N'Nicholls Town and Berry Islands', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (586, N'Ragged Island', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (587, N'Rock Sound', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (588, N'Sandy Point', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (589, N'San Salvador and Rum Cay', 1212)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (590, N'Bumthang', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (591, N'Chhukha', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (592, N'Dagana', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (593, N'Gasa', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (594, N'Ha', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (595, N'Lhuentse', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (596, N'Monggar', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (597, N'Paro', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (598, N'Pemagatshel', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (599, N'Punakha', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (600, N'Samdrup Jongkha', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (601, N'Samtee', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (602, N'Sarpang', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (603, N'Thimphu', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (604, N'Trashigang', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (605, N'Trashi Yangtse', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (606, N'Trongsa', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (607, N'Tsirang', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (608, N'Wangdue Phodrang', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (609, N'Zhemgang', 1024)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (610, N'Central', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (611, N'Ghanzi', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (612, N'Kgalagadi', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (613, N'Kgatleng', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (614, N'Kweneng', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (615, N'Ngamiland', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (616, N'North-East', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (617, N'North-West', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (618, N'South-East', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (619, N'Southern', 1027)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (620, N'Brèsckaja voblasc', 1019)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (621, N'Homelskaja voblasc', 1019)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (622, N'Hrodzenskaja voblasc', 1019)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (623, N'Mahilëuskaja voblasc', 1019)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (624, N'Minskaja voblasc', 1019)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (625, N'Vicebskaja voblasc', 1019)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (626, N'Belize', 1021)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (627, N'Cayo', 1021)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (628, N'Corozal', 1021)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (629, N'Orange Walk', 1021)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (630, N'Stann Creek', 1021)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (631, N'Toledo', 1021)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (632, N'Kinshasa', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (633, N'Bandundu', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (634, N'Bas-Congo', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (635, N'Equateur', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (636, N'Haut-Congo', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (637, N'Kasai-Occidental', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (638, N'Kasai-Oriental', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (639, N'Katanga', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (640, N'Maniema', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (641, N'Nord-Kivu', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (642, N'Orientale', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (643, N'Sud-Kivu', 1050)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (644, N'Bangui', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (645, N'Bamingui-Bangoran', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (646, N'Basse-Kotto', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (647, N'Haute-Kotto', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (648, N'Haut-Mbomou', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (649, N'Kemo', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (650, N'Lobaye', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (651, N'Mambere-Kadei', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (652, N'Mbomou', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (653, N'Nana-Grebizi', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (654, N'Nana-Mambere', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (655, N'Ombella-Mpoko', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (656, N'Ouaka', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (657, N'Ouham', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (658, N'Ouham-Pende', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (659, N'Sangha-Mbaere', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (660, N'Vakaga', 1042)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (661, N'Brazzaville', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (662, N'Bouenza', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (663, N'Cuvette', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (664, N'Cuvette-Ouest', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (665, N'Kouilou', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (666, N'Lekoumou', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (667, N'Likouala', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (668, N'Niari', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (669, N'Plateaux', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (670, N'Pool', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (671, N'Sangha', 1051)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (672, N'Aargau', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (673, N'Appenzell Innerrhoden', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (674, N'Appenzell Ausserrhoden', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (675, N'Bern', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (676, N'Basel-Landschaft', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (677, N'Basel-Stadt', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (678, N'Fribourg', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (679, N'Geneva', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (680, N'Glarus', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (681, N'Graubunden', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (682, N'Jura', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (683, N'Luzern', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (684, N'Neuchatel', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (685, N'Nidwalden', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (686, N'Obwalden', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (687, N'Sankt Gallen', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (688, N'Schaffhausen', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (689, N'Solothurn', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (690, N'Schwyz', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (691, N'Thurgau', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (692, N'Ticino', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (693, N'Uri', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (694, N'Vaud', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (695, N'Valais', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (696, N'Zug', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (697, N'Zurich', 1205)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (698, N'18 Montagnes', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (699, N'Agnebi', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (700, N'Bas-Sassandra', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (701, N'Denguele', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (702, N'Haut-Sassandra', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (703, N'Lacs', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (704, N'Lagunes', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (705, N'Marahoue', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (706, N'Moyen-Comoe', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (707, N'Nzi-Comoe', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (708, N'Savanes', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (709, N'Sud-Bandama', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (710, N'Sud-Comoe', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (711, N'Vallee du Bandama', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (712, N'Worodouqou', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (713, N'Zanzan', 1054)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (714, N'Aisen del General Carlos Ibanez del Campo', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (715, N'Antofagasta', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (716, N'Araucania', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (717, N'Atacama', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (718, N'Bio-Bio', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (719, N'Coquimbo', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (720, N'Libertador General Bernardo OHiggins', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (721, N'Los Lagos', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (722, N'Magallanes', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (723, N'Maule', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (724, N'Region Metropolitana de Santiago', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (725, N'Tarapaca', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (726, N'Valparaiso', 1044)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (727, N'Adamaoua', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (728, N'Centre', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (729, N'East', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (730, N'Far North', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (731, N'North', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (732, N'South', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (733, N'South-West', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (734, N'West', 1038)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (735, N'Beijing', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (736, N'Chongqing', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (737, N'Shanghai', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (738, N'Tianjin', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (739, N'Anhui', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (740, N'Fujian', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (741, N'Gansu', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (742, N'Guangdong', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (743, N'Guizhou', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (744, N'Hainan', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (745, N'Hebei', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (746, N'Heilongjiang', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (747, N'Henan', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (748, N'Hubei', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (749, N'Hunan', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (750, N'Jiangsu', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (751, N'Jiangxi', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (752, N'Jilin', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (753, N'Liaoning', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (754, N'Qinghai', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (755, N'Shaanxi', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (756, N'Shandong', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (757, N'Shanxi', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (758, N'Sichuan', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (759, N'Taiwan', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (760, N'Yunnan', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (761, N'Zhejiang', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (762, N'Guangxi', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (763, N'Neia Mongol (mn)', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (764, N'Xinjiang', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (765, N'Xizang', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (766, N'Hong Kong', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (767, N'Macau', 1045)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (768, N'Distrito Capital de Bogotá', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (769, N'Amazonea', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (770, N'Antioquia', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (771, N'Arauca', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (772, N'Atlántico', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (773, N'Bolívar', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (774, N'Boyacá', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (775, N'Caldea', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (776, N'Caquetá', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (777, N'Casanare', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (778, N'Cauca', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (779, N'Cesar', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (780, N'Córdoba', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (781, N'Cundinamarca', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (782, N'Chocó', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (783, N'Guainía', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (784, N'Guaviare', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (785, N'La Guajira', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (786, N'Magdalena', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (787, N'Meta', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (788, N'Nariño', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (789, N'Norte de Santander', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (790, N'Putumayo', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (791, N'Quindio', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (792, N'Risaralda', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (793, N'San Andrés, Providencia y Santa Catalina', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (794, N'Santander', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (795, N'Sucre', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (796, N'Tolima', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (797, N'Valle del Cauca', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (798, N'Vaupés', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (799, N'Vichada', 1048)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (800, N'Alajuela', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (801, N'Cartago', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (802, N'Guanacaste', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (803, N'Heredia', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (804, N'Limon', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (805, N'Puntarenas', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (806, N'San Jose', 1053)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (807, N'Camagey', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (808, N'Ciego de `vila', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (809, N'Cienfuegos', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (810, N'Ciudad de La Habana', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (811, N'Granma', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (812, N'Guantanamo', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (813, N'Holquin', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (814, N'La Habana', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (815, N'Las Tunas', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (816, N'Matanzas', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (817, N'Pinar del Rio', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (818, N'Sancti Spiritus', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (819, N'Santiago de Cuba', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (820, N'Villa Clara', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (821, N'Isla de la Juventud', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (822, N'Pinar del Roo', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (823, N'Ciego de Avila', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (824, N'Camagoey', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (825, N'Holgun', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (826, N'Sancti Spritus', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (827, N'Municipio Especial Isla de la Juventud', 1056)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (828, N'Boa Vista', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (829, N'Brava', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (830, N'Calheta de Sao Miguel', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (831, N'Fogo', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (832, N'Maio', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (833, N'Mosteiros', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (834, N'Paul', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (835, N'Porto Novo', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (836, N'Praia', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (837, N'Ribeira Grande', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (838, N'Sal', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (839, N'Sao Domingos', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (840, N'Sao Filipe', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (841, N'Sao Nicolau', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (842, N'Sao Vicente', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (843, N'Tarrafal', 1040)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (844, N'Ammochostos Magusa', 1057)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (845, N'Keryneia', 1057)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (846, N'Larnaka', 1057)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (847, N'Lefkosia', 1057)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (848, N'Lemesos', 1057)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (849, N'Pafos', 1057)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (850, N'Jihoceský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (851, N'Jihomoravský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (852, N'Karlovarský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (853, N'Královéhradecký kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (854, N'Liberecký kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (855, N'Moravskoslezský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (856, N'Olomoucký kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (857, N'Pardubický kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (858, N'Plzenský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (859, N'Praha, hlavní mesto', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (860, N'Stredoceský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (861, N'Ústecký kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (862, N'Vysocina', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (863, N'Zlínský kraj', 1058)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (864, N'Baden-Wuerttemberg', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (865, N'Bayern', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (866, N'Bremen', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (867, N'Hamburg', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (868, N'Hessen', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (869, N'Niedersachsen', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (870, N'Nordrhein-Westfalen', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (871, N'Rheinland-Pfalz', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (872, N'Saarland', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (873, N'Schleswig-Holstein', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (874, N'Berlin', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (875, N'Brandenburg', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (876, N'Mecklenburg-Vorpommern', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (877, N'Sachsen', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (878, N'Sachsen-Anhalt', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (879, N'Thueringen', 1082)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (880, N'Ali Sabiah', 1060)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (881, N'Dikhil', 1060)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (882, N'Djibouti', 1060)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (883, N'Obock', 1060)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (884, N'Tadjoura', 1060)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (885, N'Frederiksberg', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (886, N'Copenhagen City', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (887, N'Copenhagen', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (888, N'Frederiksborg', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (889, N'Roskilde', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (890, N'Vestsjælland', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (891, N'Storstrøm', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (892, N'Bornholm', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (893, N'Fyn', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (894, N'South Jutland', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (895, N'Ribe', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (896, N'Vejle', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (897, N'Ringkjøbing', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (898, N'Århus', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (899, N'Viborg', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (900, N'North Jutland', 1059)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (901, N'Distrito Nacional (Santo Domingo)', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (902, N'Azua', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (903, N'Bahoruco', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (904, N'Barahona', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (905, N'Dajabón', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (906, N'Duarte', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (907, N'El Seybo [El Seibo]', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (908, N'Espaillat', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (909, N'Hato Mayor', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (910, N'Independencia', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (911, N'La Altagracia', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (912, N'La Estrelleta [Elias Pina]', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (913, N'La Romana', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (914, N'La Vega', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (915, N'Maroia Trinidad Sánchez', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (916, N'Monseñor Nouel', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (917, N'Monte Cristi', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (918, N'Monte Plata', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (919, N'Pedernales', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (920, N'Peravia', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (921, N'Puerto Plata', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (922, N'Salcedo', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (923, N'Samaná', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (924, N'San Cristóbal', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (925, N'San Pedro de Macorís', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (926, N'Sánchez Ramírez', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (927, N'Santiago', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (928, N'Santiago Rodríguez', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (929, N'Valverde', 1062)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (930, N'Adrar', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (931, N'Ain Defla', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (932, N'Ain Tmouchent', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (933, N'Alger', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (934, N'Annaba', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (935, N'Batna', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (936, N'Bechar', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (937, N'Bejaia', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (938, N'Biskra', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (939, N'Blida', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (940, N'Bordj Bou Arreridj', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (941, N'Bouira', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (942, N'Boumerdes', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (943, N'Chlef', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (944, N'Constantine', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (945, N'Djelfa', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (946, N'El Bayadh', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (947, N'El Oued', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (948, N'El Tarf', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (949, N'Ghardaia', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (950, N'Guelma', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (951, N'Illizi', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (952, N'Jijel', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (953, N'Khenchela', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (954, N'Laghouat', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (955, N'Mascara', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (956, N'Medea', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (957, N'Mila', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (958, N'Mostaganem', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (959, N'Msila', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (960, N'Naama', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (961, N'Oran', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (962, N'Ouargla', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (963, N'Oum el Bouaghi', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (964, N'Relizane', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (965, N'Saida', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (966, N'Setif', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (967, N'Sidi Bel Abbes', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (968, N'Skikda', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (969, N'Souk Ahras', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (970, N'Tamanghasset', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (971, N'Tebessa', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (972, N'Tiaret', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (973, N'Tindouf', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (974, N'Tipaza', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (975, N'Tissemsilt', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (976, N'Tizi Ouzou', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (977, N'Tlemcen', 1003)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (978, N'Azuay', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (979, N'Bolivar', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (980, N'Canar', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (981, N'Carchi', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (982, N'Cotopaxi', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (983, N'Chimborazo', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (984, N'El Oro', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (985, N'Esmeraldas', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (986, N'Galapagos', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (987, N'Guayas', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (988, N'Imbabura', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (989, N'Loja', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (990, N'Los Rios', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (991, N'Manabi', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (992, N'Morona-Santiago', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (993, N'Napo', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (994, N'Orellana', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (995, N'Pastaza', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (996, N'Pichincha', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (997, N'Sucumbios', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (998, N'Tungurahua', 1064)
GO
INSERT [dbo].[StateProvinces] ([Id], [Name], [CountryId]) VALUES (999, N'Zamora-Chinchipe', 1064)
GO
SET IDENTITY_INSERT [dbo].[StateProvinces] OFF
GO
SET IDENTITY_INSERT [dbo].[SubscriptionPlans] ON 
GO
INSERT [dbo].[SubscriptionPlans] ([Id], [Name], [Description], [PlanType], [MonthlyAmount], [_3MonthAmount], [_6MonthAmount], [_12MonthAmount], [NumberOfProducts], [NumberOfServices], [NumberOfRequests], [NumberOfImagesForProducts], [NumberOfImagesForServices], [NumberOfImagesForRequests]) VALUES (0, N'Free', N'Free ''Visitor''', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[SubscriptionPlans] ([Id], [Name], [Description], [PlanType], [MonthlyAmount], [_3MonthAmount], [_6MonthAmount], [_12MonthAmount], [NumberOfProducts], [NumberOfServices], [NumberOfRequests], [NumberOfImagesForProducts], [NumberOfImagesForServices], [NumberOfImagesForRequests]) VALUES (1, N'Basic', N'Basic ''Exporter''
', 1, CAST(10.00 AS Decimal(18, 2)), CAST(29.00 AS Decimal(18, 2)), CAST(26.10 AS Decimal(18, 2)), CAST(23.00 AS Decimal(18, 2)), 1, 1, -1, 1, 1, 1)
GO
INSERT [dbo].[SubscriptionPlans] ([Id], [Name], [Description], [PlanType], [MonthlyAmount], [_3MonthAmount], [_6MonthAmount], [_12MonthAmount], [NumberOfProducts], [NumberOfServices], [NumberOfRequests], [NumberOfImagesForProducts], [NumberOfImagesForServices], [NumberOfImagesForRequests]) VALUES (2, N'Silver', N'Silver ''Exporter''', 1, CAST(12.00 AS Decimal(18, 2)), CAST(39.00 AS Decimal(18, 2)), CAST(36.10 AS Decimal(18, 2)), CAST(33.00 AS Decimal(18, 2)), 5, 5, -1, 3, 3, 1)
GO
INSERT [dbo].[SubscriptionPlans] ([Id], [Name], [Description], [PlanType], [MonthlyAmount], [_3MonthAmount], [_6MonthAmount], [_12MonthAmount], [NumberOfProducts], [NumberOfServices], [NumberOfRequests], [NumberOfImagesForProducts], [NumberOfImagesForServices], [NumberOfImagesForRequests]) VALUES (3, N'Gold', N'Gold ''Exporter''', 1, CAST(15.00 AS Decimal(18, 2)), CAST(49.00 AS Decimal(18, 2)), CAST(46.10 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), -1, -1, -1, 5, 5, 1)
GO
INSERT [dbo].[SubscriptionPlans] ([Id], [Name], [Description], [PlanType], [MonthlyAmount], [_3MonthAmount], [_6MonthAmount], [_12MonthAmount], [NumberOfProducts], [NumberOfServices], [NumberOfRequests], [NumberOfImagesForProducts], [NumberOfImagesForServices], [NumberOfImagesForRequests]) VALUES (4, N'Standard', N'Standard ''Importer''', 2, CAST(2.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), 0, 0, -1, 0, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[SubscriptionPlans] OFF
GO
SET IDENTITY_INSERT [dbo].[TrustImages] ON 
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (1, N'\images\trusts\trust-1\6c279556-de4e-44e6-988c-19537cabf316.jpg', 1)
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (2, N'\images\trusts\trust-2\0cfc3436-8468-43cb-bfae-da52af0b5340.png', 2)
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (3, N'\images\trusts\trust-3\528ab532-cd60-40cc-804c-6d56c7f329af.png', 3)
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (4, N'\images\trusts\trust-4\02902533-d050-4534-9eb1-a5fb87f031e3.png', 4)
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (5, N'\images\trusts\trust-5\bc675f59-46eb-4a9e-8cb1-b2f674c815c3.png', 5)
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (6, N'\images\trusts\trust-6\79baebd8-0162-4fea-b80c-50b338a70b2c.png', 6)
GO
INSERT [dbo].[TrustImages] ([Id], [ImageUrl], [TrustId]) VALUES (7, N'\images\trusts\trust-7\49ab63e4-708c-4ee9-bb11-08520cd7b456.png', 7)
GO
SET IDENTITY_INSERT [dbo].[TrustImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Trusts] ON 
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (1, N'<p>Lumber One</p>')
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (2, N'<p>PCB</p>')
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (3, N'<p>Meta</p>')
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (4, N'<p>Old Balance</p>')
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (5, N'<p>Devdas</p>')
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (6, N'<p>Netla</p>')
GO
INSERT [dbo].[Trusts] ([Id], [Name]) VALUES (7, N'<p>cow liver</p>')
GO
SET IDENTITY_INSERT [dbo].[Trusts] OFF
GO
SET IDENTITY_INSERT [dbo].[Wilayas] ON 
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (1, N'Adrar')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (2, N'Chlef')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (3, N'Laghouat')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (4, N'Oum El Bouaghi')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (5, N'Batna')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (6, N'Béjaïa')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (7, N'Biskra')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (8, N'Béchar')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (9, N'Blida')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (10, N'Bouira')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (11, N'Tamanrasset')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (12, N'Tébessa')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (13, N'Tlemcen')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (14, N'Tiaret')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (15, N'Tizi Ouzou')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (16, N'Alger')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (17, N'Djelfa')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (18, N'Jijel')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (19, N'Sétif')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (20, N'Saïda')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (21, N'Skikda')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (22, N'Sidi Bel Abbès')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (23, N'Annaba')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (24, N'Guelma')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (25, N'Constantine')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (26, N'Médéa')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (27, N'Mostaganem')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (28, N'MSila')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (29, N'Mascara')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (30, N'Ouargla')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (31, N'Oran')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (32, N'El Bayadh')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (33, N'Illizi')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (34, N'Bordj Bou Arreridj')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (35, N'Boumerdès')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (36, N'El Tarf')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (37, N'Tindouf')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (38, N'Tissemsilt')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (39, N'El Oued')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (40, N'Khenchela')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (41, N'Souk Ahras')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (42, N'Tipaza')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (43, N'Mila')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (44, N'Ain Defla')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (45, N'Naâma')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (46, N'Aïn Témouchent')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (47, N'Ghardaïa')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (48, N'Relizane')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (49, N'Timimoun')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (50, N'Bordj Badji Mokhtar')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (51, N'Ouled Djellal')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (52, N'Biskra')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (53, N'Béni Abbès')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (54, N'In Salah')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (55, N'In Guezzam')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (56, N'Touggourt')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (57, N'EL MGhair')
GO
INSERT [dbo].[Wilayas] ([Id], [Name]) VALUES (58, N'El Meniaa')
GO
SET IDENTITY_INSERT [dbo].[Wilayas] OFF
GO
/****** Object:  Index [IX_AboutImages_AboutId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AboutImages_AboutId] ON [dbo].[AboutImages]
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_CompanyId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_CompanyId] ON [dbo].[AspNetUsers]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_CountryId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_CountryId] ON [dbo].[AspNetUsers]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Companies_CategoryId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Companies_CategoryId] ON [dbo].[Companies]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Companies_CompanyActivityId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Companies_CompanyActivityId] ON [dbo].[Companies]
(
	[CompanyActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Companies_CountryId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Companies_CountryId] ON [dbo].[Companies]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Companies_StateProvinceId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Companies_StateProvinceId] ON [dbo].[Companies]
(
	[StateProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyImage_CompanyId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyImage_CompanyId] ON [dbo].[CompanyImage]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InfoImages_InfoId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_InfoImages_InfoId] ON [dbo].[InfoImages]
(
	[InfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Messages_ReceiverUserId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_ReceiverUserId] ON [dbo].[Messages]
(
	[ReceiverUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Messages_SenderUserId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_SenderUserId] ON [dbo].[Messages]
(
	[SenderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PartnerImages_PartnerId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_PartnerImages_PartnerId] ON [dbo].[PartnerImages]
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PrivacyImages_PrivacyId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_PrivacyImages_PrivacyId] ON [dbo].[PrivacyImages]
(
	[PrivacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RequestImages_RequestId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_RequestImages_RequestId] ON [dbo].[RequestImages]
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requests_CategoryId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Requests_CategoryId] ON [dbo].[Requests]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceImages_ServiceId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceImages_ServiceId] ON [dbo].[ServiceImages]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Services_CategoryId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_Services_CategoryId] ON [dbo].[Services]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TrustImages_TrustId]    Script Date: 24-Jun-24 9:37:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_TrustImages_TrustId] ON [dbo].[TrustImages]
(
	[TrustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (N'') FOR [ISO]
GO
ALTER TABLE [dbo].[PaymentHistory] ADD  DEFAULT (N'') FOR [Tenure]
GO
ALTER TABLE [dbo].[PaymentOrders] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[PaymentOrders] ADD  DEFAULT ((0)) FOR [Months]
GO
ALTER TABLE [dbo].[StateProvinces] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [CountryId]
GO
ALTER TABLE [dbo].[AboutImages]  WITH CHECK ADD  CONSTRAINT [FK_AboutImages_Abouts_AboutId] FOREIGN KEY([AboutId])
REFERENCES [dbo].[Abouts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AboutImages] CHECK CONSTRAINT [FK_AboutImages_Abouts_AboutId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Companies_CompanyId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Countries_CountryId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_SubsciptionPlans_SubscribedPlanId] FOREIGN KEY([SubscribedPlanId])
REFERENCES [dbo].[SubsciptionPlans] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_SubsciptionPlans_SubscribedPlanId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_SubscriptionPlans_SubscribedPlanId] FOREIGN KEY([SubscribedPlanId])
REFERENCES [dbo].[SubscriptionPlans] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_SubscriptionPlans_SubscribedPlanId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_CompanyActivites_CompanyActivityId] FOREIGN KEY([CompanyActivityId])
REFERENCES [dbo].[CompanyActivites] ([Id])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_CompanyActivites_CompanyActivityId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Countries_CountryId]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_StateProvinces_StateProvinceId] FOREIGN KEY([StateProvinceId])
REFERENCES [dbo].[StateProvinces] ([Id])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_StateProvinces_StateProvinceId]
GO
ALTER TABLE [dbo].[CompanyImage]  WITH CHECK ADD  CONSTRAINT [FK_CompanyImage_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CompanyImage] CHECK CONSTRAINT [FK_CompanyImage_Companies_CompanyId]
GO
ALTER TABLE [dbo].[InfoImages]  WITH CHECK ADD  CONSTRAINT [FK_InfoImages_Infos_InfoId] FOREIGN KEY([InfoId])
REFERENCES [dbo].[Infos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InfoImages] CHECK CONSTRAINT [FK_InfoImages_Infos_InfoId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AspNetUsers_ReceiverUserId] FOREIGN KEY([ReceiverUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AspNetUsers_ReceiverUserId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AspNetUsers_SenderUserId] FOREIGN KEY([SenderUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AspNetUsers_SenderUserId]
GO
ALTER TABLE [dbo].[PartnerImages]  WITH CHECK ADD  CONSTRAINT [FK_PartnerImages_Partners_PartnerId] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartnerImages] CHECK CONSTRAINT [FK_PartnerImages_Partners_PartnerId]
GO
ALTER TABLE [dbo].[PrivacyImages]  WITH CHECK ADD  CONSTRAINT [FK_PrivacyImages_Privacies_PrivacyId] FOREIGN KEY([PrivacyId])
REFERENCES [dbo].[Privacies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrivacyImages] CHECK CONSTRAINT [FK_PrivacyImages_Privacies_PrivacyId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[RequestImages]  WITH CHECK ADD  CONSTRAINT [FK_RequestImages_Requests_RequestId] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Requests] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestImages] CHECK CONSTRAINT [FK_RequestImages_Requests_RequestId]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ServiceImages]  WITH CHECK ADD  CONSTRAINT [FK_ServiceImages_Services_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Services] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceImages] CHECK CONSTRAINT [FK_ServiceImages_Services_ServiceId]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Categories_CategoryId]
GO
ALTER TABLE [dbo].[TrustImages]  WITH CHECK ADD  CONSTRAINT [FK_TrustImages_Trusts_TrustId] FOREIGN KEY([TrustId])
REFERENCES [dbo].[Trusts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrustImages] CHECK CONSTRAINT [FK_TrustImages_Trusts_TrustId]
GO
USE [master]
GO
ALTER DATABASE [VfASol] SET  READ_WRITE 
GO
