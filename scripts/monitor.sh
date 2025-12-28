#!/bin/bash
#Đường dẫn
LOG_FILE="/var/log/ops-dashboard.log"
HTML_FILE="/var/www/html/index.html"

#Hàm lấy thông tin (Function)
generate_html() {
        #Lấy thông số (command)
        MEMORY=$(LC_ALL=C free -m | grep Mem | awk '{print $3 "/" $2 " MB"}')
        DISK=$(df -h / | tail -1 | awk '{print $5}')
        REALTIME=$(date '+%d-%m-%Y %H:%M')
        UPTIME=$(uptime -p)
        RAM_PERCENT=$(LC_ALL=C free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)
        #Tạo file html
        cat > $HTML_FILE <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Live Ops Dashboard</title>
    <style>
        body { font-family: monospace; background-color: #FFFFFF; color: #000000; text-align: >
        .container { margin-top: 50px; }
        .box { 
            border: 1px solid #000000; 
            display: inline-block; 
            padding: 20px; 
            margin: 15px; 
            width: 220px; 
            border-radius: 8px;
            background: #959595;
            box-shadow: 0 0 15px rgba(246, 1, 42, 0.2);
        }
        h2 { font-size: 2em; margin: 10px 0; }
        .progress-bar { background: #ffffff; height: 10px; width: 100%; margin-top: 10px; }
        .progress-fill { background: #000000; height: 100%; width: ${RAM_PERCENT}%; transition>
    </style>
    
    <script>
        setTimeout(function(){
           location.reload();
        }, 2000);
    </script>
</head>
<body>
    <div class="container">
        <h1>REAL-TIME MONITOR LINUX</h1>
        <div class="box">
            <h3>RAM Usage</h3>
            <h2>$MEMORY</h2>
            <div class="progress-bar"><div class="progress-fill"></div></div>
        </div>
        <div class="box">
            <h3>Disk Usage</h3>
            <h2>$DISK</h2>
            <div class="progress-bar"><div class="progress-fill"></div></div>
        </div>
        <div class="box">
            <h3>Disk Usage</h3>
            <h2>$DISK</h2>
        </div>
        <div class="box">
            <h3>Realtime</h3>
            <h4 style="color: #ffffff">$REALTIME</h4>
        </div>
                <div class="box">
            <h3>Uptime</h3>
            <h4 style="color: #ffffff">$UPTIME</h4>
        </div>
    </div>
</body>
</html>
EOF
}

while true; do
        generate_html
        echo "$(date): Dashboard updated - RAM: $MEMORY" >> $LOG_FILE
        sleep 2
done
TEST_VAR= "Sai Ròi"
