create database if not exists SCHEDULE_APP;

use  SCHEDULE_APP;

-- TA: get notification,  get category, get news
-- Trí: add user and save to sharedpreference, add notification
-- Đại: add service, get service by studentcode, push notification
-- Thế: get class schedule, get exam schedule, get schedule by date, 

-- user
-- api: lưu user

create table if not exists users (
    studentCode VARCHAR(7) PRIMARY KEY NOT NULL,
	avatar VARCHAR(150) NOT NULL,
	name NVARCHAR(100) NOT NULL, 
	email VARCHAR(100) NOT NULL UNIQUE,
    isLogged BIT DEFAULT 0,
    address NVARCHAR(500)
);

insert into users (studentCode, avatar, name, email, isLogged, address) values ("ps24513", "", "vothanhthe", "thevtps24513@fpt.edu.vn", 1, "Bình Thuận");


-- category
-- api: get category
create table if not exists categories (
    id INT KEY AUTO_INCREMENT,
    name VARCHAR(500) NOT NULL,
    image VARCHAR(5000) NOT NULL,
    bgColor VARCHAR(5000) NOT NULL

);


insert into categories (id, name, image, bgColor) values (1, "Hoạt Động", "https://firebasestorage.googleapis.com/v0/b/apiapp-d8cf2.appspot.com/o/icons8_activity_28.png?alt=media&token=279b1b85-e394-40aa-8683-d2c0a633a8fc", "#e1bee7");
insert into categories (id, name, image, bgColor) values (2, "Học Tập", "https://firebasestorage.googleapis.com/v0/b/apiapp-d8cf2.appspot.com/o/icons8_learn_28.png?alt=media&token=6746f23a-bb7e-4d78-bf9f-d2c4d675b948", "#c5e1a5");
insert into categories (id, name, image, bgColor) values (3, "Học Phí", "https://firebasestorage.googleapis.com/v0/b/apiapp-d8cf2.appspot.com/o/icons8_tuition_fee_28.png?alt=media&token=51aeef7b-5df6-4588-a4b3-ccdc53218dde", "#b3e5fc");

-- news
-- api: get news
create TABLE if not exists news(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(500) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    detail VARCHAR(5000) NOT NULL,
    categoryID INT NOT NULL,
    FOREIGN KEY (categoryID) REFERENCES categories(id)
);
-- hoạt động



insert into news (id, title, image, detail, categoryID) values (1, "Phòng Công tác sinh viên gửi em thông tin v/v học GDQP đợt tháng 8/2023:", "https://fpteducationgroup.files.wordpress.com/2015/03/quan-tri-doanh-nghiep-mkt-sales1.jpg?w=640", "Phòng Công tác sinh viên thông báo thông tin v/v học GDQP đợt tháng 8/2023:

Danh sách học GDQP: https://docs.google.com/spreadsheets/d/1rScpx352KOC9kBDajKDfp5vM6NYkar1rLWK7hw82t4I/edit?usp=sharing 
Thời gian: 24/08 đến ngày 31/08/2023
Địa điểm: Trung tâm Giáo dục Quốc phòng và An ninh (Khu Quy hoạch ĐHQG - HCM - Đông Hòa – Dĩ An – Bình Dương) - Đ. Nguyễn Du, Đông Hoà, Dĩ An, Bình Dương.
Học phí: đã bao gồm trong phí kỳ định hướng
Hình thức: Sinh viên lựa chọn 1 trong 02 hình thức:
+ Học NỘI TRÚ tại TT GDQP  trong suốt thời gian trên

+ Học ngoại trú tại TT GDQP (không ở lại TT GDQP) đăng ký qua link: https://forms.gle/4rd2NCDx1yp3EefS9 

Thời gian đăng ký học ngoại trú: từ ngày nhận thông báo đến 17h ngày 27/07/2023.  

(02 hình thức trên sẽ học tại TT GDQP Đại học Quốc Gia)

Nhằm đảm bảo thông tin cấp CHỨNG CHỈ  của sinh viên được chính xác nhất sinh viên vui lòng điền đầy đủ và chính xác thông tin qua link sau: https://forms.gle/JVctsngmByjzWinC9

LƯU Ý:

Tất cả mọi trường hợp Sinh viên thuộc “ĐỐI TƯỢNG BẮT BUỘC” (sv có tên trong danh sách) nếu không hoàn thành khóa học GDQP theo đúng thời gian như trên sẽ KHÔNG ĐƯỢC giải quyết bất kỳ mọi trường hợp khi xét Tốt nghiệp sau này.
Sinh viên không tham gia học GDQP theo đợt quy định của nhà trường sẽ được ghi nhận trạng thái GDQP “RỚT MÔN” và phải hoàn tất các thủ tục đóng phí học lại GDQP theo quy định tài chính vào các đợt trả nợ môn tiếp theo (nếu có).
Sinh viên tự túc di chuyển xuống TT GDQP & AN trong ngày học GDQP đầu tiên
Đối tượng miễn giảm thực hành (bắt buộc học và thi lý thuyết):
Bộ đội xuất ngũ, Nghĩa vụ công an: sinh viên nộp Quyết định xuất ngũ, nghĩa vụ công an (photo công chứng), bắt buộc hoàn tất học và thi phần lý thuyết, miễn phần thực hành.
Các trường hợp đặc biệt (khuyết tật tay chân), có vấn đề về sức khỏe: sinh viên nộp Giấy xác nhận của bệnh viện để được xét miễn giảm phần thực hành. Bắt buộc hoàn tất học và thi phần lý thuyết.
=> Đối với 02 đối tượng trên nộp đơn miễn giảm tại Phòng Đào tạo TT GDQP&AN vào ngày học đầu tiên (24/8/2023).

Đối tượng miễn giảm môn (miễn giảm cả 02 phần thực hành và lý thuyết):
Sinh viên đã có CHỨNG CHỈ GDQP: sinh viên đã hoàn tất chương trình GDQP tại các trường Cao đẳng và Đại học khác sẽ được miễn học phần lý thuyết và thực hành. Yêu cầu sinh viên nộp CHỨNG CHỈ GDQP photo công chứng tại cơ sở mình học để được xét miễn giảm.
Các thông báo phân chia đại đội tiểu đội sẽ được gửi cho sinh viên qua các email thông báo tiếp theo.

Mọi thắc mắc cần hỗ trợ sinh viên vui lòng phản hồi qua email ctsv.fplhcm@fe.edu.vn trước ngày 28/07/2023. Sau thời gian trên mọi trường hợp phát sinh sẽ không giải quyết dưới mọi hình thức.", 1);
insert into news (id, title, image, detail, categoryID) values (2, "P.CTSV THÔNG BÁO XÁC NHẬN ĐĂNG KÝ THÀNH CÔNG BHYT ĐỢT 02 – T6/2023", "https://fpteducationgroup.files.wordpress.com/2015/03/quan-tri-doanh-nghiep-mkt-sales1.jpg?w=640", "Hiện tại BHYT đợt 2 – học kỳ Summer năm 2023 đã đăng ký thành công và có thể sử dụng trên ứng dụng VssID các bạn sinh viên có thể vào app VssID hoặc trang baohiemxahoi.gov.vn để tra cứu thông tin. 

  

Từ năm 2020 BHYT sẽ sử dụng thẻ BHYT điện tử VssID và KHÔNG CẤP thẻ BHYT giấy.

  

Bảo hiểm xã hội số (VssID) là ứng dụng trên nền tảng thiết bị di động của BHXH Việt Nam thuộc quyền quản lý của cơ quan BHXH. Với phần mềm này, người tham gia BHXH có thể tra cứu quá trình tham gia bảo hiểm và tiếp cận thông tin dễ dàng, thuận tiện nhất. 

  

- Lợi ích của việc sử dụng Ứng dụng VssID

 

+ Tra cứu mã số BHXH



+ Tra cứu quá trình tham gia BHXH, BHYT, BHTN



+ Tra cứu thời gian sử dụng, sử dụng thẻ

 

Hướng dẫn sử dụng VssID tại đây
Clip hướng dẫn tại đây 
Lưu ý: Ứng dụng VssID thuộc quyền quản lý của Cơ quan BHXH Việt Nam. Trong quá trình sử dụng nếu có bất kì lỗi hay thắc mắc nào, vui lòng liên hệ tổng đài hỗ trợ 24/7 Số hotline: 19009068 để được hỗ trợ. 

", 1);
insert into news (id, title, image, detail, categoryID) values (3, "THÔNG BÁO HỖ TRỢ SINH VIÊN ĐĂNG KÝ THAM GIA BHYT ĐỢT 2- THÁNG 06/2023) VÀ CÀI ĐẶT ỨNG DỤNG VSSID ĐỂ SỬ DỤNG CHO BHYT", "https://fpteducationgroup.files.wordpress.com/2015/03/quan-tri-doanh-nghiep-mkt-sales1.jpg?w=640", "THÔNG BÁO HỖ TRỢ SINH VIÊN ĐĂNG KÝ THAM GIA BHYT ĐỢT 2- THÁNG 06/2023) VÀ CÀI ĐẶT ỨNG DỤNG VSSID ĐỂ SỬ DỤNG CHO BHYT.

(Sinh viên đọc kỹ tất cả các thông tin bên dưới và làm theo hướng dẫn để cập nhật thông tin cá nhân chính xác nhất.)



*Đối tượng:

1. Sinh viên theo học tại FPT Polytechnic TP Hồ Chí Minh.

2. Sinh viên có thẻ BHYT hết hạn trước ngày 01/07/2023.

3. Sinh viên chưa có thẻ BHYT.

**Lưu ý: Theo chủ trương đồng bộ dữ liệu Dân cư với BHXH, chỉ sinh viên đã có CCCD hoặc giấy xác nhận của địa phương về MÃ ĐỊNH DANH CÁ NHÂN mới đăng kí được BHYT. 



***Cách thức Đăng ký BHYT:

1. Thời hạn thẻ: từ ngày 01/07/2023 đến ngày 31/12/2023 (6 tháng)

2. Mức phí thu hộ: 340.200đồng (56.700/tháng)

3. Sinh viên cần chuẩn bị các file sau:

- Đối với đối tượng gia hạn BHYT sinh viên chuẩn bị các thông tin sau tạo thành 01 file PDF: 

+ Ảnh CCCD (mặt trước, mặt sau)

+Thẻ BHYT cũ (mặt trước - thẻ cứng hoặc thẻ mềm trên VssID) 

- Đối với Sinh viên ĐĂNG KÝ MỚI, bị sai thông tin từ trước, không tra cứu được mã số BHXH (10 số cuối của thẻ BHYT); Mã số BHXH là mã thẻ quân đội (bắt đầu bằng số 97, 98) hoặc mã đã cũ (kẻ theo từng ô, từ 2017 trở về trước) BẮT BUỘC sinh viên chuẩn bị các thông tin sau tạo thành 01 file PDF: 

+ Ảnh chụp từng trang của sổ hộ khẩu và CCCD cá nhân, 

+CCCD của từng thành viên trong sổ hộ khẩu (hoặc Giấy xác nhận mã định danh nếu chưa có CCCD)



CÁC THÔNG TIN CẦN LƯU Ý

Sinh viên tự tra cứu mã số BHXH của mình (nhập Tỉnh, Họ và tên (không dấu), Ngày tháng năm sinh hoặc CCCD và để trống ô Mã Số BHXH tại link: https://baohiemxahoi.gov.vn/.../tra-cuu-ho-gia-dinh.aspx 
Thời hạn đăng ký từ hôm nay đến hết ngày 17h00 ngày 25/06/2023, đăng ký tại link (dùng email cá nhân @gmail để truy cập): https://forms.gle/5tdXHe4G1749RsLKA
Cổng thanh toán DNG sẽ cập nhật phí BHYT cho sinh viên trong vòng 4h làm việc sau khi sinh viên nhận được email xác nhận đủ điều kiện đăng ký BHYT từ P.CTSV (tối đa 48h làm việc kể từ khi sv đăng ký và đủ điều kiện).
Sinh viên lưu ý mã thanh toán trên DNG có hiệu lực trong vòng 8h, sinh viên bắt buộc thanh toán theo đúng thời gian quy định.
Mọi trường hợp thanh toán sau thời gian quy định sẽ không được giải quyết.


CÁC TRANG THÔNG TIN TRA CỨU:

Tra cứu BHXH:https://baohiemxahoi.gov.vn/.../tra-cuu-ho-gia-dinh.aspx
 Tra cứu mã Phường/Quận/Huyện/Xã. Sinh viên truy cập và nhập CHÍNH XÁC mã:
https://docs.google.com/.../1JkzRCY1HKe.../edit...

Danh sách cơ sở khám chữa bệnh. Không chọn các Cơ sở không chấp nhận tăng mới hoặc đổi nơi khám chữa bệnh (vd: Bệnh viện 175, bệnh viện 115, BV An Bình, BV Nguyễn Tri Phương, Bv Nhi đồng): 
https://drive.google.com/.../153HdJDkRd-5lV.../view...

Hướng dẫn cài đặt VssID: https://drive.google.com/.../1CxVArhlPIH0Z3NkIL46.../view...
Thông báo về mức đóng BHXH:
https://drive.google.com/.../15P_eszn2NSalBXie.../view...



Theo thông báo của cơ quan BHXH về việc NGỪNG IN THẺ BHYT GIẤY và chuyển sang thẻ BHYT điện tử SỬ DỤNG TRÊN APP VssID (chọn Cơ quan tiếp nhận là BHXH Quận Phú Nhuận).
Tại bước 6 khi đăng ký sử dụng VssID, sinh viên không cần đến cơ quan BHXH gần nhất để nộp tờ khai (hướng dẫn đăng kí VssID tại: baohiemxahoi.gov.vn)
Mọi thắc mắc sinh viên vui lòng phản hồi qua email: ctsv.fplhcm@fe.edu.vn", 1);
insert into news (id, title, image, detail, categoryID) values (4, "P.DVSV_THÔNG BÁO DSSV BẢO LƯU HỌC KỲ SUMMER 2023", "https://fpteducationgroup.files.wordpress.com/2015/03/quan-tri-doanh-nghiep-mkt-sales1.jpg?w=640", "Phòng Dịch Vụ Sinh Viên thông báo danh sách sinh viên BẢO LƯU học kỳ SUMMER 2023 cập nhật ngày 26/05/2023.

 

Sinh viên xem danh sách Tại đây

 

Mọi thắc mắc, Sinh viên có thể liên hệ với phòng Dịch vụ sinh viên qua các kênh như sau:

 

- Email: dvsvpoly.hcm@poly.edu.vn

 

- Link google meet (trong giờ hành chính): https://meet.google.com/frw-xyyf-afk 

 

- Hotline: 028.7308.8800

    (Khung giờ từ 7h00 - 20h30, Từ thứ 2 đến thứ 7)

 

Cảm ơn vì Bạn đã luôn đồng hành cùng FPT Polytechnic HCM,

 

Chúc các bạn thật nhiều sức khỏe và học thật tốt nhé!", 1);
insert into news (id, title, image, detail, categoryID) values (5, "P.DVSV_THÔNG BÁO DSSV THÔI HỌC TỰ NGUYỆN HỌC KỲ SUMMER 2023", "https://fpteducationgroup.files.wordpress.com/2015/03/quan-tri-doanh-nghiep-mkt-sales1.jpg?w=640", "Phòng Dịch Vụ Sinh Viên thông báo danh sách sinh viên THÔI HỌC TỰ NGUYỆN học kỳ SUMMER 2023 cập nhật ngày 26/05/2023.

 

Sinh viên sẽ không được xếp lớp học từ tháng 05/2023.

 

Sinh viên xem danh sách Tại đây

.

Mọi thắc mắc, Sinh viên có thể liên hệ với phòng Dịch vụ sinh viên qua các kênh như sau:

 

- Email: dvsvpoly.hcm@poly.edu.vn

 

- Link google meet: https://meet.google.com/frw-xyyf-afk 

 

- Hotline: 028.7308.8800

  (Khung giờ từ 7h00 - 20h30, Từ thứ 2 đến thứ 7)

 

Cảm ơn vì Bạn đã luôn đồng hành cùng FPT Polytechnic HCM,", 1);


-- học tập
insert into news (id, title, image, detail, categoryID) values (7, "THÔNG BÁO ĐĂNG KÝ CHUYỂN NGÀNH - CHUYỂN CƠ SỞ KỲ FALL 2023", "https://vcdn1-vnexpress.vnecdn.net/2022/11/25/image001-1669360369-2318-1669360406.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=vOa33lqGVAjBAIdIIqDFIw", "THÔNG BÁO ĐĂNG KÝ CHUYỂN NGÀNH - CHUYỂN CƠ SỞ KỲ FALL 2023
Thông báo

V/v: Đăng ký chuyển ngành, chuyển cơ sở học kỳ Fall 2023



Tất cả sinh viên có nguyện vọng CHUYỂN ĐỔI chuyên ngành, chuyên ngành hẹp hoặc chuyển cơ sở học kỳ Summer 2023 vui lòng lên AP để đăng ký.

Thông báo này KHÔNG dành cho Sinh viên KHÓA 18.2 (ngành TKĐH, TKWE) muốn chuyển chuyên ngành hẹp LẦN ĐẦU.

Thời gian mở đăng ký: Từ 9h00 ngày 01/8/2023 đến hết 20/8/2023

Lưu ý: Sau thời gian này nếu Sinh viên không đăng ký trên AP, Phòng Đào tạo sẽ không hỗ trợ xử lý với bất kỳ lý do nào.



Trân trọng!", 2);
insert into news (id, title, image, detail, categoryID) values (8, "THÔNG BÁO VỀ VIỆC NHẬN BẰNG TỐT NGHIỆP (ĐỢT TỐT NGHIỆP THÁNG 06/2023)", "https://vcdn1-vnexpress.vnecdn.net/2022/11/25/image001-1669360369-2318-1669360406.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=vOa33lqGVAjBAIdIIqDFIw", "THÔNG BÁO NHẬN BẰNG TỐT NGHIỆP
(ĐỢT TỐT NGHIỆP THÁNG 06/2023)

Địa điểm: Phòng Đào Tạo - Tầng trệt Tòa nhà T (QTSC9) - Công viên phần mềm Quang Trung, Phường Tân Chánh Hiệp, Quận 12.
Thời gian: Bắt đầu ngày 24/07/2023
Thứ 2 đến thứ 6: Sáng : 08h30 – 11h30 và Chiều : 13:30 – 16:30
Thứ 7: Sáng : 08h30 – 11h30
Danh sách sinh viên nhận bằng: DANH SÁCH SINH VIÊN TỐT NGHIỆP ĐỢT THÁNG 06 NĂM 2023
Lưu ý:
Khi nhận bằng : Sinh viên là người trực tiếp đến nhận, mang theo 1 CMND/CCCD bản chính và 1 bản sao có công chứng trong vòng 6 tháng
Bản gốc bằng Tốt nghiệp chỉ được cấp 1 lần, sinh viên mất bản gốc chỉ được cấp lại bản sao
Trường hợp nhận thay phải có ủy quyền bằng văn bản có chứng thực theo quy định của Pháp luật, CMND/CCCD photo công chứng của người ủy quyền và người được ủy quyền (trong 6 tháng)
Bằng Tốt nghiệp sẽ giữ lại trong vòng 1 năm tại trường cơ sở HCM, sau thời gian trên nếu chưa nhận sẽ chuyển về Hà Nội.
Phòng TC&QLĐT", 2);
insert into news (id, title, image, detail, categoryID) values (9, "PHÒNG KHẢO THÍ THÔNG BÁO LỊCH THI TẬP TRUNG MÔN PHÁP LUẬT NGÀY 05/08/2023", "https://vcdn1-vnexpress.vnecdn.net/2022/11/25/image001-1669360369-2318-1669360406.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=vOa33lqGVAjBAIdIIqDFIw", "PHÒNG KHẢO THÍ THÔNG BÁO LỊCH THI TẬP TRUNG MÔN PHÁP LUẬT NGÀY 05/08/2023
PHÒNG KHẢO THÍ THÔNG BÁO LỊCH THI TẬP TRUNG MÔN PHÁP LUẬT

NGÀY 05/08/2023

 



Sinh viên vui lòng đi thi Final EOS theo lịch thông báo qua email, không đi thi theo lịch thi trên AP hiện tại.

 

-         Ngoài ra, Sinh viên có thể xem lịch thi lại tại link sau: (Lưu ý xem kỹ cơ sở thi)

https://docs.google.com/spreadsheets/d/1AQNZ8m1S3uoMvoPLDyMkEdhTTPnqNRSw7zki1wL8pKk/edit#gid=1453756554

-         Mọi thắc mắc vui lòng phản hồi lại email: KHAOTHI.FPLHCM@fe.edu.vn

 

Lưu ý:

1.      Sinh viên xem kỹ cơ sở thi, ngày thi, ca thi, phòng thi.

2.      Sinh viên chỉ sử dụng máy tính hệ điều hành Windows, đây là yêu cầu bắt buộc.

3.      Sinh viên phải có mặt tại địa điểm thi đúng ngày giờ quy định. Nếu đến chậm quá 15 phút sẽ không được dự thi.

4.      Sinh viên cần xuất trình đầy đủ: THẺ SINH VIÊN VÀ CMND/ CCCD/ GIẤY PHÉP LÁI XE/ GIẤY TỜ TÙY THÂN CÓ ẢNH. (Yêu cầu bắt buộc)

5.      Sinh viên không xuất trình đủ thông tin yêu cầu, sinh viên sẽ không được tham gia buổi thi.

6.      Sinh viên thi tại toà T cần khai báo MAC để truy cập wifi (Lưu ý khai báo trước khi đi thi). Đối với trường hợp đã khai báo nhưng khai báo sai chỉ cần update là vô được ngay, khai báo lần đầu thì khoảng 10-15 phút sẽ vào được.

Link truy cập và hướng dẫn: (tài khoản login @fpt.edu.vn): https://reg.poly.edu.vn/login", 2);
insert into news (id, title, image, detail, categoryID) values (10, "THÔNG BÁO TỔ CHỨC THI LẠI CÁC MÔN HỌC ONLINE TRÊN CMS ĐỢT THI 17/08 - 19/08/2023", "https://vcdn1-vnexpress.vnecdn.net/2022/11/25/image001-1669360369-2318-1669360406.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=vOa33lqGVAjBAIdIIqDFIw", "THÔNG BÁO TỔ CHỨC THI LẠI CÁC MÔN HỌC ONLINE TRÊN CMS ĐỢT THI 17/08 - 19/08/2023
Phòng Khảo thí thông báo đến toàn thể sinh viên kế hoạch thi lại CÁC MÔN HỌC ONLINE TRÊN CMS.

Đối tượng:

Tổ chức thi lại các môn online: BUS1024 ; HOS105 ; HOS3031 ; MAR2051 ; MEC1051 ; MEC1241 ; PSY1011 ; SYB3012 ; TOU2031 ; VIE1016 ; VIE1026 ; HOS108 ; LOG301 ; ENT1125 ; ENT1126 ; ENT1225 ; ENT2125 ; ENT2225.
Sinh viên ĐÃ ĐỦ ĐIỀU KIỆN dự thi cuối kỳ nhưng THI CHƯA ĐẠT (SV kiểm tra điểm thi để biết kết quả môn học) 
 

Thời gian đăng ký trên AP: từ ngày 27/07/2023 - 06/08/2023

Ngày thi dự kiến: 17/08 - 19/08/2023

 

Hình thức đăng ký: Đăng ký và thanh toán trên AP tại mục Dịch vụ trực tuyến.



 

*   Lưu ý đối với môn Tiếng anh và MEC1051:



Từ kỳ Summer 2023, môn Tiếng Anh chuyển sang học theo phương pháp Blended, như vậy môn Tiếng Anh học từ kỳ SU23 trở đi sẽ không được thi lại.



Từ kỳ Fall 2023, môn MEC1051 sẽ chuyển đổi sang học lại môn tương đương là MEC126 , nên nếu SV chưa Đăng ký thi lại hoặc thi lại chưa đạt SẼ phải HỌC LẠI môn MEC1051.



Sinh viên nợ thành phần môn Tiếng Anh và môn MEC1051 từ kỳ Spring 2023 trở về trước cần đăng ký thi lại sớm để kịp tiến độ và không bị xếp học lại với mức phí học lại cao hơn từ kỳ Fall 2023.", 2);
insert into news (id, title, image, detail, categoryID) values (11, "Thông báo kết quả kiểm tra Tiếng Anh đầu vào ngày 22/07/2023", "https://vcdn1-vnexpress.vnecdn.net/2022/11/25/image001-1669360369-2318-1669360406.jpg?w=500&h=300&q=100&dpr=2&fit=crop&s=vOa33lqGVAjBAIdIIqDFIw", "Thông báo kết quả kiểm tra Tiếng Anh đầu vào ngày 22/07/2023

Khảo thí đã gửi email cho sinh viên thông báo về kết quả thi tiếng anh đầu vào ngày 22/07/2023.

Sinh viên đăng nhập mail FPT để biết thông tin chi tiết

Lưu ý

-        Đối với Sinh viên có kết quả “ĐẠT”: bắt đầu học tiếng anh từ level 2A (Tiếng anh 2.1). Riêng đối với ngành Du lịch, Nhà hàng, Khách sạn sẽ bắt đầu học Tiếng Anh chuyên ngành.

o  Sinh viên muốn hủy kết quả miễn giảm và bắt đầu học từ level 1A (Tiếng anh 1.1), vui lòng làm đơn tại phòng Dịch vụ sinh viên

o  Hạn chót: 02/08/2023

o  Sau ngày 02/08/2023, yêu cầu hủy điểm sẽ không được giải quyết 

-        Đối với Sinh viên có kết quả “KHÔNG ĐẠT”: bắt đầu học tiếng anh từ level 1A (Tiếng anh 1.1)

Trân trọng", 2);


-- học phí
insert into news (id, title, image, detail, categoryID) values (13, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (14, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (15, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (16, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (17, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (18, "Học Phí", "", "#FFF6E3", 3);

-- schedule
-- api: get all schedule, get schedule by date
create table if not exists schedules (
    id INT PRIMARY KEY AUTO_INCREMENT,
    room NVARCHAR(100) NOT NULL, -- phòng
    day DATE NOT NULL, -- ngày học
    time NVARCHAR(100) NOT NULL, -- ca học
    course_name NVARCHAR(100) NOT NULL, -- tên môn
    course_id NVARCHAR(100) NOT NULL, -- mã môn
    class_name NVARCHAR(100) NOT NULL, -- mã lớp
    teacher_name NVARCHAR(100) NOT NULL, -- tên giảng viên
    address NVARCHAR(100) NOT NULL, -- địa điểm
    type BIT NOT NULL, -- 0: học, 1: thi
    user_id VARCHAR(7) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(studentCode)
);

<<<<<<< HEAD

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-07', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-08', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-09', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-10', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-11', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
=======
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
>>>>>>> 11d91cc30891318b903b5bea07633a3f7a627bcd

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24524");

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-07', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-08', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-08', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-08', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-09', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-09', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-09', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-09', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-10', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-10', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-10', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-10', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-11', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-11', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-11', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, "ps24513");


-- notification
-- api: get notification, add notification

CREATE TABLE IF NOT EXISTS notifications (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userId VARCHAR(7) NOT NULL,
    newsId INT,
    scheduleId INT,
    serviceId INT,
    isSeen BIT DEFAULT 0,
    FOREIGN KEY (userId) REFERENCES users(studentCode),
    FOREIGN KEY (newsId) REFERENCES news(id),
    FOREIGN KEY (scheduleId) REFERENCES schedules(id),
    FOREIGN KEY (serviceId) REFERENCES services(id)
);

-- service

create table if not exists services(
    id INT KEY AUTO_INCREMENT,
    studentCodeID VARCHAR(7) NOT NULL,
    image VARCHAR(1000),
    phoneNumber VARCHAR(20) NOT NULL,
    service VARCHAR(100) NOT NULL,
    note VARCHAR(500),
    quantity INT,
    mucdich VARCHAR(100),
    confirm VARCHAR(100),
    FOREIGN KEY (studentCodeID) REFERENCES users(studentCode)
);

-- api: add service by mssv, get service

create table if not exists servicecomplete (
    id INT PRIMARY KEY AUTO_INCREMENT,
    service VARCHAR(100) NOT NULL,
    confirm VARCHAR(100) NOT NULL,
    date VARCHAR(100) NOT NULL,
    thongbao VARCHAR(500) NOT NULL,
    studentCodeID VARCHAR(7) NOT NULL,
    FOREIGN KEY (studentCodeID) REFERENCES users(studentCode)
);