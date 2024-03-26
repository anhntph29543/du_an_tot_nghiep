create database DATN_SD32
USE [DATN_SD32]
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 18/03/2024 21:44:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[ID_Anh] [uniqueidentifier] NOT NULL,
	[ID_SPCT] [uniqueidentifier] NULL,
	[maAnh] [varchar](50) NULL,
 CONSTRAINT [PK_Anh] PRIMARY KEY CLUSTERED 
(
	[ID_Anh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bang_Thong_Bao]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bang_Thong_Bao](
	[ID_ThongBao] [uniqueidentifier] NOT NULL,
	[ID_NhanVien] [uniqueidentifier] NULL,
	[ID_KhachHang] [uniqueidentifier] NULL,
	[maThongBao] [varchar](50) NULL,
	[tenThongBao] [nvarchar](50) NULL,
	[noiDung] [nvarchar](50) NULL,
	[thoiGianGui] [datetime] NULL,
 CONSTRAINT [PK_Bang_Thong_Bao] PRIMARY KEY CLUSTERED 
(
	[ID_ThongBao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat_Lieu]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat_Lieu](
	[ID_ChatLieu] [uniqueidentifier] NOT NULL,
	[maChatLieu] [varchar](50) NULL,
	[tenChatLieu] [nvarchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_Chat_Lieu] PRIMARY KEY CLUSTERED 
(
	[ID_ChatLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dia_Chi]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dia_Chi](
	[ID_DiaChi] [uniqueidentifier] NOT NULL,
	[ID_KhachHang] [uniqueidentifier] NULL,
	[maDiaChi] [varchar](50) NULL,
	[hoTen] [nvarchar](50) NULL,
	[sdt] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[tinhThanhPho] [nvarchar](50) NULL,
	[huyen] [nvarchar](50) NULL,
	[phuong] [nvarchar](50) NULL,
	[diaChi] [nvarchar](50) NULL,
	[ghiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dia_Chi] PRIMARY KEY CLUSTERED 
(
	[ID_DiaChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Don_Hang]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Don_Hang](
	[ID_DonHang] [uniqueidentifier] NOT NULL,
	[maDonHang] [varchar](50) NULL,
	[ID_NhanVien] [uniqueidentifier] NULL,
	[ID_KhachHang] [uniqueidentifier] NULL,
	[ID_PhieuGiamGia] [uniqueidentifier] NULL,
	[loaiDon] [nvarchar](50) NULL,
	[ngayTao] [datetime] NULL,
	[ngayThanhToan] [datetime] NULL,
	[tongTien] [money] NULL,
	[giamGia] [money] NULL,
	[phiVanChuyen] [money] NULL,
	[tienKhachPhaiTra] [money] NULL,
	[tienKhachDua] [money] NULL,
	[tienThua] [money] NULL,
	[hinhThucThanhToan] [bit] NULL,
	[trangThaiDonHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_Don_Hang] PRIMARY KEY CLUSTERED 
(
	[ID_DonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Don_Hang_Chi_Tiet]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Don_Hang_Chi_Tiet](
	[ID_DonHangChiTiet] [uniqueidentifier] NOT NULL,
	[ID_SPCT] [uniqueidentifier] NULL,
	[ID_DonHang] [uniqueidentifier] NULL,
	[tenSPCT] [nvarchar](50) NULL,
	[soLuong] [int] NULL,
	[giaSanPham] [money] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_Don_Hang_Chi_Tiet] PRIMARY KEY CLUSTERED 
(
	[ID_DonHangChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gio_Hang]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gio_Hang](
	[ID_GioHang] [uniqueidentifier] NOT NULL,
	[ID_KhachHang] [uniqueidentifier] NULL,
	[maGioHang] [varchar](50) NULL,
 CONSTRAINT [PK_Gio_Hang] PRIMARY KEY CLUSTERED 
(
	[ID_GioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gio_Hang_Chi_Tiet]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gio_Hang_Chi_Tiet](
	[ID_GioHangChiTiet] [uniqueidentifier] NOT NULL,
	[ID_GioHang] [uniqueidentifier] NULL,
	[ID_SanPhamChiTiet] [uniqueidentifier] NULL,
	[tenSPCT] [nvarchar](50) NULL,
	[soLuong] [int] NULL,
	[giaSanPham] [money] NULL,
	[ngayThem] [datetime] NULL,
 CONSTRAINT [PK_Gio_Hang_Chi_Tiet] PRIMARY KEY CLUSTERED 
(
	[ID_GioHangChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khach_Hang]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khach_Hang](
	[ID_KhachHang] [uniqueidentifier] NOT NULL,
	[ID_TaiKhoan] [uniqueidentifier] NULL,
	[maKhachHang] [varchar](50) NULL,
	[hoTen] [nvarchar](50) NULL,
	[gioiTinh] [bit] NULL,
	[sdt] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
	[anh] [nvarchar](max) NULL,
 CONSTRAINT [PK_Khach_Hang] PRIMARY KEY CLUSTERED 
(
	[ID_KhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kich_Co]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kich_Co](
	[ID_KichCo] [uniqueidentifier] NOT NULL,
	[maKichCo] [varchar](50) NULL,
	[tenKichCo] [nvarchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_Kich_Co] PRIMARY KEY CLUSTERED 
(
	[ID_KichCo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mau_Sac]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mau_Sac](
	[ID_MauSac] [uniqueidentifier] NOT NULL,
	[maMauSac] [varchar](50) NULL,
	[tenMauSac] [nvarchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_Mau_Sac] PRIMARY KEY CLUSTERED 
(
	[ID_MauSac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhan_Vien]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhan_Vien](
	[ID_NhanVien] [uniqueidentifier] NOT NULL,
	[ID_TaiKhoan] [uniqueidentifier] NULL,
	[maNhanVien] [varchar](50) NULL,
	[hoTen] [nvarchar](50) NULL,
	[gioiTinh] [bit] NULL,
	[ngaySinh] [date] NULL,
	[cccd] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[sdt] [varchar](50) NULL,
	[anh] [varchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_Nhan_Vien] PRIMARY KEY CLUSTERED 
(
	[ID_NhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phieu_Giam_Gia]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phieu_Giam_Gia](
	[ID_PhieuGiamGia] [uniqueidentifier] NOT NULL,
	[maPhieuGiamGia] [nvarchar](50) NULL,
	[giaTri] [int] NULL,
	[soLuong] [int] NULL,
	[ngayBatDau] [datetime] NULL,
	[ngayKetThuc] [datetime] NULL,
	[trangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PhieuGiamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[San_Pham]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[San_Pham](
	[ID_SanPham] [uniqueidentifier] NOT NULL,
	[ID_ThuongHieu] [uniqueidentifier] NULL,
	[maSanPham] [varchar](50) NULL,
	[tenSanPham] [nvarchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_San_Pham] PRIMARY KEY CLUSTERED 
(
	[ID_SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[San_Pham_Chi_Tiet]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[San_Pham_Chi_Tiet](
	[ID_SanPhamChiTiet] [uniqueidentifier] NOT NULL,
	[ID_SanPham] [uniqueidentifier] NULL,
	[maSPCT] [varchar](50) NULL,
	[ID_ChatLieu] [uniqueidentifier] NULL,
	[ID_MauSac] [uniqueidentifier] NULL,
	[ID_KichCo] [uniqueidentifier] NULL,
	[donGia] [money] NULL,
	[soLuong] [int] NULL,
	[trangThai] [bit] NULL,
	[moTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_San_Pham_Chi_Tiet] PRIMARY KEY CLUSTERED 
(
	[ID_SanPhamChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tai_Khoan]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tai_Khoan](
	[ID_TaiKhoan] [uniqueidentifier] NOT NULL,
	[user] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Tai_Khoan] PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuong_Hieu]    Script Date: 18/03/2024 21:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuong_Hieu](
	[ID_ThuongHieu] [uniqueidentifier] NOT NULL,
	[maThuongHieu] [varchar](50) NULL,
	[tenThuongHieu] [nvarchar](50) NULL,
	[ngayThem] [datetime] NULL,
	[trangThai] [bit] NULL,
 CONSTRAINT [PK_Thuong_Hieu] PRIMARY KEY CLUSTERED 
(
	[ID_ThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anh] ADD  DEFAULT (newid()) FOR [ID_Anh]
GO
ALTER TABLE [dbo].[Bang_Thong_Bao] ADD  DEFAULT (newid()) FOR [ID_ThongBao]
GO
ALTER TABLE [dbo].[Chat_Lieu] ADD  DEFAULT (newid()) FOR [ID_ChatLieu]
GO
ALTER TABLE [dbo].[Dia_Chi] ADD  DEFAULT (newid()) FOR [ID_DiaChi]
GO
ALTER TABLE [dbo].[Don_Hang] ADD  CONSTRAINT [DF__Don_Hang__ID_Don__4222D4EF]  DEFAULT (newid()) FOR [ID_DonHang]
GO
ALTER TABLE [dbo].[Don_Hang_Chi_Tiet] ADD  DEFAULT (newid()) FOR [ID_DonHangChiTiet]
GO
ALTER TABLE [dbo].[Gio_Hang] ADD  DEFAULT (newid()) FOR [ID_GioHang]
GO
ALTER TABLE [dbo].[Gio_Hang_Chi_Tiet] ADD  DEFAULT (newid()) FOR [ID_GioHangChiTiet]
GO
ALTER TABLE [dbo].[Khach_Hang] ADD  DEFAULT (newid()) FOR [ID_KhachHang]
GO
ALTER TABLE [dbo].[Kich_Co] ADD  DEFAULT (newid()) FOR [ID_KichCo]
GO
ALTER TABLE [dbo].[Mau_Sac] ADD  DEFAULT (newid()) FOR [ID_MauSac]
GO
ALTER TABLE [dbo].[Nhan_Vien] ADD  DEFAULT (newid()) FOR [ID_NhanVien]
GO
ALTER TABLE [dbo].[Phieu_Giam_Gia] ADD  DEFAULT (newid()) FOR [ID_PhieuGiamGia]
GO
ALTER TABLE [dbo].[San_Pham] ADD  DEFAULT (newid()) FOR [ID_SanPham]
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet] ADD  DEFAULT (newid()) FOR [ID_SanPhamChiTiet]
GO
ALTER TABLE [dbo].[Tai_Khoan] ADD  DEFAULT (newid()) FOR [ID_TaiKhoan]
GO
ALTER TABLE [dbo].[Thuong_Hieu] ADD  DEFAULT (newid()) FOR [ID_ThuongHieu]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD  CONSTRAINT [FK_Anh_San_Pham_Chi_Tiet1] FOREIGN KEY([ID_SPCT])
REFERENCES [dbo].[San_Pham_Chi_Tiet] ([ID_SanPhamChiTiet])
GO
ALTER TABLE [dbo].[Anh] CHECK CONSTRAINT [FK_Anh_San_Pham_Chi_Tiet1]
GO
ALTER TABLE [dbo].[Bang_Thong_Bao]  WITH CHECK ADD  CONSTRAINT [FK_Bang_Thong_Bao_Khach_Hang] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[Khach_Hang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[Bang_Thong_Bao] CHECK CONSTRAINT [FK_Bang_Thong_Bao_Khach_Hang]
GO
ALTER TABLE [dbo].[Bang_Thong_Bao]  WITH CHECK ADD  CONSTRAINT [FK_Bang_Thong_Bao_Nhan_Vien] FOREIGN KEY([ID_NhanVien])
REFERENCES [dbo].[Nhan_Vien] ([ID_NhanVien])
GO
ALTER TABLE [dbo].[Bang_Thong_Bao] CHECK CONSTRAINT [FK_Bang_Thong_Bao_Nhan_Vien]
GO
ALTER TABLE [dbo].[Dia_Chi]  WITH CHECK ADD  CONSTRAINT [FK_Dia_Chi_Khach_Hang] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[Khach_Hang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[Dia_Chi] CHECK CONSTRAINT [FK_Dia_Chi_Khach_Hang]
GO
ALTER TABLE [dbo].[Don_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Don_Hang_Khach_Hang] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[Khach_Hang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[Don_Hang] CHECK CONSTRAINT [FK_Don_Hang_Khach_Hang]
GO
ALTER TABLE [dbo].[Don_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Don_Hang_Nhan_Vien] FOREIGN KEY([ID_NhanVien])
REFERENCES [dbo].[Nhan_Vien] ([ID_NhanVien])
GO
ALTER TABLE [dbo].[Don_Hang] CHECK CONSTRAINT [FK_Don_Hang_Nhan_Vien]
GO
ALTER TABLE [dbo].[Don_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Don_Hang_Phieu_Giam_Gia] FOREIGN KEY([ID_PhieuGiamGia])
REFERENCES [dbo].[Phieu_Giam_Gia] ([ID_PhieuGiamGia])
GO
ALTER TABLE [dbo].[Don_Hang] CHECK CONSTRAINT [FK_Don_Hang_Phieu_Giam_Gia]
GO
ALTER TABLE [dbo].[Don_Hang_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_Don_Hang_Chi_Tiet_Don_Hang] FOREIGN KEY([ID_DonHang])
REFERENCES [dbo].[Don_Hang] ([ID_DonHang])
GO
ALTER TABLE [dbo].[Don_Hang_Chi_Tiet] CHECK CONSTRAINT [FK_Don_Hang_Chi_Tiet_Don_Hang]
GO
ALTER TABLE [dbo].[Don_Hang_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_Don_Hang_Chi_Tiet_San_Pham_Chi_Tiet] FOREIGN KEY([ID_SPCT])
REFERENCES [dbo].[San_Pham_Chi_Tiet] ([ID_SanPhamChiTiet])
GO
ALTER TABLE [dbo].[Don_Hang_Chi_Tiet] CHECK CONSTRAINT [FK_Don_Hang_Chi_Tiet_San_Pham_Chi_Tiet]
GO
ALTER TABLE [dbo].[Gio_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Gio_Hang_Khach_Hang] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[Khach_Hang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[Gio_Hang] CHECK CONSTRAINT [FK_Gio_Hang_Khach_Hang]
GO
ALTER TABLE [dbo].[Gio_Hang_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_Gio_Hang_Chi_Tiet_Gio_Hang] FOREIGN KEY([ID_GioHang])
REFERENCES [dbo].[Gio_Hang] ([ID_GioHang])
GO
ALTER TABLE [dbo].[Gio_Hang_Chi_Tiet] CHECK CONSTRAINT [FK_Gio_Hang_Chi_Tiet_Gio_Hang]
GO
ALTER TABLE [dbo].[Gio_Hang_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_Gio_Hang_Chi_Tiet_San_Pham_Chi_Tiet] FOREIGN KEY([ID_SanPhamChiTiet])
REFERENCES [dbo].[San_Pham_Chi_Tiet] ([ID_SanPhamChiTiet])
GO
ALTER TABLE [dbo].[Gio_Hang_Chi_Tiet] CHECK CONSTRAINT [FK_Gio_Hang_Chi_Tiet_San_Pham_Chi_Tiet]
GO
ALTER TABLE [dbo].[Khach_Hang]  WITH CHECK ADD  CONSTRAINT [FK_Khach_Hang_Tai_Khoan] FOREIGN KEY([ID_TaiKhoan])
REFERENCES [dbo].[Tai_Khoan] ([ID_TaiKhoan])
GO
ALTER TABLE [dbo].[Khach_Hang] CHECK CONSTRAINT [FK_Khach_Hang_Tai_Khoan]
GO
ALTER TABLE [dbo].[Nhan_Vien]  WITH CHECK ADD  CONSTRAINT [FK_Nhan_Vien_Tai_Khoan] FOREIGN KEY([ID_TaiKhoan])
REFERENCES [dbo].[Tai_Khoan] ([ID_TaiKhoan])
GO
ALTER TABLE [dbo].[Nhan_Vien] CHECK CONSTRAINT [FK_Nhan_Vien_Tai_Khoan]
GO
ALTER TABLE [dbo].[San_Pham]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Thuong_Hieu] FOREIGN KEY([ID_ThuongHieu])
REFERENCES [dbo].[Thuong_Hieu] ([ID_ThuongHieu])
GO
ALTER TABLE [dbo].[San_Pham] CHECK CONSTRAINT [FK_San_Pham_Thuong_Hieu]
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Chi_Tiet_Chat_Lieu] FOREIGN KEY([ID_ChatLieu])
REFERENCES [dbo].[Chat_Lieu] ([ID_ChatLieu])
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet] CHECK CONSTRAINT [FK_San_Pham_Chi_Tiet_Chat_Lieu]
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Chi_Tiet_Kich_Co] FOREIGN KEY([ID_KichCo])
REFERENCES [dbo].[Kich_Co] ([ID_KichCo])
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet] CHECK CONSTRAINT [FK_San_Pham_Chi_Tiet_Kich_Co]
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Chi_Tiet_Mau_Sac] FOREIGN KEY([ID_MauSac])
REFERENCES [dbo].[Mau_Sac] ([ID_MauSac])
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet] CHECK CONSTRAINT [FK_San_Pham_Chi_Tiet_Mau_Sac]
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet]  WITH CHECK ADD  CONSTRAINT [FK_San_Pham_Chi_Tiet_San_Pham] FOREIGN KEY([ID_SanPham])
REFERENCES [dbo].[San_Pham] ([ID_SanPham])
GO
ALTER TABLE [dbo].[San_Pham_Chi_Tiet] CHECK CONSTRAINT [FK_San_Pham_Chi_Tiet_San_Pham]
GO