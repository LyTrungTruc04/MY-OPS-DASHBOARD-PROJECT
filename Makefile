#Biến
SCRIPT_SRC= scripts/monitor.sh
SCRIPT_DEST= /usr/local/bin/monitor.sh
SERVICE_SRC= configs/dashboard.service
SERVICE_DEST= /etc/systemd/system/dashboard.service
NGINX_SRC= configs/dashboard.nginx
NGINX_DEST= /etc/nginx/sites-available/dashboard
NGINX_LINK= /etc/nginx/sites-enabled/dashboard

#Cài dặt
setup:
	@echo "Bắt đầu cài đặt Dashboard..."
	#Copy script
	sudo cp $(SCRIPT_SRC) $(SCRIPT_DEST)
	sudo chmod +x $(SCRIPT_DEST)
	
	#copy systemd service
	sudo cp $(SERVICE_SRC) $(SERVICE_DEST)

	#Cấu hình nginx
	@echo "Đang cấu hình nginx..."
	sudo cp $(NGINX_SRC) $(NGINX_DEST)
	#Tạo liên kết
	sudo ln -sf $(NGINX_DEST) $(NGINX_LINK)
	#Xoá file cũ để đỡ xung đột
	sudo rm -f /etc/nginx/sites-enabled/default

	#reload và srart service
	sudo systemctl daemon-reload
	sudo systemctl enable dashboard
	sudo systemctl restart dashboard
	sudo systemctl restart nginx
	@echo "Cài thành công! Hãy truy cập vào localhost để xem"

#Xem log
log:
	tail -f /var/log/ops-dashboard.log

#Gỡ cài đặt
clean:
	@echo "Đang dọn dẹp"
	sudo systemctl stop dashboard
	sudo systemctl disable dashboard
	sudo rm $(SCRIPT_DEST) $(SERVICE_DEST)
	@echo "Đã xong"
