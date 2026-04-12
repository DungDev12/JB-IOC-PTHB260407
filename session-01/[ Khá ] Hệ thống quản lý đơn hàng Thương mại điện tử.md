### Cấu trúc

| Thực thể (Entity)               | Thuộc tính (Attribute)                                                                        | Mối quan hệ (Relationship)                                                |
| ------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| Khách hàng (Customer)           | Mã khách hàng<br />Họ tên<br />Email<br />Số điện thoại<br />Địa chỉ                          | 1 -> N Đơn hàng                                                           |
| Sản phẩm (Product)              | Mã sản phẩm<br />Tên sản phẩm<br />Giá<br />Mô tả<br />Loại hàng                              | N -> 1 Chi tiết đơn hàng                                                  |
| Đơn hàng (Order)                | Mã đơn<br />Mã nhân viên<br />Ngày đặt hàng<br />Tổng tiền<br />Trạng thái<br />Mã khách hàng | N -> 1 Khách hàng<br />**1 -> N Chi tiết đơn hàng**<br />N -> 1 Nhân viên |
| Chi tiết đơn hàng (OrderDetail) | Số lượng<br />Đơn giá tại thời điểm mua                                                       | **1 -> N Sản phẩm**                                                       |
| Nhân viên (Staff)               | Mã nhân viên<br />Họ tên <br />Vị trí<br />Ngày vào làm                                       | 1 -> N Đơn hàng                                                           |

### ERD

![ERD](./drawio/[%20Khá%20]%20Hệ%20thống%20quản%20lý%20đơn%20hàng%20Thương%20mại%20điện%20tử.svg)
