### Cấu trúc

| Thực thể (Entity)               | Thuộc tính (Attribute)                                                                                                                               | Mối quan hệ (Relationship)                                                                |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- |
| Người dùng (User)              | PK: Mã người dùng<br />Họ tên<br />Email<br />Mật khẩu<br />Vai trò (student/instructor/admin)                                                | 1 -> N Đăng ký học<br />1 -> N Kết quả ( Result )                                     |
| Khoá học (Course)               | PK: Mã khoá<br />FK: Mã người dùng ( instructor )<br />FK: Mã danh mục<br />Tên<br />Mô tả<br />Cấp độ<br />Giá<br />Ngày phát hành | 1 -> N Đăng ký học<br />N -> 1 Danh mục<br />N -> 1 Giảng viên<br />1 -> N Bài học |
| Danh mục khoá học (Category)   | PK: Mã danh mục<br />Tên danh mục                                                                                                                  | 1 -> N Khoá học                                                                           |
| Giảng viên (Instructor)         | PK,FK: Mã người dùng<br />Học vị<br />Chuyên môn                                                                                               | 1 -> 1 Người dùng<br />1 -> N Khoá học                                                 |
| Đăng ký học (Enrollment)      | PK: Mã đăng ký học<br />FK: Mã người dùng ( student )<br />Khoá học<br />Giá<br />Ngày đăng ký<br />Trạng thái                       | N -> 1 Người dùng ( student )<br />N -> 1 Khoá học                                   |
| Bài học (Lesson)                | PK: Mã bài học<br />FK: Mã khoá học<br />Tiêu đề<br />Nội dung<br />Thời lượng<br />Thuộc khoá học                                     | N -> 1 Khoá học<br />1 -> Có thể có 1/N quiz                                           |
| Bài kiểm tra (Quiz)             | PK: Mã quiz<br />Tiêu đề<br />Số câu hỏi<br />Thuộc bài nào                                                                                  | 1/N -> 1 Bài học<br />1 -> N Người dùng (student)<br />1 -> N Kết quả ( Result )     |
| Kết quả (Result)                | PK: Mã kết quả<br />Ngày làm<br />FK: Mã người dùng<br />FK: Mã quiz                                                                         | N -> 1 Bài kiểm tra (quiz)<br />N -> 1 Người dùng                                      |
| Thanh toán ( Payment )           | PK: Mã thanh toán<br />FK: Mã người dùng<br />Ngày thanh toán<br />Phương thức thanh toán<br />Số tiền<br />Trạng thái                 | N -> 1 Người dùng                                                                        |
| Giấy chứng chỉ ( Certificate ) |                                                                                                                                                        |                                                                                             |

### ERD

![ERD](./drawio/[%20Giỏi%20]%20Hệ%20thống%20Quản%20lý%20Lớp%20học%20Trực%20tuyến.svg)
