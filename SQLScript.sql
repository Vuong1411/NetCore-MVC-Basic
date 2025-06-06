USE [master]
GO
/****** Object:  Database [TechStore]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE DATABASE [TechStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TechStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TechStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TechStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechStore] SET  MULTI_USER 
GO
ALTER DATABASE [TechStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TechStore] SET QUERY_STORE = OFF
GO
USE [TechStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
	[FullName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/11/2025 7:37:10 PM ******/
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
/****** Object:  Table [dbo].[Carts]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[PaymentMethod] [nvarchar](20) NULL,
	[PaymentStatus] [nvarchar](20) NULL,
	[PaymentDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CategoryID] [int] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Stock] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Specifications] [nvarchar](max) NULL,
	[ImageURLs] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/11/2025 7:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NULL,
	[Role] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250409081917_InitIdentity', N'8.0.14')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250409092852_AddFullNameToUserIdentity', N'8.0.14')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2582a1a5-4e35-4789-9e8d-ea83a4c43477', N'client', NULL, NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c96f8ed2-8b5e-4062-8389-6ccc1c522d22', N'admin', NULL, NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3b60ac33-fd7c-46a8-bf07-c586b2bd175c', N'c96f8ed2-8b5e-4062-8389-6ccc1c522d22')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName]) VALUES (N'3b60ac33-fd7c-46a8-bf07-c586b2bd175c', N'vuong@gmail.com', N'VUONG@GMAIL.COM', N'vuong@gmail.com', N'VUONG@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMrHDxF7aA2wEJzo+12kXZn3PemFBLQQ1AkBLXtJxDIbWLzBzUZVaEQHVzSpB9OMoQ==', N'7MQ6SNNUBNXCFYO7YDQXNXVFITP4KWTE', N'e216d289-790c-4b6d-ba5c-a7ebc6b6637a', NULL, 0, 0, NULL, 1, 0, N'Trần Dy Vương')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName]) VALUES (N'5f261ff8-c54a-47ea-a285-84cbae860f22', N'Morkath@gmail.com', N'MORKATH@GMAIL.COM', N'Morkath@gmail.com', N'MORKATH@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMFCqWt9EPpXnWQf66o/y6WTyvXagYmcuTGWVzQ+iCR2eNamN8W8roIJCyIu7BO9GQ==', N'IOCK53IWUO65O7FK42BJ74ICPO4FUJIN', N'ac59db79-0aaf-4351-a912-e341d8c0c784', N'0123456789', 0, 0, NULL, 1, 0, N'Tran Duy Vuong')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName]) VALUES (N'6937e9aa-d674-4518-8796-3bdda95a6485', N'morkaths@gmail.com', N'MORKATHS@GMAIL.COM', N'morkaths@gmail.com', N'MORKATHS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBgcvLhLikwQbL7vIVvcMMOpiCj65/JLRZU6YmRxpmOHkJP/9srKG6XPyzHwHleUtw==', N'APJBPSX6MEXJIADPB3TCJMVW6JJZCP76', N'0aaf6f71-e119-41be-bdbb-ec6a3924c871', N'0123456789', 0, 0, NULL, 1, 0, N'Tran Duy Vuong')
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartID], [UserID], [ProductID], [Quantity], [CreatedAt]) VALUES (4, 3, 4, 3, CAST(N'2025-03-26T14:59:26.017' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Clock')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Laptops')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'PC')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Smartphones')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Tablet')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Subtotal]) VALUES (4, 3, 4, 3, CAST(299.97 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status]) VALUES (1, 1, CAST(N'2025-03-26T14:59:26.023' AS DateTime), CAST(1799.98 AS Decimal(10, 2)), N'pending')
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status]) VALUES (2, 2, CAST(N'2025-03-26T14:59:26.023' AS DateTime), CAST(649.99 AS Decimal(10, 2)), N'completed')
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalAmount], [Status]) VALUES (3, 3, CAST(N'2025-03-26T14:59:26.023' AS DateTime), CAST(299.97 AS Decimal(10, 2)), N'processing')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [OrderID], [PaymentMethod], [PaymentStatus], [PaymentDate]) VALUES (1, 1, N'cod', N'pending', CAST(N'2025-03-26T14:59:26.033' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [OrderID], [PaymentMethod], [PaymentStatus], [PaymentDate]) VALUES (2, 2, N'credit_card', N'paid', CAST(N'2025-03-26T14:59:26.033' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [OrderID], [PaymentMethod], [PaymentStatus], [PaymentDate]) VALUES (3, 3, N'paypal', N'failed', CAST(N'2025-03-26T14:59:26.033' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (4, N'Logitech MX Master 3', 3, CAST(99.99 AS Decimal(10, 2)), 50, N'Wireless mouse with ergonomic design.', N'{"DPI": "4000", "Battery Life": "70 days"}', N'product6.jpg;product6.jpg', CAST(N'2025-03-26T14:59:26.010' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (6, N'iPhone 15 Pro Max', 2, CAST(599.00 AS Decimal(10, 2)), 2, N'Điện thoại của iPhone đời mới nhất', NULL, N'7255b1ce-915e-42be-8e8b-b195a1b2fac4.jpeg;e5919e5d-b257-4fb3-b4c8-a6871ce4cfb5.jpeg;e831bf1e-3f09-4b46-be5b-1fbc564e5ea2.jpg;f5a6ac4f-2ce1-4ecd-a415-258feb97b206.jpg;5ddfd0ed-30a7-4df0-9e3b-3f46e40b37c1.jpg;58a78e50-c492-4873-8031-6dc3c84c12b0.jpg', CAST(N'2025-03-26T18:31:52.013' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (7, N'Samsung Galaxy S25 Ultra 12GB 256GB', 1, CAST(369.00 AS Decimal(10, 2)), 0, N'Điện thoại của Sam Sung', NULL, N'9a9c17f1-0c75-4d61-aa37-dee578061f23.jpg;6549f5cf-4ca5-4978-9bd1-cfa522404584.jpg;77c8f453-0961-41b7-9f26-8108fd5c23c7.jpg;cd3c56a9-4fc5-452d-a84b-5f72a6715481.jpg', CAST(N'2025-03-26T18:34:34.750' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (8, N'Samsung Galaxy S25 Zip', 2, CAST(599.00 AS Decimal(10, 2)), 0, N'Điện thoại gập hãng Sam Sung', NULL, N'9c7e0867-16b9-407a-8fdb-bc81cf246884.jpg;ac661b07-dee3-4ca0-884f-887080419d67.jpg;7b71f1c5-fdaa-4eac-a403-7290cb92963a.jpg;e872aecc-95f4-4aae-8952-db1d1fabd3f5.jpg;ba7231b6-31a0-47cc-977c-920da85bfbfa.jpg;04cdc7f3-b29f-4845-b488-c3d3e4aa0e9b.jpg', CAST(N'2025-03-26T18:35:46.897' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (9, N'Xiaomi 15 5G 12GB 256GB', 2, CAST(399.00 AS Decimal(10, 2)), 0, N'Điện thoại trung quốc đa nhiệm', NULL, N'fac58de3-3101-47ae-83a3-9bdb3fa346bb.jpg;4047a060-9ef7-40f7-83b5-20e0461fa56b.jpg;9d194557-4b48-4c14-9e0b-9f129780070a.jpg;c1c2938d-4e22-4cba-8fde-99af10615a5d.jpg;b5910c78-d772-4ef3-a0e8-9eb2a57aaf4b.jpg;053f17dc-823e-47ae-8eb1-32716fc172d3.jpg', CAST(N'2025-03-26T18:36:45.777' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (10, N'PC TUF Gamming', 4, CAST(399.00 AS Decimal(10, 2)), 0, N'PC mạnh chơi game tốt', NULL, N'5c8f6838-73ae-4b81-9e70-e0323445342e.jpeg;078a3763-b881-48ed-877e-05f431058f92.jpeg;abee10ac-222f-48f6-8cc5-a9a03837b2fa.jpeg;ceea182f-ee5b-467d-9b07-ab83d0f71c4e.jpeg;36e19222-fee8-4ba6-95fc-188f7b372baf.jpeg', CAST(N'2025-03-26T18:37:51.180' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (11, N'PC LG UtraGear', 4, CAST(399.00 AS Decimal(10, 2)), 0, N'Hàng rẻ chất lượng cao, xem đã mắt', NULL, N'c07232e4-4784-4f68-8e13-7c59defe311b.jpeg;ea9a70bb-409a-489c-beff-03d22d1eb261.jpeg;b0c67e53-321d-4fbe-b777-fb9e6df04b9b.jpeg;532c453a-11a4-4aa6-8898-8a687ad1a2e0.jpeg;2f6aee46-57d6-4a8f-b905-2c57c91eaaf7.jpeg;8539455a-2030-496b-9b99-54cc5641a81a.jpeg', CAST(N'2025-03-26T18:38:58.730' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (12, N'Macbook Utra 15', 1, CAST(599.00 AS Decimal(10, 2)), 0, N'Dòng macbook dành cho giới thượng lưu', NULL, N'72cd6780-9865-44ef-a7b8-21cced4517b1.jpg;aee64632-1050-429b-91fa-b44ae1e84ef5.jpg;ce549f7c-d1a0-4d53-b3be-cee03ed3a86a.jpg;e9316f4d-07be-44c9-87b8-9e6313cf8030.jpg;4674ff84-c40f-4954-8b3a-35325326b62c.jpg;c8488ff5-2a9a-4726-92ce-67f1c7447de8.jpg', CAST(N'2025-03-26T18:39:59.727' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (13, N'Apple Mac Studio M4 Max 2025 14CPU 32GPU', 1, CAST(799.00 AS Decimal(10, 2)), 0, N'Hàng xịn xem phim cùng gia đình', NULL, N'292ea01f-0a9d-4afa-b047-a0f0ac2973c1.jpg;45d2c5a1-706e-45b4-8596-91c1fe0e7ae7.jpg;62a1c1d0-710e-4d74-9e24-be0500bb5752.jpg;c8d898d2-5bb3-4946-b21b-1d408608fd0f.jpg;50c97c81-10d3-43bb-9ce4-537a414a4c65.jpg;f73ddcf8-d72f-4b10-a4a1-09763b342280.jpg', CAST(N'2025-03-26T18:40:52.957' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (14, N'Laptop Gaming Acer Nitro V ANV15-51-58AN', 1, CAST(699.00 AS Decimal(10, 2)), 0, N'Laptop gaming dành cho game thủ thích đi học', NULL, N'677b688e-7c0d-4f8b-bb50-82d5b3682a6e.jpg;36d15bb6-5e42-49cd-919f-fb8e7bdefb5b.jpg;67f610dc-f6a3-418b-9a3e-e39cf9b9825e.jpg;1d924746-77bf-4916-9bd6-43b23cf94828.jpg;65daf46a-ad06-4b6c-8ca0-6b1d5acd7cd4.jpg', CAST(N'2025-03-26T18:41:35.080' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CategoryID], [Price], [Stock], [Description], [Specifications], [ImageURLs], [CreatedAt]) VALUES (19, N'Huawai Watch GT5', 5, CAST(299.00 AS Decimal(10, 2)), 2, N'Đồng hồ trung quốc sang trọng, lịch lãm, phong trần', NULL, N'9dcec582-3d86-44a3-8eb7-bee02abb9b47.jpeg;d78d0d2d-d3d7-49bf-a728-3c9db2e577a8.jpeg;291e6308-f71a-400e-bd28-3c44f9522fd7.jpeg;df33f5ff-305e-4165-aa26-84086d0b77b2.jpeg;7c37664d-96e0-401a-b805-c4ade1562587.jpeg;9e167e92-0acf-494b-af7f-c0c5412ccbeb.jpeg', CAST(N'2025-03-30T23:37:23.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Phone], [Address], [Role], [CreatedAt]) VALUES (1, N'Nguy?n Van A', N'nguyenvana@example.com', N'hashedpassword1', N'0901234567', N'Hà N?i', N'client', CAST(N'2025-03-26T14:59:25.990' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Phone], [Address], [Role], [CreatedAt]) VALUES (2, N'Tr?n Th? B', N'tranthib@example.com', N'hashedpassword2', N'0912345678', N'TP.HCM', N'client', CAST(N'2025-03-26T14:59:25.990' AS DateTime))
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password], [Phone], [Address], [Role], [CreatedAt]) VALUES (3, N'Admin', N'admin@example.com', N'012345', N'0999888777', N'Bình Ð?nh', N'admin', CAST(N'2025-03-26T14:59:25.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/11/2025 7:37:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Carts__DCC800C3FD554B93]    Script Date: 4/11/2025 7:37:10 PM ******/
ALTER TABLE [dbo].[Carts] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__8517B2E025EB23DF]    Script Date: 4/11/2025 7:37:10 PM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053461EABAB7]    Script Date: 4/11/2025 7:37:10 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [FullName]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ('cod') FOR [PaymentMethod]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ('pending') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('customer') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
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
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [TechStore] SET  READ_WRITE 
GO
