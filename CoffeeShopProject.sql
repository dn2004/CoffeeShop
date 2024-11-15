USE [CoffeeShop]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/8/2024 3:46:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[image] [nvarchar](255) NULL,
	[price] [decimal](18, 2) NULL,
	[available] [bit] NULL,
	[kind_id] [int] NULL,
 CONSTRAINT [PK__Item__3213E83F60636CDD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kind]    Script Date: 11/8/2024 3:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kind](
	[kind_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[kind_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager_Account]    Script Date: 11/8/2024 3:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager_Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
	[gender] [nvarchar](10) NULL,
	[phone] [nvarchar](15) NULL,
	[image] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2024 3:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](100) NULL,
	[table_number] [int] NULL,
	[customer_number] [nvarchar](50) NULL,
	[order_datetime] [datetime] NULL,
	[total_amount] [decimal](18, 2) NULL,
	[status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 11/8/2024 3:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[name_at_time] [nvarchar](100) NULL,
	[price_at_time] [decimal](18, 2) NULL,
	[quantity] [int] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/8/2024 3:46:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[status_id] [int] NOT NULL,
	[status_name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (1, N'Americano Đá', N'AmericanoDa.jpg', CAST(45000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (2, N'Americano Nóng', N'AmericanoNong.jpg', CAST(45000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (3, N'Cappuccino Đá', N'CappuccinoDa.jpg', CAST(45000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (4, N'Bánh Mì Que', N'BanhMiQue.jpg', CAST(19000.00 AS Decimal(18, 2)), 0, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (5, N'Choco Croffle', N'ChocoCroffle.jpg', CAST(30000.00 AS Decimal(18, 2)), 0, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (6, N'Croissant Trứng Muối', N'CroissantTrungMuoi.jpg', CAST(35000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (7, N'Mochi Kem Chocolate', N'MochiKemChocolate.jpg', CAST(25000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (8, N'Mochi Kem Sữa Dừa', N'MochiKemDuaDua.jpg', CAST(25000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (9, N'Espresso Đá', N'EspressoDa.jpg', CAST(45000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (10, N'Latte Nóng', N'LatteNong.jpg', CAST(20000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (11, N'Latte Đá', N'LatteDa.jpg', CAST(45000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (12, N'Espresso Nóng', N'EspressoNong.jpg', CAST(45000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (13, N'Mochi Kem Phúc Bồn Tử', N'MochiKemPhucBonTu.jpg', CAST(19000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (14, N'Mousse Tiramisu', N'MousseTiramisu.jpg', CAST(19000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (15, N'Mousse Gấu Chocolate', N'MousseGauChocolate.jpg', CAST(50000.00 AS Decimal(18, 2)), 0, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (16, N'Cà Phê Sữa Đá', N'CaPheSuaDa.jpg', CAST(30000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (17, N'Mochi Kem Việt Quất', N'MochiKemVietQuat.jpg', CAST(19000.00 AS Decimal(18, 2)), 0, 1)
INSERT [dbo].[Item] ([id], [name], [image], [price], [available], [kind_id]) VALUES (18, N'Bơ Aranica', N'BoArabica.jpg', CAST(30000.00 AS Decimal(18, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
INSERT [dbo].[Kind] ([kind_id], [name]) VALUES (1, N'Coffee')
INSERT [dbo].[Kind] ([kind_id], [name]) VALUES (2, N'Food')
GO
SET IDENTITY_INSERT [dbo].[Manager_Account] ON 

INSERT [dbo].[Manager_Account] ([account_id], [username], [password], [email], [gender], [phone], [image], [created_at], [status]) VALUES (1, N'dat2004', N'123', N'nguyenhuudat20032004@gmail.com', N'Male', N'0941148823', N'male', CAST(N'2024-09-23T10:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Manager_Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (1, N'Nguyễn Hữu Đạt', 4, N'0941148823', CAST(N'2023-10-28T21:48:09.437' AS DateTime), CAST(135000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (2, N'Nam', 8, N'0941148823', CAST(N'2023-10-29T10:06:51.677' AS DateTime), CAST(65000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (3, N'Nguyễn Anh Quân', 2, N'0941141156', CAST(N'2024-06-29T10:22:15.553' AS DateTime), CAST(57000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (4, N'Nguyễn Thành Nam', 2, N'0948765432', CAST(N'2024-06-29T16:05:04.797' AS DateTime), CAST(70000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (5, N'Nhật Tân', 6, N'0941324789', CAST(N'2024-07-29T16:06:25.770' AS DateTime), CAST(90000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (6, N'Nam', 3, N'0904321098', CAST(N'2024-07-29T16:07:19.383' AS DateTime), CAST(45000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (7, N'Nguyễn Hữu Đạt', 10, N'0941148823', CAST(N'2024-07-29T16:07:56.617' AS DateTime), CAST(80000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (8, N'Trương Văn Nam', 9, N'0961324789', CAST(N'2024-08-29T16:17:40.740' AS DateTime), CAST(45000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (9, N'Nguyễn Chiến Thắng', 6, N'0985674321', CAST(N'2024-08-29T16:19:17.977' AS DateTime), CAST(30000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (10, N'Công Phượng - Cafe', 3, N'0902109876', CAST(N'2024-08-29T16:20:27.940' AS DateTime), CAST(64000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (11, N'Trần Mạnh Khuê', 4, N'0941324789', CAST(N'2024-09-29T16:21:04.273' AS DateTime), CAST(70000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (12, N'Nguyễn Hữu Đạt', 10, N'0941148823', CAST(N'2024-09-29T16:21:48.737' AS DateTime), CAST(54000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (13, N'Nguyễn Hải Quân', 3, N'0937654321', CAST(N'2024-09-29T16:25:16.577' AS DateTime), CAST(30000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (14, N'Mạnh', 1, N'0962109876', CAST(N'2024-09-29T16:28:21.377' AS DateTime), CAST(45000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (15, N'Ngân', 3, N'0941148823', CAST(N'2024-09-29T16:28:49.970' AS DateTime), CAST(19000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (16, N'Nguyễn Hữu Đạt', 6, N'0941148823', CAST(N'2024-10-29T16:30:25.280' AS DateTime), CAST(125000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (17, N'Nam', 3, N'0969871234', CAST(N'2024-10-29T16:31:15.967' AS DateTime), CAST(80000.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (18, N'Nguyễn Hữu Đạt', 10, N'0941148823', CAST(N'2024-11-01T22:15:40.493' AS DateTime), CAST(45000.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (19, N'huynh dang truong', 1, N'0865742304', CAST(N'2024-11-02T10:05:37.047' AS DateTime), CAST(495000.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Order] ([order_id], [customer_name], [table_number], [customer_number], [order_datetime], [total_amount], [status_id]) VALUES (1018, N'huynh dang truong', 1, N'0865742304', CAST(N'2024-11-02T14:08:31.300' AS DateTime), CAST(90000.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (1, 1, N'Americano Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'không đường')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (2, 1, N'Cappuccino Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'không đá')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (3, 1, N'Americano Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (4, 2, N'Latte Nóng', CAST(20000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (5, 2, N'Americano Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (6, 3, N'Mochi Kem Phúc Bồn Tử', CAST(57000.00 AS Decimal(18, 2)), 3, N'1 kem không sữa đặc nha')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (7, 4, N'Americano Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (8, 4, N'Mochi Kem Chocolate', CAST(25000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (9, 5, N'Latte Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (10, 5, N'Americano Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (11, 6, N'Espresso Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (12, 7, N'Croissant Trứng Muối', CAST(35000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (13, 7, N'Americano Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (14, 8, N'Americano Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (15, 9, N'Bơ Aranica', CAST(30000.00 AS Decimal(18, 2)), 1, N'1 ly không bơ nha')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (16, 10, N'Mousse Tiramisu', CAST(19000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (17, 10, N'Americano Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (18, 11, N'Mochi Kem Sữa Dừa', CAST(25000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (19, 11, N'Americano Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (20, 12, N'Mochi Kem Phúc Bồn Tử', CAST(19000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (21, 12, N'Croissant Trứng Muối', CAST(35000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (22, 13, N'Cà Phê Sữa Đá', CAST(30000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (23, 14, N'Cappuccino Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'Cà phê ngon lên nhá')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (24, 15, N'Mochi Kem Phúc Bồn Tử', CAST(19000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (25, 16, N'Croissant Trứng Muối', CAST(35000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (26, 16, N'Americano Đá', CAST(90000.00 AS Decimal(18, 2)), 2, N'Không đường')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (27, 17, N'Croissant Trứng Muối', CAST(35000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (28, 17, N'Espresso Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (29, 18, N'Cappuccino Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'abc')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (30, 19, N'Americano Nóng', CAST(90000.00 AS Decimal(18, 2)), 2, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (31, 19, N'Cappuccino Đá', CAST(360000.00 AS Decimal(18, 2)), 8, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (32, 19, N'Espresso Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (1029, 1018, N'Cappuccino Đá', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
INSERT [dbo].[order_detail] ([order_detail_id], [order_id], [name_at_time], [price_at_time], [quantity], [Note]) VALUES (1030, 1018, N'Americano Nóng', CAST(45000.00 AS Decimal(18, 2)), 1, N'')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (2, N'Confirmed')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (3, N'Shipping')
INSERT [dbo].[Status] ([status_id], [status_name]) VALUES (4, N'Completed')
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK__Item__kind_id__1273C1CD] FOREIGN KEY([kind_id])
REFERENCES [dbo].[Kind] ([kind_id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK__Item__kind_id__1273C1CD]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([status_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order]
GO
