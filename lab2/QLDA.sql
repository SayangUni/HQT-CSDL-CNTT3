﻿CREATE DATABASE QLDA1
GO
USE QLDA1
GO
CREATE TABLE DEAN
(
TENDA NVARCHAR(15),
MADA INT NOT NULL,
DDIEM_DA NVARCHAR(15),
PHONG INT
CONSTRAINT PK_DEAN PRIMARY KEY(MADA)
)
GO
CREATE TABLE PHONGBAN
(
TENPHG NVARCHAR(15),
MAPHG INT NOT NULL,
TRPHG NVARCHAR(9),
NG_NHANCHUC DATE
CONSTRAINT PK_PHONGBAN PRIMARY KEY(MAPHG)
)
GO
CREATE TABLE DIADIEM_PHG
(
MAPHG INT NOT NULL,
DIADIEM NVARCHAR(15) NOT NULL
CONSTRAINT PK_DIADIEM_PHG PRIMARY KEY(MAPHG, DIADIEM)
)
GO
CREATE TABLE THANNHAN
(
MA_NVIEN NVARCHAR(9) NOT NULL,
TENTN NVARCHAR(15) NOT NULL,
PHAI NVARCHAR(3),
NGSINH DATE,
QUANHE NVARCHAR(15)
CONSTRAINT PK_THANNHAN PRIMARY KEY(MA_NVIEN, TENTN)
)
GO
CREATE TABLE PHANCONG
(
MA_NVIEN NVARCHAR(9) NOT NULL,
MADA INT NOT NULL,
STT INT NOT NULL,
THOIGIAN FLOAT
CONSTRAINT PK_PHANCONG PRIMARY KEY(MA_NVIEN, MADA, STT)
)
GO
CREATE TABLE CONGVIEC
(
MADA INT NOT NULL,
STT INT NOT NULL, 
TEN_CONG_VIEC NVARCHAR(50)
CONSTRAINT PK_CONGVIEC PRIMARY KEY(MADA, STT)
)
GO
CREATE TABLE NHANVIEN
(
HONV NVARCHAR(15),
TENLOT NVARCHAR(15),
TENNV NVARCHAR(15),
MANV NVARCHAR(9) NOT NULL,
NGSINH DATE,
DCHI NVARCHAR(30),
PHAI NVARCHAR(3),
LUONG INT,
MA_NQL NVARCHAR(9),
PHG INT
CONSTRAINT PK_NHANVIEN PRIMARY KEY(MANV)
)
GO
--***Nhập dữ liệu
--Bảng nhân viên:
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Đinh', N'Bá', N'Tiên', N'009', '02/11/1960', N'119 Cống Quỳnh, Tp HCM', N'Nam', 30000, N'005', 5)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Nguyễn', N'Thanh', N'Tùng', N'005', '08/20/1962', N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', 40000, N'006', 5)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Bùi', N'Ngọc', N'Hằng', N'007', '03/11/1954', N'332 Nguyễn Thái Học, Tp HCM', N'Nam', 25000, N'001', 4)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Lê', N'Quỳnh', N'Như', N'001', '02/01/1967', N'291 Hồ Văn Huê, Tp HCM', N'Nữ', 43000, N'006', 4)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Nguyễn', N'Mạnh', N'Hùng', N'004', '03/04/1967', N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, N'005', 5)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Trần', N'Thanh', N'Tâm', N'003', '05/04/1957', N'34 Mai Thị Lự, Tp HCM', N'Nam', 25000, N'005', 5)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Trần', N'Hồng', N'Quang', N'008', '09/01/1967', N'80 Lê Hồng Phong, Tp HCM', N'Nam', 25000, N'001', 4)
INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES(N'Phạm', N'Văn', N'Vinh', N'006', '01/01/1965', N'45 Trưng Vương, Hà Nội', N'Nữ', 55000, N'005', 1)
--Phòng ban:
INSERT INTO PHONGBAN(TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES(N'Nghiên cứu', 5, N'005', '05/22/1978') 
INSERT INTO PHONGBAN(TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES(N'Điều hành', 4, N'008', '01/01/1985') 
INSERT INTO PHONGBAN(TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES(N'Quản lý', 1, N'006', '06/19/1971')
--Đề án:
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
VALUES(N'Sản phẩm X', 1, N'Vũng tàu', 5)
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
VALUES(N'Sản phẩm Y', 2, N'Nha Trang', 5)
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
VALUES(N'Sản phẩm Z', 3, N'TP HCM', 5)
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
VALUES(N'Tin học hóa', 10, N'Hà Nội', 4)
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
VALUES(N'Cáp quang', 20, N'TP HCM', 1)
INSERT INTO DEAN(TENDA, MADA, DDIEM_DA, PHONG)
VALUES(N'Đào tạo', 30, N'Hà Nội', 4)
--Thân nhân:
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái')
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng')
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
INSERT INTO THANNHAN(MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES(N'009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
--Địa điểm phòng:
INSERT INTO DIADIEM_PHG(MAPHG, DIADIEM)
VALUES(1, N'TP HCM')
INSERT INTO DIADIEM_PHG(MAPHG, DIADIEM)
VALUES(4, N'Hà Nội')
INSERT INTO DIADIEM_PHG(MAPHG, DIADIEM)
VALUES(5, N'TAU')
INSERT INTO DIADIEM_PHG(MAPHG, DIADIEM)
VALUES(5, N'NHA TRANG')
INSERT INTO DIADIEM_PHG(MAPHG, DIADIEM)
VALUES(5, N'TP HCM')
--Phân công:
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'009', 1, 1, 32)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'009', 2, 2, 8)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'004', 3, 1, 40)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'003', 1, 2, 20.0)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'003', 2, 1, 20.0)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'008', 10, 1, 35)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'008', 30, 2, 5)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'001', 30, 1, 20)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'001', 20, 1, 15)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'006', 20, 1, 30)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'005', 3, 1, 10)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'005', 10, 2, 10)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'005', 20, 1, 10)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'007', 30, 2, 30)
INSERT INTO PHANCONG(MA_NVIEN, MADA, STT, THOIGIAN)
VALUES(N'007', 10, 2, 10)
--Công việc:
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(1, 1, N'Thiết kế sản phẩm X')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(1, 2, N'Thử nghiệm sản phẩm X')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(2, 1, N'Sản xuất sản phẩm Y')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(2, 2, N'Quảng cáo sản phẩm Y')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(3, 1, N'Khuyến mãi sản phẩm Z')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(10, 1, N'Tin học hóa phòng nhân sự')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(10, 2, N'Tin học hóa phòng kinh doanh')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(20, 1, N'Lắp đặt cáp quang')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(30, 1, N'Đào tạo nhân viên Marketing')
INSERT INTO CONGVIEC(MADA, STT, TEN_CONG_VIEC)
VALUES(30, 2, N'Đào tạo chuyên viên thiết kế')
--TẠO KHÓA NGOẠI 
ALTER TABLE DEAN 
ADD CONSTRAINT FK_DEAN_PHONG 
FOREIGN KEY(PHONG) 
REFERENCES PHONGBAN(MAPHG) 
GO 
ALTER TABLE DIADIEM_PHG 
ADD CONSTRAINT FK_DIADIEM_PHG 
FOREIGN KEY(MAPHG) 
REFERENCES PHONGBAN(MAPHG) 
GO 
ALTER TABLE CONGVIEC 
ADD CONSTRAINT FK_CONGVIEC 
FOREIGN KEY(MADA) 
REFERENCES DEAN(MADA) 
GO 
ALTER TABLE PHANCONG 
ADD CONSTRAINT FK_PHANCONG1 
FOREIGN KEY(MADA, STT) 
REFERENCES CONGVIEC(MADA, STT) 
GO 
ALTER TABLE PHANCONG 
ADD CONSTRAINT FK_PHANCONG 
FOREIGN KEY(MA_NVIEN) 
REFERENCES NHANVIEN(MANV) 
GO 
ALTER TABLE THANNHAN 
ADD CONSTRAINT FK_THANNHAN 
FOREIGN KEY(MA_NVIEN) 
REFERENCES NHANVIEN(MANV) 
GO 
ALTER TABLE PHONGBAN 
ADD CONSTRAINT FK_PHONGBAN 
FOREIGN KEY(TRPHG) 
REFERENCES NHANVIEN(MANV) 
GO 
ALTER TABLE NHANVIEN 
ADD CONSTRAINT FK_NHANVIEN 
FOREIGN KEY(PHG) 
REFERENCES PHONGBAN(MAPHG) 
GO 
ALTER TABLE NHANVIEN 
ADD CONSTRAINT FK_NHANVIEN1 
FOREIGN KEY(MA_NQL) 
REFERENCES NHANVIEN(MANV) 
GO

