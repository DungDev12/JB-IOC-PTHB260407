### Cấu trúc

| Thực thể (Enity)               | Thuộc tính (Attribute)                                                                     | Mối quan hệ (Relationship)                                          |
| ------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| Sinh viên ( Student )          | Mã sinh viên<br />Họ tên<br />Ngày sinh<br />Giới tính<br />Email<br />Khoa                | <br />**1 -> N Đăng ký**                                            |
| Môn học ( Course )             | Mã môn học<br />Tên môn<br />Số tín chỉ<br />Khoa phụ trách                                | <br />1 -> N Lớp học phần                                           |
| Giảng viên ( Instructor )      | Mã giảng viên<br />Họ tên<br />Học vị<br />Email<br />Khoa                                 | <br />1 -> Lớp học phần                                             |
| Lớp học phần ( Class_section ) | Mã lớp học phần<br />Mã giảng viên<br />Mã môn học<br />Học kỳ<br />Năm học<br />Phòng học | <br />N -> 1 Môn học<br />N -> 1 Giảng viên<br />**1 -> N Đăng ký** |
| Đăng ký ( Enrollment )         | Mã sinh viên<br />Mã lớp học phần<br />Ngày đăng ký                                        | **1 -> N Sinh viên đăng ký<br />1 -> N Lớp học phần**               |

### ERD

![ERD](./drawio/[%20Khá%20]%20Hệ%20thống%20Quản%20lý%20Đăng%20ký%20Môn%20học%20Đại%20học.svg)
