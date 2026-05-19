# 🚀 BỘ CÔNG CỤ TỐI ƯU HÓA PHẦN CỨNG & GIẢM ĐỘ TRỄ (INPUT LAG) VALORANT

Bộ công cụ bằng file Batch (`.bat`) giúp can thiệp an toàn vào Windows Registry, thiết lập nguồn điện nâng cao và cấu hình lại băng thông mạng nhằm ép phần cứng phản hồi nhanh nhất có thể, triệt tiêu độ trễ chuột/bàn phím khi chơi VALORANT.

---

## 📌 HƯỚNG DẪN CHẠY BỘ CÔNG CỤ
1. **Tải file script về máy tính.**
2. **Kích hoạt quyền Quản trị viên:** Nhấp chuột phải vào file `.bat` và chọn **"Run as administrator"** (Chạy với quyền admin). *Nếu không có quyền này, Windows sẽ chặn toàn bộ lệnh can thiệp hệ thống.*
3. **Áp dụng các gói tối ưu:** Lần lượt chọn các mục từ **1 đến 3** (hoặc thêm mục **5** để dọn rác).
4. **Khởi động lại PC:** Sau khi chạy xong, bạn **bắt buộc phải Restart lại máy tính** để các thay đổi trong Registry chính thức có hiệu lực.

---

## 🛠️ CHI TIẾT CÁC TÍNH NĂNG TRONG MENU

### [1] Tối ưu Chuột & Bàn phím (Input Lag ~0ms)
* **Giảm hàng đợi dữ liệu (`MouseDataQueueSize` & `KeyboardDataQueueSize` xuống 50):** Giới hạn dung lượng bộ đệm xếp hàng của Windows. Tín hiệu click chuột và nhấn phím sẽ được gửi thẳng đến CPU để xử lý ngay lập tức thay vì phải "xếp hàng chờ", đưa độ trễ thiết bị ngoại vi về mức tối thiểu.
* **Vô hiệu hóa Sticky Keys & Bộ lọc đệm phím:** Triệt tiêu hoàn toàn hiện tượng kẹt phím hoặc delay phím khi bạn thực hiện các thao tác di chuyển phức tạp (như táp/strafe liên tục).
* **Tắt USB Selective Suspend:** Ngăn Windows đưa các cổng USB (chuột, phím, tai nghe) vào trạng thái ngủ tiết kiệm điện. Giữ cho cổng kết nối luôn nhận nguồn điện đầy đủ và ổn định.

### [2] Ép công suất CPU & GPU (Max Peak Performance)
* **Kích hoạt chế độ Ultimate Performance:** Mở khóa chế độ nguồn điện "Sức mạnh tối đa" ẩn của Windows, ngăn chặn hiện tượng tự động tụt xung dòng điện (drop clock) của CPU.
* **Set High Priority cho VALORANT:** Ép Windows luôn ưu tiên phân phối chu kỳ xử lý cao nhất của CPU cho tiến trình game (`VALORANT-Win64-Shipping.exe`).
* **High Performance GPU:** Định tuyến ép buộc Windows phải cấp card đồ họa rời mạnh nhất cho game, tránh việc nhận nhầm card on-board.
* **Kích hoạt HAGS (Hardware Accelerated GPU Scheduling):** Cho phép card đồ họa tự quản lý bộ nhớ của chính nó, giảm tải tối đa cho CPU và giảm tình trạng nghẽn cổ chai (bottleneck).

### [3] Tối ưu Hệ thống & Băng thông Mạng
* **Tắt HPET (High Precision Event Timer) & Dynamic Ticks:** Loại bỏ bộ định thời phần cứng cũ kỹ của Windows — nguyên nhân hàng đầu gây ra hiện tượng giật micro-stutter (khựng hình vi mô) dù FPS hiển thị trên màn hình vẫn cao.
* **Network Throttling Index & System Responsiveness:** Tắt tính năng tự động bóp băng thông mạng khi xử lý tác vụ nền của Windows, dành 100% tài nguyên mạng cho Game để giảm ping và hạn chế mất gói tin (Packet Loss).
* **Win32PrioritySeparation (38):** Cấu hình hệ thống tập trung toàn bộ tài nguyên CPU xử lý cho ứng dụng đang chạy ở Foreground (màn hình game chính).

### [4] TAT / REVERT: Khôi phục mặc định Windows
* Nếu bạn muốn đưa máy tính trở lại trạng thái ban đầu, lựa chọn này sẽ hoàn tác 100% các chỉnh sửa Registry, reset lại các thông số chuột/bàn phím về mức mặc định (`100`) và trả mạng về cấu hình gốc của Windows.

### [5] BONUS: Dọn dẹp nhanh bộ nhớ đệm & Flush DNS
* **Flush DNS:** Xóa sạch bộ nhớ đệm định danh mạng, làm sạch đường truyền tới Server game giúp ổn định ping.
* **Xóa file Temp:** Giải phóng dung lượng ổ cứng bị chiếm dụng bởi các tệp tin rác tạm thời trong quá trình Windows vận hành.

---

## 🚀 THỨ TỰ THỰC HIỆN ĐỂ ĐẠT HIỆU QUẢ TỐT NHẤT

1. Mở file script với quyền **Admin**.
2. Nhập phím `1` (Chờ chạy xong) -> Nhập phím bất kỳ để về Menu.
3. Nhập phím `2` (Chờ chạy xong) -> Nhập phím bất kỳ để về Menu.
4. Nhập phím `3` (Chờ chạy xong) -> Nhập phím bất kỳ để về Menu.
5. Nhập phím `5` để dọn rác nhanh cho hệ thống.
6. Nhập phím `6` để thoát công cụ.
7. **Khởi động lại máy tính (Restart PC)**.

> 💡 **Lưu ý nhỏ:** Riêng mục `[5] BONUS` bạn có thể chạy lại bất cứ lúc nào (ví dụ: trước mỗi trận đấu hoặc sau một ngày dài sử dụng máy) để làm sạch máy nhanh mà không cần phải khởi động lại máy tính.
