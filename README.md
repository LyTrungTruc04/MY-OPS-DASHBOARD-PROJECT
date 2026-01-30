# 📊 My Ops Dashboard

> Công cụ giám sát hệ thống Linux tự động (System Monitoring Tool).
> Dự án Capstone tổng hợp kiến thức Bash Script, Systemd, Nginx và Makefile.

<img width="1512" height="798" alt="Screenshot 2026-01-30 at 23 43 49" src="https://github.com/user-attachments/assets/1c4d7673-9f0a-49e9-abb7-cfdac1d88901" />

<img width="582" height="168" alt="Screenshot 2025-12-27 at 23 30 23" src="https://github.com/user-attachments/assets/46a4d010-3f66-4b37-a12d-775bec78fa55" />


## 📖 Giới thiệu
**My Ops Dashboard** là một giải pháp nhẹ giúp theo dõi trạng thái server theo thời gian thực. Công cụ tự động thu thập các chỉ số quan trọng (RAM, Disk, Uptime and Realtime) và hiển thị trực quan qua giao diện Web.

Dự án này được xây dựng để giải quyết vấn đề giám sát server mà không cần cài đặt các phần mềm nặng nề như Prometheus hay Grafana.

## 🚀 Tính năng chính
* 🔄 **Real-time Monitoring:** Cập nhật thông số mỗi 2 giây.
* 💾 **Log Management:** Tự động ghi log trạng thái hệ thống.
* 🤖 **Auto-Start:** Tự động khởi động cùng hệ thống nhờ Systemd.
* 🌐 **Web Interface:** Xem báo cáo qua trình duyệt (HTML/CSS đơn giản).
* 🛠 **Easy Setup:** Cài đặt và gỡ bỏ chỉ với 1 dòng lệnh (Makefile).

## 🛠 Công nghệ sử dụng
* **Core:** Bash Scripting (Xử lý logic, lấy thông số).
* **Service Manager:** Systemd (Quản lý tiến trình chạy nền).
* **Web Server:** Nginx (Hiển thị Dashboard).
* **Automation:** Makefile (Tự động hóa triển khai).
* **Logs:** Logrotate (Quản lý dung lượng log).

## ⚙️ Yêu cầu cài đặt (Prerequisites)
Để chạy được dự án này, bạn cần:
* Hệ điều hành(linux): Ubuntu/Debian hoặc CentOS.
* Quyền Admin (`sudo`).
* Đã cài đặt `nginx` và `make`.

## 📂 Cấu trúc dự án
```text
.
├── Makefile                # Script cài đặt tự động
├── README.md               # Tài liệu hướng dẫn
├── configs/
│   ├── dashboard.service   # File cấu hình Systemd
│   ├── dashboard.logrotate # File cấu hình log
│   └── dashboard.nginx     # File cấu hình nginx
└── scripts/
    └── monitor.sh          # Script chính (thu thập dữ liệu)
```
## 📦 Hướng dẫn Cài đặt & Sử dụng

### 1. Clone dự án:
```bash 
git clone https://github.com/LyTrungTruc04/MY-OPS-DASHBOARD-PROJECT.git
cd MY-OPS-DASHBOARD-PROJECT
```

### 1.2. Move dashboard UX
```bash
sudo mv . /var/www/html
```

### 2. Cài đặt (deploy):
```bash
make setup
```
### 3. Kiểm tra hoạt động:
```bash
make log
```
### 4. Gỡ cài đặt (Nếu muốn):
```bash
make clean
```
