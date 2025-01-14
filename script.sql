USE [master]
GO
/****** Object:  Database [Project_Booking]    Script Date: 4/27/2020 15:50:31 ******/
CREATE DATABASE [Project_Booking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_Booking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MINHTB\MSSQL\DATA\Project_Booking.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Project_Booking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MINHTB\MSSQL\DATA\Project_Booking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Project_Booking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_Booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_Booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_Booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_Booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_Booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_Booking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_Booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_Booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_Booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_Booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_Booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_Booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_Booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_Booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_Booking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_Booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_Booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_Booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_Booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_Booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_Booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_Booking] SET  MULTI_USER 
GO
ALTER DATABASE [Project_Booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_Booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_Booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_Booking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Project_Booking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Project_Booking]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[PhoneNumber] [nvarchar](150) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountAdmin]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[AccountAdmin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccountAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin_Hotel]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin_Hotel](
	[AdminHotelID] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[Name_Admin] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Admin_Hotel] PRIMARY KEY CLUSTERED 
(
	[AdminHotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[CheckIn] [date] NOT NULL,
	[CheckOut] [date] NOT NULL,
	[HotelsID] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[BookTime] [date] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cancellation]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cancellation](
	[CanceID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[CheckIn] [date] NOT NULL,
	[CheckOut] [date] NOT NULL,
	[HotelsID] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ReasonCance] [nvarchar](500) NOT NULL,
	[BookTime] [date] NOT NULL,
	[CanceTime] [date] NOT NULL,
 CONSTRAINT [PK_Cancellation] PRIMARY KEY CLUSTERED 
(
	[CanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[PlaceID] [int] NOT NULL,
	[Descride] [nvarchar](500) NULL,
	[HotelName] [nvarchar](150) NOT NULL,
	[images] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PayMents]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayMents](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[PayTime] [date] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_PayMents] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Place]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[PlaceID] [int] IDENTITY(1,1) NOT NULL,
	[AddressPlace] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[PlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 4/27/2020 15:50:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNumber] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [varchar](150) NOT NULL,
	[PricePerNight] [float] NOT NULL,
	[MaxPerson] [int] NOT NULL,
	[IsFree] [bit] NOT NULL,
	[HotelID] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([CustomerID], [FullName], [Address], [PhoneNumber], [BirthDay], [UserName], [Password]) VALUES (1, N'vuong', N'12334', N'0987654322', CAST(N'2019-10-04' AS Date), N'kien345', N'45678794534456')
INSERT [dbo].[Account] ([CustomerID], [FullName], [Address], [PhoneNumber], [BirthDay], [UserName], [Password]) VALUES (2, N'nhan', N'fpt unversity', N'0987654322', CAST(N'2019-11-04' AS Date), N'nhan', N'12345678')
INSERT [dbo].[Account] ([CustomerID], [FullName], [Address], [PhoneNumber], [BirthDay], [UserName], [Password]) VALUES (3, N'minhtb', N'fpt unversity', N'01645285766', CAST(N'1999-06-01' AS Date), N'minhtb', N'88888888')
INSERT [dbo].[Account] ([CustomerID], [FullName], [Address], [PhoneNumber], [BirthDay], [UserName], [Password]) VALUES (4, N'minhtb123', N'fpt unversity', N'0987654322', CAST(N'2019-11-05' AS Date), N'minhtb123', N'77777777')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[AccountAdmin] ON 

INSERT [dbo].[AccountAdmin] ([AdminID], [UserName], [PassWord]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[AccountAdmin] OFF
SET IDENTITY_INSERT [dbo].[Admin_Hotel] ON 

INSERT [dbo].[Admin_Hotel] ([AdminHotelID], [HotelID], [UserName], [PassWord], [Name_Admin]) VALUES (1, 1, N'admin1', N'admin1', N'admin1')
INSERT [dbo].[Admin_Hotel] ([AdminHotelID], [HotelID], [UserName], [PassWord], [Name_Admin]) VALUES (2, 9, N'admin9', N'admin9', N'admin9')
INSERT [dbo].[Admin_Hotel] ([AdminHotelID], [HotelID], [UserName], [PassWord], [Name_Admin]) VALUES (3, 15, N'admin15', N'admin15', N'admin15')
SET IDENTITY_INSERT [dbo].[Admin_Hotel] OFF
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (72, CAST(N'2019-11-11' AS Date), CAST(N'2019-11-13' AS Date), 9, 18, 3, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (73, CAST(N'2019-11-11' AS Date), CAST(N'2019-11-20' AS Date), 1, 2, 3, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (74, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-23' AS Date), 6, 16, 3, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (75, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-14' AS Date), 1, 4, 2, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (76, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-14' AS Date), 1, 3, 2, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (77, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-14' AS Date), 9, 17, 2, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (78, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-19' AS Date), 9, 25, 2, N'', CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Booking] ([BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [Comment], [BookTime]) VALUES (79, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-15' AS Date), 1, 3, 3, N'', CAST(N'2019-11-12' AS Date))
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Cancellation] ON 

INSERT [dbo].[Cancellation] ([CanceID], [BookingID], [CheckIn], [CheckOut], [HotelsID], [RoomNumber], [CustomerID], [ReasonCance], [BookTime], [CanceTime]) VALUES (21, 76, CAST(N'2019-11-12' AS Date), CAST(N'2019-11-14' AS Date), 1, 3, 2, N'', CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[Cancellation] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (1, 3, N'oke', N'BirdPly', N'images/hotels/hotel1.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (4, 3, N'oke', N'DragonFly', N'images/hotels/hotel2.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (6, 3, N'oke', N'Duck', N'images/hotels/hotel3.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (8, 1, N'oke', N'Fly', N'images/hotels/hotel4.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (9, 1, N'oke', N'Mouse', N'images/hotels/hotel5.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (11, 5, N'oke', N'Pruy', N'images/hotels/hotel6.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (12, 4, N'oke', N'Oop', N'images/hotels/hotel7.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (13, 2, N'oke', N'Tiny', N'images/hotels/hotel8.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (14, 2, N'oke', N'BeLine', N'images/hotels/hotel9.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (15, 5, N'oke', N'StrayDogs', N'images/hotels/hotel10.jpg')
INSERT [dbo].[Hotel] ([HotelID], [PlaceID], [Descride], [HotelName], [images]) VALUES (16, 3, N'oke', N'Luxury', N'images/hotels/hotel11.jpg')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[PayMents] ON 

INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (21, 72, CAST(N'2019-11-11' AS Date), 3200000)
INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (22, 73, CAST(N'2019-11-11' AS Date), 4500000)
INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (23, 74, CAST(N'2019-11-11' AS Date), 7700000)
INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (24, 75, CAST(N'2019-11-11' AS Date), 400000)
INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (25, 77, CAST(N'2019-11-11' AS Date), 5000000)
INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (26, 78, CAST(N'2019-11-11' AS Date), 14000000)
INSERT [dbo].[PayMents] ([PaymentID], [BookingID], [PayTime], [Price]) VALUES (27, 79, CAST(N'2019-11-12' AS Date), 600000)
SET IDENTITY_INSERT [dbo].[PayMents] OFF
SET IDENTITY_INSERT [dbo].[Place] ON 

INSERT [dbo].[Place] ([PlaceID], [AddressPlace]) VALUES (1, N'Ha Noi')
INSERT [dbo].[Place] ([PlaceID], [AddressPlace]) VALUES (2, N'Sa Pa')
INSERT [dbo].[Place] ([PlaceID], [AddressPlace]) VALUES (3, N'Ho Chi Minh City')
INSERT [dbo].[Place] ([PlaceID], [AddressPlace]) VALUES (4, N'Phu Quoc')
INSERT [dbo].[Place] ([PlaceID], [AddressPlace]) VALUES (5, N'Ha Long Bay')
SET IDENTITY_INSERT [dbo].[Place] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (2, N'couple', 500000, 2, 0, 1)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (3, N'singer', 200000, 1, 0, 1)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (4, N'couple', 200000, 2, 0, 1)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (5, N'couple', 200000, 2, 1, 1)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (6, N'family', 1000000, 5, 1, 4)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (10, N'singer', 200000, 1, 1, 4)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (11, N'singer', 1000000, 1, 1, 8)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (12, N'couple', 1500000, 2, 1, 8)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (13, N'family', 3000000, 4, 1, 8)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (15, N'singer', 500000, 1, 1, 6)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (16, N'couple', 700000, 2, 0, 6)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (17, N'family', 2500000, 4, 0, 9)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (18, N'singer', 1600000, 1, 0, 9)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (19, N'luxury', 5000000, 2, 1, 16)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (20, N'luxyry', 4500000, 2, 1, 16)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (21, N'singer', 300000, 1, 1, 12)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (22, N'couple', 400000, 2, 1, 12)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (23, N'singer', 250000, 1, 1, 12)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (24, N'family', 500000, 4, 1, 12)
INSERT [dbo].[Room] ([RoomNumber], [RoomType], [PricePerNight], [MaxPerson], [IsFree], [HotelID]) VALUES (25, N'luxury', 2000000, 2, 0, 9)
SET IDENTITY_INSERT [dbo].[Room] OFF
ALTER TABLE [dbo].[Admin_Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Hotel_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Admin_Hotel] CHECK CONSTRAINT [FK_Admin_Hotel_Hotel]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Account] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Account] ([CustomerID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Account]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Hotel] FOREIGN KEY([HotelsID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Hotel]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Room] FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Room]
GO
ALTER TABLE [dbo].[Cancellation]  WITH CHECK ADD  CONSTRAINT [FK_Cancellation_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Cancellation] CHECK CONSTRAINT [FK_Cancellation_Booking]
GO
ALTER TABLE [dbo].[Cancellation]  WITH CHECK ADD  CONSTRAINT [FK_Cancellation_Hotel] FOREIGN KEY([HotelsID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Cancellation] CHECK CONSTRAINT [FK_Cancellation_Hotel]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Place] FOREIGN KEY([PlaceID])
REFERENCES [dbo].[Place] ([PlaceID])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Place]
GO
ALTER TABLE [dbo].[PayMents]  WITH CHECK ADD  CONSTRAINT [FK_PayMents_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[PayMents] CHECK CONSTRAINT [FK_PayMents_Booking]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hotel]
GO
USE [master]
GO
ALTER DATABASE [Project_Booking] SET  READ_WRITE 
GO
