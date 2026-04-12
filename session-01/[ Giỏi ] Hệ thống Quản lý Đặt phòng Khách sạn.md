### Cấu trúc

| Thực thể (Entity)              | Thuộc tính (Attribute)                                                                          | Mối quan hệ (Relationship)                                     |
| ------------------------------ | ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| Khách sạn (Hotel)              | PK: Mã khách sạn<br />Tên<br />Địa chỉ<br />Số sao<br />Mô tả<br />Người quản lý                | 1 -> N Phòng<br />1 -> N Đánh giá                              |
| Phòng (Room)                   | PK: Mã phòng<br />Loại phòng<br />Giá mỗi đêm<br />Tình trạng<br />Sức chứa                     | **1 -> N Đặt phòng**                                           |
| Khách hàng (Customer)          | PK: Mã khách hàng<br />Họ tên<br />Email<br />Số điện thoại<br />Quốc tịch                      | 1 -> N Đánh giá<br />1 -> N Đặt phòng                          |
| Đặt phòng (Booking)            | PK: Mã đặt phòng<br />Ngày đặt<br />Ngày nhận<br />Ngày trả<br />Tổng tiền<br />Trạng thái      | 1 -> 1 Thanh toán<br />N -> 1 Khách hàng<br />**1 -> N Phòng** |
| Thanh toán (Payment)           | PK: Mã thanh toán<br />Phương thức thanh toán<br />Ngày thanh toán<br />Số tiền<br />Trạng thái | 1 -> 1 Đặt phòng                                               |
| Đánh giá (Review)              | PK: Mã đánh giá<br />Điểm số<br />Bình luận<br />Ngày đăng                                      | N -> 1 Khách sạn<br />N -> 1 Khách hàng                        |
| Phòng_Đặt Phòng (Room_Booking) | PK: Mã phòng<br />PK: Mã đặt phòng                                                              | Phòng N <-> N Đặt phòng<br />( Bảng trung gian )               |

### ERD

![ERD](./drawio/[%20Giỏi%20]%20Hệ%20thống%20Quản%20lý%20Đặt%20phòng%20Khách%20sạn.svg)
