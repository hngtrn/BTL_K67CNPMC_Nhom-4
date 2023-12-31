USE [QuanLyBanGao2]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [char](6) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[Giaban] [money] NULL,
	[Soluong] [int] NULL,
	[Donvi] [nvarchar](50) NULL,
	[TenNCC] [nvarchar](50) NULL,
	[NSX] [datetime] NOT NULL,
	[HSD] [datetime] NULL,
	[Tonkho] [nvarchar](50) NULL,
	[Gianhap] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCC]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCC](
	[MaNCC] [char](6) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](100) NULL,
	[Dienthoai] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SANPHAM]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_SANPHAM]
as
SELECT        TOP (100) PERCENT dbo.NCC.MaNCC, dbo.SANPHAM.TenNCC, dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.SANPHAM.Giaban, dbo.SANPHAM.Soluong, dbo.SANPHAM.Donvi, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD
FROM            dbo.NCC INNER JOIN
                         dbo.SANPHAM ON dbo.NCC.TenNCC = dbo.SANPHAM.TenNCC
ORDER BY dbo.SANPHAM.MaSP
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [char](6) NOT NULL,
	[ngaylap] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHOADON]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHOADON](
	[MaHD] [char](6) NOT NULL,
	[MaSP] [char](6) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[SlBan] [int] NULL,
	[Donvi] [nvarchar](50) NULL,
	[Giaban] [money] NULL,
	[Giamgia] [real] NULL,
	[TongHD] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_CTHOADON_SANPHAM]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_CTHOADON_SANPHAM]
As
SELECT        TOP (100) PERCENT dbo.NCC.MaNCC, dbo.NCC.TenNCC, dbo.NCC.Diachi, dbo.NCC.Dienthoai, dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.SANPHAM.Soluong, dbo.SANPHAM.Donvi, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD, 
                         dbo.CTHOADON.MaHD, dbo.CTHOADON.SlBan, dbo.CTHOADON.Giaban AS Expr1, dbo.HOADON.ngaylap
FROM            dbo.CTHOADON INNER JOIN
                         dbo.HOADON ON dbo.CTHOADON.MaHD = dbo.HOADON.MaHD INNER JOIN
                         dbo.SANPHAM ON dbo.CTHOADON.MaSP = dbo.SANPHAM.MaSP INNER JOIN
                         dbo.NCC ON dbo.SANPHAM.TenNCC = dbo.NCC.TenNCC
ORDER BY dbo.SANPHAM.MaSP, dbo.CTHOADON.MaHD
GO
/****** Object:  Table [dbo].[PNHAP]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PNHAP](
	[MaPN] [char](6) NOT NULL,
	[ngaynhap] [datetime] NOT NULL,
	[MaNCC] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPNHAP]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPNHAP](
	[MaPN] [char](6) NOT NULL,
	[MaSP] [char](6) NOT NULL,
	[SlNhap] [int] NULL,
	[Donvi] [nvarchar](50) NULL,
	[Gianhap] [money] NULL,
	[TongGT] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_CTPNHAP_SANPHAM]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_CTPNHAP_SANPHAM]
As
SELECT        TOP (100) PERCENT dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.SANPHAM.Giaban, dbo.SANPHAM.Soluong, dbo.SANPHAM.TenNCC, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD, dbo.CTPNHAP.MaPN, dbo.CTPNHAP.SlNhap, 
                         dbo.CTPNHAP.Donvi AS Expr1, dbo.CTPNHAP.Gianhap, dbo.CTPNHAP.TongGT, dbo.PNHAP.ngaynhap
FROM            dbo.CTPNHAP INNER JOIN
                         dbo.PNHAP ON dbo.CTPNHAP.MaPN = dbo.PNHAP.MaPN INNER JOIN
                         dbo.SANPHAM ON dbo.CTPNHAP.MaSP = dbo.SANPHAM.MaSP
ORDER BY dbo.SANPHAM.MaSP, dbo.CTPNHAP.MaPN
GO
/****** Object:  Table [dbo].[TONKHO]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TONKHO](
	[Namthang] [datetime] NOT NULL,
	[MaSP] [char](6) NOT NULL,
	[SlBandau] [int] NULL,
	[SlTongNhap] [int] NULL,
	[SlTongBan] [int] NULL,
	[SlCuoi] [int] NULL,
	[Donvi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Namthang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SANPHAMtrongkho]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_SANPHAMtrongkho]
As
SELECT        TOP (100) PERCENT dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.SANPHAM.Giaban, dbo.SANPHAM.Soluong, dbo.SANPHAM.Donvi, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD, dbo.TONKHO.Namthang, dbo.TONKHO.SlBandau, 
                         dbo.TONKHO.SlCuoi
FROM            dbo.SANPHAM INNER JOIN
                         dbo.TONKHO ON dbo.SANPHAM.MaSP = dbo.TONKHO.MaSP
WHERE        (dbo.TONKHO.MaSP = '150S')
ORDER BY dbo.TONKHO.Namthang, dbo.TONKHO.MaSP
GO
/****** Object:  View [dbo].[vw_SANPHAMNHAP]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_SANPHAMNHAP]
As
SELECT        TOP (100) PERCENT dbo.PNHAP.MaPN, dbo.PNHAP.ngaynhap, dbo.CTPNHAP.MaSP, dbo.CTPNHAP.SlNhap, dbo.CTPNHAP.Donvi, dbo.CTPNHAP.Gianhap, dbo.CTPNHAP.TongGT, dbo.SANPHAM.TenSP, dbo.SANPHAM.Giaban, 
                         dbo.SANPHAM.Soluong, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD
FROM            dbo.CTPNHAP INNER JOIN
                         dbo.PNHAP ON dbo.CTPNHAP.MaPN = dbo.PNHAP.MaPN INNER JOIN
                         dbo.SANPHAM ON dbo.CTPNHAP.MaSP = dbo.SANPHAM.MaSP
WHERE        (dbo.PNHAP.ngaynhap = CONVERT(DATETIME, '10-11-2022 00:00:00', 113))
ORDER BY dbo.PNHAP.MaPN, dbo.CTPNHAP.MaSP
GO
/****** Object:  View [dbo].[vw_SLNHAP]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_SLNHAP]
As
SELECT        TOP (100) PERCENT dbo.PNHAP.MaPN, dbo.PNHAP.ngaynhap, dbo.PNHAP.MaNCC, dbo.CTPNHAP.SlNhap, dbo.CTPNHAP.Donvi, dbo.CTPNHAP.Gianhap, dbo.CTPNHAP.TongGT, dbo.SANPHAM.TenSP, dbo.SANPHAM.Soluong, 
                         dbo.SANPHAM.Donvi AS Expr1, dbo.SANPHAM.TenNCC, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD
FROM            dbo.CTPNHAP INNER JOIN
                         dbo.PNHAP ON dbo.CTPNHAP.MaPN = dbo.PNHAP.MaPN INNER JOIN
                         dbo.SANPHAM ON dbo.CTPNHAP.MaSP = dbo.SANPHAM.MaSP
WHERE        (dbo.CTPNHAP.SlNhap = 1000)
ORDER BY dbo.PNHAP.MaPN
GO
/****** Object:  View [dbo].[vw_TONKHO]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_TONKHO]
As
SELECT        dbo.NCC.MaNCC, dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.SANPHAM.Giaban, dbo.SANPHAM.Soluong, dbo.SANPHAM.Donvi, dbo.SANPHAM.TenNCC, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD, dbo.TONKHO.Namthang, 
                         dbo.TONKHO.SlBandau, dbo.TONKHO.SlCuoi
FROM            dbo.NCC INNER JOIN
                         dbo.SANPHAM ON dbo.NCC.TenNCC = dbo.SANPHAM.TenNCC INNER JOIN
                         dbo.TONKHO ON dbo.SANPHAM.MaSP = dbo.TONKHO.MaSP
WHERE        (dbo.SANPHAM.Soluong = 1000) OR
                         (dbo.SANPHAM.Soluong = 2000)
GO
/****** Object:  Table [dbo].[DOANHTHU]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOANHTHU](
	[Thang] [datetime] NOT NULL,
	[MaSP] [char](6) NOT NULL,
	[Giavon] [money] NULL,
	[Doanhthu] [int] NULL,
	[Loinhuan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Thang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HOADONSANPHAM]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_HOADONSANPHAM]
As
SELECT        TOP (100) PERCENT dbo.HOADON.MaHD, dbo.HOADON.ngaylap, dbo.CTHOADON.MaSP, dbo.CTHOADON.TenSP, dbo.CTHOADON.Donvi, dbo.CTHOADON.Giaban, dbo.CTHOADON.Giamgia, dbo.SANPHAM.Soluong, 
                         dbo.SANPHAM.NSX, dbo.SANPHAM.HSD, dbo.DOANHTHU.Thang, dbo.DOANHTHU.Doanhthu, dbo.DOANHTHU.Loinhuan
FROM            dbo.CTHOADON INNER JOIN
                         dbo.DOANHTHU ON dbo.CTHOADON.MaSP = dbo.DOANHTHU.MaSP INNER JOIN
                         dbo.HOADON ON dbo.CTHOADON.MaHD = dbo.HOADON.MaHD INNER JOIN
                         dbo.SANPHAM ON dbo.CTHOADON.MaSP = dbo.SANPHAM.MaSP AND dbo.DOANHTHU.MaSP = dbo.SANPHAM.MaSP
WHERE        (dbo.CTHOADON.MaSP = '511P') OR
                         (dbo.CTHOADON.MaSP = '524')
ORDER BY dbo.HOADON.MaHD, dbo.CTHOADON.MaSP
GO
/****** Object:  View [dbo].[vw_CTHOADONSANPHAM]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_CTHOADONSANPHAM]
As
SELECT        TOP (100) PERCENT dbo.SANPHAM.MaSP, dbo.SANPHAM.TenSP, dbo.SANPHAM.Giaban, dbo.SANPHAM.Soluong, dbo.SANPHAM.NSX, dbo.SANPHAM.HSD, dbo.SANPHAM.Donvi, dbo.SANPHAM.TenNCC, dbo.CTHOADON.MaHD, 
                         dbo.CTHOADON.SlBan, dbo.HOADON.ngaylap, dbo.CTHOADON.Giamgia, dbo.CTHOADON.TongHD
FROM            dbo.CTHOADON INNER JOIN
                         dbo.HOADON ON dbo.CTHOADON.MaHD = dbo.HOADON.MaHD INNER JOIN
                         dbo.SANPHAM ON dbo.CTHOADON.MaSP = dbo.SANPHAM.MaSP
ORDER BY dbo.SANPHAM.MaSP, dbo.CTHOADON.MaHD
GO
/****** Object:  View [dbo].[vw_CTSANPHAMNHAP]    Script Date: 01-Dec-23 7:06:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[vw_CTSANPHAMNHAP]
As
SELECT        TOP (100) PERCENT dbo.PNHAP.MaPN, dbo.PNHAP.ngaynhap, dbo.PNHAP.MaNCC, dbo.CTPNHAP.MaSP, dbo.CTPNHAP.SlNhap, dbo.CTPNHAP.Donvi, dbo.CTPNHAP.Gianhap, dbo.CTPNHAP.TongGT, dbo.SANPHAM.TenSP, 
                         dbo.SANPHAM.Giaban, dbo.SANPHAM.Soluong, dbo.SANPHAM.TenNCC, dbo.SANPHAM.HSD
FROM            dbo.CTPNHAP INNER JOIN
                         dbo.PNHAP ON dbo.CTPNHAP.MaPN = dbo.PNHAP.MaPN INNER JOIN
                         dbo.SANPHAM ON dbo.CTPNHAP.MaSP = dbo.SANPHAM.MaSP
WHERE        (dbo.CTPNHAP.MaSP = '150S') OR
                         (dbo.CTPNHAP.MaSP = '510M')
ORDER BY dbo.PNHAP.MaPN, dbo.CTPNHAP.MaSP
GO
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0001', N'550S  ', N'Gạo hữu cơ', 750, N'Kg', 21050.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0001', N'552M  ', N'Gạo lứt tím than', 500, N'Kg', 10740.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0001', N'552S  ', N'Gạo nếp cái hoa vàng', 200, N'Kg', 10600.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0002', N'150   ', N'Gạo trắng hạt dài', 2000, N'Kg', 11840.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0002', N'150S  ', N'Gạo thơm nàng Sen', 500, N'Kg', 16840.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0002', N'551   ', N'Gạo lứt huyết rồng', 5000, N'Kg', 11170.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0002', N'567   ', N'Gạo tám xoan', 1500, N'Kg', 16825.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0002', N'567S  ', N'Gạo sữa Mai Vàng', 1000, N'Kg', 11240.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0003', N'150S  ', N'Gạo thơm nàng Sen', 1500, N'Kg', 16840.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0003', N'510   ', N'Gạo ST24', 1000, N'Kg', 12280.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0004', N'510M  ', N'Gạo Hàm Châu', 250, N'Kg', 11700.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0005', N'BC01  ', N'Gạo BC', 1000, N'Kg', 10700.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0005', N'BT01  ', N'Gạo bắc thơm', 2500, N'Kg', 13500.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0006', N'T01   ', N'Gạo thái', 1000, N'Kg', 1400.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0006', N'TL00  ', N'Gạo thơm lài-VIP', 2500, N'Kg', 13000.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0006', N'TL01  ', N'Gạo thơm lài', 100, N'Kg', 12500.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0006', N'X01   ', N'Gạo xay', 1000, N'Kg', 9800.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0007', N'ST24  ', N'Gạo ST-24', 500, N'Kg', 22700.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0007', N'ST25  ', N'Gạo ST-25', 500, N'Kg', 24000.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0007', N'TT01  ', N'Gạo tám thơm', 2500, N'Kg', 13500.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0008', N'N002  ', N'Gạo nếp quýt', 500, N'Kg', 24000.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0009', N'NN01  ', N'Gạo 504 mới', 10000, N'Kg', 9600.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0010', N'NB01  ', N'Gạo 64 Chợ Đào', 12000, N'Kg', 9800.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0011', N'NK01  ', N'Gạo Mầm Vibigaba', 5000, N'Kg', 10000.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0012', N'T001  ', N'Thóc mùa', 5000, N'Kg', 9800.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0013', N'T002  ', N'Thóc nhập khẩu', 5000, N'Kg', 10000.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0014', N'N001  ', N'Gạo nếp nhung', 100, N'Kg', 22000.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0015', N'150S  ', N'Gạo thơm nàng Sen', 1000, N'Kg', 18720.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0015', N'552S  ', N'Gạo nếp cái hoa vàng', 2000, N'Kg', 11700.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0016', N'550S  ', N'Gạo hữu cơ', 500, N'Kg', 21500.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0016', N'551   ', N'Gạo lứt huyết rồng', 250, N'Kg', 16825.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0016', N'552   ', N'Gạo Tám Thái Đỏ', 500, N'Kg', 10600.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0016', N'552M  ', N'Gạo lứt tím than', 1000, N'Kg', 10740.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0016', N'552S  ', N'Gạo nếp cái hoa vàng', 250, N'Kg', 11170.0000, 0, NULL)
INSERT [dbo].[CTHOADON] ([MaHD], [MaSP], [TenSP], [SlBan], [Donvi], [Giaban], [Giamgia], [TongHD]) VALUES (N'HD0017', N'BT01  ', N'Gạo bắc thơm', 500, N'Kg', 13500.0000, 0, NULL)
GO
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'113   ', 2000, N'Kg', 16453.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'150   ', 2000, N'Kg', 16640.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'150S  ', 5000, N'Kg', 18520.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'510   ', 5000, N'Kg', 12080.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'510M  ', 2000, N'Kg', 11500.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'511   ', 2000, N'Kg', 11240.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'511P  ', 10000, N'Kg', 9800.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'524   ', 5000, N'Kg', 9520.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'550S  ', 2000, N'Kg', 20850.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'551   ', 5000, N'Kg', 16625.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'552   ', 1000, N'Kg', 10400.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'552M  ', 1000, N'Kg', 10540.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'552S  ', 20000, N'Kg', 10970.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'567   ', 2000, N'Kg', 11040.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0001', N'567S  ', 5000, N'Kg', 11640.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'BC01  ', 25000, N'Kg', 10500.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'BT01  ', 50000, N'Kg', 13300.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'M01   ', 5000, N'Kg', 9400.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'ST24  ', 5000, N'Kg', 21400.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'ST25  ', 5000, N'Kg', 22500.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'T01   ', 10000, N'Kg', 13800.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'TL00  ', 25000, N'Kg', 12800.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'TL01  ', 20000, N'Kg', 12300.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'TT01  ', 10000, N'Kg', 13300.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0002', N'X01   ', 10000, N'Kg', 9600.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0003', N'N001  ', 5000, N'Kg', 21800.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0003', N'N002  ', 5000, N'Kg', 23800.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0004', N'NB01  ', 50000, N'Kg', 9600.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0004', N'NK01  ', 20000, N'Kg', 9800.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0004', N'NN01  ', 50000, N'Kg', 9400.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0005', N'T001  ', 25000, N'Kg', 9600.0000, NULL)
INSERT [dbo].[CTPNHAP] ([MaPN], [MaSP], [SlNhap], [Donvi], [Gianhap], [TongGT]) VALUES (N'PN0005', N'T002  ', 20000, N'Kg', 9800.0000, NULL)
GO
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0001', CAST(N'2022-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0002', CAST(N'2022-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0003', CAST(N'2022-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0004', CAST(N'2022-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0005', CAST(N'2022-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0006', CAST(N'2022-10-23T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0007', CAST(N'2022-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0008', CAST(N'2022-10-27T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0009', CAST(N'2022-10-29T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0010', CAST(N'2022-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0011', CAST(N'2022-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0012', CAST(N'2022-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0013', CAST(N'2022-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0014', CAST(N'2022-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0015', CAST(N'2022-11-22T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0016', CAST(N'2022-11-25T00:00:00.000' AS DateTime))
INSERT [dbo].[HOADON] ([MaHD], [ngaylap]) VALUES (N'HD0017', CAST(N'2022-11-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC001', N'Công ty A', N'Hưng Yên', N'0901563888')
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC002', N'Công ty B', N'Hà Nam', N'0913454545')
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC003', N'Công ty C', N'Hà Nội', N'0928677999')
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC004', N'Công ty D', N'Hải Dương', N'0776542289')
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC005', N'Công ty E', N'Hải Dương', N'0867699999')
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC006', N'Công ty F', N'Nghệ An', N'0987654321')
INSERT [dbo].[NCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) VALUES (N'NCC007', N'Công ty G', N'Lào Cai', N'0787777776')
GO
INSERT [dbo].[PNHAP] ([MaPN], [ngaynhap], [MaNCC]) VALUES (N'PN0001', CAST(N'2022-11-10T00:00:00.000' AS DateTime), N'NCC001')
INSERT [dbo].[PNHAP] ([MaPN], [ngaynhap], [MaNCC]) VALUES (N'PN0002', CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'NCC002')
INSERT [dbo].[PNHAP] ([MaPN], [ngaynhap], [MaNCC]) VALUES (N'PN0003', CAST(N'2022-11-16T00:00:00.000' AS DateTime), N'NCC003')
INSERT [dbo].[PNHAP] ([MaPN], [ngaynhap], [MaNCC]) VALUES (N'PN0004', CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'NCC004')
INSERT [dbo].[PNHAP] ([MaPN], [ngaynhap], [MaNCC]) VALUES (N'PN0005', CAST(N'2022-11-13T00:00:00.000' AS DateTime), N'NCC005')
GO
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'113   ', N'Gạo bắc hương Hải Hậu', 16653.0000, 2000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'114   ', N'Gạo mới bắc hương ', 17000.0000, 5000, N'kg', N'Công ty C', CAST(N'2023-10-11T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'150   ', N'Gạo trắng hạt dài', 16840.0000, 2000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'150S  ', N'Gạo thơm nàng Sen', 18720.0000, 5000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'510   ', N'Gạo ST24', 12280.0000, 5000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'510M  ', N'Gạo Hàm Châu', 11700.0000, 2000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'511   ', N'Gạo thơm lài miên', 11440.0000, 2000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'511P  ', N'Gạo thơm Sóc Trăng', 10000.0000, 10000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'524   ', N'Gạo nếp bắc', 9720.0000, 5000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'550S  ', N'Gạo hữu cơ', 21050.0000, 2000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'551   ', N'Gạo lứt huyết rồng', 16825.0000, 5000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'552   ', N'Gạo Tám Thái Đỏ', 10600.0000, 1000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'552M  ', N'Gạo lứt tím than', 10740.0000, 1000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'552S  ', N'Gạo nếp cái hoa vàng', 11170.0000, 200000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'567   ', N'Gạo tám xoan', 11240.0000, 2000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'567S  ', N'Gạo sữa Mai Vàng', 11840.0000, 5000, N'Kg', N'Công ty A', CAST(N'2022-10-08T00:00:00.000' AS DateTime), CAST(N'2023-08-04T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'BC01  ', N'Gạo BC', 10700.0000, 25000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'BT01  ', N'Gạo bắc thơm', 13500.0000, 50000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'G504M ', N'Gạo 504 Mới', 20000.0000, 1500, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'G64TD ', N'Gạo 64 Thơm Dứa', 20000.0000, 2000, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GAD   ', N'Gạo lứt Ấn', 15000.0000, 3000, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GC    ', N'Gạo Champa', 25000.0000, 2000, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GC02  ', N'Gạo Chiêm', 17000.0000, 2000, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GCBH  ', N'Gạo Cũ Bắc Hương', 19000.0000, 1000, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GCM   ', N'Gạo Cỏ May', 22000.0000, 1600, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GDL2  ', N'Gạo Đài Loan 2', 22000.0000, 1500, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GDT   ', N'Gạo Đài Thơm', 22000.0000, 1200, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GGC   ', N'Gạo Gò Công', 17000.0000, 3000, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GHC   ', N'Gạo Hữu Cơ', 22000.0000, 2400, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GHK   ', N'Gạo Hồng Kong', 21000.0000, 1400, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GHM   ', N'Gạo Hoa mai', 27000.0000, 2000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GHN   ', N'Gạo Hàn Nhật', 23000.0000, 2100, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GHNT  ', N'Gạo Hạt Ngọc Trời', 25000.0000, 1500, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GL01  ', N'Gạo lứt', 20000.0000, 1500, N'kg', N'Công ty B ', CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2024-10-10T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GLC   ', N'Gạo lài Campuchia', 18000.0000, 2000, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GLC1  ', N'Gạo Long Châu', 20000.0000, 2000, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GMBH  ', N'Gạo Mới Bắc Hương', 26000.0000, 2200, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GMD   ', N'Gạo Miến Điện', 30000.0000, 1800, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GMG   ', N'Gạo Mầm Gaba', 20000.0000, 1500, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GMN   ', N'Gạo Mầm Nghệ', 25000.0000, 1500, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNA   ', N'Gạo nếp Ấn', 19000.0000, 1000, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNCTB ', N'Gạo Nếp Cẩm Tây Bắc', 26000.0000, 2000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GND   ', N'Gạo nàng Đông ', 14000.0000, 1500, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNDB  ', N'Gạo nếp Điện Biên', 20000.0000, 2000, N'kg', N'Công ty B', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNH   ', N'Gạo nàng Hạ', 20000.0000, 4000, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-15T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNH1  ', N'Gạo Nàng Hoa', 25000.0000, 2000, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNN   ', N'Gạo Nếp Nương', 22000.0000, 1500, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNN1  ', N'Gạo Nếp Ngỗng', 21000.0000, 1500, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNT   ', N'Gạo nàng Thu', 18000.0000, 2000, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNT1  ', N'Gạo Nếp Than', 22000.0000, 1400, N'kg', N'Công ty B', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GNX   ', N'Gạo nàng Xuân ', 22000.0000, 2022, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GOC   ', N'Gạo Ông Cua', 23000.0000, 1500, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GS1   ', N'Gạo sữa', 27000.0000, 2000, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GT01  ', N'Gạo Tám đỏ', 20000.0000, 5000, N'kg', N'Công ty F', CAST(N'2023-10-12T00:00:00.000' AS DateTime), CAST(N'2025-11-10T00:00:00.000' AS DateTime), N'5000', 18000.0000)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GT02  ', N'Gạo Tám đen', 25000.0000, 2500, N'kg', N'Công ty F', CAST(N'2023-10-12T00:00:00.000' AS DateTime), CAST(N'2025-11-15T00:00:00.000' AS DateTime), N'2500', NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GT03  ', N'Gạo Tám trắng ', 21000.0000, 2200, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTAA  ', N'Gạo Thơm A An', 18000.0000, 1400, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTAN  ', N'Gạo tẻ ẤN', 25000.0000, 3000, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTB1  ', N'Gạo tẻ B1', 19000.0000, 2100, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTB2  ', N'Gạo tẻ B2', 22000.0000, 1500, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTC2  ', N'Gạo tẻ C2', 20000.0000, 2000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTD   ', N'Gạo Thơm Dứa', 26000.0000, 2000, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTDB  ', N'Gạo Tám Điện Biên', 24000.0000, 1800, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTHC  ', N'Gạo Thơm Hữu Cơ', 35000.0000, 3000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTJ85 ', N'Gạo Thơm Jasmine 85', 14000.0000, 19000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTJ86 ', N'Gạo Thơm Jasmine 86', 15000.0000, 2000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTJ87 ', N'Gạo thơm Jasmine 87', 19000.0000, 3000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTJ88 ', N'Gạo thơm Jasmine 88', 20000.0000, 2000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTJ89 ', N'Gạo thơm Jasmine 89', 22000.0000, 1900, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTJ90 ', N'Gạo thơm Jasmine 90', 25000.0000, 2000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTL   ', N'Gạo Thái Lan', 22000.0000, 2000, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTLB  ', N'Gạo Thơm Lài Bún', 24000.0000, 1300, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTM   ', N'Gạo Thơm Mỹ', 25000.0000, 1400, N'kg', N'Công ty G', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTNC  ', N'Gạo Tài Nguyen chợ Cóc', 28000.0000, 2000, N'kg', N'Công ty B', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTND  ', N'Gạo Tài Nguyên Chợ đào ', 30000.0000, 2500, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTQ   ', N'Gạo Tứ Quý', 25000.0000, 1900, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTS   ', N'Gạo Tấm Sari', 18000.0000, 1500, N'kg', N'Công ty A', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTSM  ', N'Gạo Tấm Sa Mơ', 26000.0000, 1800, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTT2  ', N'Gạo Thơm Thái 2', 21000.0000, 2000, N'kg', N'Công ty C', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTTE  ', N'Gạo Tám Thái Én', 26000.0000, 1500, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GTTH  ', N'Gạo Trắng Trung Hoa', 15000.0000, 1500, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GVC   ', N'Gạo Vô Cơ', 13000.0000, 2000, N'kg', N'Công ty B', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GVN   ', N'Gạo Việt Nhật', 22000.0000, 1800, N'kg', N'Công ty D', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GXD   ', N'Gạo Xi Dẻo', 26000.0000, 2000, N'kg', N'Công ty E', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'GXM   ', N'Gạo Xi Mềm', 25000.0000, 1000, N'kg', N'Công ty F', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'M01   ', N'Gạo mằn', 9600.0000, 5000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'N001  ', N'Gạo nếp nhung', 22000.0000, 5000, N'Kg', N'Công ty C', CAST(N'2022-11-10T00:00:00.000' AS DateTime), CAST(N'2023-11-10T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'N002  ', N'Gạo nếp quýt', 24000.0000, 5000, N'Kg', N'Công ty C', CAST(N'2022-11-10T00:00:00.000' AS DateTime), CAST(N'2023-11-10T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'NB01  ', N'Gạo 64 Chợ Đào', 9800.0000, 50000, N'Kg', N'Công ty D', CAST(N'2022-10-28T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'NK01  ', N'Gạo Mầm Vibigaba', 10000.0000, 20000, N'Kg', N'Công ty D', CAST(N'2022-10-28T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'NN01  ', N'Gạo 504 mới', 9600.0000, 50000, N'Kg', N'Công ty D', CAST(N'2022-10-28T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'ST24  ', N'Gạo ST-24', 21600.0000, 5000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'ST25  ', N'Gạo ST-25', 22700.0000, 5000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'T001  ', N'Thóc mùa', 9800.0000, 25000, N'Kg', N'Công ty E', CAST(N'2022-10-20T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'T002  ', N'Thóc nhập khẩu', 10000.0000, 20000, N'Kg', N'Công ty E', CAST(N'2022-09-23T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'T01   ', N'Gạo thái', 14000.0000, 10000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'TL00  ', N'Gạo thơm lài-VIP', 13000.0000, 25000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'TL01  ', N'Gạo thơm lài', 12500.0000, 20000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'TT01  ', N'Gạo tám thơm', 13500.0000, 10000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Giaban], [Soluong], [Donvi], [TenNCC], [NSX], [HSD], [Tonkho], [Gianhap]) VALUES (N'X01   ', N'Gạo xay', 9800.0000, 10000, N'Kg', N'Công ty B', CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'113   ', 1000, 2000, 900, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'150   ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'150S  ', 1500, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'510   ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'510M  ', 500, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'511   ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'511P  ', 2500, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'524   ', 2000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'550S  ', 2000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'551   ', 2500, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'552   ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'552M  ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'552S  ', 10000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'567   ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'567S  ', 2000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'BC01  ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'BT01  ', 2000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'M01   ', 3000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'N001  ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'N002  ', 200, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'NB01  ', 2000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'NK01  ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'NN01  ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'ST24  ', 750, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'ST25  ', 1000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'T001  ', 3000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'T002  ', 2000, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'T01   ', 200, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'TL00  ', 250, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'TL01  ', 500, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'TT01  ', 500, NULL, NULL, NULL, N'Kg')
INSERT [dbo].[TONKHO] ([Namthang], [MaSP], [SlBandau], [SlTongNhap], [SlTongBan], [SlCuoi], [Donvi]) VALUES (CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'X01   ', 1000, NULL, NULL, NULL, N'Kg')
GO
ALTER TABLE [dbo].[SANPHAM] ADD  DEFAULT ((0)) FOR [Soluong]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHOADON_HOADON] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADON] ([MaHD])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK_CTHOADON_HOADON]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHOADON_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK_CTHOADON_SanPham]
GO
ALTER TABLE [dbo].[CTPNHAP]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CTPNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTPNHAP_PNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PNHAP] ([MaPN])
GO
ALTER TABLE [dbo].[CTPNHAP] CHECK CONSTRAINT [FK_CTPNHAP_PNhap]
GO
ALTER TABLE [dbo].[DOANHTHU]  WITH CHECK ADD  CONSTRAINT [FK_DOANHTHU_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[DOANHTHU] CHECK CONSTRAINT [FK_DOANHTHU_SanPham]
GO
ALTER TABLE [dbo].[PNHAP]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NCC] ([MaNCC])
GO
ALTER TABLE [dbo].[TONKHO]  WITH CHECK ADD  CONSTRAINT [FK_TONKHO_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[TONKHO] CHECK CONSTRAINT [FK_TONKHO_SanPham]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD CHECK  (([Giamgia]>=(0) AND [Giamgia]<=(100)))
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD CHECK  (([Giamgia]>=(0) AND [Giamgia]<=(100)))
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD CHECK  (([SlBan]>(0)))
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD CHECK  (([SlBan]>(0)))
GO
ALTER TABLE [dbo].[CTPNHAP]  WITH CHECK ADD CHECK  (([SlNhap]>(0)))
GO
ALTER TABLE [dbo].[CTPNHAP]  WITH CHECK ADD CHECK  (([SlNhap]>(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
