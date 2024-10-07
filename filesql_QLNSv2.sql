USE [master]
GO
/****** Object:  Database [QlNhanSu]    Script Date: 12/28/2021 11:05:28 AM ******/
CREATE DATABASE QlNhanSu
Go
USE QlNhanSu
GO
/****** Object:  Table [dbo].[BaoHiem]    Script Date: 12/28/2021 11:05:28 AM ******/

CREATE TABLE [dbo].[BaoHiem](
	[MaNhanVien] [varchar](5) NOT NULL,
	[LoaiBaoHiem] [nvarchar](50) NULL,
	[SoThe] [varchar](20) NULL,
	[NgayCap] [date] NULL,
	[NgayHetHan] [date] NULL,
	[NoiCap] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCong](
	[MaNhanVien] [varchar](5) NOT NULL,
	[Ngay] [date] NOT NULL,
	[TinhTrang] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [varchar](5) NOT NULL,
	[TenCv] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ctChucVu]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ctChucVu](
	[MaNhanVien] [varchar](5) NULL,
	[MaCV] [varchar](5) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[LyDo] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[MaHD] [varchar](5) NOT NULL,
	[NgayVaoLam] [date] NOT NULL,
	[HeSoLuong] [int] NOT NULL,
	[MaCV] [varchar](5) NOT NULL,
	[MaPB] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luong]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luong](
	[HeSoLuong] [int] NOT NULL,
	[LuongCB] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HeSoLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](5) NOT NULL,
	[MaPB] [varchar](5) NOT NULL,
	[MaHD] [varchar](5) NOT NULL,
	[HeSoLuong] [int] NOT NULL,
	[TenNV] [nvarchar](100) NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoCM] [varchar](20) NOT NULL,
	[DienThoai] [varchar](20) NOT NULL,
	[TrinhDoHV] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[Email] [varchar](20) NULL,
	[TTHonNhan] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](5) NOT NULL,
	[TenPB] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Taikhoan]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taikhoan](
	[MaNhanVien] [varchar](5) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[TenQuyenHan] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongPhat]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongPhat](
	[MaNhanVien] [varchar](5) NOT NULL,
	[Loai] [nvarchar](50) NULL,
	[Tien] [int] NULL,
	[LyDo] [nvarchar](max) NULL,
	[Ngay] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BaoHiem] ([MaNhanVien], [LoaiBaoHiem], [SoThe], [NgayCap], [NgayHetHan], [NoiCap]) VALUES (N'NV01', N'Bảo Hiểm Thân Thể', N'BH00001', CAST(N'2020-06-28' AS Date), CAST(N'2020-10-30' AS Date), N'Thái Bình')
INSERT [dbo].[BaoHiem] ([MaNhanVien], [LoaiBaoHiem], [SoThe], [NgayCap], [NgayHetHan], [NoiCap]) VALUES (N'NV02', N'Bảo Hiểm Y Tế', N'BHY0001', CAST(N'2020-06-28' AS Date), CAST(N'2021-04-16' AS Date), N'')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2020-06-25' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2020-06-28' AS Date), N'Nghỉ Không Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2020-06-28' AS Date), N'Nghỉ Không Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2020-06-28' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2020-06-28' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2020-06-28' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2021-04-16' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2021-04-16' AS Date), N'Nghỉ Không Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2021-04-16' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2021-04-16' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2021-04-16' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2021-04-16' AS Date), N'Nghỉ Không Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2021-04-16' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2021-04-16' AS Date), N'Nghỉ Có Phép')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV18', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV19', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV20', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV21', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV22', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2021-12-13' AS Date), N'Đi Làm')
GO
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV18', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV19', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV20', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV21', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV22', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV01', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV02', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV18', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV19', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV20', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV21', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV22', CAST(N'2021-12-13' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV03', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV04', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV05', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV06', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV07', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV08', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV09', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV10', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV11', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV12', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV13', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV14', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV15', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV16', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChamCong] ([MaNhanVien], [Ngay], [TinhTrang]) VALUES (N'NV17', CAST(N'2020-06-25' AS Date), N'Đi Làm')
INSERT [dbo].[ChucVu] ([MaCV], [TenCv]) VALUES (N'CV01', N'Giám Đốc')
INSERT [dbo].[ChucVu] ([MaCV], [TenCv]) VALUES (N'CV02', N'Phó Giám Đốc')
INSERT [dbo].[ChucVu] ([MaCV], [TenCv]) VALUES (N'CV03', N'Trưởng Phòng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCv]) VALUES (N'CV04', N'Phó Phòng')
INSERT [dbo].[ChucVu] ([MaCV], [TenCv]) VALUES (N'CV05', N'Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV01', N'CV01', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV02', N'CV02', CAST(N'2014-10-01' AS Date), CAST(N'2021-04-16' AS Date), N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV03', N'CV03', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV04', N'CV03', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV05', N'CV03', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV06', N'CV04', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV07', N'CV04', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV08', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV09', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV10', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV11', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV12', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV13', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV14', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV15', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV16', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV17', N'CV05', CAST(N'2014-10-01' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV18', N'CV05', CAST(N'2014-01-25' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV02', N'CV01', CAST(N'2021-04-16' AS Date), CAST(N'2021-12-15' AS Date), N'Chuyển chức vụ, Thay đổi chức vụ')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV19', N'CV03', CAST(N'2014-01-25' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV20', N'CV03', CAST(N'2014-01-25' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV21', N'CV01', CAST(N'2021-04-16' AS Date), NULL, N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV22', N'CV02', CAST(N'2021-04-16' AS Date), CAST(N'2021-12-15' AS Date), N'Tuyển Nhân Viên')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV02', N'CV01', CAST(N'2021-12-15' AS Date), NULL, N'Chuyển chức vụ, Thay đổi chức vụ')
INSERT [dbo].[ctChucVu] ([MaNhanVien], [MaCV], [NgayBatDau], [NgayKetThuc], [LyDo]) VALUES (N'NV22', N'CV02', CAST(N'2021-12-15' AS Date), NULL, N'Chuyển chức vụ, Thay đổi chức vụ')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD01', CAST(N'2014-01-25' AS Date), 10, N'CV01', N'PB01')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD02', CAST(N'2014-01-25' AS Date), 9, N'CV01', N'PB02')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD03', CAST(N'2014-01-25' AS Date), 8, N'CV03', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD04', CAST(N'2014-01-25' AS Date), 8, N'CV03', N'PB04')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD05', CAST(N'2014-01-25' AS Date), 8, N'CV03', N'PB05')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD06', CAST(N'2014-01-25' AS Date), 7, N'CV04', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD07', CAST(N'2014-01-25' AS Date), 7, N'CV04', N'PB04')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD08', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD09', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD10', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD11', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD12', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD13', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD14', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB04')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD15', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB04')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD16', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB05')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD17', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB05')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD18', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB05')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD19', CAST(N'2014-01-25' AS Date), 6, N'CV05', N'PB05')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD20', CAST(N'2014-01-25' AS Date), 9, N'CV01', N'PB02')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD21', CAST(N'2014-01-25' AS Date), 8, N'CV03', N'PB03')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD22', CAST(N'2014-01-25' AS Date), 9, N'CV03', N'PB05')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD23', CAST(N'2021-04-16' AS Date), 2, N'CV01', N'PB01')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD24', CAST(N'2021-04-16' AS Date), 2, N'CV02', N'PB02')
INSERT [dbo].[HopDong] ([MaHD], [NgayVaoLam], [HeSoLuong], [MaCV], [MaPB]) VALUES (N'HD25', CAST(N'2021-06-20' AS Date), 2, N'CV01', N'PB04')
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (1, 3500000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (2, 3700000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (3, 100000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (4, 4000000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (5, 4500000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (6, 50000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (7, 70000000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (8, 10000000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (9, 12000000)
INSERT [dbo].[Luong] ([HeSoLuong], [LuongCB]) VALUES (10, 16000000)
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV01', N'PB01', N'HD01', 10, N'Nguyễn Hồng Kỳ', N'Nam', CAST(N'1999-01-26' AS Date), N'034099001755', N'0386685086', N'Đại Học', N'Thụy Sơn, Thái Thụy, Thái Bình', N'marinkqh@gmail.com', N'Độc thân')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV02', N'PB01', N'HD02', 9, N'Nguyễn Quốc Tuấn', N'Nam', CAST(N'1999-01-15' AS Date), N'111111', N'1638345699', N'Đại Học', N'Thái Bình', N'tuannguyen@gmail.com', N'Độc thân')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV03', N'PB03', N'HD03', 8, N'Trương Minh Sang', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV04', N'PB04', N'HD04', 8, N'Nguyễn Thị Lệ Thu', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV05', N'PB05', N'HD05', 8, N'Trần Minh Siêu A', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV06', N'PB03', N'HD06', 7, N'Trần Ngọc Tuyết', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV07', N'PB05', N'HD07', 7, N'Nguyễn Hữu Minh', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV08', N'PB03', N'HD08', 6, N'Huỳnh Thị Yến Lê', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV09', N'PB03', N'HD09', 6, N'Nguyễn Thị Kim Thoa', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV10', N'PB03', N'HD10', 6, N'Nguyễn Thị Bích Hằng', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV11', N'PB03', N'HD11', 6, N'Hồ Mạnh Tiến', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV12', N'PB03', N'HD12', 6, N'Nguyễn Tăng Quốc', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV13', N'PB04', N'HD13', 6, N'Lê Thị Tịnh', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV14', N'PB04', N'HD14', 6, N'Bùi Thị Sương', N'Nữ', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV15', N'PB05', N'HD15', 6, N'Bùi Văn Long', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV16', N'PB05', N'HD16', 6, N'Đỗ Hữu Tiến', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV17', N'PB05', N'HD17', 6, N'Phạm Văn MạnhB', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV18', N'PB05', N'HD19', 6, N'Phạm Văn MạnhB', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV19', N'PB03', N'HD21', 8, N'Trương Minh Sang', N'Nam', CAST(N'1985-09-02' AS Date), N'88888888', N'1638345699', N'Đại Học', N'Biên Hòa, Đồng nai', N'@gmail.com', N'Đã Kết Hôn')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV20', N'PB05', N'HD22', 9, N'cscs', N'Nam', CAST(N'1985-09-02' AS Date), N'273737383938', N'383763463463', N'DG', N'mjmj275263', N'@gmai.com', N'kh')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV21', N'PB01', N'HD23', 2, N'Nguyên AAAA', N'Nam', CAST(N'2021-04-16' AS Date), N'1651651651651', N'1616165161', N'DH', N'ssssss', N'd@gmail.com', N'kh')
INSERT [dbo].[NhanVien] ([MaNhanVien], [MaPB], [MaHD], [HeSoLuong], [TenNV], [GioiTinh], [NgaySinh], [SoCM], [DienThoai], [TrinhDoHV], [DiaChi], [Email], [TTHonNhan]) VALUES (N'NV22', N'PB02', N'HD24', 2, N'Tran Van B', N'Nam', CAST(N'2021-04-16' AS Date), N'123456789', N'098765432', N'DH', N'BDsfvdfbfgbsgfg', N'v@gmail.com', N'k')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB01', N'Phòng Giám Đốc')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB02', N'Phòng Phó Giám Đốc')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB03', N'Phòng Kinh Doanh')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB04', N'Phòng Kế Toán')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB05', N'Phòng Kỹ Thuật')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB06', N'Phong Maketing')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'PB07', N'Phòng nhân sự')
INSERT [dbo].[Taikhoan] ([MaNhanVien], [TenDangNhap], [MatKhau], [TenQuyenHan]) VALUES (N'NV01', N'admin', N'admin', N'Super Admin')
INSERT [dbo].[Taikhoan] ([MaNhanVien], [TenDangNhap], [MatKhau], [TenQuyenHan]) VALUES (N'NV03', N'admin03', N'admin03', N'User')
INSERT [dbo].[Taikhoan] ([MaNhanVien], [TenDangNhap], [MatKhau], [TenQuyenHan]) VALUES (N'NV02', N'admin1', N'admin', N'Admin')
INSERT [dbo].[ThuongPhat] ([MaNhanVien], [Loai], [Tien], [LyDo], [Ngay]) VALUES (N'NV03', N'Phạt', 100000, N'Đến muộn', CAST(N'2020-06-28' AS Date))
INSERT [dbo].[ThuongPhat] ([MaNhanVien], [Loai], [Tien], [LyDo], [Ngay]) VALUES (N'NV01', N'Thưởng', 10000, N'OT', CAST(N'2020-06-28' AS Date))
INSERT [dbo].[ThuongPhat] ([MaNhanVien], [Loai], [Tien], [LyDo], [Ngay]) VALUES (N'NV08', N'Phạt', 100015, N'fsgdc', CAST(N'2020-06-28' AS Date))
INSERT [dbo].[ThuongPhat] ([MaNhanVien], [Loai], [Tien], [LyDo], [Ngay]) VALUES (N'NV05', N'Thưởng', 30000, N'Oke chưa anh em', CAST(N'2020-07-02' AS Date))
INSERT [dbo].[ThuongPhat] ([MaNhanVien], [Loai], [Tien], [LyDo], [Ngay]) VALUES (N'NV02', N'Thưởng', 150000000, N'Hoàn thành tốt cv', CAST(N'2021-11-25' AS Date))
ALTER TABLE [dbo].[BaoHiem]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ctChucVu]  WITH CHECK ADD FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[ctChucVu]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([HeSoLuong])
REFERENCES [dbo].[Luong] ([HeSoLuong])
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([HeSoLuong])
REFERENCES [dbo].[Luong] ([HeSoLuong])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HopDong] ([MaHD])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[Taikhoan]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ThuongPhat]  WITH CHECK ADD FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoNV]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[BaoCaoNV]
as
begin
    select nv.MaNhanVien, nv.TenNV,  nv.GioiTinh, nv.NgaySinh, nv.SoCM, nv.DienThoai, pb.TenPB, nv.HeSoLuong, nv.TrinhDoHV, nv.DiaChi, nv.Email, nv.TTHonNhan
	from NhanVien nv, PhongBan pb
	where nv.MaPB=pb.MaPB
end
GO
/****** Object:  StoredProcedure [dbo].[CapNhatChucVu]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[CapNhatChucVu]
@macv varchar(5),
@tencv nvarchar(50)
as
	if(exists(select MaCV from ChucVu where MaCV = @macv))
	begin
		update ChucVu set MaCV = @macv, TenCV = @tencv where MaCV = @macv
	end

----------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[CapNhatLuong]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[CapNhatLuong]
@hesoluong int,
@luongcb int
as
	Update Luong set LuongCB = @luongcb where HeSoLuong = @hesoluong

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[CapNhatMaCvTrongHopDong]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[CapNhatMaCvTrongHopDong]
@mahd varchar(5),
@macv varchar(5)
as
	update HopDong set MaCV = @macv where MaHD = @mahd
GO
/****** Object:  StoredProcedure [dbo].[CapNhatNgayVaoLam]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[CapNhatNgayVaoLam]
@ngay date,
@manv varchar(5)
as
	update HopDong set NgayVaoLam = @ngay from NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD where MaNhanVien = @manv
------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Hợp Đồng-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[CapNhatPhongBan]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[CapNhatPhongBan]
@maphong varchar(5),
@tenphong nvarchar(20)
as
	update PhongBan set MaPB = @maphong, TenPB = @tenphong
	where MaPB = @maphong

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DangNhap]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[DangNhap]
@taikhoan nvarchar(50),
@matkhau nvarchar(50)
as
if(exists(select TenDangNhap from TaiKhoan where TenDangNhap = @taikhoan and MatKhau = @matkhau))
begin
	select err = 0
end
else
	select err = 1
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DemSoNgayLam]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create proc [dbo].[DemSoNgayLam]
@manv varchar(5),
@ngaydau date,
@ngaycuoi date
as
	select MaNhanVien, COUNT(Ngay)as NgayLam from ChamCong 
	where MaNhanVien = @manv and (Ngay >= @ngaydau and Ngay <= @ngaycuoi) and TinhTrang = N'Đi Làm'
	Group By MaNhanVien

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DemSoNgaynghiCoPhep]    Script Date: 12/28/2021 11:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[DemSoNgaynghiCoPhep]
@manv varchar(5),
@ngaydau date,
@ngaycuoi date
as
	select MaNhanVien, COUNT(Ngay)as NgayLam from ChamCong 
	where MaNhanVien = @manv and (Ngay >= @ngaydau and Ngay <= @ngaycuoi) and TinhTrang = N'Nghỉ Có Phép'
	Group By MaNhanVien

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DemSoNgayNghiKhongPhep]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[DemSoNgayNghiKhongPhep]
@manv varchar(5),
@ngaydau date,
@ngaycuoi date
as
	select MaNhanVien, COUNT(Ngay)as NgayLam from ChamCong 
	where MaNhanVien = @manv and (Ngay >= @ngaydau and Ngay <= @ngaycuoi) and TinhTrang = N'Nghỉ Không Phép'
	Group By MaNhanVien

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[DoiMatKhau]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[DoiMatKhau]
@manv varchar(5),
@taikhoan nvarchar(50),
@matkhaumoi nvarchar(50)
as
	update TaiKhoan set MaNhanVien = @manv, TenDangNhap = @taikhoan, MatKhau = @matkhaumoi
	where TenDangNhap = @taikhoan

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[HienPhongBan]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[HienPhongBan]
@maphong varchar(5)
as
	if(@maphong = '0')
	begin
		select PhongBan.MaPB, TenPB, count(NhanVien.MaPB) as SoNV
		from PhongBan left join NhanVien on PhongBan.MaPB = NhanVien.MaPB
		GROUP BY PhongBan.MaPB, TenPB
	end
	else
	begin
		select PhongBan.MaPB, TenPB, count(NhanVien.MaPB) as SoNV
		from PhongBan left join NhanVien on PhongBan.MaPB = NhanVien.MaPB
		where PhongBan.MaPB = @maphong
		GROUP BY PhongBan.MaPB, TenPB
	end	

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayBaoHiem]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayBaoHiem]
@ma varchar(5),
@loaibh nvarchar(50)
as
	if(@ma = '0')
	begin
		select NhanVien.MaNhanVien, TenNV, LoaiBaoHiem, NgayHetHan
		from NhanVien left join BaoHiem on NhanVien.MaNhanVien = BaoHiem.MaNhanVien
	end
	else
	begin
		select NhanVien.MaNhanVien, TenNV, LoaiBaoHiem, SoThe, NgayCap, NgayHetHan, NoiCap
		from NhanVien left join BaoHiem on NhanVien.MaNhanVien = BaoHiem.MaNhanVien
		where NhanVien.MaNhanVien = @ma and LoaiBaoHiem = @loaibh
	end
---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayChamCong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[LayChamCong]
@ma varchar(5),
@ngay date
as
if(@ma = '0')
begin
	select ChamCong.MaNhanVien, NhanVien.TenNV, TinhTrang 
	from ChamCong inner join NhanVien on ChamCong.MaNhanVien = NhanVien.MaNhanVien
	where Ngay = @ngay
end
else
begin
	select ngay from ChamCong where Ngay = @ngay
end

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayChucVu]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayChucVu]
@ma varchar(5)
as
	if(@ma = '0')
	begin
		select MaCV, TenCv from ChucVu
	end
	else
	begin
		select MaCV, TenCv from ChucVu where MaCV = @ma
	end

----------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayChucVuTuMaNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[LayChucVuTuMaNV]
@manv varchar(5)
as
	select TenCV from (NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD) inner join ChucVu on HopDong.MaCV = ChucVu.MaCV
	where MaNhanVien = @manv
GO
/****** Object:  StoredProcedure [dbo].[LayctChucVu]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayctChucVu]
@manv varchar(5)
as
	if(@manv = '0')
	begin
		select MaNhanVien, ' ' as TenNV,  ' ' as TenCv, NgayBatDau, NgayKetThuc, LyDo from ctChucVu
	end
	else
	begin
		select MaNhanVien, ' ' as TenNV,  ' ' as TenCv, NgayBatDau, NgayKetThuc, LyDo from ctChucVu where MaNhanVien = @manv
	end

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảo Hiểm-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayLuongCB]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayLuongCB]
@hesoluong int
as
	select LuongCB From Luong where HeSoLuong = @hesoluong


------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Chức Vụ-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayLuongCBTuHSL]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayLuongCBTuHSL]
@hsl int
as
	select LuongCB from Luong where HeSoLuong = @hsl

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[layMaCVTuTenCV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[layMaCVTuTenCV]
@tencv nvarchar(100)
as
	if(exists(select TenCV from ChucVu where TenCV = @tencv))
	begin
		select MaCV from ChucVu where TenCV = @tencv
	end
	else
		select err = 1

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[layMaHopDong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[layMaHopDong]
@mahd varchar(5)
as
if(@mahd = '0')
begin
	select MaHD from HopDong
end
else 
begin
	select MaHD from HopDong where MaHD = @mahd
end

------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[layMaHopDongTuMaNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[layMaHopDongTuMaNV]
@manv  varchar(5)
as
	select MaHD from NhanVien where MaNhanVien = @manv
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayMaNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Nhân Viên-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

Create Proc [dbo].[LayMaNV]
@tendangnhap nvarchar(50)
as
if(@tendangnhap = '0')
begin
	select MaNhanVien from NhanVien
end
else 
begin
	select MaNhanVien from Taikhoan where TenDangNhap = @tendangnhap
end
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[layMaNVTuTenNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[layMaNVTuTenNV]
@tennv nvarchar(50)
as
	select MaNhanVien from NhanVien where TenNV = @tennv
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[layMaPBTuTenPB]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Phòng Ban-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

Create Proc [dbo].[layMaPBTuTenPB]
@tenpb nvarchar(100)
as
	if(exists(select TenPB from PhongBan where TenPB = @tenpb))
	begin
		select MaPB from PhongBan where TenPB = @tenpb
	end
	else
		select err = 1

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayNgayVaoLam]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayNgayVaoLam]
@manv varchar(5)
as
	select NgayVaoLam from NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD where MaNhanVien = @manv

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayNhanVienTuMaPB]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayNhanVienTuMaPB]--'0','12-1-2016', '12-30-2016'
@mapb varchar(5),
@ngaydau date,
@ngaycuoi date
as
	if(@mapb = '0')
	begin
		select TenNV, Loai, Tien, LyDo
		from NhanVien left join ThuongPhat on NhanVien.MaNhanVien = ThuongPhat.MaNhanVien
		where (Ngay >= @ngaydau and Ngay <= @ngaycuoi) or Ngay is null
	end
	else
	begin
		select TenNV, Loai, Tien, LyDo
		from NhanVien left join ThuongPhat on NhanVien.MaNhanVien = ThuongPhat.MaNhanVien
		where (@mapb = MaPB and (Ngay >= @ngaydau and Ngay <= @ngaycuoi)) or Ngay is null
	end

------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayPhuCap]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayPhuCap]
@ma varchar(5)
as
	if(@ma = '0')
	begin
		select PhuCap.MaNhanVien, TenNV, LoaiPC, Tien, TuNgay, DenNgay from PhuCap left join NhanVien on PhuCap.MaNhanVien = NhanVien.MaNhanVien
		order by TuNgay Desc
	end
	else
	begin
		select PhuCap.MaNhanVien, TenNV, LoaiPC, Tien, TuNgay, DenNgay from PhuCap left join NhanVien on PhuCap.MaNhanVien = NhanVien.MaNhanVien
		where PhuCap.MaNhanVien = @ma
		order by TuNgay Desc
	end

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayQuyenHanNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayQuyenHanNV]
@taikhoan nvarchar(50),
@matkhau nvarchar(50)
as
	select TenQuyenHan from Taikhoan where TenDangNhap = @taikhoan and MatKhau = @matkhau

GO
/****** Object:  StoredProcedure [dbo].[layTenNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[layTenNhanVien]
@manhanvien varchar(5)
as
if(@manhanvien = '0')
begin
	Select MaNhanVien, TenNV from NhanVien
end
else
begin
	select TenNV from NhanVien where MaNhanVien = @manhanvien
end

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[layTenPBTuMaNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[layTenPBTuMaNV]
@manv varchar(5)
as
	select TenPB  from NhanVien inner join PhongBan on NhanVien.MaPB = PhongBan.MaPB where MaNhanVien = @manv
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayThongTinNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[LayThongTinNV]
@manhanvien varchar(5)
as
if(@manhanvien = 'NV')
begin
	select MaNhanVien, TenNV, GioiTinh, ChucVu.TenCV 
	from (NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD) inner join ChucVu on HopDong.MaCV = ChucVu.maCV
end
else
	select MaNhanVien, NhanVien.MaPB, MaCV, NhanVien.HeSoLuong, NhanVien.MaHD, TenNV, GioiTinh, NgaySinh, SoCM, DienThoai, TrinhDoHV, DiaChi, Email, TTHonNhan
	from NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD where MaNhanVien = @manhanvien

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayTienPhuCap]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayTienPhuCap]
@manv varchar(5),
@ngay date
as
	select MaNhanVien, Sum(Tien) as Tien From PhuCap 
	where MaNhanVien = @manv and (TuNgay <= @ngay and DenNgay >= @ngay)
	group by MaNhanVien

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Lương-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[LayTienThuong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[LayTienThuong]
@manv varchar(5),
@ngaydau date,
@ngaycuoi date
as
	select Tien, Loai from ThuongPhat
	where MaNhanVien = @manv and (Ngay >= @ngaydau and Ngay <= @ngaycuoi)

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[Ma]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[Ma]
@manv nvarchar(50)
as
	select NhanVien.MaPB, MaCV, NhanVien.HeSoLuong, NhanVien.MaHD from NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD where MaNhanVien = @manv

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[NvCoTK]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[NvCoTK]
@ma varchar(5)
as
if(@ma = '0')
begin
	select NhanVien.MaNhanVien, TenNV, TenDangNhap, MatKhau, TenQuyenHan
	from NhanVien right join Taikhoan on NhanVien.MaNhanVien = Taikhoan.MaNhanVien
end
else
begin
	select MaNhanVien, TenDangNhap, MatKhau, TenQuyenHan
	from TaiKhoan
	where MaNhanVien = @ma
end
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[NvCTaiKhoan]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Tài Khoản-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
Create Proc [dbo].[NvCTaiKhoan]
@ma varchar(5)
as
if(@ma = '0')
begin
	select NhanVien.MaNhanVien, TenNV, ChucVu.TenCv 
	from ((NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD) inner join ChucVu on HopDong.MaCV = ChucVu.MaCV) 
		left join Taikhoan on NhanVien.MaNhanVien = Taikhoan.MaNhanVien
	where TenDangNhap is null
end

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[pcLayNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[pcLayNhanVien]
@ma varchar(5)
as
	if(@ma = '0')
	begin
		select MaNhanVien, TenNV from NhanVien
	end

-----------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SuaBaoHiem]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[SuaBaoHiem]
@manv varchar(5),
@loaibhcu nvarchar(50),
@loaibhmoi nvarchar(50),
@sothe varchar(20),
@ngaycap date,
@ngayhethan date,
@noicap nvarchar(100)
as
	update BaoHiem set MaNhanVien = @manv, LoaiBaoHiem = @loaibhmoi, SoThe = @sothe, NgayCap = @ngaycap, NgayHetHan = @ngayhethan, NoiCap = @noicap
	where MaNhanVien = @manv and LoaiBaohiem = @loaibhcu

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SuactChucVu]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[SuactChucVu]
@manv varchar(5),
@macv varchar(5),
@ngaykt date
as
	update ctChucVu set NgayKetThuc = @ngaykt where MaCV = @macv and MaNhanVien = @manv

-------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SuaNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[SuaNhanVien]
@manv varchar(5),
@mapb varchar(5),
@hesoluong int,
@mahd varchar(5),
@tennv Nvarchar(50),
@gioitinh nvarchar(5),
@ngaysinh date,
@socm varchar(20),
@sodt varchar(20),
@trinhdo nvarchar(50),
@diachi nvarchar(100),
@email nvarchar(50),
@honnhan nvarchar(10)
as
	update NhanVien
	set MaNhanVien = @manv, MaPB = @mapb, HeSoLuong = @hesoluong, MaHD = @mahd, TenNV = @tennv, GioiTinh = @gioitinh, 
		NgaySinh = @ngaysinh, SoCM = @socm, DienThoai = @sodt, TrinhDoHV = @trinhdo, DiaChi = @diachi, Email = @email, 
		TTHonNhan = @honnhan
	where MaNhanVien = @manv

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SuaPhuCap]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[SuaPhuCap]
@manv varchar(5),
@loaipcc nvarchar(50),
@loaipcm nvarchar(50),
@tien int,
@tungay date,
@denngay date
as
	update PhuCap set LoaiPC = @loaipcm, Tien = @tien, TuNgay = @tungay, DenNgay = @denngay
	where MaNhanVien = @manv and LoaiPC = @loaipcc

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[SuaThongTinNhanVien]
@manv varchar(5),
@tennv nvarchar(50),
@mapb varchar(5),
@hesoluong int,
@gioitinh nvarchar(5),
@ngaysinh date,
@socm varchar(20),
@sodt varchar(20),
@trinhdo nvarchar(50),
@diachi nvarchar(100),
@email nvarchar(50),
@honnhan nvarchar(10)
as
	update NhanVien
	set MaNhanVien = @manv, TenNV = @tennv, MaPB = @mapb, HeSoLuong = @hesoluong, GioiTinh = @gioitinh, 
		NgaySinh = @ngaysinh, SoCM = @socm, DienThoai = @sodt, TrinhDoHV = @trinhdo, DiaChi = @diachi, Email = @email, 
		TTHonNhan = @honnhan
	where MaNhanVien = @manv

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SuaTK]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[SuaTK]
@manv varchar(5),
@maqh varchar(5),
@taikhoan nvarchar(50),
@matkhau nvarchar(50)
as
	update Taikhoan set MaNhanVien = @manv, TenQuyenHan = @maqh, TenDangNhap = @taikhoan, MatKhau = @matkhau
	where MaNhanVien = @manv

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemBaoHiem]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ThemBaoHiem]
@manv varchar(5),
@loaibh nvarchar(50),
@sothe varchar(20),
@ngaycap date,
@ngayhethan date,
@noicap nvarchar(100)
as
	insert into BaoHiem(MaNhanVien, LoaiBaoHiem, SoThe, NgayCap, NgayHetHan, NoiCap) values(@manv, @loaibh, @sothe, @ngaycap, @ngayhethan, @noicap)

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemChamCong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[ThemChamCong]
@manv varchar(5),
@ngay date,
@tinhtrang Nvarchar(20)
as
	insert into ChamCong(MaNhanVien, Ngay, TinhTrang) values (@manv, @ngay, @tinhtrang)
	
GO
/****** Object:  StoredProcedure [dbo].[ThemChucVu]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ThemChucVu]
@macv varchar(5),
@tencv nvarchar(50)
as
	insert into ChucVu(MaCV, TenCv) values(@macv, @tencv)

----------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemctChucVu]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ThemctChucVu]
@manv varchar(5),
@macv varchar(5),
@ngaybd date,
@lydo nvarchar(100)
as
	insert into ctChucVU(MaNhanVien, MaCV, NgayBatDau, LyDo) values(@manv, @macv, @ngaybd, @lydo)

-------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemHopDong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[ThemHopDong]
@mahd varchar(5),
@ngayvaolam date,
@hesoluong int,
@macv varchar(5),
@mapb varchar(5)
as
	insert into HopDong(MaHD, NgayVaoLam, HeSoLuong, MaCV, MaPB) 
	values(@mahd, @ngayvaolam,  @hesoluong, @macv, @mapb)

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[ThemNhanVien]
@manv varchar(5),
@tennv nvarchar(50),
@mapb varchar(5),
@hesoluong int,
@mahd varchar(5),
@gioitinh nvarchar(5),
@ngaysinh date,
@socm varchar(20),
@sodt varchar(20),
@trinhdo nvarchar(50),
@diachi nvarchar(100),
@email nvarchar(50),
@honnhan nvarchar(10)
as
	insert into NhanVien(MaNhanVien, TenNV, MaPB, HeSoLuong, MaHD, GioiTinh, NgaySinh, SoCM, DienThoai, TrinhDoHV, DiaChi, Email, TTHonNhan )
	values (@manv, @tennv, @mapb, @hesoluong, @mahd, @gioitinh, @ngaysinh, @socm, @sodt, @trinhdo, @diachi, @email, @honnhan)
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemPhongBan]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[ThemPhongBan]
@maphong varchar(5),
@tenphong nvarchar(20)
as
	if(not exists(select MaPB from PhongBan where MaPB = @maphong))
	begin
		insert into PhongBan(MaPB, TenPB) values(@maphong, @tenphong)
	end
	else
		select err = 1


-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemPhuCap]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ThemPhuCap]
@manv varchar(5),
@loaipc nvarchar(50),
@tien int,
@tungay date,
@denngay date
as
	insert into PhuCap(MaNhanVien, LoaiPC, Tien, TuNgay, DenNgay) values(@manv, @loaipc, @tien, @tungay, @denngay)

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemTaiKhoan]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[ThemTaiKhoan]
@manv varchar(5),
@taikhoan nvarchar(50),
@matkhau nvarchar(50),
@tenquyenhan nvarchar(20)
as
if(not exists(select TenDangNhap from Taikhoan where TenDangNhap = @taikhoan))
begin
	insert into Taikhoan(MaNhanVien, TenDangNhap, MatKhau, TenQuyenHan)
			values(@manv, @taikhoan,@matkhau, @tenquyenhan)
	select err = '0'
end
else select err = '1'

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThemThuongPhat]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[ThemThuongPhat]
@manv varchar(5),
@loai nvarchar(100),
@tien int,
@lydo nvarchar(100),
@ngay date
as
	insert into ThuongPhat(MaNhanVien, Loai, Tien, LyDo, Ngay) values(@manv, @loai, @tien, @lydo, @ngay)

------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------ctChucVu-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ThongTinNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[ThongTinNhanVien]
@manhanvien varchar(5)
as
	select MaNhanVien, TenNV, GioiTinh, NgaySinh, SoCM, DienThoai, TrinhDoHV, DiaChi, Email, TTHonNhan, ChucVu.TenCV, PhongBan.TenPB, 
			NhanVien.HeSoLuong
	from ((NhanVien inner join PhongBan on NhanVien.MaPB = PhongBan.MaPB) inner join HopDong on NhanVien.MaHD = HopDong.MaHD)
	inner join ChucVu on HopDong.MaCV = ChucVu.MaCV
	where MaNhanVien = @manhanvien

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[tkccXemTheoTenVaPhongBan]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[tkccXemTheoTenVaPhongBan]
@tennv nvarchar(50),
@tenpb nvarchar(20),
@ngaydau date,
@ngaycuoi date,
@khoa int
as
	if(@khoa = 1)
	begin
		select NhanVien.MaNhanVien, TenNV, TinhTrang, Ngay
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where TenNV like @tennv and Ngay >= @ngaydau and Ngay <= @ngaycuoi
		order by NhanVien.MaNhanVien
	end
	else
	begin
		select NhanVien.MaNhanVien, TenNV, TinhTrang, Ngay
		from (NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien) inner join PhongBan
				on NhanVien.MaPB = PhongBan.MaPB
		where TenPB = @tenPB and Ngay >= @ngaydau and Ngay <= @ngaycuoi
		order by NhanVien.MaNhanVien
	end

-----------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[tkNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[tkNhanVien]
@tukhoa nvarchar(100),
@gt int
as
if(@gt = 1)
begin 
	select MaNhanVien, TenNV, GioiTinh, ChucVu.TenCV 
	from ((NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD) inner join PhongBan on NhanVien.MaPB = PhongBan.MaPB) inner join ChucVu on HopDong.MaCV = ChucVu.MaCV
	where (TenNV like '%'+@tukhoa+'%' or SoCM like '%'+@tukhoa+'%' or DienThoai like '%'+@tukhoa+'%' or TrinhDoHV like '%'+@tukhoa+'%' or DiaChi like '%'+@tukhoa+'%' 
		or Email like '%'+@tukhoa+'%' or TTHonNhan like '%'+@tukhoa+'%' or TenCv like '%'+@tukhoa+'%' or TenPB like '%'+@tukhoa+'%') and GioiTinh = N'Nam'
end
else if(@gt = 2)
begin 
	select MaNhanVien, TenNV, GioiTinh, ChucVu.TenCV 
	from ((NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD) inner join PhongBan on NhanVien.MaPB = PhongBan.MaPB) inner join ChucVu on HopDong.MaCV = ChucVu.MaCV
	where (TenNV like '%'+@tukhoa+'%' or SoCM like '%'+@tukhoa+'%' or DienThoai like '%'+@tukhoa+'%' or TrinhDoHV like '%'+@tukhoa+'%' or DiaChi like '%'+@tukhoa+'%' 
		or Email like '%'+@tukhoa+'%' or TTHonNhan like '%'+@tukhoa+'%' or TenCv like '%'+@tukhoa+'%' or TenPB like '%'+@tukhoa+'%') and GioiTinh = N'Nữ'
end
else
begin
	select MaNhanVien, TenNV, GioiTinh, ChucVu.TenCV 
	from ((NhanVien inner join HopDong on NhanVien.MaHD = HopDong.MaHD) inner join PhongBan on NhanVien.MaPB = PhongBan.MaPB) inner join ChucVu on HopDong.MaCV = ChucVu.MaCV
	where (TenNV like '%'+@tukhoa+'%' or SoCM like '%'+@tukhoa+'%' or DienThoai like '%'+@tukhoa+'%' or TrinhDoHV like '%'+@tukhoa+'%' or DiaChi like '%'+@tukhoa+'%' 
		or Email like '%'+@tukhoa+'%' or TTHonNhan like '%'+@tukhoa+'%' or TenCv like '%'+@tukhoa+'%' or TenPB like '%'+@tukhoa+'%')
end
GO
/****** Object:  StoredProcedure [dbo].[tkNhanVienNghi]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create proc [dbo].[tkNhanVienNghi]
@ngaydau date,
@ngaycuoi date,
@khoa int
as
	if(@khoa = 1)
	begin
		select NhanVien.MaNhanVien, TenNV, Ngay
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay = @ngaydau and TinhTrang = N'Nghỉ Không Phép'
	end
	else
	begin
		select NhanVien.MaNhanVien, TenNV, Ngay
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay >= @ngaydau and Ngay <= @ngaycuoi and TinhTrang = N'Nghỉ Không Phép'
	end

-----------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[tkNhanVienNghiCoPhep]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[tkNhanVienNghiCoPhep]
@ngaydau date,
@ngaycuoi date,
@khoa int
as
	if(@khoa = 1)
	begin
		select NhanVien.MaNhanVien, TenNV, Ngay
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay = @ngaydau and TinhTrang = N'Nghỉ Có Phép'
	end
	else
	begin
		select NhanVien.MaNhanVien, TenNV, Ngay
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay >= @ngaydau and Ngay <= @ngaycuoi and TinhTrang = N'Nghỉ Có Phép'
	end
-----------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[tkSoNgayDiLamCuaNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[tkSoNgayDiLamCuaNhanVien]
@ngaydau date,
@ngaycuoi date,
@khoa int
as
	if(@khoa = 1)
	begin
		select distinct NhanVien.MaNhanVien, TenNV, count(TinhTrang) as SoNN
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay >= @ngaydau and Ngay <= @ngaycuoi and TinhTrang = N'Đi Làm'
		group by NhanVien.MaNhanVien, TenNV
	end
	else if(@khoa = 2)
	begin
		select distinct NhanVien.MaNhanVien, TenNV, count(TinhTrang) as SoNN
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay >= @ngaydau and Ngay <= @ngaycuoi and TinhTrang = N'Nghỉ Có Phép'
		group by NhanVien.MaNhanVien, TenNV
	end
	else
	begin
		select distinct NhanVien.MaNhanVien, TenNV, count(TinhTrang) as SoNN
		from NhanVien inner join ChamCong on NhanVien.MaNhanVien = ChamCong.MaNhanVien
		where Ngay >= @ngaydau and Ngay <= @ngaycuoi and TinhTrang = N'Nghỉ Không Phép'
		group by NhanVien.MaNhanVien, TenNV
	end
-----------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[TongLuongNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create proc [dbo].[TongLuongNV]
@ma varchar(5)
as
if(@ma = '0')
begin
	select MaNhanVien, TenNV, NhanVien.HeSoLuong, '0' as NL, '0' as T, '0' as P, '0' as Tien, '0' as TL
	From NhanVien inner join Luong on NhanVien.HeSoLuong = Luong.HeSoLuong
end
else 
begin
	select LuongCB from NhanVien inner join Luong on NhanVien.HeSoLuong = Luong.HeSoLuong
	where MaNhanVien = @ma
end

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaBaoHiem]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaBaoHiem]
@manv varchar(5),
@loaibh nvarchar(50)
as
	delete BaoHiem where MaNhanVien = @manv and LoaiBaohiem = @loaibh

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaBaoHiemTheoNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaBaoHiemTheoNV]
@manv varchar(5)
as
	delete BaoHiem where MaNhanVien = @manv
------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------PhuCap-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaCapNhat]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaCapNhat]
@macv varchar(5)
as
	delete ChucVu where MaCV = @macv
------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Bảng Thưởng Phạt-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaChamCong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[XoaChamCong]
@manv varchar(5)
as
	delete ChamCong where MaNhanVien = @manv

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaChamCongTheoNgay]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[XoaChamCongTheoNgay]
@ngay date
as
	delete ChamCong where Ngay = @ngay


-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoactChucVu]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoactChucVu]
@manv varchar(5)
as
	delete ctChucVu where MaNhanVien = @manv

-------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaHopDong]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[XoaHopDong]
@mahd varchar(5)
as
delete HopDong where MaHD = @mahd
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaNhanVien]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[XoaNhanVien]
@manv varchar(5)
as
	if(exists(select MaNhanVien from NhanVien where MaNhanVien = @manv))
	begin
		delete NhanVien where MaNhanVien = @manv
	end
	else 
		select err = 1
-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaPhongBan]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[XoaPhongBan]
@maphong varchar(5)
as
	if((not exists(select MaPB from NhanVien where MaPB = @maphong)) and (not exists (Select MaPB from HopDong where MaPB = @maphong)))
	begin
		delete PhongBan where MaPB = @maphong
	end
	else
		select err = 1

-------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaPhuCap]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaPhuCap]
@manv varchar(5),
@loaipc nvarchar(50)
as
	delete PhuCap where MaNhanVien = @manv and LoaiPC = @loaipc

---------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaPhuCapTheoNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaPhuCapTheoNV]
@manv varchar(5)
as
	delete PhuCap where MaNhanVien = @manv
------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------Thống Kê-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaThuongPhat]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaThuongPhat]
@manv varchar(5),
@loai nvarchar(100),
@tien int,
@lydo nvarchar(100)
as
	delete ThuongPhat where (MaNhanVien = @manv and Loai = @loai and Tien = @tien and LyDo = @lydo)

------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaThuongPhatTheoNV]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[XoaThuongPhatTheoNV]
@manv varchar(5)
as
	delete ThuongPhat where MaNhanVien = @manv
------------------------------------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[XoaTK]    Script Date: 12/28/2021 11:05:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[XoaTK]
@ma varchar(5)
as
	delete Taikhoan where MaNhanVien = @ma

-------------------------------------------------------------------------------------------------
GO
USE [master]
GO
ALTER DATABASE [QlNhanSu] SET  READ_WRITE 
GO
