USE [master]
GO
/****** Object:  Database [shoppingcart]    Script Date: 12/7/2023 8:22:31 pm ******/
CREATE DATABASE [shoppingcart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoppingcart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shoppingcart.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shoppingcart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shoppingcart_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shoppingcart] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoppingcart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoppingcart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoppingcart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoppingcart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoppingcart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoppingcart] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoppingcart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoppingcart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoppingcart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoppingcart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoppingcart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoppingcart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoppingcart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoppingcart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoppingcart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoppingcart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shoppingcart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoppingcart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoppingcart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoppingcart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoppingcart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoppingcart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoppingcart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoppingcart] SET RECOVERY FULL 
GO
ALTER DATABASE [shoppingcart] SET  MULTI_USER 
GO
ALTER DATABASE [shoppingcart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoppingcart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoppingcart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoppingcart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoppingcart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shoppingcart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shoppingcart', N'ON'
GO
ALTER DATABASE [shoppingcart] SET QUERY_STORE = OFF
GO
USE [shoppingcart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[AppUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/7/2023 8:22:31 pm ******/
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
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NULL,
	[DeliveryTime] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemOrdered_ProductItemId] [int] NULL,
	[ItemOrdered_ProductName] [nvarchar](max) NULL,
	[ItemOrdered_PictureUrl] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerEmail] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[ShipToAddress_FirstName] [nvarchar](max) NULL,
	[ShipToAddress_LastName] [nvarchar](max) NULL,
	[ShipToAddress_Street] [nvarchar](max) NULL,
	[ShipToAddress_City] [nvarchar](max) NULL,
	[ShipToAddress_State] [nvarchar](max) NULL,
	[ShipToAddress_ZipCode] [nvarchar](max) NULL,
	[DeliveryMethodId] [int] NULL,
	[Subtotal] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[PaymentIntentId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBrands]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBrands](
	[Id] [int] NOT NULL,
	[Name] [text] NULL,
 CONSTRAINT [PK_ProductBrands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PictureUrl] [varchar](max) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductBrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 12/7/2023 8:22:31 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] NOT NULL,
	[Name] [text] NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220725144650_initialcreate', N'6.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701042549_IdentityInitial', N'6.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230712021830_OrderEntity', N'6.0.2')
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [FirstName], [LastName], [Street], [City], [State], [ZipCode], [AppUserId]) VALUES (2, N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90900', N'c4f9bb05-85a7-4e34-8f55-791f9fc4f0d9')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0af74ff4-fd14-4c61-bfc0-40df2983adcf', N'test', N'test1@test.com', N'TEST1@TEST.COM', N'test1@test.com', N'TEST1@TEST.COM', 0, N'AQAAAAEAACcQAAAAENYuGbJuKD6NM6hgNqAmJ12qo6y7D3dHNKhcY3g/aQqPGPwv/b8/bTpp246bxVHPGw==', N'SHDS733D7BCKMF6AN2YT2S5YMJR36UYB', N'848a774b-d62b-4a44-9d57-8aca35c7f932', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c4f9bb05-85a7-4e34-8f55-791f9fc4f0d9', N'Bob', N'bob@test.com', N'BOB@TEST.COM', N'bob@test.com', N'BOB@TEST.COM', 0, N'AQAAAAEAACcQAAAAEOcxaJchGCxf2PMzmBZAfD6z37Hyd3nsbyvxNRKCl88VcuXGN4w4gt/T3G7bm5+1dA==', N'5A72Q2OOLN4QT64CDJP3TPH2NWGLTMXG', N'bd4c9e5f-6058-49db-ae53-324a0711f623', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd932cba0-a5d8-471b-a449-d0f44cd7a23f', N'test', N'test@test.com', N'TEST@TEST.COM', N'test@test.com', N'TEST@TEST.COM', 0, N'AQAAAAEAACcQAAAAEJUXqdGd4PAEfbSWWmipGvBL8/kxLetg1jqe2Emwvlyx8oh0X4FeiuWiWb49sSPZPQ==', N'Q5BTJYC5YJP7UHRQJB7W4AZPLBAOYTGV', N'c17e4fe4-26d2-4ffe-a142-567b4c640c7c', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (1, N'UPS1', N'1-2 Days', N'Fastest delivery time', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (2, N'UPS2', N'2-5 Days', N'Get it within 5 days', CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (3, N'UPS3', N'5-10 Days', N'Slower but cheap', CAST(2.55 AS Decimal(18, 2)))
INSERT [dbo].[DeliveryMethods] ([Id], [ShortName], [DeliveryTime], [Description], [Price]) VALUES (4, N'FREE', N'1-2 Weeks', N'Free! You get what you pay for', CAST(0.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (1, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (2, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (3, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 3)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (4, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 4)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (5, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 5)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (6, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 6)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (7, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 7)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (8, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (9, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 8)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (10, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 9)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (11, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 3, 10)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (12, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 8, 11)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (13, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 8, 13)
INSERT [dbo].[OrderItems] ([Id], [ItemOrdered_ProductItemId], [ItemOrdered_ProductName], [ItemOrdered_PictureUrl], [Price], [Quantity], [OrderId]) VALUES (14, 4, N'Net Core Super Board', N'images/products/sb-core2.png', CAST(300.00 AS Decimal(18, 2)), 8, 12)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (1, NULL, CAST(N'2023-07-12T08:36:37.5163282' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(600.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (2, NULL, CAST(N'2023-07-12T08:37:05.0002264' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(600.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (3, NULL, CAST(N'2023-07-12T08:39:26.9394196' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (4, N'bob@test.com', CAST(N'2023-07-12T08:40:56.7608298' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (5, N'bob@test.com', CAST(N'2023-07-12T08:42:43.0343679' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (6, N'bob@test.com', CAST(N'2023-07-12T08:42:58.0346079' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (7, N'bob@test.com', CAST(N'2023-07-12T08:43:11.2425225' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (8, N'bob@test.com', CAST(N'2023-07-12T08:48:14.4321181' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(1800.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (9, N'bob@test.com', CAST(N'2023-07-12T08:50:41.9219886' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (10, N'bob@test.com', CAST(N'2023-07-12T08:59:58.3103200' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(900.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (11, N'bob@test.com', CAST(N'2023-07-12T09:10:57.4848474' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(2400.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (12, N'bob@test.com', CAST(N'2023-07-12T09:12:17.0919748' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(2400.00 AS Decimal(18, 2)), N'Pending', NULL)
INSERT [dbo].[Orders] ([Id], [BuyerEmail], [OrderDate], [ShipToAddress_FirstName], [ShipToAddress_LastName], [ShipToAddress_Street], [ShipToAddress_City], [ShipToAddress_State], [ShipToAddress_ZipCode], [DeliveryMethodId], [Subtotal], [Status], [PaymentIntentId]) VALUES (13, N'bob@test.com', CAST(N'2023-07-12T09:12:17.0919654' AS DateTime2), N'Bob', N'Bobbity', N'10 The Street', N'New York', N'NY', N'90250', 1, CAST(2400.00 AS Decimal(18, 2)), N'Pending', NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[ProductBrands] ([Id], [Name]) VALUES (1, N'Angular')
INSERT [dbo].[ProductBrands] ([Id], [Name]) VALUES (2, N'NetCore')
INSERT [dbo].[ProductBrands] ([Id], [Name]) VALUES (3, N'VS Code')
INSERT [dbo].[ProductBrands] ([Id], [Name]) VALUES (4, N'React')
INSERT [dbo].[ProductBrands] ([Id], [Name]) VALUES (5, N'Typescript')
INSERT [dbo].[ProductBrands] ([Id], [Name]) VALUES (6, N'Redis')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (1, N'Angular Speedster Board 2000', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis', CAST(200.00 AS Decimal(18, 2)), N'images/products/sb-ang1.png', 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (2, N'Green Angular Board 3000', N'Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.', CAST(150.00 AS Decimal(18, 2)), N'images/products/sb-ang2.png', 1, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (3, N'Core Board Speed Rush 3', N'Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.', CAST(180.00 AS Decimal(18, 2)), N'images/products/sb-core1.png', 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (4, N'Net Core Super Board', N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.', CAST(300.00 AS Decimal(18, 2)), N'images/products/sb-core2.png', 1, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (5, N'React Board Super Whizzy Fast', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.', CAST(250.00 AS Decimal(18, 2)), N'images/products/sb-react1.png', 1, 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (6, N'Typescript Entry Board', N'Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.', CAST(120.00 AS Decimal(18, 2)), N'images/products/sb-ts1.png', 1, 5)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (7, N'Core Blue Hat', N'Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.', CAST(10.00 AS Decimal(18, 2)), N'images/products/hat-core1.png', 2, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (8, N'Green React Woolen Hat', N'Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.', CAST(8.00 AS Decimal(18, 2)), N'images/products/hat-react1.png', 2, 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (9, N'Purple React Woolen Hat', N'Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.', CAST(15.00 AS Decimal(18, 2)), N'images/products/hat-react2.png', 2, 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (10, N'Blue Code Gloves', N'Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.', CAST(18.00 AS Decimal(18, 2)), N'images/products/glove-code1.png', 4, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (11, N'Green Code Gloves', N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.', CAST(15.00 AS Decimal(18, 2)), N'images/products/glove-code2.png', 4, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (12, N'Purple React Gloves', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa.', CAST(16.00 AS Decimal(18, 2)), N'images/products/glove-react1.png', 4, 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (13, N'Green React Gloves', N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.', CAST(14.00 AS Decimal(18, 2)), N'images/products/glove-react2.png', 4, 4)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (14, N'Redis Red Boots', N'Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.', CAST(250.00 AS Decimal(18, 2)), N'images/products/boot-redis1.png', 3, 6)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (15, N'Core Red Boots', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.', CAST(189.99 AS Decimal(18, 2)), N'images/products/boot-core2.png', 3, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (16, N'Core Purple Boots', N'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.', CAST(199.99 AS Decimal(18, 2)), N'images/products/boot-core1.png', 3, 2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (17, N'Angular Purple Boots', N'Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.', CAST(150.00 AS Decimal(18, 2)), N'images/products/boot-ang2.png', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [PictureUrl], [ProductTypeId], [ProductBrandId]) VALUES (18, N'Angular Blue Boots', N'Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.', CAST(180.00 AS Decimal(18, 2)), N'images/products/boot-ang1.png', 3, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (1, N'Boards')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (2, N'Hats')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (3, N'Boots')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (4, N'Gloves')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Address_AppUserId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Address_AppUserId] ON [dbo].[Address]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DeliveryMethodId]    Script Date: 12/7/2023 8:22:32 pm ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DeliveryMethodId] ON [dbo].[Orders]
(
	[DeliveryMethodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_AspNetUsers_AppUserId]
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
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId] FOREIGN KEY([DeliveryMethodId])
REFERENCES [dbo].[DeliveryMethods] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryMethods_DeliveryMethodId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductBrands_ProductBrandId] FOREIGN KEY([ProductBrandId])
REFERENCES [dbo].[ProductBrands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductBrands_ProductBrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
USE [master]
GO
ALTER DATABASE [shoppingcart] SET  READ_WRITE 
GO
