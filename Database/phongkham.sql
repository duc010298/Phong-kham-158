DROP DATABASE phongkham

CREATE DATABASE phongkham

USE phongkham

CREATE TABLE Customer (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(250),
	YOB INT,
	AddressCus NVARCHAR(250),
	DayVisit DATE,
	ExpectedDOB DATE,
	Result NVARCHAR(250),
	Note NVARCHAR(250)
)

CREATE TABLE KetQuaSieuAm (
	ID INT PRIMARY KEY NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	OrderNumber INT NOT NULL,
	FormID INT NOT NULL
)

INSERT INTO KetQuaSieuAm VALUES (1, N'Thai dưới 12T', 1, 1)
INSERT INTO KetQuaSieuAm VALUES (2, N'Thai dưới 12T - Dọa sảy', 2, 1)
INSERT INTO KetQuaSieuAm VALUES (3, N'Thai 12T - 14T', 3, 2)
INSERT INTO KetQuaSieuAm VALUES (4, N'Thai 12T - 14T - Dọa sảy', 4, 2)
INSERT INTO KetQuaSieuAm VALUES (5, N'Thai 15T - 34T', 5, 2)
INSERT INTO KetQuaSieuAm VALUES (6, N'Thai 34T - 40T', 6, 2)
INSERT INTO KetQuaSieuAm VALUES (7, N'Túi ối', 7, 1)
INSERT INTO KetQuaSieuAm VALUES (8, N'Túi ối - Dọa sảy', 8, 1)
INSERT INTO KetQuaSieuAm VALUES (9, N'Siêu âm ổ bụng 4D', 9, 3)
INSERT INTO KetQuaSieuAm VALUES (10, N'Ổ bụng vú', 10, 3)
INSERT INTO KetQuaSieuAm VALUES (11, N'Vú', 11, 4)


CREATE TABLE KetQuaSieuAm_Content (
	OrderNumber INT,
	Class1 NVARCHAR(250),
	Class2 NVARCHAR(250),
	KqsaId INT
	CONSTRAINT PK_KetQuaSieuAmContent PRIMARY KEY(OrderNumber, KqsaId)
	CONSTRAINT FK_KetQuaSieuAmContent FOREIGN KEY (KqsaId) REFERENCES KetQuaSieuAm(ID)
)

INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	N'tình trạng thai',
	NULL,
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Tử cung:',
	N'Buồng tử cung có 01 thai',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- Cử động thai:',
	N'(+)',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Tim thai:',
	N' lần/phút',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Rau thai:',
	N'Bình thường',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Túi ối:',
	N'Bình thường',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Chiều dài đầu mông:',
	N' mm',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Đường kính lưỡng đỉnh:',
	NULL,
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Tuổi thai:',
	N' tuần',
	1
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'Kết luận:',
	N'Thai  tuần ',
	1
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	N'tình trạng thai',
	N'01',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Số lượng thai:',
	N'01',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- Cử động thai:',
	N'(+)',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Tim thai:',
	N'  lần/phút',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Rau thai:',
	N'bình thường',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Túi ối:',
	N'bờ túi ối không đều, có hiện tượng bóc tách',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Chiều dài đầu mông:',
	N' mm',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Đường kính lưỡng đỉnh:',
	NULL,
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Tuổi thai:',
	N' tuần',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'- Phần phụ phải:',
	N'bình thường',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'- Phần phụ trái:',
	N'bình thường',
	2
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'Kết luận:',
	N'Thai  tuần - Doạ sảy',
	2
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	NULL,
	N'01',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Tử cung:',
	N'có 01 túi ối',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- Đường kính túi ối:',
	N' mm',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Bờ túi ối:',
	N'bình thường',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Nước ối:',
	N'bình thường',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Phôi thai:',
	NULL,
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Tim thai:',
	NULL,
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Tương đương thai:',
	N' tuần',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Phần phụ phải:',
	N'bình thường',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'- Phần phụ trái:',
	N'bình thường',
	7
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'Kết luận:',
	N'Thai  tuần',
	7
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	NULL,
	N'có 01 túi ối',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Tử cung:',
	N'có 01 túi ối',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- Đường kính túi ối:',
	N' mm',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Bờ túi ối:',
	N'không đều có hiện tượng bóc tách',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Nước ối:',
	N'bình thường',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Phôi thai:',
	NULL,
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Tim thai ',
	NULL,
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Tương đương thai:',
	N' tuần',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Phần phụ phải:',
	N'bình thường',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'- Phần phụ trái:',
	N'bình thường',
	8
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'Kết luận:',
	N'Thai  tuần - Doạ sảy',
	8
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	N'Kiểm tra tình trạng thai',
	NULL,
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Số lượng thai:',
	N'01',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- ĐK lưỡng đỉnh:',
	N' mm',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Chiều dài đầu mông:',
	N' mm',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Vị trí rau:',
	N'rộng',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Cử động thai:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'Bờ hộp sọ:',
	NULL,
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Cấu trúc đường giữa(vách trong suốt):',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Hình ảnh siêu âm tiểu não:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'- Não thất 2 bên:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'- Kích thước hố sau:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'- Cấu trúc tim:',
	N'4 buồng',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	13,
	N'- Dây rốn(3 mạch máu)',
	NULL,
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	14,
	N'- Nhịp tim thai:',
	N' lần/phút',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	15,
	N'- Hình ảnh dạ dày:',
	N'có',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	16,
	N'- Dày da gáy:',
	N'1.8mm',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	17,
	N'- Bàng quang:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	18,
	N'- Tình trạng ối:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	19,
	N'- Cột sống:',
	N'Bình thường',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	20,
	N'- Dự kiến ngày sinh:',
	N' (+,- 7 ngày)',
	3
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	21,
	N'- Kết luận:',
	N'01 thai, Thai   tuần, cử động thai bình thường',
	3
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	N'Kiểm tra tình trạng thai',
	NULL,
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Số lượng thai:',
	N'01',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- ĐK lưỡng đỉnh:',
	N' mm',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Chiều dài đầu mông:',
	N' mm',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Vị trí rau:',
	N'Rau bám rộng, bờ ối có hiện tượng bóc tách',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Cử động thai:',
	N'Tốt',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'Bờ hộp sọ:',
	NULL,
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Cấu trúc đường giữa(vách trong suốt):',
	N'Bình thường',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'- Hình ảnh siêu âm tiểu não:',
	N'Bình thường',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'- Não thất 2 bên:',
	N'Bình thường',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'- Kích thước hố sau:',
	N'Bình thường',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	13,
	N'- Nhịp tim thai:',
	N' lần/phút',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	14,
	N'- Cột sống:',
	N'Bình thường',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	15,
	N'- Dầy da gáy:',
	N'2.0mm',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	16,
	N'- Tình trạng ối:',
	N'có',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	17,
	N'- Dự kiến ngày sinh:',
	N' (+,- 7 ngày)',
	4
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	18,
	N'- Kết luận:',
	N'01 thai, Thai  tuần  ngày - Doạ sảy',
	4
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	N'Kiểm tra tình trạng thai',
	NULL,
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Số lượng thai:',
	N'01',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- ĐK lưỡng đỉnh:',
	N' mm',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Chiều dài xương đùi:',
	N' mm',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Đường kình ngang bụng:',
	N' mm',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Đường kính trước sau:',
	N' mm',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Trọng lượng thai:',
	N' g',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Vị trí rau:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Cử động thai:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'Bờ hộp sọ:',
	NULL,
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'- Cấu trúc đường giữa(vách trong suốt):',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'- Hình ảnh siêu âm tiểu não:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	13,
	N'- Não thất 2 bên:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	14,
	N'- Kích thước hố sau:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	15,
	N'- Hai thận:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	16,
	N'- Cấu trúc tim:',
	N'4 buồng',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	17,
	N'- Dây rốn(3 mạch máu)',
	NULL,
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	18,
	N'- Nhịp tim thai:',
	N' lần/phút',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	19,
	N'- Hình ảnh dạ dày:',
	N'có',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	20,
	N'- Bàng quang:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	21,
	N'- Tình trạng ối:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	22,
	N'- Cột sống:',
	N'Bình thường',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	23,
	N'- Dự kiến ngày sinh:',
	N' (+;- 7 ngày)',
	5
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	24,
	N'- Kết luận:',
	N'01 thai, Thai  tuần  ngày. Cử động thai bình thường.',
	5
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	N'Kiểm tra tình trạng thai',
	NULL,
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'- Số lượng thai:',
	N'01',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	N'- ĐK lưỡng đỉnh:',
	N' mm',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'- Chiều dài xương đùi:',
	N' mm',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	N'- Đường kình ngang bụng:',
	N' mm',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'- Đường kính trước sau:',
	N' mm',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'- Trọng lượng thai:',
	N' g (+_200g)',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	N'- Vị trí rau:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'- Cử động thai:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	N'Bờ hộp sọ:',
	NULL,
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'- Cấu trúc đường giữa(vách trong suốt):',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'- Hình ảnh siêu âm tiểu não:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	13,
	N'- Não thất 2 bên:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	14,
	N'- Kích thước hố sau:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	15,
	N'- Hai thận:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	16,
	N'- Cấu trúc tim:',
	N'4 buồng',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	17,
	N'- Dây rốn(3 mạch máu)',
	NULL,
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	18,
	N'- Nhịp tim thai:',
	N' lần/phút',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	19,
	N'- Hình ảnh dạ dày:',
	N'có',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	20,
	N'- Ngôi thai:',
	N'Đầu',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	21,
	N'- Bàng quang:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	22,
	N'- Tình trạng ối:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	23,
	N'- Cột sống:',
	N'Bình thường',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	24,
	N'- Dự kiến ngày sinh:',
	N' (+;- 7 ngày )',
	6
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	25,
	N'- Kết luận:',
	N'01 thai, Thai  tuần  ngày. Cử động thai bình thường.',
	6
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	NULL,
	NULL,
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'Gan',
	N'-  Không to, nhu mô gan đều, không có hình khối khu trú bất thường.',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	NULL,
	N'-  Tĩnh mạch cửa không giãn',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'Mật',
	N'- Túi mật không căng, thành mỏng, không có sỏi',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	NULL,
	N'-  Đường mật trong gan và ống mật chủ không giãn, không có sỏi',
	9
)

INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'Thận',
	N'- Thận phải: Kích thước bình thường, nhu mô đều, đài bể thận không giãn, không có sỏi',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	NULL,
	N'- Thận trái: Kích thước bình thường, nhu mô đều, đài bể thận không giãn, không có sỏi',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	NULL,
	N'-  Niệu quản hai bên bình thường',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'Tử cung phần phụ',
	N'- Tử cung kích bình thường, đường lòng tử cung rõ niêm mạc mỏng, chưa thấy khối bất thường',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	NULL,
	N'- Phần phụ trái: bình thường',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	NULL,
	N'- Phần phụ phải: bình thường',
	9
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'Kết luận',
	N'Hiện tại gan, mật, thận, tử cung, phần phụ, bình thường',
	9
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	NULL,
	NULL,
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'Gan',
	N'-  Không to, nhu mô gan đều, không có hình khối khu trú bất thường.',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	NULL,
	N'-  Tĩnh mạch cửa không giãn',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	N'Mật',
	N'- Túi mật không căng, thành mỏng, không có sỏi',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	NULL,
	N'-  Đường mật trong gan và ống mât chủ không giãn, không có sỏi',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	N'Thận',
	N'- Thận phải: Kích thước bình thường, nhu mô đều, đài bể thận không giãn, không có sỏi',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	NULL,
	N'- Thận trái: Kích thước bình thường, nhu mô đều, đài bể thận không giãn, không có sỏi',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	NULL,
	N'-  Niệu quản hai bên bình thường',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	N'Tử cung phần phụ',
	N'- Tử cung kích thước bình thường, đường lòng tử cung rõ niêm mạc mỏng, chưa thấy khối bất thường',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	NULL,
	N'- Phần phụ trái: bình thường',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	NULL,
	N'- Phần phụ phải: bình thường',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	12,
	N'Vú',
	N'- Vú trái: không thấy khối u khu trú',
	10
)

INSERT INTO KetQuaSieuAm_Content VALUES (
	13,
	NULL,
	N'- Vú phải: không thấy khối u khu trú',
	10
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	14,
	N'Kết luận',
	N'Hiện tại gan, mật, thận, tử cung, phần phụ, vú bình thường',
	10
)
--
INSERT INTO KetQuaSieuAm_Content VALUES (
	1,
	NULL,
	NULL,
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	2,
	N'1. Vú phải',
	N'Nhu mô tuyến vú bình thường',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	3,
	NULL,
	N'Mật độ tuyến vú bình thường',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	4,
	NULL,
	N'Không có hình ảnh nhân xơ và nang tuyến vú',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	5,
	NULL,
	N'Núm vú bình thường',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	6,
	NULL,
	NULL,
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	7,
	N'2. Vú trái',
	N'Nhu mô tuyến vú bình thường',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	8,
	NULL,
	N'Mật độ tuyến vú bình thường',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	9,
	NULL,
	N'Không có hình ảnh nhân xơ và nang tuyến vú',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	10,
	NULL,
	N'Núm vú bình thường',
	11
)
INSERT INTO KetQuaSieuAm_Content VALUES (
	11,
	N'Kết luận',
	N'Hiện tại 2 vú chưa thấy hình ảnh bất thường',
	11
)
--

SELECT ID, Name FROM KetQuaSieuAm ORDER BY OrderNumber
SELECT Class1, Class2 FROM KetQuaSieuAm_Content WHERE KqsaId = ? ORDER BY OrderNumber
SELECT Form FROM KetQuaSieuAm WHERE ID = ?



--
INSERT INTO Customer VALUES(N'Nguyễn Văn A', 1998, N'An Lão', '2018/05/30', '2018/06/25', N'Thai tuần', N't')
