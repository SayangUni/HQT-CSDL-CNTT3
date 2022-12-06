---Nhập vào MaNV cho biết tuổi của nhân viên này.
CREATE FUNCTION FN_Tuoi(@MaNV nvarchar(9))
RETURNS int
AS
Begin
	Return (Select DATEDIFF(year, NGSINH, GETDATE()) + 1 from NHANVIEN where MANV=@MaNV)
End
--Gói chạy:
select [dbo].[FN_Tuoi]('005')
select * from NHANVIEN


---Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia

if OBJECT_ID('fn_phai_nv') is not null
 drop function fn_dean_nv
 go 
 create function fn_dean_nv(@gt Nvarchar(4))
 returns int
 as 
 begin
 return (select count(mada) from PHANCONG
 WHERE MA_NVIEN=@MaNhanVien)
 end
 
 ---Truyền tham số vào phái nam hoặc nữ, xuất số lượng nhân viên theo phái
 IF OBJECT_ID('FN_PHAI_NV') IS NOT NULL
DROP FUNCTION FN_PHAI_NV
GO
CREATE FUNCTION FN_PHAI_NV( @GT NVARCHAR(4))
RETURNS INT
AS
BEGIN
RETURN(SELECT COUNT (*)	FROM NHANVIEN WHERE UPPER(PHAI)=UPPER(@GT))
END
 ---Truyền tham số đầu vào là tên phòng, tính mức lương trung bình của phòng đó, Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng đó.
 IF OBJECT_ID('FN_LUONG_NV_PB') IS NOT NULL
DROP FUNCTION FN_LUONG_NV_PB
GO
CREATE FUNCTION FN_LUONG_NV_PB(@TENPHONGBAN NVARCHAR(15))
RETURNS @LISTNV TABLE(HOTEN NVARCHAR(60), LUONG FLOAT)
AS 
BEGIN
DECLARE @LUONGTB FLOAT 
SELECT @LUONGTB=AVG(LUONG) FROM NHANVIEN
INNER JOIN PHONGBAN ON PHONGBAN.MAPHG=NHANVIEN.PHG
WHERE UPPER(TENPHG)=UPPER(@TENPHONGBAN)
INSERT INTO @LISTNV
SELECT CONCAT(HONV, ' ', TENLOT,' ',TENNV), LUONG FROM NHANVIEN 
WHERE LUONG>@LUONGTB
RETURN
END
 ---Tryền tham số đầu vào là Mã Phòng, cho biết tên phòng ban, họ tên người trưởng phòng
 ---và số lượng đề án mà phòng ban đó chủ trì.
 IF OBJECT_ID('FN_PB_NV_DEAN') IS NOT NULL
DROP FUNCTION FN_PB_NV_DEAN
GO
CREATE FUNCTION FN_PB_NV_DEAN (@MAPB INT)
RETURNS @LISTPB TABLE (TENPHONG NVARCHAR(20), HOTENNV NVARCHAR(60),SLDUAN INT)
AS 
BEGIN
INSERT INTO @LISTPB
SELECT PHONGBAN.TENPHG, CONCAT(HONV,' ', TENLOT, ' ', TENNV), COUNT(MADA) 
FROM PHONGBAN INNER JOIN DEAN ON DEAN.PHONG=PHONGBAN.MAPHG 
INNER JOIN NHANVIEN ON NHANVIEN.PHG=PHONGBAN.MAPHG 
WHERE PHONGBAN.MAPHG=@MAPB
GROUP BY TENPHG, HONV, TENLOT, TENNV
RETURN
END
---Bài 2
---Hiển thị thông tin HoNV,TenNV,TenPHG, DiaDiemPhg.
CREATE VIEW VW_DD_NV AS 
SELECT HONV,TENNV,TENPHG,DIADIEM FROM PHONGBAN
INNER JOIN DIADIEM_PHG ON DIADIEM_PHG.MAPHG=PHONGBAN.MAPHG
INNER JOIN NHANVIEN ON NHANVIEN.PHG=PHONGBAN.MAPHG
SELECT * FROM VW_DD_NV
GO
---Hiển thị thông tin TenNv, Lương, Tuổi.
CREATE VIEW VW_TUOI_NV AS 
SELECT TENNV,LUONG,YEAR (GETDATE())-YEAR(NGSINH) AS 'TUỔI' FROM NHANVIEN
SELECT * FROM VW_TUOI_NV
GO
---Hiển thị tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhân viên nhất
IF OBJECT_ID('VW_PB') IS NOT NULL
DROP FUNCTION VW_PB
GO
CREATE VIEW VW_PB(TENPHONGBAN,HOTENTP,SLNV)
AS
SELECT  TENPHG, COUNT(NV.MANV),CONCAT(TP.HONV,'',TP.TENLOT, '',TP.TENNV)
FROM NHANVIEN AS NV INNER JOIN PHONGBAN  ON PHONGBAN.MAPHG=NV.PHG
INNER JOIN NHANVIEN AS TP ON TP.MANV=PHONGBAN.TRPHG
GROUP BY TENPHG,TP.TENNV,TP.HONV,TP.TENLOT
ORDER BY COUNT (NV.MANV) DESC
SELECT * FROM PHONGBAN 
SELECT * FROM NHANVIEN

SELECT * FROM VW_PB
