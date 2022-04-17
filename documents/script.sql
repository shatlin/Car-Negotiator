USE [master]
GO
/****** Object:  Database [AutoNegotiatorDB]    Script Date: 2019/01/14 19:23:21 ******/
CREATE DATABASE [AutoNegotiatorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoNegotiatorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AutoNegotiatorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AutoNegotiatorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AutoNegotiatorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AutoNegotiatorDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoNegotiatorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoNegotiatorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoNegotiatorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoNegotiatorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoNegotiatorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoNegotiatorDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoNegotiatorDB] SET  MULTI_USER 
GO
ALTER DATABASE [AutoNegotiatorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoNegotiatorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoNegotiatorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoNegotiatorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutoNegotiatorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AutoNegotiatorDB] SET QUERY_STORE = OFF
GO
USE [AutoNegotiatorDB]
GO
/****** Object:  Table [dbo].[BestTimeToContact]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BestTimeToContact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BestTimeToContact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dealerId] [int] NULL,
	[requestId] [int] NOT NULL,
	[bidAmount] [int] NULL,
	[isWinningBid] [bit] NULL,
	[bidCreatedDate] [datetime] NULL,
	[winningDate] [datetime] NULL,
	[isDealerInterested] [bit] NULL,
	[dealerComments] [nvarchar](3000) NULL,
	[adminComments] [nvarchar](3000) NULL,
	[adminId] [nvarchar](3000) NULL,
	[bidUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Bids] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarMakes]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarMakes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[makeName] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_CarMakes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModels]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carMakeId] [int] NOT NULL,
	[carModelName] [nvarchar](100) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_CarModels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarRequests]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarRequests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carVariantId] [int] NOT NULL,
	[clientId] [int] NOT NULL,
	[requestedDate] [datetime] NOT NULL,
	[deliveryRequestDate] [datetime] NOT NULL,
	[colorChoice1Id] [int] NULL,
	[colorChoice2Id] [int] NULL,
	[colorChoice3Id] [int] NULL,
	[canOfferDifferentColor] [bit] NOT NULL,
	[paymentMethodId] [int] NULL,
	[financeApproved] [bit] NOT NULL,
	[financeHouseId] [int] NULL,
	[depositAmount] [int] NULL,
	[tradeinVehicleAvailable] [bit] NOT NULL,
	[tradeinMakeId] [int] NULL,
	[tradeinModelId] [int] NULL,
	[tradeinVariantId] [int] NULL,
	[tradeinYearId] [int] NULL,
	[tradeinFuelId] [int] NULL,
	[tradeinDescription] [nvarchar](3000) NULL,
	[tradeinValue] [int] NULL,
	[tradeinKMs] [int] NULL,
	[clientComments] [nvarchar](3000) NULL,
	[isRequestActive] [bit] NOT NULL,
	[winningBidId] [int] NULL,
	[clientAcceptedWinningBid] [bit] NULL,
	[actualSellingPrice] [int] NULL,
	[commissionCalculated] [int] NULL,
	[commisionReceived] [int] NULL,
	[AdminComments] [nvarchar](3000) NULL,
	[isRequestClosed] [bit] NOT NULL,
 CONSTRAINT [PK_CarRequests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarVariantFuels]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarVariantFuels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarVariantFuels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarVariants]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarVariants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carModelId] [int] NOT NULL,
	[carVariantName] [nvarchar](300) NOT NULL,
	[isActive] [bit] NOT NULL,
	[AveragePrice] [int] NULL,
 CONSTRAINT [PK_CarVariants] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarVariantYears]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarVariantYears](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_CarVariantYears] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLogins]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[clientId] [int] NOT NULL,
	[logintime] [datetime] NOT NULL,
	[logouttime] [datetime] NULL,
 CONSTRAINT [PK_ClientLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titleId] [int] NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NULL,
	[contactNumber] [nvarchar](50) NULL,
	[bestTimeToContactId] [int] NOT NULL,
	[emailAddress] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[rememberMe] [bit] NULL,
	[isEmailConfirmed] [bit] NULL,
	[provinceId] [int] NOT NULL,
	[townId] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[bidemailnotify] [bit] NOT NULL,
	[bidsmsnotify] [bit] NOT NULL,
	[closenextdayemailnotify] [bit] NOT NULL,
	[closenextdaysmsnotify] [bit] NOT NULL,
	[closedemailnotify] [bit] NOT NULL,
	[closedsmsnotify] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryCode] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerLogins]    Script Date: 2019/01/14 19:23:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dealerId] [int] NOT NULL,
	[logintime] [datetime] NOT NULL,
	[logouttime] [datetime] NULL,
 CONSTRAINT [PK_DealerLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerMakes]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerMakes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dealerId] [int] NOT NULL,
	[carMakeId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_DealerMakes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerProvinces]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerProvinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dealerId] [int] NOT NULL,
	[provinceId] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_DealerProvinces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealers]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titleId] [int] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[MobileNumber] [nvarchar](50) NOT NULL,
	[TelephoneNumber] [nvarchar](50) NOT NULL,
	[emailAddress] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[rememberMe] [bit] NOT NULL,
	[isEmailConfirmed] [bit] NOT NULL,
	[provinceId] [int] NOT NULL,
	[townId] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[modifiedDate] [datetime] NOT NULL,
	[lastLoginDate] [datetime] NULL,
	[isActive] [bit] NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
	[businessName] [nvarchar](100) NOT NULL,
	[registrationNumber] [nvarchar](100) NOT NULL,
	[VATNumber] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[paymentGatewayId] [int] NOT NULL,
	[newlistemailnotify] [bit] NOT NULL,
	[newlistsmsnotify] [bit] NOT NULL,
	[lowerbidemailnotify] [bit] NOT NULL,
	[lowerbidsmsnotify] [bit] NOT NULL,
	[closenextdayemailnotify] [bit] NOT NULL,
	[closenextdaysmsnotify] [bit] NOT NULL,
	[closedemailnotify] [bit] NOT NULL,
	[closedsmsnotify] [bit] NOT NULL,
 CONSTRAINT [PK_Dealers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faq_Types]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faq_Types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faq_Types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faqs]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faqs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faqtypeId] [int] NOT NULL,
	[question] [nvarchar](1000) NOT NULL,
	[answer] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_Faqs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinanceHouse]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinanceHouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FinanceHouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentGateway]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGateway](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentGateway] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[countryId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[provinceId] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[logintime] [datetime] NOT NULL,
	[logouttime] [datetime] NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titleId] [int] NULL,
	[userTypeId] [int] NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NULL,
	[contactNumber] [nvarchar](50) NULL,
	[emailAddress] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[rememberMe] [bit] NULL,
	[provinceId] [int] NOT NULL,
	[townId] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[modifiedDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2019/01/14 19:23:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BestTimeToContact] ON 

INSERT [dbo].[BestTimeToContact] ([id], [Value]) VALUES (1, N'office hours')
INSERT [dbo].[BestTimeToContact] ([id], [Value]) VALUES (2, N'non office hours')
INSERT [dbo].[BestTimeToContact] ([id], [Value]) VALUES (3, N'any time')
SET IDENTITY_INSERT [dbo].[BestTimeToContact] OFF
SET IDENTITY_INSERT [dbo].[Bids] ON 

INSERT [dbo].[Bids] ([id], [dealerId], [requestId], [bidAmount], [isWinningBid], [bidCreatedDate], [winningDate], [isDealerInterested], [dealerComments], [adminComments], [adminId], [bidUpdatedDate]) VALUES (4919, 3, 51, 20000, NULL, CAST(N'2018-11-21T22:30:54.193' AS DateTime), NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Bids] ([id], [dealerId], [requestId], [bidAmount], [isWinningBid], [bidCreatedDate], [winningDate], [isDealerInterested], [dealerComments], [adminComments], [adminId], [bidUpdatedDate]) VALUES (4920, 4, 51, 19999, 1, CAST(N'2018-11-21T22:31:23.077' AS DateTime), NULL, 1, NULL, NULL, NULL, CAST(N'2018-11-21T22:31:34.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bids] OFF
SET IDENTITY_INSERT [dbo].[CarMakes] ON 

INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (1, N'Abarth', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (2, N'Alfa Romeo', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (3, N'Aston Martin', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (4, N'Audi', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (5, N'Bentley', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (6, N'BMW', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (7, N'Changan', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (8, N'Chevrolet', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (9, N'Datsun', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (10, N'Fiat', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (11, N'Ford', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (12, N'GWM', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (13, N'Haval', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (14, N'Honda', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (15, N'Hyundai', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (16, N'Isuzu', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (17, N'Jaguar', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (18, N'Jeep', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (19, N'JMC', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (20, N'Kia', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (21, N'Lamborghini', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (22, N'Land Rover', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (23, N'Lexus', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (24, N'Mahindra', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (25, N'Maserati', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (26, N'Mazda', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (27, N'McLaren', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (28, N'Mercedes-AMG', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (29, N'Mercedes-Benz', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (30, N'Mercedes-Maybach', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (31, N'MINI', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (32, N'Mitsubishi', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (33, N'Nissan', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (34, N'Opel', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (35, N'Peugeot', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (36, N'Porsche', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (37, N'Renault', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (38, N'Rolls-Royce', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (39, N'smart', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (40, N'SsangYong', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (41, N'Subaru', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (42, N'Suzuki', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (43, N'Toyota', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (44, N'Volkswagen', 1)
INSERT [dbo].[CarMakes] ([id], [makeName], [isActive]) VALUES (45, N'Volvo', 1)
SET IDENTITY_INSERT [dbo].[CarMakes] OFF
SET IDENTITY_INSERT [dbo].[CarModels] ON 

INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (1, 1, N'124 spider', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (2, 1, N'595', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (3, 2, N'4C', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (4, 2, N'Giulia', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (5, 2, N'Giulietta', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (6, 2, N'Stelvio', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (7, 3, N'Rapide S', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (8, 3, N'Vanquish', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (9, 4, N'A1', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (10, 4, N'A1 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (11, 4, N'A3 Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (12, 4, N'A3 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (13, 4, N'A3 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (14, 4, N'A4 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (15, 4, N'A5 Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (16, 4, N'A5 Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (17, 4, N'A5 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (18, 4, N'A6 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (19, 4, N'A7 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (20, 4, N'A8', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (21, 4, N'A8L', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (22, 4, N'Q2', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (23, 4, N'Q3', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (24, 4, N'Q5', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (25, 4, N'Q7', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (26, 4, N'R8', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (27, 4, N'RS 6 Avant', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (28, 4, N'RS 7 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (29, 4, N'RS Q3', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (30, 4, N'RS3 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (31, 4, N'RS3 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (32, 4, N'RS5 Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (33, 4, N'S3 Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (34, 4, N'S3 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (35, 4, N'S3 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (36, 4, N'S4 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (37, 4, N'S5 Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (38, 4, N'S5 Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (39, 4, N'S5 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (40, 4, N'S6 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (41, 4, N'S7 Sportback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (42, 4, N'S8', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (43, 4, N'TT Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (44, 4, N'TT RS Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (45, 5, N'Bentayga', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (46, 5, N'Continental', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (47, 5, N'Flying Spur', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (48, 5, N'Mulsanne', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (49, 6, N'1 Series (5-door)', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (50, 6, N'2 Series Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (51, 6, N'2 Series Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (52, 6, N'3 Series', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (53, 6, N'3 Series Gran Turismo', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (54, 6, N'4 Series Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (55, 6, N'4 Series Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (56, 6, N'4 Series Gran Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (57, 6, N'5 Series Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (58, 6, N'6 Series Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (59, 6, N'6 Series Gran Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (60, 6, N'7 Series M760Li', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (61, 6, N'7 Series Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (62, 6, N'i3', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (63, 6, N'i8', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (64, 6, N'M3 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (65, 6, N'M4 Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (66, 6, N'M4 Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (67, 6, N'M5', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (68, 6, N'M6 Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (69, 6, N'M6 Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (70, 6, N'M6 Gran Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (71, 6, N'X1', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (72, 6, N'X2', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (73, 6, N'X3', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (74, 6, N'X4', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (75, 6, N'X5', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (76, 6, N'X5 M', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (77, 6, N'X6', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (78, 6, N'X6 M', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (79, 7, N'Star Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (80, 7, N'Star II', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (81, 7, N'Star Mini Van', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (82, 8, N'Utility', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (83, 9, N'Go', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (84, 9, N'Go+ MPV', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (85, 9, N'Go+ Panel Van Lux', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (86, 10, N'500', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (87, 10, N'500 S', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (88, 10, N'500C', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (89, 10, N'500X', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (90, 10, N'Doblo Cargo', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (91, 10, N'Fiorino', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (92, 10, N'Fullback Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (93, 10, N'Fullback Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (94, 10, N'Panda', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (95, 10, N'Tipo Hatchback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (96, 10, N'Tipo Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (97, 11, N'Ecosport', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (98, 11, N'Everest', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (99, 11, N'Fiesta', 1)
GO
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (100, 11, N'Figo', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (101, 11, N'Focus', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (102, 11, N'Focus Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (103, 11, N'Focus ST', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (104, 11, N'Kuga', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (105, 11, N'Mustang Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (106, 11, N'Mustang Fastback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (107, 11, N'Ranger Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (108, 11, N'Ranger Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (109, 11, N'Ranger Super Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (110, 11, N'Tourneo Custom', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (111, 11, N'Transit', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (112, 12, N'H5', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (113, 12, N'Steed 5 Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (114, 12, N'Steed 5 Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (115, 12, N'Steed 6 Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (116, 13, N'H1 Crossover', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (117, 13, N'H2 SUV', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (118, 13, N'H6 SUV', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (119, 13, N'H9', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (120, 14, N'Ballade', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (121, 14, N'BR-V', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (122, 14, N'Brio Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (123, 14, N'Brio Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (124, 14, N'Civic Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (125, 14, N'Civic Type-R', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (126, 14, N'CR-V', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (127, 14, N'HR-V', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (128, 14, N'HR-V 2018', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (129, 14, N'Jazz', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (130, 15, N'Accent', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (131, 15, N'Accent Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (132, 15, N'Creta', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (133, 15, N'Elantra', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (134, 15, N'Grand i10', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (135, 15, N'H 100', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (136, 15, N'H-1', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (137, 15, N'i20', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (138, 15, N'Tucson', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (139, 16, N'KB Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (140, 16, N'KB Extended Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (141, 16, N'KB Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (142, 16, N'mu-X', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (143, 16, N'mu-X 4X4', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (144, 17, N'E-Pace', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (145, 17, N'F-Pace', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (146, 17, N'F-Type Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (147, 17, N'F-Type Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (148, 17, N'XE', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (149, 17, N'XF', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (150, 17, N'XJ', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (151, 17, N'XJR', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (152, 18, N'Cherokee', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (153, 18, N'Cherokee Limited', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (154, 18, N'Cherokee Trailhawk', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (155, 18, N'Grand Cherokee', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (156, 18, N'Grand Cherokee SRT8', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (157, 18, N'Renegade', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (158, 18, N'Wrangler Rubicon', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (159, 18, N'Wrangler Sahara', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (160, 18, N'Wrangler Unlimited', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (161, 19, N'Boarding', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (162, 19, N'Landwind', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (163, 19, N'Vigus Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (164, 20, N'Cerato Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (165, 20, N'Cerato Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (166, 20, N'Grand Sedona', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (167, 20, N'K2700', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (168, 20, N'Picanto', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (169, 20, N'Rio Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (170, 20, N'Rio Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (171, 20, N'Sorento', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (172, 20, N'Soul', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (173, 20, N'Sportage', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (174, 20, N'Stinger 4 door Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (175, 21, N'Aventador', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (176, 21, N'Huracan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (177, 22, N'Discovery', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (178, 22, N'Discovery Sport', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (179, 22, N'Range Rover', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (180, 22, N'Range Rover Evoque', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (181, 22, N'Range Rover Evoque Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (182, 22, N'Range Rover Evoque Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (183, 22, N'Range Rover Sport', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (184, 22, N'Range Rover Velar', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (185, 23, N'CT 200h', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (186, 23, N'ES', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (187, 23, N'GS 200t', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (188, 23, N'GS 350F-Sport', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (189, 23, N'IS', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (190, 23, N'LC', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (191, 23, N'LS 500', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (192, 23, N'LX', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (193, 23, N'NX', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (194, 23, N'RC', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (195, 23, N'RX 350 EX', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (196, 23, N'RX 450h SE', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (197, 24, N'Bolero Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (198, 24, N'Bolero Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (199, 24, N'Genio Dropside', 1)
GO
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (200, 24, N'Genio Flatbed', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (201, 24, N'Genio Maxivan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (202, 24, N'Genio Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (203, 24, N'KUV100', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (204, 24, N'Scorpio PIK-UP', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (205, 24, N'Scorpio PIK-UP Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (206, 24, N'Scorpio SUV', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (207, 24, N'Thar', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (208, 24, N'TUV300', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (209, 24, N'XUV500', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (210, 25, N'Ghibli', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (211, 25, N'Levante', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (212, 25, N'Quattroporte GTS', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (213, 25, N'Quattroporte S', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (214, 26, N'2', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (215, 26, N'3 Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (216, 26, N'3 Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (217, 26, N'BT-50 Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (218, 26, N'CX-3', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (219, 26, N'CX-5', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (220, 26, N'MX-5', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (221, 27, N'570', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (222, 27, N'720S', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (223, 28, N'A-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (224, 28, N'C-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (225, 28, N'CLA', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (226, 28, N'CLS', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (227, 28, N'E-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (228, 28, N'G-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (229, 28, N'GLA', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (230, 28, N'GLC', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (231, 28, N'GLE', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (232, 28, N'GLS', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (233, 28, N'GT', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (234, 28, N'S-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (235, 28, N'SL', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (236, 28, N'SLC', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (237, 29, N'A-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (238, 29, N'B-Class Sports Tourer', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (239, 29, N'C-Class Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (240, 29, N'C-Class Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (241, 29, N'C-Class Estate', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (242, 29, N'C-Class Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (243, 29, N'CLA', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (244, 29, N'CLS Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (245, 29, N'E-Class Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (246, 29, N'E-Class Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (247, 29, N'E-Class Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (248, 29, N'G-Class Cross-Country', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (249, 29, N'GLA', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (250, 29, N'GLC Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (251, 29, N'GLC SUV', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (252, 29, N'GLE', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (253, 29, N'GLS', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (254, 29, N'S-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (255, 29, N'S-Class Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (256, 29, N'S-Class Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (257, 29, N'SL Roadster', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (258, 29, N'SLC', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (259, 29, N'V-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (260, 29, N'Vito Mixto Crewcab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (261, 29, N'Vito Panel Van', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (262, 29, N'Vito Tourer', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (263, 29, N'X-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (264, 30, N'S-Class', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (265, 31, N'Clubman', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (266, 31, N'Cooper 3-door Hatch Seven Edition', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (267, 31, N'Cooper 5-door Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (268, 31, N'Cooper Convertible', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (269, 31, N'Cooper Countryman', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (270, 31, N'Cooper One', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (271, 31, N'Hatch 1499', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (272, 31, N'John Cooper Works', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (273, 32, N'ASX', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (274, 32, N'Outlander', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (275, 32, N'Pajero 3 door', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (276, 32, N'Pajero 5 door', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (277, 32, N'Pajero Sport', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (278, 32, N'Triton Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (279, 33, N'370Z Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (280, 33, N'Almera', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (281, 33, N'GT-R', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (282, 33, N'Juke', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (283, 33, N'Leaf', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (284, 33, N'Micra', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (285, 33, N'Micra Active', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (286, 33, N'Navara Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (287, 33, N'NP200', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (288, 33, N'NP300 Hardbody - Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (289, 33, N'NP300 Hardbody - Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (290, 33, N'NV200 - Combi', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (291, 33, N'NV200 - Panel Van', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (292, 33, N'NV350 - Impendulo', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (293, 33, N'NV350 - Panel Van', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (294, 33, N'Patrol', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (295, 33, N'Patrol Pick-Up', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (296, 33, N'Qashqai', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (297, 33, N'X-Trail', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (298, 34, N'Adam', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (299, 34, N'Astra Hatchback', 1)
GO
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (300, 34, N'Corsa', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (301, 34, N'Crossland X', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (302, 34, N'Grandland X', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (303, 34, N'Mokka', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (304, 35, N'2008', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (305, 35, N'208', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (306, 35, N'3008', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (307, 35, N'308', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (308, 35, N'Boxer', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (309, 35, N'Partner', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (310, 36, N'911 Carrera', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (311, 36, N'911 Carrera Cabriolet', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (312, 36, N'911 Carrera Touring', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (313, 36, N'911 GT', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (314, 36, N'911 Targa', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (315, 36, N'911 Turbo', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (316, 36, N'Boxster', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (317, 36, N'Cayenne', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (318, 36, N'Cayman', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (319, 36, N'Macan S', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (320, 36, N'Panamera', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (321, 37, N'Captur', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (322, 37, N'Clio', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (323, 37, N'Clio RS', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (324, 37, N'Duster', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (325, 37, N'Kadjar', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (326, 37, N'Kangoo Express', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (327, 37, N'Kwid', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (328, 37, N'Megane Hatchback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (329, 37, N'Sandero', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (330, 37, N'Sandero Stepway', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (331, 37, N'Trafic', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (332, 38, N'Ghost', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (333, 38, N'Wraith', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (334, 39, N'Forfour', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (335, 39, N'Fortwo Coupe', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (336, 40, N'Korando', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (337, 41, N'Forester', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (338, 41, N'Impreza', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (339, 41, N'Impreza XV', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (340, 41, N'Legacy', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (341, 41, N'Outback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (342, 41, N'WRX', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (343, 42, N'Baleno', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (344, 42, N'Celerio', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (345, 42, N'Ciaz', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (346, 42, N'Ertiga', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (347, 42, N'Grand Vitara', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (348, 42, N'Ignis', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (349, 42, N'Jimny', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (350, 42, N'Swift', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (351, 42, N'Swift Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (352, 42, N'Vitara', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (353, 43, N'86', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (354, 43, N'Auris', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (355, 43, N'Avanza', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (356, 43, N'Aygo', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (357, 43, N'C-HR', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (358, 43, N'Corolla', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (359, 43, N'Corolla Quest', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (360, 43, N'Etios', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (361, 43, N'Etios Cross', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (362, 43, N'Etios Hatchback', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (363, 43, N'FJ Cruiser', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (364, 43, N'Fortuner', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (365, 43, N'Hilux Double Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (366, 43, N'Hilux Single Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (367, 43, N'Hilux Xtra Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (368, 43, N'Land Cruiser 200', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (369, 43, N'Land Cruiser 76', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (370, 43, N'Land Cruiser 79 Pick-up', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (371, 43, N'Land Cruiser Prado', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (372, 43, N'Prius', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (373, 43, N'Quantum', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (374, 43, N'Quantum - Sesfikile', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (375, 43, N'Quantum Crew Cab', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (376, 43, N'Quantum Panel Van', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (377, 43, N'RAV4', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (378, 43, N'Rush', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (379, 43, N'Yaris', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (380, 44, N'Amarok', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (381, 44, N'Arteon', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (382, 44, N'Beetle', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (383, 44, N'Caddy', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (384, 44, N'California', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (385, 44, N'Caravelle & Kombi', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (386, 44, N'Golf 7', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (387, 44, N'Golf GTI', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (388, 44, N'Golf R', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (389, 44, N'Jetta', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (390, 44, N'Passat', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (391, 44, N'Polo Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (392, 44, N'Polo Sedan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (393, 44, N'Polo Vivo Hatch', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (394, 44, N'Tiguan', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (395, 44, N'Touareg', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (396, 44, N'Transporter', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (397, 44, N'Transporter Crew Bus', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (398, 44, N'Transporter Panel Van', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (399, 44, N'UP 5-Door', 1)
GO
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (400, 45, N'S60', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (401, 45, N'S90', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (402, 45, N'V40', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (403, 45, N'V40 Cross Country', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (404, 45, N'V60 Cross Country', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (405, 45, N'V90 Cross Country', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (406, 45, N'XC40', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (407, 45, N'XC60', 1)
INSERT [dbo].[CarModels] ([id], [carMakeId], [carModelName], [isActive]) VALUES (408, 45, N'XC90', 1)
SET IDENTITY_INSERT [dbo].[CarModels] OFF
SET IDENTITY_INSERT [dbo].[CarRequests] ON 

INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (51, 1307, 55, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (52, 1638, 56, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (53, 1258, 57, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (54, 518, 58, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (55, 748, 59, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (56, 1451, 60, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (57, 2325, 61, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (58, 481, 62, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (59, 1625, 63, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (60, 2043, 64, CAST(N'2018-11-16T11:12:00.000' AS DateTime), CAST(N'2018-11-29T00:00:00.000' AS DateTime), 1, 4, 4, 0, 1, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (61, 17, 55, CAST(N'2018-11-25T12:37:27.923' AS DateTime), CAST(N'2018-11-14T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (62, 178, 55, CAST(N'2018-11-25T12:40:01.090' AS DateTime), CAST(N'2018-11-22T00:00:00.000' AS DateTime), 3, 3, 3, 0, 2, 0, 2, -3, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (63, 20, 55, CAST(N'2018-11-25T12:41:18.167' AS DateTime), CAST(N'2018-11-22T00:00:00.000' AS DateTime), 4, 3, 3, 0, 2, 0, 2, -3, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (64, 176, 55, CAST(N'2018-11-25T12:50:03.180' AS DateTime), CAST(N'2018-11-15T00:00:00.000' AS DateTime), 3, 3, 5, 1, 2, 1, 3, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (65, 52, 55, CAST(N'2018-11-25T12:53:47.243' AS DateTime), CAST(N'2018-11-22T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (66, 25, 55, CAST(N'2018-11-25T12:55:49.297' AS DateTime), CAST(N'2018-11-28T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (67, 25, 55, CAST(N'2018-11-25T12:58:16.247' AS DateTime), CAST(N'2018-11-22T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (68, 174, 55, CAST(N'2018-11-25T13:00:16.507' AS DateTime), CAST(N'2018-11-28T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (69, 174, 55, CAST(N'2018-11-25T13:00:31.643' AS DateTime), CAST(N'2018-11-28T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (70, 174, 55, CAST(N'2018-11-25T13:00:52.130' AS DateTime), CAST(N'2018-11-28T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[CarRequests] ([id], [carVariantId], [clientId], [requestedDate], [deliveryRequestDate], [colorChoice1Id], [colorChoice2Id], [colorChoice3Id], [canOfferDifferentColor], [paymentMethodId], [financeApproved], [financeHouseId], [depositAmount], [tradeinVehicleAvailable], [tradeinMakeId], [tradeinModelId], [tradeinVariantId], [tradeinYearId], [tradeinFuelId], [tradeinDescription], [tradeinValue], [tradeinKMs], [clientComments], [isRequestActive], [winningBidId], [clientAcceptedWinningBid], [actualSellingPrice], [commissionCalculated], [commisionReceived], [AdminComments], [isRequestClosed]) VALUES (71, 174, 55, CAST(N'2018-11-25T13:01:20.897' AS DateTime), CAST(N'2018-11-28T00:00:00.000' AS DateTime), 1, 1, 1, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[CarRequests] OFF
SET IDENTITY_INSERT [dbo].[CarVariantFuels] ON 

INSERT [dbo].[CarVariantFuels] ([id], [value]) VALUES (1, N'petrol')
INSERT [dbo].[CarVariantFuels] ([id], [value]) VALUES (2, N'diesel')
SET IDENTITY_INSERT [dbo].[CarVariantFuels] OFF
SET IDENTITY_INSERT [dbo].[CarVariants] ON 

INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1, 1, N'124 spider turismo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2, 1, N'124 spider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (3, 2, N'500 595 1.4T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (4, 2, N'500 595 1.4T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (5, 2, N'500C 595 1.4T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (6, 2, N'500C 595 1.4T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (7, 2, N'500C 595 turismo 1.4T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (8, 2, N'500C 595 turismo 1.4T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (9, 2, N'500 595 competizione 1.4T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (10, 2, N'500 595 competizione 1.4T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (11, 2, N'500C 595 competizione 1.4T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (12, 2, N'500C 595 competizione 1.4T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (13, 2, N'500 595 turismo 1.4T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (14, 3, N'4C coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (15, 3, N'4C Spider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (16, 4, N'Giulia 2.0T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (17, 4, N'Giulia Quadrifoglio Verde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (18, 4, N'Giulia 2.0T Super', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (19, 5, N'Giulietta 1.4TB', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (20, 5, N'Giulietta 1.4TB Super', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (21, 5, N'Giulietta 1.4TB Super auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (22, 5, N'Giulietta 1750TBi Veloce', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (23, 6, N'Stelvio 2.0T First Edition Q4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (24, 6, N'Stelvio 2.0T Super Q4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (25, 7, N'Rapide S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (26, 8, N'Vanquish S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (27, 8, N'Vanquish S Ultimate Volante', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (28, 8, N'Vanquish S Volante', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (29, 8, N'Vanquish S Ultimate coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (30, 9, N'A1 3-door 1.0TFSI S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (31, 9, N'A1 3-door 1.0TFSI S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (32, 9, N'A1 3-door 1.0TFSI SE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (33, 9, N'A1 3-door 1.4TFSI SE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (34, 9, N'A1 3-door 1.8TFSI Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (35, 10, N'A1 Sportback 1.0TFSI S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (36, 10, N'A1 Sportback 1.0TFSI S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (37, 10, N'A1 Sportback 1.0TFSI SE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (38, 10, N'A1 Sportback 1.4TFSI SE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (39, 10, N'A1 Sportback 1.8TFSI Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (40, 11, N'A3 cabriolet 2.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (41, 11, N'A3 cabriolet 2.0TFSI S line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (42, 12, N'A3 sedan 1.0TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (43, 12, N'A3 sedan 1.0TFSI S line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (44, 12, N'A3 sedan 1.4TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (45, 12, N'A3 sedan 1.4TFSI S line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (46, 12, N'A3 sedan 2.0TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (47, 12, N'A3 sedan 2.0TFSI S line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (48, 12, N'A3 sedan 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (49, 12, N'A3 sedan 2.0TDI S line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (50, 13, N'A3 Sportback 1.0TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (51, 13, N'A3 Sportback 1.0TFSI S line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (52, 13, N'A3 Sportback 1.4TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (53, 13, N'A3 Sportback 1.4TFSI S line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (54, 13, N'A3 Sportback 2.0TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (55, 13, N'A3 Sportback 2.0TFSI S line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (56, 13, N'A3 Sportback 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (57, 13, N'A3 Sportback 2.0TDI S line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (58, 14, N'A4 1.4TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (59, 14, N'A4 1.4TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (60, 14, N'A4 2.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (61, 14, N'A4 2.0TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (62, 14, N'A4 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (63, 14, N'A4 2.0TDI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (64, 14, N'A4 2.0TFSI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (65, 15, N'A5 cabriolet 2.0TFSI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (66, 15, N'A5 cabriolet 2.0TFSI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (67, 15, N'A5 cabriolet 2.0TFSI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (68, 15, N'A5 cabriolet 2.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (69, 15, N'A5 cabriolet 2.0TFSI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (70, 15, N'A5 cabriolet 2.0TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (71, 16, N'A5 coupe 2.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (72, 16, N'A5 coupe 2.0TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (73, 16, N'A5 coupe 2.0TFSI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (74, 16, N'A5 coupe 2.0TDI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (75, 16, N'A5 coupe 2.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (76, 16, N'A5 coupe 2.0TFSI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (77, 16, N'A5 coupe 2.0TDI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (78, 16, N'A5 coupe 2.0TFSI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (79, 16, N'A5 coupe 2.0TDI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (80, 16, N'A5 coupe 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (81, 16, N'A5 coupe 2.0TDI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (82, 16, N'A5 coupe 2.0TFSI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (83, 17, N'A5 Sportback 2.0TFSI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (84, 17, N'A5 Sportback 2.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (85, 17, N'A5 Sportback 2.0TDI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (86, 17, N'A5 Sportback 2.0TDI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (87, 17, N'A5 Sportback 2.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (88, 17, N'A5 Sportback 2.0TDI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (89, 17, N'A5 Sportback 2.0TFSI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (90, 17, N'A5 Sportback 2.0TFSI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (91, 17, N'A5 Sportback 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (92, 17, N'A5 Sportback 2.0TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (93, 17, N'A5 Sportback 2.0TFSI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (94, 17, N'A5 Sportback 2.0TDI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (95, 18, N'A6 1.8TFSI SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (96, 18, N'A6 2.0TDI SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (97, 18, N'A6 3.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (98, 18, N'A6 2.0T quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (99, 19, N'A7 Sportback 3.0TDI BiT quattro', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (100, 19, N'A7 Sportback 3.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (101, 20, N'A8 4.2TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (102, 20, N'A8 3.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (103, 21, N'A8 L 3.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (104, 21, N'A8 L 4.2TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (105, 21, N'A8 L 6.3 W12 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (106, 22, N'Q2 1.4TFSI sport S line sports auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (107, 22, N'Q2 1.4TFSI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (108, 22, N'Q2 1.4TFSI sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (109, 22, N'Q2 1.4TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (110, 22, N'Q2 1.0TFSI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (111, 22, N'Q2 1.0TFSI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (112, 22, N'Q2 1.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (113, 22, N'Q2 1.0TFSI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (114, 22, N'Q2 1.0TFSI sport S line sports auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (115, 22, N'Q2 1.0TFSI sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (116, 22, N'Q2 2.0TDI sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (117, 22, N'Q2 2.0TDI sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (118, 23, N'Q3 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (119, 23, N'Q3 2.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (120, 23, N'Q3 2.0T quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (121, 23, N'Q3 2.0T quattro auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (122, 23, N'Q3 2.0T 155kW quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (123, 23, N'Q3 2.0TDI SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (124, 23, N'Q3 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (125, 23, N'Q3 2.0T quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (126, 23, N'Q3 2.0T quattro auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (127, 23, N'Q3 2.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (128, 23, N'Q3 2.0T 155kW quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (129, 23, N'Q3 2.0TDI SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (130, 23, N'Q3 2.0T quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (131, 23, N'Q3 1.4T S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (132, 23, N'Q3 2.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (133, 23, N'Q3 1.4TFSI S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (134, 23, N'Q3 2.0TDI S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (135, 24, N'Q5 2.0TFSI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (136, 24, N'Q5 2.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (137, 24, N'Q5 2.0TFSI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (138, 24, N'Q5 2.0TFSI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (139, 24, N'Q5 2.0TDI quattro sport S line sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (140, 24, N'Q5 2.0TDI quattro sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (141, 24, N'SQ5 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (142, 25, N'Q7 3.0TDI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (143, 26, N'R8 5.2 V10 plus quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (144, 26, N'R8 5.2 V10 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (145, 26, N'R8 5.2 V10 Spyder quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (146, 27, N'RS6 Avant quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (147, 28, N'RS7 Sportback quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (148, 29, N'RS Q3 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (149, 29, N'RS Q3 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (150, 29, N'RS Q3 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (151, 30, N'RS3 sedan quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (152, 31, N'RS3 Sportback quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (153, 31, N'RS3 Sportback quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (154, 32, N'RS5 coupe quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (155, 33, N'S3 cabriolet quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (156, 34, N'S3 sedan quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (157, 35, N'S3 Sportback quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (158, 36, N'S4 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (159, 37, N'S5 cabriolet quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (160, 38, N'S5 coupe quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (161, 39, N'S5 Sportback quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (162, 40, N'S6 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (163, 41, N'S7 Sportback quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (164, 42, N'S8 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (165, 42, N'S8 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (166, 42, N'S8 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (167, 42, N'S8 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (168, 42, N'S8 quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (169, 43, N'TTS coupe 2.0T quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (170, 43, N'TT coupe 1.8TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (171, 43, N'TT coupe 2.0TFSI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (172, 43, N'TT coupe 2.0TFSI quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (173, 44, N'TT RS coupe quattro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (174, 45, N'Bentayga W12', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (175, 45, N'Bentayga Diesel', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (176, 46, N'Continental GT W12 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (177, 47, N'Flying Spur V8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (178, 47, N'Flying Spur V8 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (179, 48, N'Mulsanne', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (180, 48, N'Mulsanne Speed', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (181, 49, N'118i 5-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (182, 49, N'118i 5-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (183, 49, N'118i 5-door Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (184, 49, N'118i 5-door Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (185, 49, N'118i 5-door Edition Sport Line Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (186, 49, N'118i 5-door M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (187, 49, N'118i 5-door M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (188, 49, N'120i 5-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (189, 49, N'120i 5-door sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (190, 49, N'120i 5-door Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (191, 49, N'120i 5-door Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (192, 49, N'120i 5-door M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (193, 49, N'120i 5-door M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (194, 49, N'120d 5-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (195, 49, N'120d 5-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (196, 49, N'120d 5-door sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (197, 49, N'120d 5-door Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (198, 49, N'120d 5-door Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (199, 49, N'120d 5-door Sport Line sports-auto', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (200, 49, N'120d 5-door M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (201, 49, N'120d 5-door M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (202, 49, N'120d 5-door M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (203, 49, N'120d 5-door Edition M Sport Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (204, 49, N'120d 5-door Edition M Sport Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (205, 49, N'120d 5-door Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (206, 49, N'125i 5-door M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (207, 49, N'125i 5-door Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (208, 49, N'M140i 5-door sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (209, 49, N'M140i 5-door Edition Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (210, 49, N'120i 5-door Edition M Sport Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (211, 49, N'120i 5-door Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (212, 49, N'118i 5-door Edition Sport Line Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (213, 50, N'220i convertible Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (214, 50, N'220i convertible Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (215, 50, N'220i convertible Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (216, 50, N'220i convertible Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (217, 50, N'220i convertible M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (218, 50, N'220i convertible M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (219, 50, N'230i convertible Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (220, 50, N'230i convertible Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (221, 50, N'230i convertible Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (222, 50, N'230i convertible Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (223, 50, N'230i convertible M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (224, 50, N'230i convertible M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (225, 50, N'M240i convertible sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (226, 50, N'M2 competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (227, 50, N'M2 competition auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (228, 51, N'220i coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (229, 51, N'220i coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (230, 51, N'220i coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (231, 51, N'220i coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (232, 51, N'220i coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (233, 51, N'220i coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (234, 51, N'220d coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (235, 51, N'220d coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (236, 51, N'220d coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (237, 51, N'220d coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (238, 51, N'220d coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (239, 51, N'220d coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (240, 51, N'220d coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (241, 51, N'220d coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (242, 51, N'220d coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (243, 51, N'230i coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (244, 51, N'230i coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (245, 51, N'230i coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (246, 51, N'230i coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (247, 51, N'230i coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (248, 51, N'230i coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (249, 51, N'M240i coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (250, 51, N'M2 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (251, 51, N'M2 coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (252, 52, N'318i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (253, 52, N'318i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (254, 52, N'318i Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (255, 52, N'318i Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (256, 52, N'318i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (257, 52, N'318i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (258, 52, N'318i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (259, 52, N'318i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (260, 52, N'320i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (261, 52, N'320i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (262, 52, N'320i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (263, 52, N'320i Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (264, 52, N'320i Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (265, 52, N'320i Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (266, 52, N'320i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (267, 52, N'320i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (268, 52, N'320i Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (269, 52, N'320i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (270, 52, N'320i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (271, 52, N'320i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (272, 52, N'320d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (273, 52, N'320d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (274, 52, N'320d sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (275, 52, N'320d Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (276, 52, N'320d Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (277, 52, N'320d Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (278, 52, N'320d Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (279, 52, N'320d Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (280, 52, N'320d Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (281, 52, N'320d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (282, 52, N'320d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (283, 52, N'320d M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (284, 52, N'330i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (285, 52, N'330i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (286, 52, N'330i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (287, 52, N'330i Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (288, 52, N'330i Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (289, 52, N'330i Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (290, 52, N'330i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (291, 52, N'330i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (292, 52, N'330i Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (293, 52, N'330i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (294, 52, N'330i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (295, 52, N'330i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (296, 52, N'330d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (297, 52, N'330d sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (298, 52, N'330d Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (299, 52, N'330d Luxury Line sports-auto', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (300, 52, N'330d Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (301, 52, N'330d Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (302, 52, N'330d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (303, 52, N'330d M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (304, 52, N'340i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (305, 52, N'340i Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (306, 52, N'340i Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (307, 52, N'340i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (308, 52, N'330e eDrive Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (309, 52, N'330e eDrive M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (310, 52, N'330e eDrive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (311, 52, N'330e eDrive Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (312, 52, N'318i Edition Sport Line Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (313, 52, N'318i Edition Sport Line Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (314, 52, N'320i Edition M Sport Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (315, 52, N'320i Edition M Sport Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (316, 52, N'320i Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (317, 52, N'320d Edition M Sport Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (318, 52, N'320d Edition M Sport Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (319, 52, N'320d Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (320, 52, N'330i Edition M Sport Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (321, 52, N'330i Edition M Sport Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (322, 52, N'330i Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (323, 52, N'330d Edition M Sport Shadow auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (324, 52, N'330d Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (325, 52, N'330e eDrive Edition M Sport Shadow', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (326, 52, N'340i Edition M Sport Shadow sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (327, 53, N'320i GT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (328, 53, N'320d GT Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (329, 53, N'320d GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (330, 53, N'320d GT Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (331, 53, N'320i GT M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (332, 53, N'320i GT sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (333, 53, N'320d GT M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (334, 53, N'320d GT sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (335, 53, N'320i GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (336, 53, N'320d GT Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (337, 53, N'320i GT M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (338, 53, N'320i GT Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (339, 53, N'320d GT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (340, 53, N'320d GT Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (341, 53, N'320d GT M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (342, 53, N'320d GT Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (343, 53, N'320i GT Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (344, 53, N'320d GT Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (345, 53, N'320d GT M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (346, 53, N'320i GT M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (347, 53, N'320i GT Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (348, 53, N'320i GT Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (349, 53, N'320i GT Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (350, 53, N'320i GT Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (351, 53, N'340i GT M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (352, 53, N'340i GT sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (353, 53, N'340i GT Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (354, 53, N'340i GT Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (355, 54, N'420i convertible Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (356, 54, N'430i convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (357, 54, N'420i convertible Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (358, 54, N'420i convertible Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (359, 54, N'420i convertible auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (360, 54, N'420i convertible sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (361, 54, N'420i convertible M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (362, 54, N'420i convertible M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (363, 54, N'420i convertible M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (364, 54, N'430i convertible M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (365, 54, N'430i convertible M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (366, 54, N'440i convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (367, 54, N'440i convertible Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (368, 54, N'440i convertible Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (369, 54, N'440i convertible M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (370, 54, N'420i convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (371, 54, N'420i convertible Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (372, 54, N'420i convertible Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (373, 54, N'430i convertible sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (374, 54, N'430i convertible Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (375, 54, N'430i convertible Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (376, 54, N'430i convertible Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (377, 54, N'430i convertible Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (378, 54, N'430i convertible Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (379, 54, N'430i convertible Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (380, 54, N'430i convertible M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (381, 54, N'430i convertible auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (382, 54, N'420i convertible Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (383, 55, N'430i coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (384, 55, N'430i coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (385, 55, N'430i coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (386, 55, N'420i coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (387, 55, N'420i coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (388, 55, N'420d coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (389, 55, N'420d coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (390, 55, N'420d coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (391, 55, N'420i coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (392, 55, N'430i coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (393, 55, N'430i coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (394, 55, N'440i coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (395, 55, N'440i coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (396, 55, N'440i coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (397, 55, N'440i coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (398, 55, N'430i coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (399, 55, N'430i coupe Luxury Line', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (400, 55, N'430i coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (401, 55, N'430i coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (402, 55, N'430i coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (403, 55, N'430i coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (404, 55, N'420i coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (405, 55, N'420i coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (406, 55, N'420i coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (407, 55, N'420i coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (408, 55, N'420i coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (409, 55, N'420i coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (410, 55, N'420d coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (411, 55, N'420d coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (412, 55, N'420d coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (413, 55, N'420d coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (414, 55, N'420d coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (415, 55, N'420d coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (416, 55, N'420d coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (417, 55, N'420d coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (418, 55, N'420d coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (419, 55, N'430i coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (420, 55, N'430i coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (421, 55, N'420i coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (422, 55, N'420i coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (423, 55, N'420i coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (424, 56, N'420i Gran Coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (425, 56, N'420i Gran Coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (426, 56, N'420i Gran Coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (427, 56, N'420i Gran Coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (428, 56, N'420i Gran Coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (429, 56, N'420i Gran Coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (430, 56, N'420i Gran Coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (431, 56, N'420d Gran Coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (432, 56, N'420d Gran Coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (433, 56, N'420i Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (434, 56, N'440i Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (435, 56, N'430i Gran Coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (436, 56, N'420d Gran Coupe sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (437, 56, N'420d Gran Coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (438, 56, N'420d Gran Coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (439, 56, N'440i Gran Coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (440, 56, N'440i Gran Coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (441, 56, N'420i Gran Coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (442, 56, N'420d Gran Coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (443, 56, N'420d Gran Coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (444, 56, N'430i Gran Coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (445, 56, N'420i Gran Coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (446, 56, N'440i Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (447, 56, N'420d Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (448, 56, N'420i Gran Coupe M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (449, 56, N'430i Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (450, 56, N'420d Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (451, 56, N'420d Gran Coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (452, 56, N'420d Gran Coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (453, 56, N'420i Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (454, 56, N'430i Gran Coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (455, 56, N'430i Gran Coupe Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (456, 56, N'430i Gran Coupe Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (457, 56, N'430i Gran Coupe Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (458, 56, N'430i Gran Coupe Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (459, 56, N'430i Gran Coupe Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (460, 56, N'430i Gran Coupe Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (461, 56, N'420d Gran Coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (462, 56, N'430i Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (463, 56, N'430i Gran Coupe M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (464, 57, N'540i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (465, 57, N'520d Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (466, 57, N'520d Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (467, 57, N'540i Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (468, 57, N'540i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (469, 57, N'530d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (470, 57, N'530d Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (471, 57, N'530d Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (472, 57, N'530i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (473, 57, N'530i Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (474, 57, N'520d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (475, 57, N'530i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (476, 57, N'540i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (477, 57, N'530d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (478, 57, N'530i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (479, 57, N'520d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (480, 57, N'520i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (481, 57, N'520i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (482, 57, N'520i Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (483, 57, N'520i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (484, 58, N'640i convertible Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (485, 58, N'650i convertible Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (486, 58, N'640i convertible Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (487, 58, N'640i convertible M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (488, 58, N'650i convertible Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (489, 58, N'650i convertible M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (490, 59, N'640i Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (491, 59, N'640i Gran Coupe Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (492, 59, N'650i Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (493, 59, N'650i Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (494, 59, N'640d Gran Coupe Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (495, 59, N'650i Gran Coupe Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (496, 59, N'640d Gran Coupe M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (497, 59, N'640d Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (498, 59, N'640i Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (499, 59, N'640i xDrive GT Sport Line', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (500, 59, N'630d GT Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (501, 59, N'630d GT M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (502, 59, N'640i xDrive GT Luxury Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (503, 59, N'640i xDrive GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (504, 59, N'640i xDrive GT M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (505, 59, N'630d GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (506, 59, N'630d GT Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (507, 60, N'740i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (508, 60, N'750i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (509, 60, N'750Li M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (510, 60, N'M760Li V12 Excellence xDrive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (511, 60, N'M760Li xDrive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (512, 60, N'M760Li xDrive 7 40 Jahre Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (513, 61, N'740i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (514, 61, N'740i Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (515, 61, N'730d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (516, 61, N'730d Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (517, 61, N'730d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (518, 61, N'750i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (519, 61, N'750i Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (520, 61, N'750Li', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (521, 61, N'750Li Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (522, 61, N'740e eDrive Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (523, 61, N'740e eDrive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (524, 61, N'740i Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (525, 61, N'750Li Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (526, 61, N'750i Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (527, 61, N'730d Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (528, 61, N'740e eDrive Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (529, 61, N'740e eDrive M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (530, 62, N'i3 eDrive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (531, 62, N'i3 eDrive REx', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (532, 63, N'i8 eDrive Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (533, 63, N'i8 eDrive Roadster', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (534, 64, N'M3 Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (535, 64, N'M3 Competition auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (536, 64, N'M3 Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (537, 64, N'M3', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (538, 65, N'M4 convertible Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (539, 65, N'M4 convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (540, 66, N'M4 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (541, 66, N'M4 coupe Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (542, 66, N'M4 CS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (543, 67, N'M5', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (544, 67, N'M5 competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (545, 68, N'M6 convertible Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (546, 68, N'M6 convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (547, 69, N'M6 Gran Coupe Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (548, 69, N'M6 coupe Competition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (549, 69, N'M6 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (550, 70, N'M6 Gran Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (551, 71, N'X1 sDrive20d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (552, 71, N'X1 sDrive20d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (553, 71, N'X1 sDrive20d sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (554, 71, N'X1 sDrive20d Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (555, 71, N'X1 sDrive20d Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (556, 71, N'X1 sDrive20d Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (557, 71, N'X1 sDrive20d xLine', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (558, 71, N'X1 sDrive20d xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (559, 71, N'X1 sDrive20d xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (560, 71, N'X1 sDrive20d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (561, 71, N'X1 sDrive20d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (562, 71, N'X1 sDrive20d M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (563, 71, N'X1 sDrive18i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (564, 71, N'X1 sDrive18i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (565, 71, N'X1 sDrive18i Sport Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (566, 71, N'X1 sDrive18i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (567, 71, N'X1 sDrive18i xLine', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (568, 71, N'X1 sDrive18i xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (569, 71, N'X1 sDrive18i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (570, 71, N'X1 sDrive18i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (571, 71, N'X1 sDrive20i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (572, 71, N'X1 sDrive20i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (573, 71, N'X1 sDrive20i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (574, 71, N'X1 sDrive20i Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (575, 71, N'X1 sDrive20i xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (576, 71, N'X1 sDrive20i xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (577, 71, N'X1 sDrive20i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (578, 71, N'X1 sDrive20i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (579, 71, N'X1 xDrive20i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (580, 71, N'X1 xDrive20i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (581, 71, N'X1 xDrive20i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (582, 71, N'X1 xDrive20i Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (583, 71, N'X1 xDrive20i xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (584, 71, N'X1 xDrive20i xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (585, 71, N'X1 xDrive20i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (586, 71, N'X1 xDrive20i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (587, 71, N'X1 xDrive20d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (588, 71, N'X1 xDrive20d sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (589, 71, N'X1 xDrive20d Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (590, 71, N'X1 xDrive20d Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (591, 71, N'X1 xDrive20d xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (592, 71, N'X1 xDrive20d xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (593, 71, N'X1 xDrive20d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (594, 71, N'X1 xDrive20d M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (595, 71, N'X1 xDrive25i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (596, 71, N'X1 xDrive25i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (597, 71, N'X1 xDrive25i Sport Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (598, 71, N'X1 xDrive25i Sport Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (599, 71, N'X1 xDrive25i xLine auto', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (600, 71, N'X1 xDrive25i xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (601, 71, N'X1 xDrive25i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (602, 71, N'X1 xDrive25i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (603, 72, N'X2 sDrive20i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (604, 72, N'X2 sDrive18i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (605, 72, N'X2 xDrive20d M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (606, 72, N'X2 xDrive20d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (607, 72, N'X2 sDrive18i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (608, 72, N'X2 sDrive20i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (609, 73, N'X3 xDrive20d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (610, 73, N'X3 xDrive30d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (611, 73, N'X3 xDrive30d sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (612, 73, N'X3 xDrive30i Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (613, 73, N'X3 xDrive20d xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (614, 73, N'X3 xDrive30d xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (615, 73, N'X3 xDrive30i xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (616, 73, N'X3 xDrive30i xLine sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (617, 73, N'X3 xDrive30d xLine auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (618, 73, N'X3 xDrive20d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (619, 73, N'X3 xDrive30i auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (620, 73, N'X3 xDrive30i sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (621, 73, N'X3 xDrive30d M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (622, 73, N'X3 xDrive20d Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (623, 73, N'X3 xDrive30i Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (624, 73, N'X3 M40i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (625, 73, N'X3 xDrive30i M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (626, 73, N'X3 xDrive30i M Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (627, 73, N'X3 xDrive30d M Sport sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (628, 73, N'X3 xDrive30d Luxury Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (629, 73, N'X3 xDrive30d Luxury Line sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (630, 74, N'X4 xDrive20i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (631, 74, N'X4 xDrive20d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (632, 74, N'X4 xDrive20d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (633, 74, N'X4 M40i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (634, 74, N'X4 xDrive20i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (635, 75, N'X5 xDrive25d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (636, 75, N'X5 xDrive25d Exterior Design Pure Experience', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (637, 75, N'X5 xDrive25d Exterior Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (638, 75, N'X5 xDrive25d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (639, 75, N'X5 xDrive30d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (640, 75, N'X5 xDrive30d Exterior Design Pure Experience', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (641, 75, N'X5 xDrive30d Exterior Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (642, 75, N'X5 xDrive30d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (643, 75, N'X5 xDrive40e eDrive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (644, 75, N'X5 xDrive40e eDrive Exterior Design Pure Experience', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (645, 75, N'X5 xDrive40e eDrive Exterior Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (646, 75, N'X5 xDrive40e eDrive M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (647, 75, N'X5 xDrive40d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (648, 75, N'X5 xDrive40d Exterior Design Pure Experience', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (649, 75, N'X5 xDrive40d Exterior Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (650, 75, N'X5 xDrive40d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (651, 75, N'X5 xDrive50i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (652, 75, N'X5 xDrive50i Exterior Design Pure Experience', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (653, 75, N'X5 xDrive50i Exterior Design Pure Excellence', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (654, 75, N'X5 xDrive50i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (655, 76, N'X5 M50d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (656, 76, N'X5 M', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (657, 76, N'X5 M edition black fire', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (658, 77, N'X6 xDrive35i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (659, 77, N'X6 xDrive35i Exterior Design Pure Extravagance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (660, 77, N'X6 xDrive35i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (661, 77, N'X6 xDrive40d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (662, 77, N'X6 xDrive40d Exterior Design Pure Extravagance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (663, 77, N'X6 xDrive40d M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (664, 77, N'X6 xDrive50i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (665, 77, N'X6 xDrive50i Exterior Design Pure Extravagance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (666, 77, N'X6 xDrive50i M Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (667, 77, N'X6 M edition black fire', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (668, 78, N'X6 M50d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (669, 78, N'X6 M', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (670, 79, N'Star 1.3 double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (671, 79, N'Star 1.3 double cab Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (672, 80, N'Star 1.3', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (673, 80, N'Star 1.3 Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (674, 81, N'Star 1.3 Mini Van 5-seat', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (675, 82, N'Utility 1.3D Club', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (676, 82, N'Utility 1.3D Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (677, 82, N'Dawn Black Badge', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (678, 82, N'Utility 1.4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (679, 82, N'Utility 1.4 (aircon+ABS)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (680, 82, N'Utility 1.4 UteSurf Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (681, 82, N'Utility 1.4 UteForce Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (682, 83, N'Go 1.2 Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (683, 83, N'Go 1.2 Flash', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (684, 84, N'Go+ 1.2 Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (685, 85, N'Go+ 1.2 panel van Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (686, 86, N'500 TwinAir Lounge auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (687, 86, N'500 TwinAir Pop auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (688, 86, N'500 TwinAir Pop Star auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (689, 86, N'500 TwinAir Pop', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (690, 86, N'500 TwinAir Lounge', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (691, 86, N'500 TwinAir Pop Star', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (692, 87, N'500S TwinAir', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (693, 87, N'500S TwinAir LE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (694, 87, N'500S TwinAir cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (695, 87, N'500S TwinAir cabriolet LE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (696, 88, N'500C TwinAir 500 60th Anniversary', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (697, 88, N'500C TwinAir 500 60th Anniversary auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (698, 88, N'500C TwinAir Lounge auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (699, 88, N'500C TwinAir Lounge', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (700, 89, N'500X 1.4T Pop Star auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (701, 89, N'500X 1.4T Pop Star', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (702, 89, N'500X 1.4T Cross auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (703, 89, N'500X 1.4T Cross', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (704, 89, N'500X 1.6 Pop', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (705, 90, N'Doblo Cargo 1.3 Multijet (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (706, 90, N'Doblo Cargo Maxi 1.6 Multijet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (707, 90, N'Doblo Cargo Maxi 1.6 Multijet (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (708, 90, N'Doblo Cargo 1.3 Multijet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (709, 90, N'Doblo Cargo 1.4 (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (710, 90, N'Doblo Cargo 1.4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (711, 91, N'Fiorino 1.3 Multijet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (712, 91, N'Fiorino 1.3 Multijet (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (713, 91, N'Fiorino 1.4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (714, 91, N'Fiorino 1.4 (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (715, 92, N'Fullback 2.5Di-D double cab SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (716, 92, N'Fullback 2.5Di-D double cab 4x4 LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (717, 92, N'Fullback 2.4Di-D double cab 4x4 LX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (718, 93, N'Fullback 2.4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (719, 93, N'Fullback 2.5Di-D', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (720, 94, N'Panda 0.9 TwinAir Easy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (721, 94, N'Panda 0.9 TwinAir Lounge', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (722, 94, N'Panda 0.9 TwinAir 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (723, 94, N'Panda 0.9 TwinAir 4x4 Cross', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (724, 95, N'Tipo hatch 1.4 Lounge', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (725, 95, N'Tipo hatch 1.6 Easy auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (726, 95, N'Tipo hatch 1.4 Pop', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (727, 95, N'Tipo hatch 1.4 Easy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (728, 96, N'Tipo sedan 1.4 Pop', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (729, 96, N'Tipo sedan 1.4 Easy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (730, 96, N'Tipo sedan 1.3 Multijet Easy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (731, 96, N'Tipo sedan 1.6 Easy auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (732, 97, N'EcoSport 1.0T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (733, 97, N'EcoSport 1.5TDCi Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (734, 97, N'EcoSport 1.0T Titanium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (735, 97, N'EcoSport 1.0T Titanium auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (736, 97, N'EcoSport 1.0T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (737, 98, N'Everest 2.2 XLT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (738, 98, N'Everest 2.2 XLS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (739, 98, N'Everest 2.2 4WD XLS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (740, 98, N'Everest 3.2 XLT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (741, 98, N'Everest 3.2 4WD XLT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (742, 98, N'Everest 3.2 4WD Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (743, 98, N'Everest 2.2 XLT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (744, 98, N'Everest 2.2 XLS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (745, 99, N'Fiesta ST', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (746, 99, N'Fiesta ST200', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (747, 99, N'Fiesta 1.5TDCi Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (748, 99, N'Fiesta 1.0T Titanium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (749, 99, N'Fiesta 1.0T Titanium auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (750, 99, N'Fiesta 1.0T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (751, 99, N'Fiesta 1.0T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (752, 100, N'Figo sedan 1.5 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (753, 100, N'Figo sedan 1.5 Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (754, 100, N'Figo hatch 1.5 Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (755, 100, N'Figo hatch 1.5 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (756, 100, N'Figo hatch 1.5 Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (757, 101, N'Focus hatch 1.0T Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (758, 101, N'Focus hatch 1.0T Ambiente auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (759, 101, N'Focus hatch 1.5T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (760, 101, N'Focus hatch 1.5TDCi Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (761, 101, N'Focus hatch 1.5T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (762, 101, N'Focus hatch 1.5TDCi Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (763, 101, N'Focus hatch 1.0T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (764, 101, N'Focus hatch 1.0T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (765, 101, N'Focus RS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (766, 102, N'Focus sedan 1.0T Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (767, 102, N'Focus sedan 1.0T Ambiente auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (768, 102, N'Focus sedan 1.5TDCi Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (769, 102, N'Focus sedan 1.5TDCi Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (770, 102, N'Focus sedan 1.0T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (771, 102, N'Focus sedan 1.0T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (772, 102, N'Focus sedan 1.5T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (773, 102, N'Focus sedan 1.5T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (774, 103, N'Focus ST 1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (775, 103, N'Focus ST 3', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (776, 104, N'Kuga 1.5T Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (777, 104, N'Kuga 2.0T AWD Titanium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (778, 104, N'Kuga 1.5T Ambiente auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (779, 104, N'Kuga 1.5T Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (780, 104, N'Kuga 2.0TDCi AWD Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (781, 104, N'Kuga 1.5T Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (782, 104, N'Kuga 2.0TDCi AWD Titanium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (783, 105, N'Mustang 2.3T convertible auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (784, 105, N'Mustang 5.0 GT convertible auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (785, 106, N'Mustang 2.3T fastback', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (786, 106, N'Mustang 2.3T fastback auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (787, 106, N'Mustang 5.0 GT fastback', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (788, 106, N'Mustang 5.0 GT fastback auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (789, 107, N'Ranger 2.2 double cab Hi-Rider XLT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (790, 107, N'Ranger 2.2 double cab 4x4 XLS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (791, 107, N'Ranger 2.2 double cab Hi-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (792, 107, N'Ranger 2.2 double cab Hi-Rider XLT Fx4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (793, 107, N'Ranger 3.2 double cab Hi-Rider XLT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (794, 107, N'Ranger 2.2 double cab 4x4 XL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (795, 107, N'Ranger 3.2 double cab 4x4 XLT Fx4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (796, 107, N'Ranger 3.2 double cab 4x4 Wildtrak auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (797, 107, N'Ranger 2.2 double cab 4x4 XL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (798, 107, N'Ranger 2.2 double cab Hi-Rider XLT Fx4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (799, 107, N'Ranger 2.2 double cab Hi-Rider XL auto', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (800, 107, N'Ranger 2.2 double cab Hi-Rider XLT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (801, 107, N'Ranger 3.2 double cab Hi-Rider XLT Fx4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (802, 107, N'Ranger 3.2 double cab Hi-Rider XLT Fx4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (803, 107, N'Ranger 3.2 double cab Hi-Rider Wildtrak auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (804, 107, N'Ranger 2.2 double cab Hi-Rider XL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (805, 107, N'Ranger 2.2 double cab 4x4 XL-Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (806, 107, N'Ranger 3.2 double cab 4x4 XLT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (807, 107, N'Ranger 3.2 double cab Hi-Rider XLT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (808, 108, N'Ranger 2.2', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (809, 108, N'Ranger 2.2 Hi-Rider XL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (810, 108, N'Ranger 2.2 4x4 XLS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (811, 108, N'Ranger 2.2 (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (812, 108, N'Ranger 2.2 4x4 XL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (813, 108, N'Ranger 2.2 Hi-Rider XL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (814, 109, N'Ranger 2.2 SuperCab Hi-Rider XL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (815, 109, N'Ranger 2.2 SuperCab Hi-Rider XL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (816, 109, N'Ranger 2.2 SuperCab Hi-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (817, 109, N'Ranger 2.2 SuperCab Hi-Rider (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (818, 109, N'Ranger 2.2 SuperCab 4x4 XL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (819, 109, N'Ranger 3.2 SuperCab 4x4 XLT auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (820, 109, N'Ranger 2.2 SuperCab 4x4 XLS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (821, 110, N'Tourneo Custom 2.2TDCi SWB Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (822, 110, N'Tourneo Custom 2.2TDCi LWB Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (823, 110, N'Tourneo Custom 2.2TDCi SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (824, 110, N'Tourneo Custom 2.2TDCi LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (825, 110, N'Tourneo 2.2TDCi MWB 12-seat', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (826, 110, N'Tourneo Custom 2.2TDCi SWB Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (827, 111, N'Transit Custom panel van 2.2TDCi 74kW SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (828, 111, N'Transit Custom panel van 2.2TDCi 92kW SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (829, 111, N'Transit Custom panel van 2.2TDCi 74kW LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (830, 111, N'Transit Custom panel van 2.2TDCi 92kW LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (831, 111, N'Transit Custom panel van 2.2TDCi 114kW SWB Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (832, 111, N'Transit 2.2TDCi 92kW MWB chassis cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (833, 111, N'Transit 2.2TDCi 92kW MWB panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (834, 111, N'Transit Custom Kombi Van 2.2TDCi SWB Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (835, 111, N'Transit Custom Kombi Van 2.2TDCi LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (836, 111, N'Transit Connect 1.0T SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (837, 111, N'Transit 2.2TDCi 92kW MWB panel van (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (838, 111, N'Transit 2.2TDCi 92kW MWB chassis cab (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (839, 111, N'Transit Connect 1.5TDCi LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (840, 111, N'Transit Custom panel van 2.2TDCi 74kW SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (841, 111, N'Transit Custom panel van 2.2TDCi 92kW SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (842, 111, N'Transit Custom panel van 2.2TDCi 74kW LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (843, 111, N'Transit Custom panel van 2.2TDCi 92kW LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (844, 111, N'Transit Custom panel van 2.2TDCi 114kW SWB Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (845, 111, N'Transit 2.2TDCi 92kW MWB chassis cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (846, 111, N'Transit 2.2TDCi 92kW MWB panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (847, 111, N'Transit Custom Kombi Van 2.2TDCi SWB Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (848, 111, N'Transit Custom Kombi Van 2.2TDCi LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (849, 111, N'Transit Connect 1.0T SWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (850, 111, N'Transit 2.2TDCi 92kW MWB panel van (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (851, 111, N'Transit 2.2TDCi 92kW MWB chassis cab (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (852, 111, N'Transit Connect 1.5TDCi LWB Ambiente', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (853, 112, N'H5 2.0VGT City', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (854, 112, N'H5 2.4L City', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (855, 113, N'Steed 5E 2.0VGT double cab Xscape', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (856, 113, N'Steed 5E 2.0VGT double cab SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (857, 113, N'Steed 5E 2.4 double cab Xscape', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (858, 113, N'Steed 5E 2.4 double cab SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (859, 113, N'Steed 5 2.2MPi double cab SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (860, 113, N'Steed 5 2.2MPi double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (861, 113, N'Steed 5 2.0VGT double cab 4x4 SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (862, 113, N'Steed 5 2.0VGT double cab SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (863, 114, N'Steed 5 2.2MPi Workhorse safety', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (864, 114, N'Steed 5 2.2MPi Workhorse', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (865, 114, N'Steed 5 2.0WGT Workhorse', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (866, 114, N'Steed 5 2.0WGT 4x4 Workhorse', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (867, 115, N'Steed 6 2.0VGT double cab SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (868, 115, N'Steed 6 2.0VGT double cab Xscape', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (869, 116, N'H1 1.5', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (870, 117, N'H2 1.5T Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (871, 117, N'H2 1.5T Luxury auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (872, 117, N'H2 1.5T City auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (873, 117, N'H2 1.5T City', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (874, 118, N'H6 2.0T City', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (875, 118, N'H6 2.0T City auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (876, 118, N'H6 2.0T Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (877, 118, N'H6 2.0T Premium auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (878, 118, N'H6 2.0T Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (879, 118, N'H6 2.0T Luxury auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (880, 118, N'H6 1.5T City', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (881, 118, N'H6 1.5T Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (882, 119, N'H9 2.0T 4WD Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (883, 120, N'Ballade 1.5 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (884, 120, N'Ballade 1.5 Trend auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (885, 120, N'Ballade 1.5 Elegance auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (886, 120, N'Ballade 1.5 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (887, 120, N'Ballade 1.5 Executive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (888, 121, N'BR-V 1.5 Comfort auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (889, 121, N'BR-V 1.5 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (890, 121, N'BR-V 1.5 Elegance auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (891, 121, N'BR-V 1.5 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (892, 121, N'BR-V 1.5 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (893, 122, N'Brio hatch 1.2 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (894, 122, N'Brio hatch 1.2 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (895, 122, N'Brio hatch 1.2 Comfort auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (896, 123, N'Brio Amaze sedan 1.2 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (897, 123, N'Brio Amaze sedan 1.2 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (898, 123, N'Brio Amaze sedan 1.2 Comfort auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (899, 124, N'Civic sedan 1.5T Sport', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (900, 124, N'Civic sedan 1.8 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (901, 124, N'Civic sedan 1.8 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (902, 124, N'Civic sedan 1.5T Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (903, 125, N'Civic Type R', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (904, 126, N'CR-V 2.0 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (905, 126, N'CR-V 2.0 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (906, 126, N'CR-V 1.5T Executive AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (907, 126, N'CR-V 1.5T Exclusive AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (908, 127, N'HR-V 1.5 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (909, 127, N'HR-V 1.8 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (910, 128, N'HR-V 1.5 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (911, 128, N'HR-V 1.8 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (912, 129, N'Jazz 1.2 Trend', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (913, 129, N'Jazz 1.2 Comfort', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (914, 129, N'Jazz 1.2 Comfort auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (915, 129, N'Jazz 1.5 Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (916, 129, N'Jazz 1.5 Elegance auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (917, 129, N'Jazz 1.5 Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (918, 130, N'Accent sedan 1.6 Glide', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (919, 130, N'Accent sedan 1.6 Glide auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (920, 130, N'Accent sedan 1.6 Fluid auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (921, 130, N'Accent sedan 1.6 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (922, 130, N'Accent sedan 1.6 Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (923, 131, N'Accent hatch 1.6 Fluid auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (924, 131, N'Accent hatch 1.6 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (925, 132, N'Creta 1.6 Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (926, 132, N'Creta 1.6 Executive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (927, 132, N'Creta 1.6D Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (928, 133, N'Elantra 1.6 Turbo Elite Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (929, 133, N'Elantra 2.0 Elite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (930, 133, N'Elantra 1.6 Executive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (931, 133, N'Elantra 1.6 Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (932, 134, N'Grand i10 1.2 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (933, 134, N'Grand i10 1.25 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (934, 134, N'Grand i10 1.0 Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (935, 134, N'Grand i10 1.2 Glide', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (936, 134, N'Grand i10 1.0 Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (937, 134, N'Grand i10 1.2 Fluid auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (938, 134, N'Grand i10 1.0 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (939, 135, N'H-100 Bakkie 2.6D deck', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (940, 135, N'H-100 Bakkie 2.6D chassis cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (941, 135, N'H-100 Bakkie 2.6D deck (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (942, 135, N'H-100 Bakkie 2.6D tipper (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (943, 135, N'H-100 Bakkie 2.6D tipper', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (944, 136, N'H-1 2.5CRDi panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (945, 136, N'H-1 2.4 bus Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (946, 136, N'H-1 2.5CRDi bus Elite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (947, 137, N'i20 1.4 Fluid auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (948, 137, N'i20 1.2 Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (949, 137, N'i20 1.4 Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (950, 137, N'i20 1.4 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (951, 137, N'i20 1.2 Fluid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (952, 137, N'i20 1.4 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (953, 138, N'Tucson 2.0 Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (954, 138, N'Tucson 1.6T Elite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (955, 138, N'Tucson 2.0D Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (956, 138, N'Tucson 2.0 Premium auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (957, 138, N'Tucson 2.0 Elite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (958, 138, N'Tucson 2.0D Elite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (959, 138, N'Tucson 2.0 Executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (960, 139, N'KB 250D-Teq double cab Hi-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (961, 139, N'KB 250D-Teq double cab X-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (962, 139, N'KB 250D-Teq double cab 4x4 Hi-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (963, 139, N'KB 250D-Teq double cab 4x4 X-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (964, 139, N'KB 250D-Teq double cab LE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (965, 139, N'KB 300D-Teq double cab LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (966, 139, N'KB 300D-Teq double cab LX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (967, 139, N'KB 300D-Teq double cab 4x4 LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (968, 139, N'KB 300D-Teq double cab 4x4 LX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (969, 139, N'KB 250D-Teq double cab X-Rider Black', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (970, 140, N'KB 250D-Teq Extended cab Hi-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (971, 140, N'KB 300D-Teq Extended cab LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (972, 140, N'KB 300D-Teq Extended cab LX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (973, 140, N'KB 300D-Teq Extended cab 4x4 LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (974, 141, N'KB 250', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (975, 141, N'KB 250 Fleetside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (976, 141, N'KB 250D-Teq Fleetside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (977, 141, N'KB 250D-Teq LE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (978, 141, N'KB 250D-Teq 4x4 Hi-Rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (979, 141, N'KB 300D-Teq LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (980, 141, N'KB 300D-Teq 4x4 LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (981, 142, N'mu-X 3.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (982, 143, N'mu-X 3.0 4WD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (983, 144, N'E-Pace P200 AWD R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (984, 144, N'E-Pace D180 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (985, 144, N'E-Pace P250 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (986, 144, N'E-Pace P250 AWD R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (987, 144, N'E-Pace D150 AWD HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (988, 144, N'E-Pace D150 AWD R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (989, 144, N'E-Pace P300 AWD HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (990, 144, N'E-Pace D240 AWD R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (991, 144, N'E-Pace P300 AWD R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (992, 144, N'E-Pace D180 AWD R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (993, 144, N'E-Pace D240 AWD HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (994, 144, N'E-Pace P200 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (995, 144, N'E-Pace P200 AWD R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (996, 144, N'E-Pace P200 AWD R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (997, 144, N'E-Pace P200 AWD SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (998, 144, N'E-Pace P200 AWD R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (999, 144, N'E-Pace P200 AWD HSE', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1000, 144, N'E-Pace P300 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1001, 144, N'E-Pace P300 AWD R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1002, 144, N'E-Pace D240 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1003, 144, N'E-Pace D240 AWD R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1004, 144, N'E-Pace P250 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1005, 144, N'E-Pace P250 AWD R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1006, 144, N'E-Pace P250 AWD SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1007, 144, N'E-Pace P250 AWD R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1008, 144, N'E-Pace P250 AWD HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1009, 144, N'E-Pace P250 AWD R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1010, 144, N'E-Pace D240 AWD R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1011, 144, N'E-Pace P300 AWD SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1012, 144, N'E-Pace D150 AWD R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1013, 144, N'E-Pace D150 AWD SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1014, 144, N'E-Pace P300 AWD R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1015, 144, N'E-Pace D180 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1016, 144, N'E-Pace D240 AWD SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1017, 144, N'E-Pace P200 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1018, 144, N'E-Pace D150 AWD R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1019, 144, N'E-Pace D180 AWD SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1020, 144, N'E-Pace D180 AWD R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1021, 144, N'E-Pace D180 AWD HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1022, 144, N'E-Pace D180 AWD R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1023, 144, N'E-Pace D150 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1024, 144, N'E-Pace D180 AWD R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1025, 144, N'E-Pace D180 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1026, 144, N'E-Pace D150 AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1027, 144, N'E-Pace D150 AWD R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1028, 145, N'F-Pace 25t R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1029, 145, N'F-Pace 25t AWD Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1030, 145, N'F-Pace 25d AWD Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1031, 145, N'F-Pace 25t AWD R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1032, 145, N'F-Pace 35t AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1033, 145, N'F-Pace 35t AWD R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1034, 145, N'F-Pace 25t Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1035, 145, N'F-Pace 35t AWD Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1036, 145, N'F-Pace 20d AWD R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1037, 145, N'F-Pace 30d AWD Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1038, 145, N'F-Pace 25d AWD R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1039, 145, N'F-Pace 20d AWD Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1040, 145, N'F-Pace 30d AWD S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1041, 145, N'F-Pace 30d AWD R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1042, 145, N'F-Pace 30t AWD Pure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1043, 145, N'F-Pace 30t AWD R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1044, 146, N'F-Type convertible P380 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1045, 146, N'F-Type convertible P380', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1046, 146, N'F-Type convertible P340 R-Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1047, 146, N'F-Type convertible P340', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1048, 146, N'F-Type convertible P300 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1049, 146, N'F-Type convertible 221kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1050, 146, N'F-Type convertible 294kW 400 Sport Special Edition AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1051, 146, N'F-Type convertible 294kW 400 Sport Special Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1052, 146, N'F-Type convertible P380 AWD R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1053, 146, N'F-Type convertible P340 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1054, 146, N'F-Type convertible P340 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1055, 146, N'F-Type SVR convertible AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1056, 146, N'F-Type convertible P380 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1057, 146, N'F-Type convertible P380 R-Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1058, 146, N'F-Type convertible P380 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1059, 146, N'F-Type R convertible AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1060, 147, N'F-Type coupe 221kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1061, 147, N'F-Type coupe P340 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1062, 147, N'F-Type coupe P380 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1063, 147, N'F-Type coupe 294kW 400 Sport Special Edition AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1064, 147, N'F-Type coupe P300 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1065, 147, N'F-Type coupe P380 R-Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1066, 147, N'F-Type coupe P340 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1067, 147, N'F-Type coupe P380 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1068, 147, N'F-Type coupe P380 AWD R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1069, 147, N'F-Type coupe 294kW 400 Sport Special Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1070, 147, N'F-Type coupe P380 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1071, 147, N'F-Type R coupe AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1072, 147, N'F-Type SVR coupe AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1073, 147, N'F-Type coupe P340 R-Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1074, 147, N'F-Type coupe P340', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1075, 147, N'F-Type coupe P380', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1076, 148, N'XE 30t Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1077, 148, N'XE 25t Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1078, 148, N'XE 25t R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1079, 148, N'XE 25t Landmark Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1080, 148, N'XE 25t Portfolio', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1081, 148, N'XE 300 Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1082, 148, N'XE S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1083, 148, N'XE 30t Portfolio', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1084, 148, N'XE 30t R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1085, 149, N'XF 30t R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1086, 149, N'XF 25t R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1087, 149, N'XF 20d Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1088, 149, N'XF 20d R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1089, 149, N'XF 25t Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1090, 149, N'XF 25t Portfolio', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1091, 149, N'XF 300 Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1092, 149, N'XF S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1093, 150, N'XJ L 3.0 Supercharged Portfolio', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1094, 150, N'XJ L 5.0 Supercharged Autobiography', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1095, 150, N'XJ 3.0D XJ50', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1096, 150, N'XJ L 3.0D XJ50', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1097, 150, N'XJ 3.0 Supercharged R-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1098, 150, N'XJ 3.0D Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1099, 150, N'XJ 3.0D Premium Luxury', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1100, 150, N'XJ L 3.0D Premium Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1101, 151, N'XJR575', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1102, 152, N'Cherokee 2.4L Longitude', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1103, 153, N'Cherokee 3.2L Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1104, 153, N'Cherokee 3.2L 4x4 Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1105, 153, N'Cherokee 3.2L 4x4 Limited 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1106, 153, N'Cherokee 3.2L Limited 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1107, 154, N'Cherokee 3.2L 4x4 Trailhawk', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1108, 155, N'Grand Cherokee 3.6L Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1109, 155, N'Grand Cherokee 5.7L Overland', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1110, 155, N'Grand Cherokee 3.6L Overland', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1111, 155, N'Grand Cherokee 3.0CRD Overland', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1112, 155, N'Grand Cherokee 3.0CRD Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1113, 155, N'Grand Cherokee 3.0CRD Summit', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1114, 155, N'Grand Cherokee 3.0CRD Limited 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1115, 155, N'Grand Cherokee 3.6L Summit', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1116, 155, N'Grand Cherokee 3.0CRD Laredo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1117, 155, N'Grand Cherokee 3.6L Limited 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1118, 155, N'Grand Cherokee 3.6L Laredo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1119, 156, N'Grand Cherokee SRT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1120, 157, N'Renegade 1.4L T Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1121, 157, N'Renegade 1.4L T 4x4 Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1122, 157, N'Renegade 2.4L 4x4 Trailhawk', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1123, 157, N'Renegade 1.6L Multijet Limited', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1124, 157, N'Renegade 1.6L Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1125, 157, N'Renegade 1.6L Longitude', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1126, 157, N'Renegade 1.4L T Limited auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1127, 157, N'Renegade 1.4L T 4x4 Limited 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1128, 158, N'Wrangler 3.6L Rubicon', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1129, 159, N'Wrangler 3.6L Sahara', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1130, 160, N'Wrangler Unlimited 3.6L Rubicon', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1131, 160, N'Wrangler Unlimited 3.6L Sahara', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1132, 160, N'Wrangler Unlimited 2.8CRD Sahara', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1133, 160, N'Wrangler Unlimited Sahara 3.6L 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1134, 160, N'Wrangler Unlimited Sahara 2.8CRD 75th Anniversary Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1135, 161, N'Boarding 2.8TD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1136, 161, N'Boarding 2.8TD Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1137, 161, N'Boarding 2.8TDCi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1138, 161, N'Boarding 2.8TDCi Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1139, 162, N'Landwind 5 2.0T Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1140, 162, N'Landwind 5 2.0T Lux auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1141, 162, N'Landwind 5 2.0T Flagship auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1142, 163, N'Vigus 2.4TDCi double cab 4WD LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1143, 163, N'Vigus 2.4 double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1144, 163, N'Vigus 2.4 double cab LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1145, 163, N'Vigus 2.4TDCi double cab LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1146, 163, N'Vigus 2.4TDCi double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1147, 163, N'Vigus 2.4TDCi double cab 4WD SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1148, 164, N'Cerato hatch 1.6 EX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1149, 164, N'Cerato hatch 1.6 SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1150, 164, N'Cerato hatch 1.6 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1151, 164, N'Cerato hatch 2.0 EX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1152, 164, N'Cerato hatch 2.0 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1153, 165, N'Cerato sedan 1.6 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1154, 165, N'Cerato sedan 1.6 SX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1155, 165, N'Cerato sedan 1.6 EX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1156, 165, N'Cerato sedan 2.0 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1157, 165, N'Cerato sedan 2.0 EX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1158, 166, N'Grand Sedona 2.2CRDi EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1159, 166, N'Grand Sedona 2.2CRDi EX 11-seat', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1160, 166, N'Grand Sedona 2.2CRDi SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1161, 166, N'Grand Sedona 3.3 V6 SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1162, 166, N'Grand Sedona 3.3 V6 SXL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1163, 166, N'Grand Sedona 2.2CRDi SXL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1164, 166, N'Grand Sedona 3.3 V6 SXL 11-seat', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1165, 167, N'K2700 2.7D workhorse chassis cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1166, 167, N'K2700 2.7D workhorse dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1167, 167, N'K2700 2.7D workhorse dropside (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1168, 167, N'K2700 2.7D workhorse dropside Sebenza', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1169, 167, N'K2700 2.7D workhorse dropside Sebenza 2', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1170, 167, N'K2700 2.7D workhorse tipper', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1171, 167, N'K2500 workhorse dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1172, 167, N'K2500 workhorse dropside (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1173, 167, N'K2500 tipper', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1174, 168, N'Picanto 1.2 Start auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1175, 168, N'Picanto 1.2 Style auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1176, 168, N'Picanto 1.0 Style auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1177, 168, N'Picanto 1.0 Smart', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1178, 168, N'Picanto 1.2 Start', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1179, 168, N'Picanto 1.2 Smart', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1180, 168, N'Picanto 1.0 Style', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1181, 168, N'Picanto 1.0 Start', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1182, 168, N'Picanto 1.2 Street', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1183, 168, N'Picanto 1.2 Style', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1184, 168, N'Picanto 1.0 Street', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1185, 168, N'Picanto 1.2 Smart auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1186, 168, N'Picanto 1.0 Start auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1187, 169, N'Rio hatch 1.4 Tec auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1188, 169, N'Rio hatch 1.2 LS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1189, 169, N'Rio hatch 1.4 LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1190, 169, N'Rio hatch 1.4 LX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1191, 169, N'Rio hatch 1.4 Tec', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1192, 169, N'Rio hatch 1.4 EX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1193, 169, N'Rio hatch 1.4 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1194, 170, N'Rio sedan 1.2', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1195, 170, N'Rio sedan 1.4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1196, 170, N'Rio sedan 1.4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1197, 170, N'Rio sedan 1.4 Tec', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1198, 170, N'Rio sedan 1.4 Tec auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1199, 170, N'Rio sedan 1.2', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1200, 170, N'Rio sedan 1.4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1201, 170, N'Rio sedan 1.4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1202, 170, N'Rio sedan 1.4 Tec', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1203, 170, N'Rio sedan 1.4 Tec auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1204, 171, N'Sorento 2.4 LS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1205, 171, N'Sorento 2.2CRDi LX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1206, 171, N'Sorento 2.2CRDi AWD EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1207, 171, N'Sorento 2.2CRDi AWD SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1208, 171, N'Sorento 2.2CRDi AWD SXL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1209, 171, N'Sorento 2.2CRDi LS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1210, 172, N'Soul 1.6CRDi Start', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1211, 172, N'Soul 2.0 Street', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1212, 172, N'Soul 1.6 Start auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1213, 172, N'Soul 1.6 Start', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1214, 172, N'Soul 1.6CRDi Street', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1215, 172, N'Soul 2.0 Smart auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1216, 172, N'Soul 1.6CRDi Smart auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1217, 173, N'Sportage 2.0CRDi EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1218, 173, N'Sportage 1.6T GT-Line AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1219, 173, N'Sportage 2.0CRDi SX AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1220, 173, N'Sportage 2.0 Ignite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1221, 173, N'Sportage 2.4GDI SX AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1222, 173, N'Sportage 2.0 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1223, 173, N'Sportage 1.7CRDi Ignite Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1224, 173, N'Sportage 2.0 Ignite Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1225, 173, N'Sportage 2.0 Ignite auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1226, 173, N'Sportage 2.0 Ignite Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1227, 173, N'Sportage 2.0 EX Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1228, 173, N'Sportage 2.0CRDi EX Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1229, 174, N'Stinger 3.3T GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1230, 175, N'Aventador LP740-4 S Roadster', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1231, 175, N'Aventador LP740-4 S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1232, 176, N'Huracan LP580-2 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1233, 176, N'Huracan LP610-4 Avio coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1234, 176, N'Huracan LP610-4 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1235, 176, N'Huracan LP610-4 Spyder', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1236, 176, N'Huracan LP640-4 Performante coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1237, 176, N'Huracan LP580-2 Spyder', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1238, 177, N'Discovery SE Si6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1239, 177, N'Discovery SE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1240, 177, N'Discovery SE Td6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1241, 177, N'Discovery HSE Luxury Td6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1242, 177, N'Discovery S Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1243, 177, N'Discovery HSE Td6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1244, 177, N'Discovery S Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1245, 177, N'Discovery HSE Luxury Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1246, 177, N'Discovery SE Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1247, 177, N'Discovery HSE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1248, 177, N'Discovery HSE Luxury Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1249, 177, N'Discovery HSE Luxury Si6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1250, 177, N'Discovery HSE Si6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1251, 177, N'Discovery S Td6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1252, 177, N'Discovery S Si6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1253, 177, N'Discovery HSE Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1254, 178, N'Discovery Sport Pure Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1255, 178, N'Discovery Sport HSE Si4 213kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1256, 178, N'Discovery Sport HSE Luxury Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1257, 178, N'Discovery Sport HSE TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1258, 178, N'Discovery Sport HSE Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1259, 178, N'Discovery Sport Pure TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1260, 178, N'Discovery Sport SE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1261, 178, N'Discovery Sport SE TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1262, 178, N'Discovery Sport SE Si4 213kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1263, 178, N'Discovery Sport SE Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1264, 178, N'Discovery Sport HSE Luxury TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1265, 178, N'Discovery Sport HSE Luxury Si4 213kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1266, 178, N'Discovery Sport HSE Luxury Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1267, 178, N'Discovery Sport HSE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1268, 179, N'Range Rover L SVAutobiography Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1269, 179, N'Range Rover L Autobiography Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1270, 179, N'Range Rover SVAutobiography Dynamic Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1271, 179, N'Range Rover L SVAutobiography SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1272, 179, N'Range Rover Autobiography P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1273, 179, N'Range Rover Vogue SE P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1274, 179, N'Range Rover Autobiography SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1275, 179, N'Range Rover L Autobiography P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1276, 179, N'Range Rover L SVAutobiography P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1277, 179, N'Range Rover Autobiography Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1278, 179, N'Range Rover Vogue TDV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1279, 179, N'Range Rover L Vogue SE P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1280, 179, N'Range Rover Vogue P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1281, 179, N'Range Rover Vogue SE SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1282, 179, N'Range Rover L Autobiography SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1283, 179, N'Range Rover L Vogue SE SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1284, 179, N'Range Rover Vogue SE Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1285, 179, N'Range Rover L Vogue SE Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1286, 180, N'Range Rover Evoque HSE Dynamic Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1287, 180, N'Range Rover Evoque HSE Dynamic TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1288, 180, N'Range Rover Evoque SE Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1289, 180, N'Range Rover Evoque SE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1290, 180, N'Range Rover Evoque HSE Dynamic Si4 213kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1291, 180, N'Range Rover Evoque SE Dynamic TD4 Landmark Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1292, 180, N'Range Rover Evoque SE TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1293, 180, N'Range Rover Evoque HSE Dynamic Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1294, 180, N'Range Rover Evoque Autobiography Sd4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1295, 180, N'Range Rover Evoque Autobiography Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1296, 180, N'Range Rover Evoque Autobiography TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1297, 180, N'Range Rover Evoque Autobiography Si4 213kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1298, 181, N'Range Rover Evoque convertible HSE Dynamic Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1299, 182, N'Range Rover Evoque coupe HSE Dynamic Sd4', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1300, 182, N'Range Rover Evoque coupe HSE Dynamic Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1301, 182, N'Range Rover Evoque coupe HSE Dynamic TD4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1302, 182, N'Range Rover Evoque coupe HSE Dynamic Si4 213kW', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1303, 183, N'Range Rover Sport Autobiography Dynamic SCV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1304, 183, N'Range Rover Sport HSE Dynamic Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1305, 183, N'Range Rover Sport Autobiography Dynamic Supercharged', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1306, 183, N'Range Rover Sport SE TDV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1307, 183, N'Range Rover Sport HSE SDV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1308, 183, N'Range Rover Sport SE SCV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1309, 183, N'Range Rover Sport SE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1310, 183, N'Range Rover Sport Autobiography Dynamic SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1311, 183, N'Range Rover Sport S Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1312, 183, N'Range Rover Sport HSE SCV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1313, 183, N'Range Rover Sport HSE Dynamic SDV8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1314, 183, N'Range Rover Sport Autobiography Dynamic P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1315, 183, N'Range Rover Sport SVR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1316, 183, N'Range Rover Sport S TDV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1317, 183, N'Range Rover Sport HSE Dynamic P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1318, 183, N'Range Rover Sport HSE TDV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1319, 183, N'Range Rover Sport S SCV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1320, 183, N'Range Rover Sport SE SDV6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1321, 183, N'Range Rover Sport HSE P400e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1322, 183, N'Range Rover Sport HSE Si4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1323, 184, N'Range Rover Velar D275 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1324, 184, N'Range Rover Velar D240 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1325, 184, N'Range Rover Velar P380 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1326, 184, N'Range Rover Velar P300 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1327, 184, N'Range Rover Velar D300 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1328, 184, N'Range Rover Velar P300 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1329, 184, N'Range Rover Velar D275 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1330, 184, N'Range Rover Velar D275', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1331, 184, N'Range Rover Velar P380', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1332, 184, N'Range Rover Velar D240 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1333, 184, N'Range Rover Velar P380 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1334, 184, N'Range Rover Velar P340 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1335, 184, N'Range Rover Velar D240 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1336, 184, N'Range Rover Velar P250 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1337, 184, N'Range Rover Velar P250 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1338, 184, N'Range Rover Velar D240', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1339, 184, N'Range Rover Velar P340', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1340, 184, N'Range Rover Velar P300 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1341, 184, N'Range Rover Velar P340 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1342, 184, N'Range Rover Velar D300 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1343, 184, N'Range Rover Velar D300 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1344, 184, N'Range Rover Velar D300 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1345, 184, N'Range Rover Velar D300 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1346, 184, N'Range Rover Velar P300 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1347, 184, N'Range Rover Velar D275 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1348, 184, N'Range Rover Velar D275 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1349, 184, N'Range Rover Velar D180 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1350, 184, N'Range Rover Velar D275 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1351, 184, N'Range Rover Velar P340 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1352, 184, N'Range Rover Velar P300 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1353, 184, N'Range Rover Velar P380 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1354, 184, N'Range Rover Velar P380 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1355, 184, N'Range Rover Velar P340 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1356, 184, N'Range Rover Velar P250', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1357, 184, N'Range Rover Velar P380 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1358, 184, N'Range Rover Velar D180', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1359, 184, N'Range Rover Velar D240 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1360, 184, N'Range Rover Velar D300 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1361, 184, N'Range Rover Velar D300', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1362, 184, N'Range Rover Velar P250 HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1363, 184, N'Range Rover Velar P380 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1364, 184, N'Range Rover Velar D180 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1365, 184, N'Range Rover Velar P250 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1366, 184, N'Range Rover Velar P250 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1367, 184, N'Range Rover Velar D240 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1368, 184, N'Range Rover Velar P300 R-Dynamic SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1369, 184, N'Range Rover Velar P340 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1370, 184, N'Range Rover Velar D300 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1371, 184, N'Range Rover Velar P380 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1372, 184, N'Range Rover Velar D275 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1373, 184, N'Range Rover Velar D275 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1374, 184, N'Range Rover Velar P340 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1375, 184, N'Range Rover Velar P300 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1376, 184, N'Range Rover Velar P300', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1377, 184, N'Range Rover Velar P340 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1378, 184, N'Range Rover Velar D180 R-Dynamic S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1379, 184, N'Range Rover Velar D240 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1380, 184, N'Range Rover Velar D180 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1381, 184, N'Range Rover Velar D240 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1382, 184, N'Range Rover Velar P250 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1383, 184, N'Range Rover Velar D180 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1384, 184, N'Range Rover Velar D180 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1385, 184, N'Range Rover Velar P250 R-Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1386, 184, N'Range Rover Velar D180 R-Dynamic HSE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1387, 185, N'CT 200h S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1388, 186, N'ES 250 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1389, 186, N'ES 300h EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1390, 187, N'GS 300 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1391, 188, N'GS 350 F-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1392, 189, N'IS 300 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1393, 189, N'IS 300 E', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1394, 189, N'IS 350 F-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1395, 190, N'LC 500', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1396, 190, N'LC 500 LC Limited Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1397, 191, N'LS 500', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1398, 192, N'LX 450d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1399, 192, N'LX 570', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1400, 193, N'NX 300h EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1401, 193, N'NX 300 E', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1402, 193, N'NX 300 F-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1403, 193, N'NX 300 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1404, 194, N'RC 300 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1405, 194, N'RC 350 F-Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1406, 195, N'RX 350 EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1407, 195, N'RX 350L EX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1408, 196, N'RX 450h SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1409, 196, N'RX 450h SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1410, 197, N'Bolero 2.5TD double cab 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1411, 197, N'Bolero 2.5TD double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1412, 197, N'Bolero 2.5TD double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1413, 197, N'Bolero 2.5TD double cab 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1414, 198, N'Bolero 2.5TD dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1415, 198, N'Bolero 2.5TD Loader', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1416, 198, N'Bolero 2.5TD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1417, 198, N'Bolero 2.5TD 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1418, 198, N'Bolero 2.5Di Maxitruck Plus Contractor', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1419, 198, N'Bolero 2.5Di Maxitruck Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1420, 198, N'Bolero 2.5Di Maxitruck Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1421, 198, N'Bolero 2.5Di Maxitruck Plus Contractor', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1422, 198, N'Bolero 2.5TD Loader', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1423, 198, N'Bolero 2.5TD dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1424, 198, N'Bolero 2.5TD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1425, 198, N'Bolero 2.5TD 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1426, 199, N'Genio 2.2CRDe dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1427, 199, N'Genio 2.2CRDe dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1428, 199, N'Genio 2.2CRDe Long dropside', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1429, 200, N'Genio 2.2CRDe flatbed', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1430, 200, N'Genio 2.2CRDe flatbed', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1431, 201, N'Genio 2.2CRDe Maxivan', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1432, 201, N'Genio 2.2CRDe Maxivan', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1433, 202, N'Genio 2.2CRDe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1434, 202, N'Genio 2.2CRDe single cab Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1435, 202, N'Genio 2.2CRDe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1436, 202, N'Genio 2.2CRDe Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1437, 203, N'KUV100 Nxt 1.2 G80 K4+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1438, 203, N'KUV100 Nxt 1.2 G80 K6+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1439, 203, N'KUV100 Nxt 1.2 G80 K8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1440, 203, N'KUV100 Nxt 1.2 D75 K6+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1441, 203, N'KUV100 Nxt 1.2 D75 K8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1442, 204, N'Pik Up 2.2CRDe 4x4 S6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1443, 204, N'Pik Up 2.2CRDe S6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1444, 204, N'Pik Up 2.2CRDe S4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1445, 205, N'Pik Up 2.2CRDe double cab S10', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1446, 205, N'Pik Up 2.2CRDe double cab 4x4 S10', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1447, 206, N'Scorpio 2.2CRDe S11', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1448, 206, N'Scorpio 2.2CRDe S11 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1449, 207, N'Thar 2.5CRDe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1450, 208, N'TUV300 1.5CRDe T8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1451, 209, N'XUV500 2.2CRDe W6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1452, 209, N'XUV500 2.2CRDe W8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1453, 209, N'XUV500 2.2CRDe W8 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1454, 209, N'XUV500 2.2CRDe W8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1455, 209, N'XUV500 2.2CRDe W8 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1456, 209, N'XUV500 2.2CRDe W6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1457, 209, N'XUV500 2.2CRDe W6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1458, 209, N'XUV500 2.2CRDe W8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1459, 209, N'XUV500 2.2CRDe W8 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1460, 209, N'XUV500 2.2CRDe W8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1461, 209, N'XUV500 2.2CRDe W8 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1462, 209, N'XUV500 2.2CRDe W6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1463, 209, N'XUV500 2.2CRDe W4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1464, 209, N'XUV500 2.2CRDe W6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1465, 209, N'XUV500 2.2CRDe W8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1466, 209, N'XUV500 2.2CRDe W4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1467, 209, N'XUV500 2.2CRDe W8 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1468, 209, N'XUV500 2.2CRDe W8 AWD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1469, 209, N'XUV500 2.2CRDe W8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1470, 209, N'XUV500 2.2CRDe W6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1471, 209, N'XUV500 2.2CRDe W4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1472, 209, N'XUV500 2.2CRDe W8 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1473, 210, N'Ghibli 350', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1474, 210, N'Ghibli Diesel', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1475, 210, N'Ghibli S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1476, 211, N'Levante Diesel', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1477, 211, N'Levante S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1478, 212, N'Quattroporte GTS GranSport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1479, 212, N'Quattroporte Diesel GranLusso', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1480, 213, N'Quattroporte 330', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1481, 213, N'Quattroporte S GranSport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1482, 214, N'Mazda2 1.5 Individual auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1483, 214, N'Mazda2 1.5DE Hazumi auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1484, 214, N'Mazda2 1.5 Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1485, 214, N'Mazda2 1.5 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1486, 214, N'Mazda2 1.5 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1487, 214, N'Mazda2 1.5 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1488, 214, N'Mazda2 1.5 Individual Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1489, 215, N'Mazda3 hatch 1.6 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1490, 215, N'Mazda3 hatch 2.0 Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1491, 215, N'Mazda3 hatch 2.0 Astina', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1492, 215, N'Mazda3 hatch 1.6 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1493, 215, N'Mazda3 hatch 1.6 Original', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1494, 215, N'Mazda3 hatch 1.6 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1495, 215, N'Mazda3 hatch 2.0 Individual auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1496, 215, N'Mazda3 hatch 1.6 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1497, 215, N'Mazda3 hatch 2.0 Individual auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1498, 215, N'Mazda3 hatch 1.6 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1499, 215, N'Mazda3 hatch 2.0 Individual', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1500, 215, N'Mazda3 hatch 1.6 Original', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1501, 215, N'Mazda3 hatch 1.6 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1502, 215, N'Mazda3 hatch 2.0 Astina', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1503, 215, N'Mazda3 hatch 2.0 Astina Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1504, 216, N'Mazda3 sedan 2.0 Astina', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1505, 216, N'Mazda3 sedan 2.0 Individual auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1506, 216, N'Mazda3 sedan 1.6 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1507, 216, N'Mazda3 sedan 1.6 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1508, 216, N'Mazda3 sedan 1.6 Original', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1509, 216, N'Mazda3 sedan 1.6 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1510, 216, N'Mazda3 sedan 2.0 Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1511, 216, N'Mazda3 sedan 1.6 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1512, 216, N'Mazda3 sedan 1.6 Original', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1513, 216, N'Mazda3 sedan 1.6 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1514, 216, N'Mazda3 sedan 1.6 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1515, 216, N'Mazda3 sedan 2.0 Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1516, 216, N'Mazda3 sedan 2.0 Individual auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1517, 216, N'Mazda3 sedan 2.0 Astina Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1518, 216, N'Mazda3 sedan 2.0 Astina', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1519, 217, N'BT-50 2.5 double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1520, 217, N'BT-50 2.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1521, 217, N'BT-50 2.2 double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1522, 217, N'BT-50 2.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1523, 217, N'BT-50 3.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1524, 217, N'BT-50 3.2 double cab SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1525, 217, N'BT-50 3.2 double cab 4x4 SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1526, 217, N'BT-50 3.2 double cab 4x4 SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1527, 217, N'BT-50 3.2 double cab SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1528, 217, N'BT-50 3.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1529, 217, N'BT-50 2.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1530, 217, N'BT-50 3.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1531, 217, N'BT-50 3.2 double cab SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1532, 217, N'BT-50 3.2 double cab 4x4 SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1533, 217, N'BT-50 3.2 double cab 4x4 SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1534, 217, N'BT-50 2.5 double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1535, 217, N'BT-50 2.2 double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1536, 217, N'BT-50 2.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1537, 217, N'BT-50 3.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1538, 217, N'BT-50 3.2 double cab SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1539, 217, N'BT-50 2.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1540, 217, N'BT-50 3.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1541, 217, N'BT-50 3.2 double cab SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1542, 217, N'BT-50 3.2 double cab 4x4 SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1543, 217, N'BT-50 3.2 double cab 4x4 SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1544, 217, N'BT-50 2500D double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1545, 217, N'BT-50 2.2 double cab SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1546, 217, N'BT-50 3.2 double cab 4x4 SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1547, 217, N'BT-50 3.2 double cab 4x4 SLE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1548, 217, N'BT-50 2.2 double cab SLE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1549, 217, N'BT-50 2.2 double cab SLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1550, 218, N'CX-3 2.0 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1551, 218, N'CX-3 2.0 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1552, 218, N'CX-3 2.0 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1553, 218, N'CX-3 2.0 Individual auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1554, 218, N'CX-3 2.0 Active auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1555, 218, N'CX-3 2.0 Individual Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1556, 219, N'CX-5 2.0 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1557, 219, N'CX-5 2.0 Dynamic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1558, 219, N'CX-5 2.0 Active auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1559, 219, N'CX-5 2.0 Dynamic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1560, 219, N'CX-5 2.2DE AWD Akera', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1561, 219, N'CX-5 2.0 Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1562, 219, N'CX-5 2.2DE Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1563, 219, N'CX-5 2.5 AWD Individual', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1564, 220, N'MX-5 2.0 Roadster Coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1565, 220, N'MX-5 2.0 RF auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1566, 221, N'570S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1567, 221, N'570GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1568, 222, N'720S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1569, 223, N'A45 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1570, 223, N'A45 4Matic Yellow Night Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1571, 224, N'C63', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1572, 224, N'C63 cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1573, 224, N'C63 S cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1574, 224, N'C63 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1575, 224, N'C63 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1576, 224, N'C43 coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1577, 224, N'C63 S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1578, 224, N'C43 cabriolet 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1579, 224, N'C43 coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1580, 225, N'CLA45 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1581, 225, N'CLA45 4Matic Yellow Night Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1582, 226, N'CLS63 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1583, 227, N'E43 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1584, 227, N'E63 S 4Matic+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1585, 228, N'G63', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1586, 228, N'G63 Edition 463', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1587, 229, N'GLA45 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1588, 229, N'GLA45 4Matic Yellow Night Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1589, 230, N'GLC43 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1590, 230, N'GLC43 coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1591, 230, N'GLC63 S coupe 4Matic+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1592, 230, N'GLC63 S 4Matic+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1593, 230, N'GLC63 S coupe 4Matic+ Edition 1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1594, 230, N'GLC63 S 4Matic+ Edition 1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1595, 231, N'GLE63 S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1596, 231, N'GLE43', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1597, 231, N'GLE43 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1598, 231, N'GLE63', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1599, 231, N'GLE63 S', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1600, 232, N'GLS63', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1601, 233, N'GT S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1602, 233, N'GT C roadster', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1603, 233, N'GT R coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1604, 233, N'GT roadster', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1605, 233, N'GT coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1606, 233, N'GT C roadster GT Edition 50', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1607, 234, N'S65 L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1608, 234, N'S63 L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1609, 234, N'S63 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1610, 234, N'S65 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1611, 234, N'S63 cabriolet 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1612, 234, N'S65 cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1613, 235, N'SL63', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1614, 235, N'SL65', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1615, 236, N'SLC43', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1616, 223, N'A200 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1617, 223, N'A250 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1618, 223, N'A200 Style', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1619, 238, N'B200d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1620, 238, N'B220d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1621, 238, N'B200', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1622, 238, N'B250 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1623, 238, N'B200 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1624, 238, N'B200d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1625, 239, N'C220d cabriolet AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1626, 239, N'C200 cabriolet AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1627, 239, N'C300 cabriolet AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1628, 240, N'C200 coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1629, 240, N'C220d coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1630, 240, N'C300 coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1631, 241, N'C180 estate Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1632, 241, N'C200 estate Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1633, 241, N'C180 estate Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1634, 241, N'C180 estate', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1635, 241, N'C200 estate AMG Sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1636, 241, N'C180 estate AMG Sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1637, 241, N'C200 estate Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1638, 241, N'C180 estate Exclusive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1639, 241, N'C200 estate Exclusive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1640, 241, N'C180 estate Avantgarde auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1641, 241, N'C180 estate auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1642, 241, N'C200 estate AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1643, 241, N'C180 estate AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1644, 241, N'C200 estate Avantgarde auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1645, 241, N'C200 estate', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1646, 241, N'C200 estate auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1647, 241, N'C250d estate Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1648, 241, N'C250d estate AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1649, 241, N'C250d estate Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1650, 242, N'C250d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1651, 242, N'C250 Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1652, 242, N'C250d Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1653, 242, N'C250d Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1654, 242, N'C250 Edition C', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1655, 242, N'C250d Edition C', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1656, 242, N'C300 Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1657, 242, N'C300 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1658, 242, N'C220d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1659, 242, N'C43 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1660, 242, N'C180 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1661, 242, N'C180', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1662, 242, N'C220d Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1663, 242, N'C200 Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1664, 242, N'C220d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1665, 242, N'C180 Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1666, 242, N'C200 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1667, 242, N'C200', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1668, 225, N'CLA200 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1669, 225, N'CLA200d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1670, 225, N'CLA200d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1671, 225, N'CLA200d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1672, 225, N'CLA200d AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1673, 225, N'CLA220d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1674, 225, N'CLA250 Sport 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1675, 225, N'CLA200 AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1676, 225, N'CLA220d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1677, 225, N'CLA200 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1678, 225, N'CLA200', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1679, 244, N'CLS500 AMG', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1680, 244, N'CLS400', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1681, 244, N'CLS250d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1682, 244, N'CLS350d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1683, 245, N'E500 cabriolet AMG Sports', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1684, 245, N'E500 cabriolet V8 Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1685, 245, N'E220d cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1686, 245, N'E220d cabriolet AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1687, 245, N'E300 cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1688, 245, N'E300 cabriolet AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1689, 245, N'E400 cabriolet 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1690, 245, N'E400 cabriolet AMG Line 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1691, 246, N'E400 coupe Edition 1 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1692, 246, N'E300 coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1693, 246, N'E400 coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1694, 246, N'E400 coupe AMG Line 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1695, 246, N'E300 coupe Edition 1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1696, 246, N'E220d coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1697, 246, N'E220d coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1698, 246, N'E200 coupe Edition 1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1699, 246, N'E200 coupe', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1700, 246, N'E200 coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1701, 246, N'E220d coupe Edition 1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1702, 246, N'E300 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1703, 247, N'E250 Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1704, 247, N'E200', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1705, 247, N'E200 Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1706, 247, N'E200 Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1707, 247, N'E200 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1708, 247, N'E220d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1709, 247, N'E220d Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1710, 247, N'E220d Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1711, 247, N'E220d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1712, 247, N'E350d Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1713, 247, N'E350d Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1714, 247, N'E350d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1715, 247, N'E250 Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1716, 247, N'E-Class E400 Exclusive 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1717, 247, N'E250', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1718, 247, N'E-Class E400 Avantgarde 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1719, 247, N'E250 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1720, 247, N'E-Class E400 AMG Line 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1721, 248, N'G350d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1722, 248, N'G350d designo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1723, 229, N'GLA220d 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1724, 229, N'GLA200d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1725, 229, N'GLA220d 4Matic Style', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1726, 229, N'GLA200', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1727, 229, N'GLA200 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1728, 229, N'GLA200 AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1729, 229, N'GLA250 4Matic Style', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1730, 229, N'GLA200 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1731, 229, N'GLA200d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1732, 229, N'GLA200d AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1733, 229, N'GLA200d AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1734, 229, N'GLA250 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1735, 250, N'GLC250 coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1736, 250, N'GLC220d coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1737, 250, N'GLC220d coupe 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1738, 250, N'GLC250 coupe 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1739, 250, N'GLC250d coupe 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1740, 250, N'GLC250d coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1741, 250, N'GLC300 coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1742, 250, N'GLC350d coupe 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1743, 250, N'GLC300 coupe 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1744, 250, N'GLC350d coupe 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1745, 251, N'GLC220d 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1746, 251, N'GLC250d 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1747, 251, N'GLC300 4Matic Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1748, 251, N'GLC300 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1749, 251, N'GLC250 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1750, 251, N'GLC250 4Matic Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1751, 251, N'GLC250 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1752, 251, N'GLC250d 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1753, 251, N'GLC250d 4Matic Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1754, 251, N'GLC300 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1755, 251, N'GLC220d 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1756, 251, N'GLC220d 4Matic Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1757, 251, N'GLC350d 4Matic AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1758, 251, N'GLC350d 4Matic Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1759, 251, N'GLC350d 4Matic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1760, 231, N'GLE350d coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1761, 231, N'GLE350d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1762, 231, N'GLE400', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1763, 231, N'GLE500', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1764, 231, N'GLE250d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1765, 231, N'GLE500e', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1766, 231, N'GLE500 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1767, 232, N'GLS350d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1768, 232, N'GLS500', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1769, 234, N'S600 L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1770, 234, N'S560 L AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1771, 234, N'S560 L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1772, 234, N'S450 L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1773, 234, N'S350d L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1774, 234, N'S350d L AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1775, 234, N'S400d L AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1776, 234, N'S600 L AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1777, 234, N'S400d L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1778, 234, N'S450 L AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1779, 255, N'S560 cabriolet AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1780, 255, N'S560 cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1781, 255, N'S560 cabriolet Exclusive Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1782, 256, N'S560 coupe Exclusive Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1783, 256, N'S560 coupe AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1784, 256, N'S560 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1785, 257, N'SL400 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1786, 257, N'SL500 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1787, 236, N'SLC200 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1788, 236, N'SLC300 AMG Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1789, 236, N'SLC200 AMG Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1790, 236, N'SLC300 RedArt Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1791, 236, N'SLC200 RedArt Edition auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1792, 236, N'SLC200 RedArt Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1793, 259, N'V200d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1794, 259, N'V220d auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1795, 259, N'V250d', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1796, 259, N'V220d Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1797, 259, N'V250d Avantgarde', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1798, 260, N'Vito 111 CDI Mixto crewcab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1799, 260, N'Vito 116 CDI Mixto crewcab', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1800, 260, N'Vito 116 CDI Mixto crewcab auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1801, 261, N'Vito 111 CDI panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1802, 261, N'Vito 114 CDI panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1803, 261, N'Vito 114 CDI panel van auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1804, 261, N'Vito 116 CDI panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1805, 261, N'Vito 116 CDI panel van auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1806, 262, N'Vito 119 CDI Tourer Select auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1807, 262, N'Vito 116 CDI Tourer Select', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1808, 262, N'Vito 116 CDI Tourer Select auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1809, 262, N'Vito 111 CDI Tourer Pro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1810, 262, N'Vito 114 CDI Tourer Pro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1811, 262, N'Vito 116 CDI Tourer Pro', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1812, 262, N'Vito 116 CDI Tourer Pro auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1813, 262, N'Vito 114 CDI Tourer Pro auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1814, 263, N'X220d double cab Progressive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1815, 263, N'X250d double cab Progressive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1816, 263, N'X250d double cab 4Matic Progressive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1817, 263, N'X250d double cab 4Matic Power', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1818, 263, N'X250d double cab 4Matic Progressive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1819, 263, N'X250d double cab 4Matic Power auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1820, 234, N'S560', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1821, 234, N'S650', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1822, 265, N'Cooper Clubman auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1823, 265, N'Cooper S Clubman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1824, 265, N'Cooper S Clubman auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1825, 265, N'Cooper S Clubman sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1826, 266, N'Cooper S Hatch 3-door sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1827, 266, N'Cooper Hatch 3-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1828, 266, N'Cooper S Hatch 3-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1829, 266, N'Cooper S Hatch 3-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1830, 266, N'Cooper Hatch 3-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1831, 267, N'Cooper S Hatch 5-door sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1832, 267, N'Cooper Hatch 5-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1833, 267, N'Cooper Hatch 5-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1834, 267, N'Cooper S Hatch 5-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1835, 267, N'Cooper S Hatch 5-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1836, 268, N'Cooper Convertible auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1837, 268, N'Cooper Convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1838, 268, N'Cooper S Convertible auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1839, 268, N'Cooper S Convertible', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1840, 268, N'Cooper S Convertible sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1841, 269, N'Cooper S Countryman auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1842, 269, N'Cooper S Countryman sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1843, 269, N'Cooper S Countryman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1844, 269, N'Cooper Countryman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1845, 269, N'Cooper Countryman auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1846, 269, N'Cooper D Countryman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1847, 269, N'Cooper D Countryman auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1848, 270, N'One Hatch 5-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1849, 270, N'One Hatch 5-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1850, 270, N'One Hatch 3-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1851, 270, N'One Hatch 3-door auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1852, 271, N'1499 GT ', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1853, 272, N'John Cooper Works ALL4 Clubman sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1854, 272, N'John Cooper Works ALL4 Clubman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1855, 272, N'John Cooper Works ALL4 Countryman sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1856, 272, N'John Cooper Works ALL4 Countryman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1857, 272, N'John Cooper Works Hatch 3-door', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1858, 272, N'John Cooper Works Hatch 3-door sports-auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1859, 273, N'ASX 2.0 GLS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1860, 273, N'ASX 2.0 GLS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1861, 273, N'ASX 2.0 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1862, 273, N'ASX 2.0 GL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1863, 273, N'ASX 2.0 GLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1864, 273, N'ASX 2.0 GLS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1865, 274, N'Outlander 2.4 GLS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1866, 275, N'Pajero 3-door 3.2DI-D GLS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1867, 275, N'Pajero 3-door 3.2DI-D GLS Legend II', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1868, 276, N'Pajero 5-door 3.2DI-D GLS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1869, 276, N'Pajero 5-door 3.2DI-D GLS Exceed', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1870, 276, N'Pajero 5-door 3.2DI-D GLS Legend II', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1871, 277, N'Pajero Sport 2.4 D4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1872, 277, N'Pajero Sport 2.4 D4 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1873, 278, N'Triton 2.5DI-D 4x4 double cab Xtreme', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1874, 278, N'Triton 2.5DI-D double cab Xtreme', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1875, 278, N'Triton 2.4DI-D double cab 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1876, 278, N'Triton 2.4DI-D double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1877, 278, N'Triton 2.4DI-D double cab 4x4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1878, 278, N'Triton 2.4DI-D double cab auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1879, 278, N'Triton 3.5 4x4 double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1880, 278, N'Triton 3.2DI-D 4x4 double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1881, 278, N'Triton 3.2DI-D 4x4 double cab automatic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1882, 278, N'Triton 2.5DI-D 4x4 double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1883, 278, N'Triton 2.4DI-D double cab Xtreme auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1884, 278, N'Triton 2.4DI-D double cab 4x4 Xtreme', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1885, 278, N'Triton 2.4DI-D double cab 4x4 Athlete auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1886, 278, N'Triton 2.4DI-D double cab 4x4 Xtreme auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1887, 279, N'370Z coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1888, 279, N'370Z coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1889, 280, N'Almera 1.5 Acenta', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1890, 280, N'Almera 1.5 Acenta auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1891, 281, N'GT-R Premium Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1892, 281, N'GT-R Black Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1893, 282, N'Juke 1.6T Tekna Techno', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1894, 282, N'Juke 1.6T 4WD Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1895, 282, N'Juke 1.6T Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1896, 282, N'Juke 1.2T Acenta', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1897, 282, N'Juke 1.2T Acenta+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1898, 282, N'Juke 1.5dCi Acenta+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1899, 282, N'Juke 1.2T Acenta', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1900, 282, N'Juke 1.2T Acenta+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1901, 282, N'Juke 1.5dCi Acenta+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1902, 282, N'Juke 1.6T Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1903, 282, N'Juke 1.6T Tekna Techno', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1904, 282, N'Juke 1.6T 4WD Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1905, 283, N'Leaf', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1906, 284, N'Micra 66kW turbo Acenta Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1907, 284, N'Micra 66kW turbo Acenta', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1908, 284, N'Micra 66kW turbo Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1909, 285, N'Micra Active 1.2 Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1910, 286, N'Navara 2.3D double cab 4x4 SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1911, 286, N'Navara 2.3D double cab SE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1912, 286, N'Navara 2.3D double cab SE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1913, 286, N'Navara 2.3D double cab LE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1914, 286, N'Navara 2.3D double cab LE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1915, 286, N'Navara 2.3D double cab 4x4 LE auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1916, 286, N'Navara 2.3D double cab 4x4 LE', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1917, 287, N'NP200 1.6i loaded', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1918, 287, N'NP200 1.6i Stealth', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1919, 287, N'NP200 1.6i Ice', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1920, 287, N'NP200 1.6i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1921, 287, N'NP200 1.6i (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1922, 287, N'NP200 1.6i safety pack', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1923, 287, N'NP200 1.6 16v mid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1924, 287, N'NP200 1.6 16v high', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1925, 287, N'NP200 1.5dCi safety pack', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1926, 287, N'NP200 1.5dCi high', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1927, 287, N'NP200 1.5dCi Ice', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1928, 288, N'NP300 Hardbody 2.5TDi double cab Hi-rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1929, 288, N'NP300 Hardbody 2.4 double cab Hi-rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1930, 288, N'NP300 Hardbody 2.5TDi double cab 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1931, 288, N'NP300 Hardbody 2.4 double cab 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1932, 289, N'NP300 Hardbody 2.0 mid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1933, 289, N'NP300 Hardbody 2.5TDi Hi-rider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1934, 289, N'NP300 Hardbody 2.5TDi mid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1935, 289, N'NP300 Hardbody 2.4 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1936, 289, N'NP300 Hardbody 2.0 (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1937, 289, N'NP300 Hardbody 2.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1938, 289, N'NP300 Hardbody 2.5TDi 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1939, 289, N'NP300 Hardbody 2.5TDi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1940, 289, N'NP300 Hardbody 2.5TDi (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1941, 290, N'NV200 Combi 1.6i Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1942, 290, N'NV200 Combi 1.5dCi Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1943, 291, N'NV200 panel van 1.6i Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1944, 291, N'NV200 panel van 1.5dCi Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1945, 292, N'NV350 Impendulo 2.5i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1946, 293, N'NV350 panel van 2.5i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1947, 293, N'NV350 panel van wide-body 2.5i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1948, 293, N'NV350 panel van wide-body 2.5dCi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1949, 294, N'Patrol 5.6 V8 LE Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1950, 295, N'Patrol 3.0TD pick-up', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1951, 296, N'Qashqai 1.2T Acenta auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1952, 296, N'Qashqai 1.2T Acenta', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1953, 296, N'Qashqai 1.5dCi Acenta Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1954, 296, N'Qashqai 1.5dCi Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1955, 296, N'Qashqai 1.5dCi Acenta', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1956, 296, N'Qashqai 1.2T Acenta Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1957, 296, N'Qashqai 1.2T Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1958, 297, N'X-Trail 2.5 4x4 Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1959, 297, N'X-Trail 1.6dCi Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1960, 297, N'X-Trail 2.5 4x4 Acenta', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1961, 297, N'X-Trail 2.0 Visia', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1962, 297, N'X-Trail 1.6dCi 4x4 Tekna', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1963, 297, N'X-Trail 2.5 4x4 Acenta+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1964, 298, N'Adam 1.0T Jam', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1965, 298, N'Adam 1.0T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1966, 298, N'Adam 1.0T Slam', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1967, 299, N'Astra hatch 1.0T Enjoy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1968, 299, N'Astra hatch 1.4T Enjoy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1969, 299, N'Astra hatch 1.4T Enjoy auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1970, 299, N'Astra hatch 1.0T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1971, 299, N'Astra hatch 1.4T Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1972, 299, N'Astra hatch 1.4T Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1973, 299, N'Astra hatch 1.6T Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1974, 300, N'Corsa 1.4 Enjoy auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1975, 300, N'Corsa 1.0T Enjoy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1976, 300, N'Corsa 1.4 Turbo Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1977, 300, N'Corsa 1.0T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1978, 301, N'Crossland X 1.2 Turbo Cosmo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1979, 301, N'Crossland X 1.2 Turbo Enjoy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1980, 301, N'Crossland X 1.2 Turbo Cosmo auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1981, 301, N'Crossland X 1.2', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1982, 302, N'Grandland X 1.6 Turbo Cosmo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1983, 302, N'Grandland X 1.6 Turbo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1984, 302, N'Grandland X 1.6 Turbo Enjoy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1985, 303, N'Mokka X 1.4 Turbo Cosmo auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1986, 303, N'Mokka X 1.4 Turbo Cosmo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1987, 303, N'Mokka X 1.4 Turbo Enjoy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1988, 303, N'Mokka X 1.4 Turbo Enjoy auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1989, 304, N'2008 1.6HDi Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1990, 304, N'2008 1.6HDi Allure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1991, 304, N'2008 1.2T Allure auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1992, 304, N'2008 1.2T GT Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1993, 304, N'2008 1.2T Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1994, 304, N'2008 1.2T GT Line+ auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1995, 305, N'208 1.2 Allure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1996, 305, N'208 1.2 Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1997, 305, N'208 1.2T GT Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1998, 305, N'208 1.2T GT Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (1999, 306, N'3008 1.6T Active', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2000, 306, N'3008 1.6T Allure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2001, 306, N'3008 1.6T GT Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2002, 306, N'3008 2.0HDi Active', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2003, 306, N'3008 1.2T Active Limited Edition', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2004, 306, N'3008 2.0HDi Allure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2005, 307, N'308 1.2T Allure auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2006, 307, N'308 1.2T Allure', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2007, 308, N'Boxer 2.2HDi L2H1 M', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2008, 309, N'Partner 1.6 L1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2009, 309, N'Partner 1.6HDi L1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2010, 309, N'Partner 1.6HDi L2 crew cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2011, 310, N'911 Carrera 4 coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2012, 310, N'911 Carrera coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2013, 310, N'911 Carrera 4 coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2014, 310, N'911 Carrera coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2015, 310, N'911 Carrera S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2016, 310, N'911 Carrera S coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2017, 310, N'911 Carrera 4S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2018, 310, N'911 Carrera 4S coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2019, 310, N'911 Carrera GTS coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2020, 310, N'911 Carrera GTS coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2021, 310, N'911 Carrera 4 GTS coupe auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2022, 310, N'911 Carrera 4 GTS coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2023, 311, N'911 Carrera 4S cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2024, 311, N'911 Carrera 4 cabriolet auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2025, 311, N'911 Carrera S cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2026, 311, N'911 Carrera 4 cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2027, 311, N'911 Carrera 4S cabriolet auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2028, 311, N'911 Carrera S cabriolet auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2029, 311, N'911 Carrera cabriolet auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2030, 311, N'911 Carrera cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2031, 311, N'911 Carrera GTS cabriolet auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2032, 311, N'911 Carrera GTS cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2033, 311, N'911 Carrera 4 GTS cabriolet auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2034, 311, N'911 Carrera 4 GTS cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2035, 312, N'911 Carrera T auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2036, 312, N'911 Carrera T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2037, 313, N'911 GT3', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2038, 313, N'911 GT3 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2039, 313, N'911 GT2 RS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2040, 313, N'911 GT3 touring', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2041, 313, N'911 GT3 RS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2042, 314, N'911 targa 4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2043, 314, N'911 targa 4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2044, 314, N'911 targa 4S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2045, 314, N'911 targa 4S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2046, 314, N'911 targa 4 GTS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2047, 314, N'911 targa 4 GTS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2048, 315, N'911 turbo S coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2049, 315, N'911 turbo cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2050, 315, N'911 turbo S cabriolet', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2051, 315, N'911 turbo coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2052, 315, N'911 turbo S Exclusive Series coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2053, 316, N'718 Boxster auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2054, 316, N'718 Boxster', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2055, 316, N'718 Boxster S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2056, 316, N'718 Boxster S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2057, 316, N'718 Boxster GTS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2058, 316, N'718 Boxster GTS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2059, 317, N'Cayenne', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2060, 317, N'Cayenne S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2061, 317, N'Cayenne turbo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2062, 318, N'718 Cayman S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2063, 318, N'718 Cayman S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2064, 318, N'718 Cayman', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2065, 318, N'718 Cayman auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2066, 318, N'718 Cayman GTS auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2067, 318, N'718 Cayman GTS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2068, 319, N'Macan turbo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2069, 319, N'Macan S diesel', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2070, 319, N'Macan S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2071, 319, N'Macan GTS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2072, 319, N'Macan turbo Performance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2073, 320, N'Panamera 4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2074, 320, N'Panamera 4S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2075, 320, N'Panamera turbo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2076, 320, N'Panamera 4 executive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2077, 320, N'Panamera turbo S e-hybrid Sport Turismo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2078, 320, N'Panamera turbo S e-hybrid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2079, 320, N'Panamera turbo Sport Turismo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2080, 320, N'Panamera 4S Sport Turismo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2081, 320, N'Panamera 4 Sport Turismo', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2082, 321, N'Captur 66kW turbo Blaze', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2083, 321, N'Captur 66kW turbo Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2084, 321, N'Captur 66kW dCi Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2085, 321, N'Captur 88kW turbo Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2086, 321, N'Captur 88kW turbo Dynamique auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2087, 322, N'Clio 66kW turbo Expression', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2088, 322, N'Clio 88kW turbo Expression auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2089, 322, N'Clio 66kW turbo Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2090, 322, N'Clio 66kW turbo Authentique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2091, 322, N'Clio 88kW turbo GT-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2092, 323, N'Clio RS 220 Trophy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2093, 323, N'Clio RS 200 Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2094, 323, N'Clio RS 18 F1', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2095, 324, N'Duster 1.5dCi Dynamique auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2096, 324, N'Duster 1.6 Expression', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2097, 324, N'Duster 1.5dCi Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2098, 324, N'Duster 1.5dCi Dynamique 4WD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2099, 324, N'Duster 1.5dCi Prestige', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2100, 325, N'Kadjar 96kW turbo Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2101, 325, N'Kadjar 96kW dCi Dynamique 4WD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2102, 325, N'Kadjar 96kW TCe Dynamique auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2103, 325, N'Kadjar 81kW dCi Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2104, 325, N'Kadjar 81kW dCi Dynamique auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2105, 325, N'Kadjar 96kW TCe Blaze', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2106, 326, N'Kangoo Express 1.6 panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2107, 327, N'Kwid 1.0 Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2108, 327, N'Kwid 1.0 Expression', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2109, 327, N'Kwid 1.0 Dynamique auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2110, 327, N'Kwid 1.0 Climber', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2111, 328, N'Megane RS 280 Cup', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2112, 328, N'Megane RS 280 Lux', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2113, 328, N'Megane 97kW Dynamique auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2114, 328, N'Megane 84kW Expression', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2115, 328, N'Megane 97kW Dynamique', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2116, 329, N'Sandero 66kW turbo Expression', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2117, 330, N'Sandero Stepway 66kW turbo Expression', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2118, 330, N'Sandero Stepway 66kW turbo Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2119, 331, N'Trafic 1.6dCi panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2120, 332, N'Ghost', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2121, 332, N'Ghost Extended Wheelbase', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2122, 333, N'Wraith', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2123, 333, N'Wraith Black Badge', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2124, 334, N'forfour base', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2125, 334, N'forfour passion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2126, 334, N'forfour prime', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2127, 334, N'forfour proxy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2128, 334, N'forfour base auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2129, 334, N'forfour passion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2130, 334, N'forfour prime auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2131, 334, N'forfour proxy auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2132, 334, N'Brabus forfour', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2133, 334, N'Brabus forfour Xclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2134, 335, N'fortwo coupe base', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2135, 335, N'fortwo coupe passion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2136, 335, N'fortwo coupe prime', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2137, 335, N'fortwo coupe proxy', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2138, 335, N'Brabus fortwo coupe', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2139, 335, N'Brabus fortwo coupe Xclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2140, 336, N'Korando 2.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2141, 337, N'Forester 2.5 X', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2142, 337, N'Forester 2.0 X', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2143, 337, N'Forester 2.0 XT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2144, 337, N'Forester 2.5 XS Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2145, 337, N'Forester 2.5 XS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2146, 338, N'Impreza 2.0i-S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2147, 338, N'Impreza 2.0i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2148, 338, N'Impreza 2.0i-S ES', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2149, 339, N'XV 2.0i-S ES', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2150, 339, N'XV 2.0i', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2151, 340, N'Legacy 3.6 R-S ES Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2152, 341, N'Outback 2.5i-S ES Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2153, 341, N'Outback 3.6 R-S ES Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2154, 342, N'WRX STI Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2155, 342, N'WRX Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2156, 342, N'WRX ES Premium', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2157, 343, N'Baleno 1.4 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2158, 343, N'Baleno 1.4 GLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2159, 343, N'Baleno 1.4 GLX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2160, 344, N'Celerio 1.0 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2161, 344, N'Celerio 1.0 GL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2162, 344, N'Celerio 1.0 GA', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2163, 345, N'Ciaz 1.4 GLX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2164, 345, N'Ciaz 1.4 GLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2165, 345, N'Ciaz 1.4 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2166, 346, N'Ertiga 1.4 GA', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2167, 346, N'Ertiga 1.4 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2168, 346, N'Ertiga 1.4 GL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2169, 347, N'Grand Vitara 2.4 Dune', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2170, 347, N'Grand Vitara 2.4 Dune auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2171, 347, N'Grand Vitara 2.4 Summit auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2172, 347, N'Grand Vitara 2.4 Summit', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2173, 348, N'Ignis 1.2 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2174, 348, N'Ignis 1.2 GLX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2175, 348, N'Ignis 1.2 GLX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2176, 349, N'Jimny 1.3 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2177, 349, N'Jimny 1.3', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2178, 350, N'Swift 1.2 GA', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2179, 350, N'Swift 1.2 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2180, 350, N'Swift 1.2 GL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2181, 351, N'DZire 1.2 GA', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2182, 351, N'DZire 1.2 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2183, 351, N'DZire 1.2 GL auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2184, 352, N'Vitara 1.6 GLX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2185, 352, N'Vitara 1.6 GL+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2186, 352, N'Vitara 1.6 GL+ AllGrip', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2187, 352, N'Vitara 1.6 GLX AllGrip', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2188, 352, N'Vitara 1.6 GL', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2189, 352, N'Vitara 1.6 GL+ auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2190, 353, N'GT86', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2191, 354, N'Auris 1.6 XR auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2192, 354, N'Auris Hybrid XR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2193, 354, N'Auris 1.6 XS', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2194, 354, N'Auris 1.6 XR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2195, 354, N'Auris 1.3 X', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2196, 354, N'Auris 1.6 Xi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2197, 355, N'Avanza 1.3 S panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2198, 355, N'Avanza 1.3 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2199, 355, N'Avanza 1.3 SX', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2200, 355, N'Avanza 1.5 SX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2201, 355, N'Avanza 1.5 SX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2202, 355, N'Avanza 1.5 TX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2203, 356, N'Aygo 1.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2204, 356, N'Aygo 1.0 X-Play', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2205, 356, N'Aygo 1.0 X-Cite', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2206, 357, N'C-HR 1.2T', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2207, 357, N'C-HR 1.2T Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2208, 357, N'C-HR 1.2T Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2209, 357, N'C-HR 1.2T Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2210, 358, N'Corolla 1.4D-4D Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2211, 358, N'Corolla 1.4D-4D Esteem', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2212, 358, N'Corolla 1.8 Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2213, 358, N'Corolla 1.8 Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2214, 358, N'Corolla 1.8 Exclusive auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2215, 358, N'Corolla 1.6 Prestige auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2216, 358, N'Corolla 1.3 Esteem', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2217, 358, N'Corolla 1.3 Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2218, 358, N'Corolla 1.6 Esteem', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2219, 358, N'Corolla 1.6 Prestige', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2220, 358, N'Corolla 1.6 Prestige+ auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2221, 358, N'Corolla 1.6 Prestige+', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2222, 359, N'Corolla Quest 1.6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2223, 359, N'Corolla Quest 1.6 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2224, 359, N'Corolla Quest 1.6 Plus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2225, 360, N'Etios sedan 1.5 Sprint', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2226, 360, N'Etios sedan 1.5 Xi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2227, 361, N'Etios Cross 1.5 Xs', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2228, 362, N'Etios hatch 1.5 Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2229, 362, N'Etios hatch 1.5 Sprint', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2230, 362, N'Etios hatch 1.5 Xi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2231, 363, N'FJ Cruiser', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2232, 364, N'Fortuner 2.8GD-6 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2233, 364, N'Fortuner 4.0 V6 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2234, 364, N'Fortuner 2.8GD-6 4x4', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2235, 364, N'Fortuner 2.4GD-6 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2236, 364, N'Fortuner 2.7 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2237, 364, N'Fortuner 2.8GD-6 4x4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2238, 364, N'Fortuner 2.4GD-6 4x4 auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2239, 364, N'Fortuner 2.8GD-6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2240, 364, N'Fortuner 2.4GD-6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2241, 365, N'Hilux 2.4GD-6 double cab S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2242, 365, N'Hilux 2.8GD-6 double cab Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2243, 365, N'Hilux 2.8GD-6 double cab 4x4 Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2244, 365, N'Hilux 2.4GD-6 double cab SRX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2245, 365, N'Hilux 2.8GD-6 double cab 4x4 Raider auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2246, 365, N'Hilux 4.0 V6 double cab 4x4 Raider Dakar', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2247, 365, N'Hilux 2.7 double cab S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2248, 365, N'Hilux 2.8GD-6 double cab Raider Dakar auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2249, 365, N'Hilux 2.4GD-6 double cab SR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2250, 365, N'Hilux 2.4GD-6 double cab 4x4 SR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2251, 365, N'Hilux 2.8GD-6 double cab Raider auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2252, 365, N'Hilux 2.8GD-6 double cab 4x4 Raider Dakar', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2253, 365, N'Hilux 2.4GD-6 double cab 4x4 SRX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2254, 365, N'Hilux 2.8GD-6 double cab 4x4 Raider Dakar auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2255, 365, N'Hilux 4.0 V6 double cab 4x4 Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2256, 365, N'Hilux 2.8GD-6 double cab Raider Dakar', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2257, 365, N'Hilux 2.4GD-6 double cab SRX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2258, 365, N'Hilux 2.4GD-6 double cab 4x4 SRX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2259, 366, N'Hilux 2.4GD-6 4x4 SRX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2260, 366, N'Hilux 2.4GD-6 4x4 SRX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2261, 366, N'Hilux 2.4GD-6 SRX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2262, 366, N'Hilux 2.8GD-6 Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2263, 366, N'Hilux 2.4GD-6 SR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2264, 366, N'Hilux 2.0 (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2265, 366, N'Hilux 2.8GD-6 Raider auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2266, 366, N'Hilux 2.4GD (aircon)', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2267, 366, N'Hilux 2.4GD-6 4x4 SR', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2268, 366, N'Hilux 2.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2269, 366, N'Hilux 2.4GD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2270, 366, N'Hilux 2.8GD-6 4x4 Raider auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2271, 366, N'Hilux 2.4GD-6 SRX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2272, 366, N'Hilux 2.8GD-6 4x4 Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2273, 367, N'Hilux 2.8GD-6 Xtra cab 4x4 Raider auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2274, 367, N'Hilux 2.8GD-6 Xtra cab 4x4 Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2275, 367, N'Hilux 2.8GD-6 Xtra cab Raider Dakar', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2276, 367, N'Hilux 2.4GD-6 Xtra cab SRX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2277, 367, N'Hilux 2.8GD-6 Xtra cab 4x4 Raider Dakar auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2278, 367, N'Hilux 2.4GD-6 Xtra cab SRX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2279, 367, N'Hilux 2.8GD-6 Xtra cab Raider', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2280, 367, N'Hilux 2.8GD-6 Xtra cab Raider auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2281, 367, N'Hilux 2.8GD-6 Xtra cab Raider Dakar auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2282, 367, N'Hilux 2.8GD-6 Xtra cab 4x4 Raider Dakar', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2283, 368, N'Land Cruiser 200 4.5D-4D V8 VX-R', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2284, 368, N'Land Cruiser 200 4.5D-4D V8 GX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2285, 368, N'Land Cruiser 200 4.5D-4D V8 VX-R', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2286, 369, N'Land Cruiser 76 4.5D-4D LX V8 station wagon', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2287, 370, N'Land Cruiser 79 4.5D-4D LX V8 double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2288, 370, N'Land Cruiser 79 4.0 V6', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2289, 370, N'Land Cruiser 79 4.2D', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2290, 370, N'Land Cruiser 79 4.5D-4D LX V8', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2291, 370, N'Land Cruiser 79 4.0 V6 double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2292, 370, N'Land Cruiser 79 4.2D double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2293, 371, N'Land Cruiser Prado 3.0DT TX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2294, 371, N'Land Cruiser Prado 4.0 VX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2295, 371, N'Land Cruiser Prado 3.0DT VX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2296, 371, N'Land Cruiser Prado 3.0DT VX-L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2297, 371, N'Land Cruiser Prado 4.0 VX-L', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2298, 372, N'Prius Hybrid', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2299, 373, N'Quantum 2.5D-4D GL 14-seater bus', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2300, 373, N'Quantum 2.5D-4D GL 10-seater bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2301, 373, N'Quantum 2.7 GL 10-seater bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2302, 373, N'Quantum 2.7 GL 14-seater bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2303, 374, N'Quantum 2.7 Ses-fikile', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2304, 374, N'Quantum 2.5D-4D Ses-fikile', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2305, 375, N'Quantum 2.5D-4D crew cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2306, 375, N'Quantum 2.7 crew cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2307, 376, N'Quantum 2.7 S-Long panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2308, 376, N'Quantum 2.5D-4D panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2309, 376, N'Quantum 2.5D-4D S-Long panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2310, 376, N'Quantum 2.7 panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2311, 377, N'RAV4 2.2D-4D AWD VX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2312, 377, N'RAV4 2.5 AWD VX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2313, 377, N'RAV4 2.0 GX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2314, 377, N'RAV4 2.0 GX auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2315, 377, N'RAV4 2.2D-4D AWD GX', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2316, 378, N'Rush 1.5 S auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2317, 378, N'Rush 1.5 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2318, 379, N'Yaris 1.5 Xi', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2319, 379, N'Yaris 1.5 Xs', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2320, 379, N'Yaris 1.5 Cross', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2321, 379, N'Yaris 1.5 S', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2322, 379, N'Yaris 1.5 Xs auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2323, 380, N'Amarok 3.0 V6 TDI double cab Highline Plus 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2324, 380, N'Amarok 3.0 V6 TDI double cab Extreme 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2325, 380, N'Amarok 2.0BiTDI double cab Highline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2326, 380, N'Amarok 2.0TDI double cab Comfortline 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2327, 380, N'Amarok 2.0TDI double cab Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2328, 380, N'Amarok 2.0BiTDI double cab Highline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2329, 380, N'Amarok 2.0BiTDI double cab Highline Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2330, 380, N'Amarok 2.0BiTDI double cab Highline 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2331, 380, N'Amarok 2.0BiTDI double cab Highline 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2332, 380, N'Amarok 2.0BiTDI double cab Highline Plus 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2333, 380, N'Amarok 2.0BiTDI double cab Extreme 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2334, 380, N'Amarok 3.0 V6 TDI double cab Highline 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2335, 380, N'Amarok 2.0BiTDI double cab Dark Label 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2336, 381, N'Arteon 2.0TDI Elegance', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2337, 381, N'Arteon 2.0TDI R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2338, 381, N'Arteon 2.0TSI 4Motion R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2339, 382, N'Beetle 1.4TSI R-Line Exclusive', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2340, 383, N'Caddy 2.0TDI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2341, 383, N'Caddy Maxi 2.0TDI crew bus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2342, 383, N'Caddy Maxi 2.0TDI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2343, 383, N'Caddy Maxi 2.0TDI crew bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2344, 383, N'Caddy 2.0TDI panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2345, 383, N'Caddy 1.6 panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2346, 383, N'Caddy Maxi 2.0TDI panel van', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2347, 383, N'Caddy 2.0TDI crew bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2348, 383, N'Caddy Maxi 2.0TDI panel van auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2349, 383, N'Caddy Maxi 2.0TDI panel van Sport', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2350, 383, N'Caddy Alltrack 2.0TDI auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2351, 383, N'Caddy Alltrack 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2352, 383, N'Caddy Maxi 2.0TDI Trendline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2353, 383, N'Caddy 1.6 crew bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2354, 383, N'Caddy 2.0TDI crew bus', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2355, 384, N'California Coast 2.0BiTDI 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2356, 385, N'Kombi 2.0TDI LWB Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2357, 385, N'Kombi 2.0TDI SWB Trendline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2358, 385, N'California Beach 2.0TDI 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2359, 385, N'Kombi 2.0TDI SWB Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2360, 385, N'Caravelle 2.0BiTDI Highline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2361, 385, N'Kombi 2.0TDI SWB Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2362, 385, N'Kombi 2.0TDI LWB Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2363, 385, N'Kombi 2.0TDI SWB Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2364, 385, N'Caravelle 2.0BiTDI Comfortline 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2365, 385, N'Caravelle 2.0BiTDI Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2366, 385, N'Caravelle 2.0BiTDI Highline 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2367, 385, N'Kombi 2.0BiTDI SWB Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2368, 385, N'Kombi 2.0TDI SWB Trendline Plus auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2369, 386, N'Golf 1.0TSI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2370, 386, N'Golf 1.4TSI Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2371, 386, N'Golf 1.4TSI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2372, 386, N'Golf 1.0TSI Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2373, 386, N'Golf 1.0TSI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2374, 386, N'Golf 2.0TDI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2375, 386, N'Golf 2.0TDI Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2376, 387, N'Golf GTI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2377, 387, N'Golf GTD', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2378, 388, N'Golf R', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2379, 389, N'Jetta 1.2TSI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2380, 389, N'Jetta 1.4TSI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2381, 389, N'Jetta 1.4TSI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2382, 389, N'Jetta 1.4TSI Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2383, 389, N'Jetta 1.4TSI Highline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2384, 389, N'Jetta 1.6TDI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2385, 389, N'Jetta 1.6TDI Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2386, 389, N'Jetta 2.0TDI Highline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2387, 389, N'Jetta 1.6 Conceptline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2388, 390, N'Passat 2.0TDI Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2389, 390, N'Passat 2.0TDI Luxury R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2390, 390, N'Passat 2.0TDI Executive R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2391, 390, N'Passat 2.0TSI Executive R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2392, 390, N'Passat 1.4TSI Luxury R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2393, 390, N'Passat 1.4TSI Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2394, 391, N'Polo hatch 1.0TSI beats auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2395, 391, N'Polo hatch 1.0TSI Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2396, 391, N'Polo hatch 1.0TSI Comfortline R-Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2397, 391, N'Polo hatch 1.0TSI Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2398, 391, N'Polo hatch 1.0TSI Highline R-Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2399, 391, N'Polo hatch 1.0TSI Comfortline', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2400, 391, N'Polo hatch 1.0TSI Highline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2401, 391, N'Polo hatch 1.0TSI Highline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2402, 391, N'Polo hatch 1.0TSI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2403, 391, N'Polo hatch 1.0TSI Highline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2404, 391, N'Polo hatch 1.0TSI beats', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2405, 391, N'Polo GTI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2406, 392, N'Polo sedan 1.4 Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2407, 392, N'Polo sedan 1.6 Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2408, 392, N'Polo sedan 1.6 Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2409, 392, N'Polo sedan 1.4 Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2410, 392, N'Polo sedan 1.6 Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2411, 392, N'Polo sedan 1.5TDI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2412, 393, N'Polo Vivo hatch 1.4 Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2413, 393, N'Polo Vivo hatch 1.6 Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2414, 393, N'Polo Vivo hatch 1.6 Maxx', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2415, 393, N'Polo Vivo hatch 1.6 Highline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2416, 393, N'Polo Vivo hatch 1.0TSI GT', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2417, 393, N'Polo Vivo hatch 1.4 Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2418, 394, N'Tiguan 1.4TSI Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2419, 394, N'Tiguan 1.4TSI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2420, 394, N'Tiguan 1.4TSI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2421, 394, N'Tiguan 1.4TSI Comfortline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2422, 394, N'Tiguan 1.4TSI Comfortline R-Line auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2423, 394, N'Tiguan 2.0TSI 4Motion Highline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2424, 394, N'Tiguan 2.0TSI 4Motion Highline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2425, 394, N'Tiguan 2.0TDI Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2426, 394, N'Tiguan 2.0TDI Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2427, 394, N'Tiguan 2.0TDI 4Motion Highline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2428, 394, N'Tiguan Allspace 2.0TSI 4Motion Highline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2429, 394, N'Tiguan 2.0TDI 4Motion Highline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2430, 394, N'Tiguan 1.4TSI Trendline auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2431, 394, N'Tiguan 2.0TDI 4Motion Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2432, 394, N'Tiguan 2.0TDI 4Motion Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2433, 394, N'Tiguan Allspace 2.0TSI 4Motion Highline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2434, 394, N'Tiguan Allspace 2.0TDI 4Motion Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2435, 394, N'Tiguan Allspace 2.0TSI 4Motion Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2436, 394, N'Tiguan Allspace 2.0TDI 4Motion Comfortline R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2437, 394, N'Tiguan Allspace 1.4TSI Trendline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2438, 394, N'Tiguan Allspace 2.0TSI 4Motion Comfortline', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2439, 395, N'Touareg V6 TDI Luxury', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2440, 395, N'Touareg V6 TDI Executive R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2441, 395, N'Touareg V6 TDI Luxury R-Line', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2442, 396, N'Transporter 2.0TDI', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2443, 396, N'Transporter 2.0TDI double cab', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2444, 396, N'Transporter 2.0BiTDI double cab auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2445, 396, N'Transporter 2.0TDI double cab 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2446, 397, N'Transporter 2.0BiTDI crew bus LWB 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2447, 397, N'Transporter 2.0BiTDI crew bus SWB 4Motion auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2448, 397, N'Transporter 2.0BiTDI crew bus SWB auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2449, 397, N'Transporter 2.0TDI crew bus SWB', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2450, 397, N'Transporter 2.0TDI crew bus SWB 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2451, 397, N'Transporter 2.0TDI crew bus LWB', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2452, 397, N'Transporter 2.0TDI crew bus LWB 10-seater', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2453, 397, N'Transporter 2.0TDI crew bus LWB 4Motion', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2454, 397, N'Transporter 2.0TDI crew bus LWB auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2455, 398, N'Transporter 2.0TDI panel van SWB Sport auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2456, 398, N'Transporter 2.0TDI panel van LWB auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2457, 398, N'Transporter 2.0TDI panel van SWB', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2458, 398, N'Transporter 2.0TDI panel van LWB', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2459, 399, N'cross up! 5-door 1.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2460, 399, N'move up! 5-door 1.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2461, 399, N'take up! 5-door 1.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2462, 399, N'up! beats 5-door 1.0', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2463, 400, N'S60 T3 Kinetic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2464, 400, N'S60 T3 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2465, 400, N'S60 T3 Momentum auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2466, 400, N'S60 T3 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2467, 400, N'S60 T3 Inscription auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2468, 400, N'S60 T3 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2469, 400, N'S60 T3 R-Design auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2470, 400, N'S60 T4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2471, 400, N'S60 T4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2472, 400, N'S60 T4 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2473, 400, N'S60 D4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2474, 400, N'S60 D4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2475, 400, N'S60 D4 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2476, 400, N'S60 T5 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2477, 400, N'S60 T5 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2478, 400, N'S60 T5 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2479, 400, N'S60 D5 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2480, 400, N'S60 D5 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2481, 400, N'S60 T6 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2482, 400, N'S60 T6 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2483, 400, N'S60 polestar', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2484, 401, N'S90 T6 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2485, 401, N'S90 T6 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2486, 401, N'S90 T6 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2487, 401, N'S90 D5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2488, 401, N'S90 D5 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2489, 401, N'S90 D5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2490, 401, N'S90 D4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2491, 401, N'S90 D4 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2492, 401, N'S90 D4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2493, 401, N'S90 T5 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2494, 401, N'S90 T5 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2495, 401, N'S90 T5 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2496, 402, N'V40 T5 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2497, 402, N'V40 T3 Momentum auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2498, 402, N'V40 T3 Inscription auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2499, 402, N'V40 T3 R-Design auto', 1, NULL)
GO
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2500, 402, N'V40 T4 Momentum auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2501, 402, N'V40 D3 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2502, 402, N'V40 D3 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2503, 402, N'V40 D4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2504, 402, N'V40 D4 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2505, 402, N'V40 T5 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2506, 402, N'V40 D4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2507, 402, N'V40 D3 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2508, 402, N'V40 T4 Inscription auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2509, 402, N'V40 T5 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2510, 402, N'V40 T4 R-Design auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2511, 402, N'V40 D2 Kinetic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2512, 402, N'V40 T2 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2513, 402, N'V40 T2 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2514, 402, N'V40 T3 Kinetic auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2515, 402, N'V40 T2 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2516, 402, N'V40 D2 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2517, 402, N'V40 D2 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2518, 402, N'V40 D2 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2519, 402, N'V40 T2 Kinetic', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2520, 403, N'V40 Cross Country T4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2521, 403, N'V40 Cross Country D4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2522, 403, N'V40 Cross Country T5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2523, 403, N'V40 Cross Country T4 Inscription auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2524, 403, N'V40 Cross Country D4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2525, 403, N'V40 Cross Country T5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2526, 403, N'V40 Cross Country T4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2527, 403, N'V40 Cross Country T4 Momentum auto', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2528, 403, N'V40 Cross Country D3 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2529, 403, N'V40 Cross Country D3 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2530, 404, N'V60 Cross Country D4 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2531, 404, N'V60 Cross Country D4 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2532, 404, N'V60 Cross Country T5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2533, 404, N'V60 Cross Country T5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2534, 405, N'V90 Cross Country D5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2535, 405, N'V90 Cross Country T5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2536, 405, N'V90 Cross Country D4 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2537, 405, N'V90 Cross Country D5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2538, 405, N'V90 Cross Country D4 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2539, 405, N'V90 Cross Country T6 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2540, 405, N'V90 Cross Country T5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2541, 405, N'V90 Cross Country T6 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2542, 406, N'XC40 D4 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2543, 406, N'XC40 D4 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2544, 406, N'XC40 T5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2545, 406, N'XC40 T5 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2546, 406, N'XC40 D4 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2547, 406, N'XC40 T3 R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2548, 406, N'XC40 T3 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2549, 406, N'XC40 T3 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2550, 406, N'XC40 T5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2551, 407, N'XC60 T5 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2552, 407, N'XC60 D5 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2553, 407, N'XC60 D5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2554, 407, N'XC60 D5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2555, 407, N'XC60 T6 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2556, 407, N'XC60 T5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2557, 407, N'XC60 T5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2558, 407, N'XC60 D4 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2559, 407, N'XC60 T6 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2560, 407, N'XC60 T6 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2561, 407, N'XC60 D4 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2562, 407, N'XC60 D4 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2563, 408, N'XC90 D4 Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2564, 408, N'XC90 D4 Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2565, 408, N'XC90 D5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2566, 408, N'XC90 D5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2567, 408, N'XC90 D5 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2568, 408, N'XC90 T5 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2569, 408, N'XC90 T5 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2570, 408, N'XC90 T5 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2571, 408, N'XC90 T6 AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2572, 408, N'XC90 T6 AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2573, 408, N'XC90 T6 AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2574, 408, N'XC90 T8 Twin Engine AWD Momentum', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2575, 408, N'XC90 T8 Twin Engine AWD Inscription', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2576, 408, N'XC90 T8 Twin Engine AWD R-Design', 1, NULL)
INSERT [dbo].[CarVariants] ([id], [carModelId], [carVariantName], [isActive], [AveragePrice]) VALUES (2577, 408, N'XC90 T8 Twin Engine AWD Excellence', 1, NULL)
SET IDENTITY_INSERT [dbo].[CarVariants] OFF
SET IDENTITY_INSERT [dbo].[CarVariantYears] ON 

INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (1, 2018)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (2, 2017)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (3, 2016)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (4, 2015)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (5, 2014)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (6, 2013)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (7, 2012)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (8, 2011)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (9, 2010)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (10, 2009)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (11, 2008)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (12, 2007)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (13, 2006)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (14, 2005)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (15, 2004)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (16, 2003)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (17, 2002)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (18, 2001)
INSERT [dbo].[CarVariantYears] ([id], [Value]) VALUES (19, 2000)
SET IDENTITY_INSERT [dbo].[CarVariantYears] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (55, 1, N'Client1', N'Client1', N'743760126', 1, N'Client1@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (56, 1, N'Client2', N'Client2', N'743760126', 1, N'Client2@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (57, 1, N'Client3', N'Client3', N'743760126', 1, N'Client3@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (58, 1, N'Client4', N'Client4', N'743760126', 1, N'Client4@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (59, 1, N'Client5', N'Client5', N'743760126', 1, N'Client5@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (60, 1, N'Client6', N'Client6', N'743760126', 1, N'Client6@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (61, 1, N'Client7', N'Client7', N'743760126', 1, N'Client7@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (62, 1, N'Client8', N'Client8', N'743760126', 1, N'Client8@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (63, 1, N'Client9', N'Client9', N'743760126', 1, N'Client9@gmail.com', N'client123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Clients] ([id], [titleId], [firstName], [lastName], [contactNumber], [bestTimeToContactId], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [bidemailnotify], [bidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (64, 1, N'Client10', N'Client10', N'743760126', 1, N'Client10@gmail.com', N'shatlin123', NULL, NULL, 3, 68, CAST(N'2018-11-11T13:25:00.000' AS DateTime), NULL, NULL, 0, 1, 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([id], [Value]) VALUES (1, N'white')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (2, N'blue')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (3, N'red')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (4, N'grey')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (5, N'black')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (6, N'Dark Blue')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (7, N'silver')
INSERT [dbo].[Colors] ([id], [Value]) VALUES (8, N'Brown')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([id], [countryCode], [Name], [isActive]) VALUES (1, N'ZA', N'South Africa', 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[DealerMakes] ON 

INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (17, 3, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (19, 5, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (67, 3, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (69, 5, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (117, 3, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (119, 5, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (167, 3, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (169, 5, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (217, 3, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (219, 5, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (267, 3, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (269, 5, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (317, 3, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (319, 5, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (367, 3, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (369, 5, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (417, 3, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (419, 5, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (467, 3, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (469, 5, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (517, 3, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (519, 5, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (567, 3, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (569, 5, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (617, 3, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (619, 5, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (667, 3, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (669, 5, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (717, 3, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (719, 5, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (767, 3, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (769, 5, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (817, 3, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (819, 5, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (867, 3, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (869, 5, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (917, 3, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (919, 5, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (967, 3, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (969, 5, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1017, 3, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1019, 5, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1067, 3, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1069, 5, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1117, 3, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1119, 5, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1167, 3, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1169, 5, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1217, 3, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1219, 5, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1267, 3, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1269, 5, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1317, 3, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1319, 5, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1367, 3, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1369, 5, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1417, 3, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1419, 5, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1467, 3, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1469, 5, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1517, 3, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1519, 5, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1567, 3, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1569, 5, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1617, 3, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1619, 5, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1667, 3, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1669, 5, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1717, 3, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1719, 5, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1767, 3, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1769, 5, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1817, 3, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1819, 5, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1867, 3, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1869, 5, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1917, 3, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1919, 5, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1967, 3, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (1969, 5, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2017, 3, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2019, 5, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2067, 3, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2069, 5, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2117, 3, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2119, 5, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2167, 3, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2169, 5, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2217, 3, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2219, 5, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2267, 3, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2268, 3, 2, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2269, 3, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2270, 3, 4, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2271, 3, 5, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2272, 3, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2273, 3, 7, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2274, 3, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2275, 3, 9, 1)
GO
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2276, 3, 10, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2277, 3, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2278, 3, 12, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2279, 3, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2280, 3, 14, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2281, 3, 15, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2282, 3, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2283, 3, 17, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2284, 3, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2285, 3, 19, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2286, 3, 20, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2287, 3, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2288, 3, 22, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2289, 3, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2290, 3, 24, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2291, 3, 25, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2292, 3, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2293, 3, 27, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2294, 3, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2295, 3, 29, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2296, 3, 30, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2297, 3, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2298, 3, 32, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2299, 3, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2300, 3, 34, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2301, 3, 35, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2302, 3, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2303, 3, 37, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2304, 3, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2305, 3, 39, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2306, 3, 40, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2307, 3, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2308, 3, 42, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2309, 3, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2310, 3, 44, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2311, 3, 45, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2312, 4, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2313, 4, 2, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2314, 4, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2315, 4, 4, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2316, 4, 5, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2317, 4, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2318, 4, 7, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2319, 4, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2320, 4, 9, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2322, 4, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2323, 4, 12, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2324, 4, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2325, 4, 14, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2326, 4, 15, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2327, 4, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2328, 4, 17, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2329, 4, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2330, 4, 19, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2331, 4, 20, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2332, 4, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2333, 4, 22, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2334, 4, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2335, 4, 24, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2336, 4, 25, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2337, 4, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2338, 4, 27, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2339, 4, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2340, 4, 29, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2341, 4, 30, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2342, 4, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2343, 4, 32, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2344, 4, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2345, 4, 34, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2346, 4, 35, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2347, 4, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2348, 4, 37, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2349, 4, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2350, 4, 39, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2351, 4, 40, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2352, 4, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2353, 4, 42, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2354, 4, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2355, 4, 44, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2356, 4, 45, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2357, 5, 1, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2358, 5, 2, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2359, 5, 3, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2360, 5, 4, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2361, 5, 5, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2362, 5, 6, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2363, 5, 7, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2364, 5, 8, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2365, 5, 9, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2366, 5, 10, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2367, 5, 11, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2368, 5, 12, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2369, 5, 13, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2370, 5, 14, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2371, 5, 15, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2372, 5, 16, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2373, 5, 17, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2374, 5, 18, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2375, 5, 19, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2376, 5, 20, 1)
GO
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2377, 5, 21, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2378, 5, 22, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2379, 5, 23, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2380, 5, 24, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2381, 5, 25, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2382, 5, 26, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2383, 5, 27, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2384, 5, 28, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2385, 5, 29, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2386, 5, 30, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2387, 5, 31, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2388, 5, 32, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2389, 5, 33, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2390, 5, 34, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2391, 5, 35, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2392, 5, 36, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2393, 5, 37, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2394, 5, 38, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2395, 5, 39, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2396, 5, 40, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2397, 5, 41, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2398, 5, 42, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2399, 5, 43, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2400, 5, 44, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (2401, 5, 45, 1)
INSERT [dbo].[DealerMakes] ([Id], [dealerId], [carMakeId], [isActive]) VALUES (4517, 4, 10, 1)
SET IDENTITY_INSERT [dbo].[DealerMakes] OFF
SET IDENTITY_INSERT [dbo].[DealerProvinces] ON 

INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (8, 3, 1, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (9, 4, 2, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (10, 5, 3, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (58, 3, 6, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (60, 5, 8, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (108, 3, 2, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (109, 4, 3, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (110, 5, 4, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (158, 3, 7, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (159, 4, 8, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (160, 5, 9, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (208, 3, 3, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (209, 4, 4, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (210, 5, 5, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (258, 3, 8, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (259, 4, 9, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (260, 5, 1, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (308, 3, 4, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (309, 4, 5, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (310, 5, 6, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (358, 3, 9, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (359, 4, 1, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (360, 5, 2, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (408, 3, 5, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (409, 4, 6, 1)
INSERT [dbo].[DealerProvinces] ([Id], [dealerId], [provinceId], [isActive]) VALUES (410, 5, 7, 1)
SET IDENTITY_INSERT [dbo].[DealerProvinces] OFF
SET IDENTITY_INSERT [dbo].[Dealers] ON 

INSERT [dbo].[Dealers] ([id], [titleId], [firstName], [lastName], [MobileNumber], [TelephoneNumber], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [isActive], [Position], [businessName], [registrationNumber], [VATNumber], [Address], [paymentGatewayId], [newlistemailnotify], [newlistsmsnotify], [lowerbidemailnotify], [lowerbidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (3, 1, N'dealer1', N'dealer1', N'0123456789', N'0123456789', N'dealer1@gmail.com', N'dealer123', 0, 0, 6, 8, CAST(N'2018-11-15T14:25:59.243' AS DateTime), CAST(N'2018-11-15T14:25:59.243' AS DateTime), NULL, 0, N'Manager', N'Business', N'1213213123123123', N'34234234324324234', N'Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.', 2, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Dealers] ([id], [titleId], [firstName], [lastName], [MobileNumber], [TelephoneNumber], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [isActive], [Position], [businessName], [registrationNumber], [VATNumber], [Address], [paymentGatewayId], [newlistemailnotify], [newlistsmsnotify], [lowerbidemailnotify], [lowerbidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (4, 1, N'dealer2', N'dealer1', N'123456789', N'123456789', N'dealer2@gmail.com', N'dealer123', 0, 0, 6, 8, CAST(N'2018-11-15T14:25:00.000' AS DateTime), CAST(N'2018-11-15T14:25:00.000' AS DateTime), NULL, 0, N'Manager', N'Business', N'1,21321E+15', N'3,42342E+16', N'Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.', 2, 0, 1, 1, 0, 1, 0, 1, 0)
INSERT [dbo].[Dealers] ([id], [titleId], [firstName], [lastName], [MobileNumber], [TelephoneNumber], [emailAddress], [password], [rememberMe], [isEmailConfirmed], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate], [isActive], [Position], [businessName], [registrationNumber], [VATNumber], [Address], [paymentGatewayId], [newlistemailnotify], [newlistsmsnotify], [lowerbidemailnotify], [lowerbidsmsnotify], [closenextdayemailnotify], [closenextdaysmsnotify], [closedemailnotify], [closedsmsnotify]) VALUES (5, 1, N'dealer3', N'dealer1', N'123456789', N'123456789', N'dealer3@gmail.com', N'dealer123', 0, 0, 6, 8, CAST(N'2018-11-15T14:25:00.000' AS DateTime), CAST(N'2018-11-15T14:25:00.000' AS DateTime), NULL, 0, N'Manager', N'Business', N'1,21321E+15', N'3,42342E+16', N'Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.Address field.', 2, 0, 1, 1, 0, 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Dealers] OFF
SET IDENTITY_INSERT [dbo].[Faq_Types] ON 

INSERT [dbo].[Faq_Types] ([id], [Value]) VALUES (1, N'clientfaq')
INSERT [dbo].[Faq_Types] ([id], [Value]) VALUES (2, N'dealerfaq')
INSERT [dbo].[Faq_Types] ([id], [Value]) VALUES (3, N'adminfaq')
SET IDENTITY_INSERT [dbo].[Faq_Types] OFF
SET IDENTITY_INSERT [dbo].[Faqs] ON 

INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (1, 1, N'How does AutoNegotiator make money?', N' AutoNegotiator receive a modest commission from the winning dealer.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (2, 1, N'What happens to my trade in?', N' AutoNegotiator sees the trade in/second hand vehicle as a separate transaction. The best deals are done when dealer does not have to equity the risk involved in a used car into the pricing of the new one. With the multitude of used car selling/buying sites available we could recommend someone if need be. We have relationships with some of the sites.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (3, 1, N'What personal information do I need to give?', N' We just require your contact info. Thus we require your Name, Surname and Contact Details.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (4, 1, N'How soon will I hear back from you?', N' We normally respond the same day or if your request was over a weekend/Public Holiday you will be contacted on the following day or Monday.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (5, 1, N'Are the dealers on AutoNegotiator reputable?', N'AutoNegotiator only does business with manufacturer approved new car dealers. The standards set by the manufacturers are so strict that we feel confident in stating that they are highly reputable.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (6, 1, N'What happens if I decide not to buy?', N'You will not be held to any purchase as you have not committed to anything by submitting your enquiry details to us.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (7, 1, N'Why does AutoNegotiator specialize in new vehicles only?', N'As AutoNegotiator uses a reverse auction to get dealers to bid against each other for exactly the same vehicle, we cannot apply this on second hand cars. 2017 Nissan Micra with 22000km in Cape Town could be totally different to the same car in Pietersburg. For a reverse auction to be effective the products need to be the same.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (8, 1, N'How does AutoNegotiator assist me with financing?', N'AutoNegotiator has a business relationship with the highly respected financial service provider, Seriti. Seriti offers a platform to the motor industry to send application for finance to finance banks. Thus, we can assist in getting your application processed before your auction has been completed.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (9, 1, N'What if I want to cancel my enquiry?', N'If you cancel your enquiry we will surely miss you but you have no obligation to anyone. We look forward to assisting you in future.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (10, 1, N'What does the Indicative Price mean?', N'Indicative price is seen as the ruling price of that model at the specified date. This is just a indication of what the normal manufacturers recommended price is.May I request more than vehicle at a time?')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (11, 1, N'Will my information be shared with all of your dealers?', N'We don’t share your information with any of the dealers during the auction period and will only provide the winning dealer with your information once the auction has successfully completed. You may request contact with more than one dealer.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (12, 1, N'Will I receive the winning dealer’s contact information?', N'We share your provided details with the dealer and the transaction is concluded between yourself and the dealer. We also send you the dealer''s information.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (13, 1, N'How long has AutoNegotiator been providing its unique service?', N'We have been operational for since March 2017 and hope to be your buying portal for years to come.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (14, 1, N'What happens if I decide to buy later?', N'If you put your purchase of for later, we recommend you reload a new inquiry when ready, as pricing is very time dependent.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (15, 1, N'What saving could I expect?', N'Savings from a few thousands to hundreds of thousands have been achieved.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (16, 1, N'What are the costs to the buyer?', N'There are no cost to the buyer for using our service.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (17, 1, N'Why do you ask about driver license?', N'Most buyers require finance and the financing banks require insurance and you will not be able to get insurance on your name if you do not have a valid drivers license.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (18, 1, N'Could you help me arrange insurance?', N'Yes we could help you arrange insurance, just tick box: Would you like us to arrange insurance?')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (19, 1, N'What is included in the price I receive?', N'We have a arrangement with our dealers that they have to make a price that includes delivery to your specified area. The only extra price would be for licencing and registration in your name. Also if extras are added after the initial pricing it could also increase your price.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (20, 1, N'Why is my enquiry open to dealers from anywhere?', N'We hope to get you the best price nationally, as some vehicles sell better in some areas, we hope we can get your preferred vehicle from a dealer where this could apply. When you open your enquiry to the whole of the country you will get the best price.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (21, 1, N'How will my vehicle be delivered to me?', N'After arranging delivery dealers could opt to drive your vehicle to you or get it delivered by car carrier.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (22, 1, N'Why does AutoNegotiator require a colour?', N'Sometimes your required colour could have limited stock and this could drive up the price. We recommend adding extra color options.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (23, 1, N'What should I do if the dealer does not have my exact vehicle?', N'Dealers generally will do their best to match the vehicle you have configured on AutoNegotiator, but many times they will not have an exact match for the car you are looking to purchase. This is not the dealer''s fault, but rather a challenge with the way vehicles are manufactured and marketed. While some vehicles are produced in large numbers, other vehicles are produced in smaller numbers. To further complicate things, many options or colors will be produced in even more limited combinations. This creates a great deal of confusion for buyers that want a very specific configuration. Ultimately this can affect your expectations when contacting a dealer, so it may be helpful to keep an open mind about what the dealer may be offering as an alternative.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (24, 2, N'How does the cost structure work for our dealership?', N'This will be discussed telephonically with one of our dealer agents. We do have one of the most competitive spotter fees and it’s not based on percentage of price.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (25, 2, N'Are there any upfront or fixed monthly costs?', N'No sign up fees.
No monthly fees.
No contracts that bind you into our service.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (26, 2, N'How soon will I receive a Buyer''s information after an auction has closed?', N'Usually 24 hours between end of auction and dealer receiving Buyer''s information. This could sometimes take longer if a customer starts his finance with us after he received the Best price.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (27, 2, N'Are there situations where a Buyer will be put in touch with multiple dealers, after an auction has closed?', N'Some buyers could ask to be put in touch with multiple dealers , but this is not the norm. ')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (28, 2, N'How does AutoNegotiator validate enquiries?', N'We endeavor to contact all enquiries by telephone before activation. If a customer only requires communication by email we unfortunately cannot validate. Furthermore, our finance department provides an additional level of validation.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (29, 2, N'Once the bidding process has ended and our dealership had the lowest bet, what happens from there on?', N'If we have reviewed the winning bid, and are comfortable in sending the lead to the winning dealer, we do so using automatic processes. Both Buyer and winning Dealer are informed of each others details.
Sometimes we may still be busy with a finance approval, and will only send the lead to the winning Dealer at the conclusion of that process.
There have also been cases where a client requests specifically to speak to more than one Dealer, e.g. the winning dealer and another that may have the exact colour required.
Furthermore in some cases a Buyer may choose to go with a Dealer located in their immediate vicinity.
Our Call Centre also attempts (in most cases) to phone the winning dealer and congratulate them on their winning bid, and confirm we have sent the information required.')
INSERT [dbo].[Faqs] ([id], [faqtypeId], [question], [answer]) VALUES (30, 2, N'What happens if our dealership uses a different payment gateway than Seriti?', N'AutoNegotiator currently uses Seriti as gateway to the banks but in cases of other gateways being used we will send the dealer the application form.')
SET IDENTITY_INSERT [dbo].[Faqs] OFF
SET IDENTITY_INSERT [dbo].[FinanceHouse] ON 

INSERT [dbo].[FinanceHouse] ([id], [Value]) VALUES (1, N'absa')
INSERT [dbo].[FinanceHouse] ([id], [Value]) VALUES (2, N'standard bank')
INSERT [dbo].[FinanceHouse] ([id], [Value]) VALUES (3, N'wesbank')
SET IDENTITY_INSERT [dbo].[FinanceHouse] OFF
SET IDENTITY_INSERT [dbo].[PaymentGateway] ON 

INSERT [dbo].[PaymentGateway] ([id], [Value]) VALUES (1, N'Seriti')
INSERT [dbo].[PaymentGateway] ([id], [Value]) VALUES (2, N'Signio')
INSERT [dbo].[PaymentGateway] ([id], [Value]) VALUES (3, N'Dealernet')
INSERT [dbo].[PaymentGateway] ([id], [Value]) VALUES (4, N'Other')
SET IDENTITY_INSERT [dbo].[PaymentGateway] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([id], [Value]) VALUES (1, N'cash')
INSERT [dbo].[PaymentMethod] ([id], [Value]) VALUES (2, N'finance')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
SET IDENTITY_INSERT [dbo].[Provinces] ON 

INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (1, 1, N'Eastern Cape')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (2, 1, N'Free State')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (3, 1, N'Gauteng')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (4, 1, N'KwaZulu-Natal')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (5, 1, N'Limpopo')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (6, 1, N'Mpumalanga')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (7, 1, N'Northern Cape')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (8, 1, N'North West')
INSERT [dbo].[Provinces] ([id], [countryId], [name]) VALUES (9, 1, N'Western Cape')
SET IDENTITY_INSERT [dbo].[Provinces] OFF
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([id], [Value]) VALUES (1, N'Mr')
INSERT [dbo].[Titles] ([id], [Value]) VALUES (2, N'Mrs')
INSERT [dbo].[Titles] ([id], [Value]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[Titles] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (1, 1, N'Adelaide', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (2, 1, N'Alice', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (3, 1, N'Aliwal North', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (4, 1, N'Barkly East', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (5, 1, N'Bhisho', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (6, 1, N'Bizana', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (7, 1, N'Burgersdorp', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (8, 1, N'Butterworth', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (9, 1, N'Coffee Bay', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (10, 1, N'Cradock', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (11, 1, N'East London', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (12, 1, N'Elliot', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (13, 1, N'Flagstaff', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (14, 1, N'Fort Beaufort', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (15, 1, N'Graaff-Reinet', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (16, 1, N'Grahamstown', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (17, 1, N'Jansenville', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (18, 1, N'Jeffreys Bay', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (19, 1, N'Kareedouw', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (20, 1, N'Kirkwood', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (21, 1, N'Mdantsane', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (22, 1, N'Middelburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (23, 1, N'Port Alfred', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (24, 1, N'Port Elizabeth', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (25, 1, N'Port St Johns', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (26, 1, N'Queenstown', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (27, 1, N'Somerset East', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (28, 1, N'Stutterheim', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (29, 1, N'Uitenhage', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (30, 1, N'Umtata / Mthatha', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (31, 1, N'Willowmore', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (32, 1, N'Willowvale', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (33, 1, N'Town not listed -Eastern Cape', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (34, 2, N'Bethlehem', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (35, 2, N'Bloemfontein', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (36, 2, N'Botshabelo', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (37, 2, N'Brandfort', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (38, 2, N'Bultfontein', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (39, 2, N'Clocolan', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (40, 2, N'Deneysville', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (41, 2, N'Frankfort', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (42, 2, N'Harrismith', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (43, 2, N'Heilbron', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (44, 2, N'Hennenman', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (45, 2, N'Hoopstad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (46, 2, N'Koffiefontein', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (47, 2, N'Koppies', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (48, 2, N'Kroonstad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (49, 2, N'Ladybrand', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (50, 2, N'Parys', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (51, 2, N'Phuthaditjhaba', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (52, 2, N'Reitz', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (53, 2, N'Sasolburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (54, 2, N'Senekal', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (55, 2, N'Springfontein', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (56, 2, N'Thaba ''Nchu', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (57, 2, N'Theunissen', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (58, 2, N'Viljoenskroon', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (59, 2, N'Virginia', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (60, 2, N'Vrede', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (61, 2, N'Vredefort', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (62, 2, N'Welkom', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (63, 2, N'Wesselsbron', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (64, 2, N'Winburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (65, 2, N'Town not listed -Free State', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (66, 3, N'East Rand', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (67, 3, N'Johannesburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (68, 3, N'Pretoria / Tshwane', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (69, 3, N'Sedibeng', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (70, 3, N'West Rand', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (71, 3, N'Town not listed -Gauteng', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (72, 4, N'Drakensberg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (73, 4, N'Durban City', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (74, 4, N'Midlands', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (75, 4, N'North Coast', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (76, 4, N'North Suburbs', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (77, 4, N'South Coast (Ugu)', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (78, 4, N'South Suburbs', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (79, 4, N'West Suburbs', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (80, 4, N'Town not listed -KwaZulu-Natal', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (81, 5, N'Bela-Bela / Warmbad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (82, 5, N'Dendron', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (83, 5, N'Giyani', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (84, 5, N'Lebowakgomo', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (85, 5, N'Lephalale / Ellisras', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (86, 5, N'Louis Trichardt', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (87, 5, N'Lulekani', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (88, 5, N'Mankweng', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (89, 5, N'Marblehall', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (90, 5, N'Modimolle / Nylstroom', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (91, 5, N'Modjadji / Duiwelskloof', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (92, 5, N'Mokopane / Potgietersrus', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (93, 5, N'Musina / Messina', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (94, 5, N'Mutale', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (95, 5, N'Nkowankowa', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (96, 5, N'Phalaborwa', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (97, 5, N'Polokwane / Pietersburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (98, 5, N'Soekmekaar', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (99, 5, N'Thabazimbi', 1)
GO
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (100, 5, N'Thohoyandou', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (101, 5, N'Thulamela', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (102, 5, N'Tzaneen', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (103, 5, N'Town not listed Limpopo', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (104, 6, N'Balfour', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (105, 6, N'Barberton', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (106, 6, N'Bethal', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (107, 6, N'Breyten', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (108, 6, N'Bushbuckridge', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (109, 6, N'Carolina', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (110, 6, N'Delmas', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (111, 6, N'Dullstroom', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (112, 6, N'Ekangala', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (113, 6, N'eMakhazeni / Belfast', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (114, 6, N'Embalenhle', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (115, 6, N'Empuluzi', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (116, 6, N'Ermelo', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (117, 6, N'Greylingstad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (118, 6, N'Groblersdal', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (119, 6, N'Hazyview', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (120, 6, N'Hendrina', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (121, 6, N'Komatipoort', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (122, 6, N'Kriel', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (123, 6, N'KwaNgema', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (124, 6, N'Leslie / Lebogang', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (125, 6, N'Lydenburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (126, 6, N'Machadodorp', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (127, 6, N'Malelane', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (128, 6, N'Mbombela / Nelspruit', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (129, 6, N'Middelburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (130, 6, N'New-Location', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (131, 6, N'Ogies / Phola', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (132, 6, N'Piet Retief', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (133, 6, N'Sabie', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (134, 6, N'Secunda', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (135, 6, N'Siyabuswa', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (136, 6, N'Standerton', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (137, 6, N'Volksrust', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (138, 6, N'Wakkerstroom', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (139, 6, N'Witbank', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (140, 6, N'Witrivier', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (141, 6, N'Town not listed -Mpumalanga', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (142, 7, N'Alexander Bay', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (143, 7, N'Barkly West', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (144, 7, N'Beeshoek', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (145, 7, N'Calvinia', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (146, 7, N'Carnarvon', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (147, 7, N'Colesberg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (148, 7, N'Danielskuil', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (149, 7, N'De Aar', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (150, 7, N'Fraserburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (151, 7, N'Garies', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (152, 7, N'Griekwastad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (153, 7, N'Groblershoop', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (154, 7, N'Hartswater', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (155, 7, N'Jan Kempdorp', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (156, 7, N'Kathu', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (157, 7, N'Keimoes', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (158, 7, N'Kimberley', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (159, 7, N'Kuruman', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (160, 7, N'Mier', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (161, 7, N'Pampierstad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (162, 7, N'Pofadder', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (163, 7, N'Port Nolloth', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (164, 7, N'Postmasburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (165, 7, N'Prieska', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (166, 7, N'Ritchie', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (167, 7, N'Springbok', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (168, 7, N'Strydenburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (169, 7, N'Sutherland', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (170, 7, N'Upington', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (171, 7, N'Vanderkloof', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (172, 7, N'Victoria West', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (173, 7, N'Warrenton', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (174, 7, N'Town not listed -Northern Cape', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (175, 8, N'Bloemhof', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (176, 8, N'Bray', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (177, 8, N'Brits', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (178, 8, N'Christiana', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (179, 8, N'Delareyville', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (180, 8, N'Fochville', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (181, 8, N'Hartbeespoort', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (182, 8, N'Klerksdorp', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (183, 8, N'Koster', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (184, 8, N'Lichtenburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (185, 8, N'Mabopane', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (186, 8, N'Magaliesburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (187, 8, N'Mahikeng / Mafikeng', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (188, 8, N'Mmbatho', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (189, 8, N'Mogwase', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (190, 8, N'Mothibistad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (191, 8, N'Orkney', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (192, 8, N'Ottosdal / Letsopa', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (193, 8, N'Pomfret', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (194, 8, N'Potchefstroom', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (195, 8, N'Reivilo', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (196, 8, N'Rustenburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (197, 8, N'Schweizer-Reneke', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (198, 8, N'Stella', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (199, 8, N'Stilfontein', 1)
GO
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (200, 8, N'Ventersdorp', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (201, 8, N'Vryburg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (202, 8, N'Wolmaransstad', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (203, 8, N'Zeerust', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (204, 8, N'Town not listed -North West', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (205, 9, N'Atlantic Seaboard', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (206, 9, N'Cape Flats', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (207, 9, N'Cape Town', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (208, 9, N'Cape Winelands', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (209, 9, N'Central Karoo', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (210, 9, N'Eden', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (211, 9, N'Helderberg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (212, 9, N'Northern Suburbs', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (213, 9, N'Overberg', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (214, 9, N'Southern Peninsula', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (215, 9, N'Southern Suburbs', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (216, 9, N'West Coast', 1)
INSERT [dbo].[Towns] ([id], [provinceId], [name], [isActive]) VALUES (217, 9, N'Town not listed -Western Cape', 1)
SET IDENTITY_INSERT [dbo].[Towns] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [titleId], [userTypeId], [firstName], [lastName], [contactNumber], [emailAddress], [password], [rememberMe], [provinceId], [townId], [createdDate], [modifiedDate], [lastLoginDate]) VALUES (1, 1, 1, N'admin', N'admin', N'0743760125', N'admin@gmail.com', N'admin123', NULL, 3, 69, CAST(N'2018-11-15T11:13:47.260' AS DateTime), CAST(N'2018-11-15T11:13:47.260' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([id], [Value]) VALUES (1, N'admin')
INSERT [dbo].[UserTypes] ([id], [Value]) VALUES (2, N'agent')
INSERT [dbo].[UserTypes] ([id], [Value]) VALUES (3, N'superuser')
INSERT [dbo].[UserTypes] ([id], [Value]) VALUES (4, N'Dealer')
INSERT [dbo].[UserTypes] ([id], [Value]) VALUES (5, N'Client')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
/****** Object:  Index [IX_FK_Bids_CarRequest]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bids_CarRequest] ON [dbo].[Bids]
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Bids_Dealer]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Bids_Dealer] ON [dbo].[Bids]
(
	[dealerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_Car]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_Car] ON [dbo].[CarRequests]
(
	[carVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_CarMake]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_CarMake] ON [dbo].[CarRequests]
(
	[tradeinMakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_CarModel]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_CarModel] ON [dbo].[CarRequests]
(
	[tradeinModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_CarVariant]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_CarVariant] ON [dbo].[CarRequests]
(
	[tradeinVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_CarVariantFuel]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_CarVariantFuel] ON [dbo].[CarRequests]
(
	[tradeinFuelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_CarVariantYear]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_CarVariantYear] ON [dbo].[CarRequests]
(
	[tradeinYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_Client]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_Client] ON [dbo].[CarRequests]
(
	[clientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_lookup]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_lookup] ON [dbo].[CarRequests]
(
	[colorChoice1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_lookup1]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_lookup1] ON [dbo].[CarRequests]
(
	[colorChoice2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_lookup2]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_lookup2] ON [dbo].[CarRequests]
(
	[colorChoice3Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_lookup3]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_lookup3] ON [dbo].[CarRequests]
(
	[colorChoice3Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarRequest_lookup4]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarRequest_lookup4] ON [dbo].[CarRequests]
(
	[paymentMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CarVariant_CarModel]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_CarVariant_CarModel] ON [dbo].[CarVariants]
(
	[carModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClientLogins_Client]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClientLogins_Client] ON [dbo].[ClientLogins]
(
	[clientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Client_lookup]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Client_lookup] ON [dbo].[Clients]
(
	[titleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Client_lookup1]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Client_lookup1] ON [dbo].[Clients]
(
	[bestTimeToContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Client_Town]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Client_Town] ON [dbo].[Clients]
(
	[townId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DealerLogins_Dealer]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DealerLogins_Dealer] ON [dbo].[DealerLogins]
(
	[dealerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DealerMakes_CarMake]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DealerMakes_CarMake] ON [dbo].[DealerMakes]
(
	[carMakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DealerMakes_Dealer]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DealerMakes_Dealer] ON [dbo].[DealerMakes]
(
	[dealerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DealerProvince_Dealer]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DealerProvince_Dealer] ON [dbo].[DealerProvinces]
(
	[dealerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DealerProvince_Province]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DealerProvince_Province] ON [dbo].[DealerProvinces]
(
	[provinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Dealer_lookup]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Dealer_lookup] ON [dbo].[Dealers]
(
	[titleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Dealer_Town]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Dealer_Town] ON [dbo].[Dealers]
(
	[townId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_faq_lookup]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_faq_lookup] ON [dbo].[Faqs]
(
	[faqtypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Province_Country]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Province_Country] ON [dbo].[Provinces]
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Town_Province]    Script Date: 2019/01/14 19:23:23 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Town_Province] ON [dbo].[Towns]
(
	[provinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Email]    Script Date: 2019/01/14 19:23:23 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Email] UNIQUE NONCLUSTERED 
(
	[emailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_CarRequest] FOREIGN KEY([requestId])
REFERENCES [dbo].[CarRequests] ([id])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_CarRequest]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Dealer] FOREIGN KEY([dealerId])
REFERENCES [dbo].[Dealers] ([id])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Dealer]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequest_Client] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequest_Client]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequest_TradeInCarMake] FOREIGN KEY([tradeinMakeId])
REFERENCES [dbo].[CarMakes] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequest_TradeInCarMake]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequest_TradeInCarModel] FOREIGN KEY([tradeinModelId])
REFERENCES [dbo].[CarModels] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequest_TradeInCarModel]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequest_TradeInCarVariant] FOREIGN KEY([tradeinVariantId])
REFERENCES [dbo].[CarVariants] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequest_TradeInCarVariant]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_CarVariantFuels_TradeInFuelId] FOREIGN KEY([tradeinFuelId])
REFERENCES [dbo].[CarVariantFuels] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_CarVariantFuels_TradeInFuelId]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_CarVariants] FOREIGN KEY([carVariantId])
REFERENCES [dbo].[CarVariants] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_CarVariants]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_CarVariantYears_TradeinYearId] FOREIGN KEY([tradeinYearId])
REFERENCES [dbo].[CarVariantYears] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_CarVariantYears_TradeinYearId]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_Colors_Color1] FOREIGN KEY([colorChoice1Id])
REFERENCES [dbo].[Colors] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_Colors_Color1]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_Colors_Color2] FOREIGN KEY([colorChoice2Id])
REFERENCES [dbo].[Colors] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_Colors_Color2]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_Colors_Color3] FOREIGN KEY([colorChoice3Id])
REFERENCES [dbo].[Colors] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_Colors_Color3]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_FinanceHouse] FOREIGN KEY([financeHouseId])
REFERENCES [dbo].[FinanceHouse] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_FinanceHouse]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_PaymentMethod] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[PaymentMethod] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_PaymentMethod]
GO
ALTER TABLE [dbo].[CarRequests]  WITH CHECK ADD  CONSTRAINT [FK_CarRequests_WinningBid] FOREIGN KEY([winningBidId])
REFERENCES [dbo].[Bids] ([id])
GO
ALTER TABLE [dbo].[CarRequests] CHECK CONSTRAINT [FK_CarRequests_WinningBid]
GO
ALTER TABLE [dbo].[CarVariants]  WITH CHECK ADD  CONSTRAINT [FK_CarVariant_CarModel] FOREIGN KEY([carModelId])
REFERENCES [dbo].[CarModels] ([id])
GO
ALTER TABLE [dbo].[CarVariants] CHECK CONSTRAINT [FK_CarVariant_CarModel]
GO
ALTER TABLE [dbo].[ClientLogins]  WITH CHECK ADD  CONSTRAINT [FK_ClientLogins_Client] FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
GO
ALTER TABLE [dbo].[ClientLogins] CHECK CONSTRAINT [FK_ClientLogins_Client]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Client_Town] FOREIGN KEY([townId])
REFERENCES [dbo].[Towns] ([id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Client_Town]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_BestTimeToContact] FOREIGN KEY([bestTimeToContactId])
REFERENCES [dbo].[BestTimeToContact] ([id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_BestTimeToContact]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Provinces] FOREIGN KEY([provinceId])
REFERENCES [dbo].[Provinces] ([id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Provinces]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Titles] FOREIGN KEY([titleId])
REFERENCES [dbo].[Titles] ([id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Titles]
GO
ALTER TABLE [dbo].[DealerLogins]  WITH CHECK ADD  CONSTRAINT [FK_DealerLogins_Dealer] FOREIGN KEY([dealerId])
REFERENCES [dbo].[Dealers] ([id])
GO
ALTER TABLE [dbo].[DealerLogins] CHECK CONSTRAINT [FK_DealerLogins_Dealer]
GO
ALTER TABLE [dbo].[DealerMakes]  WITH CHECK ADD  CONSTRAINT [FK_DealerMakes_CarMake] FOREIGN KEY([carMakeId])
REFERENCES [dbo].[CarMakes] ([id])
GO
ALTER TABLE [dbo].[DealerMakes] CHECK CONSTRAINT [FK_DealerMakes_CarMake]
GO
ALTER TABLE [dbo].[DealerMakes]  WITH CHECK ADD  CONSTRAINT [FK_DealerMakes_Dealer] FOREIGN KEY([dealerId])
REFERENCES [dbo].[Dealers] ([id])
GO
ALTER TABLE [dbo].[DealerMakes] CHECK CONSTRAINT [FK_DealerMakes_Dealer]
GO
ALTER TABLE [dbo].[DealerProvinces]  WITH CHECK ADD  CONSTRAINT [FK_DealerProvince_Dealer] FOREIGN KEY([dealerId])
REFERENCES [dbo].[Dealers] ([id])
GO
ALTER TABLE [dbo].[DealerProvinces] CHECK CONSTRAINT [FK_DealerProvince_Dealer]
GO
ALTER TABLE [dbo].[DealerProvinces]  WITH CHECK ADD  CONSTRAINT [FK_DealerProvince_Province] FOREIGN KEY([provinceId])
REFERENCES [dbo].[Provinces] ([id])
GO
ALTER TABLE [dbo].[DealerProvinces] CHECK CONSTRAINT [FK_DealerProvince_Province]
GO
ALTER TABLE [dbo].[Dealers]  WITH CHECK ADD  CONSTRAINT [FK_Dealer_Town] FOREIGN KEY([townId])
REFERENCES [dbo].[Towns] ([id])
GO
ALTER TABLE [dbo].[Dealers] CHECK CONSTRAINT [FK_Dealer_Town]
GO
ALTER TABLE [dbo].[Dealers]  WITH CHECK ADD  CONSTRAINT [FK_Dealers_PaymentGateway] FOREIGN KEY([paymentGatewayId])
REFERENCES [dbo].[PaymentGateway] ([id])
GO
ALTER TABLE [dbo].[Dealers] CHECK CONSTRAINT [FK_Dealers_PaymentGateway]
GO
ALTER TABLE [dbo].[Dealers]  WITH CHECK ADD  CONSTRAINT [FK_Dealers_Provinces] FOREIGN KEY([provinceId])
REFERENCES [dbo].[Provinces] ([id])
GO
ALTER TABLE [dbo].[Dealers] CHECK CONSTRAINT [FK_Dealers_Provinces]
GO
ALTER TABLE [dbo].[Dealers]  WITH CHECK ADD  CONSTRAINT [FK_Dealers_Titles] FOREIGN KEY([titleId])
REFERENCES [dbo].[Titles] ([id])
GO
ALTER TABLE [dbo].[Dealers] CHECK CONSTRAINT [FK_Dealers_Titles]
GO
ALTER TABLE [dbo].[Faqs]  WITH CHECK ADD  CONSTRAINT [FK_Faqs_Faq_Types] FOREIGN KEY([faqtypeId])
REFERENCES [dbo].[Faq_Types] ([id])
GO
ALTER TABLE [dbo].[Faqs] CHECK CONSTRAINT [FK_Faqs_Faq_Types]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Province_Country] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Province_Country]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Town_Province] FOREIGN KEY([provinceId])
REFERENCES [dbo].[Provinces] ([id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Town_Province]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_User] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_User]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Provinces] FOREIGN KEY([provinceId])
REFERENCES [dbo].[Provinces] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Provinces]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Towns] FOREIGN KEY([townId])
REFERENCES [dbo].[Towns] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Towns]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([userTypeId])
REFERENCES [dbo].[UserTypes] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [AutoNegotiatorDB] SET  READ_WRITE 
GO
