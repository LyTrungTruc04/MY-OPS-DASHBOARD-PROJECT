let diskChartInstance = null;

function initChart() {
    const ctx = document.getElementById('diskChart').getContext('2d');
    diskChartInstance = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Used', 'Free'],
            datasets: [{
                data: [0, 100], 
                backgroundColor: ['#ff5f1f', '#222'],
                borderWidth: 0,
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { position: 'right', labels: { color: '#aaa', font: { family: 'Share Tech Mono' } } }
            },
            cutout: '70%'
        }
    });
}

async function fetchData() {
    try {
        // Thêm timestamp để tránh cache trình duyệt
        const response = await fetch('data.json?t=' + new Date().getTime());
        const data = await response.json();

        // 1. Cập nhật ngày giờ
        document.getElementById('date-text').innerText = data.date + ' ' + data.time;

        // 2. Cập nhật Process
        document.getElementById('proc-count').innerText = data.system.processes;

        // 3. Cập nhật RAM
        document.getElementById('ram-text').innerText = `${data.ram.used} / ${data.ram.total} MB`;
        document.getElementById('ram-bar').style.width = `${data.ram.percent}%`;
        document.getElementById('ram-percent').innerText = data.ram.percent;

        // 4. Cập nhật Uptime
        document.getElementById('uptime-text').innerText = data.system.uptime;

        // 5. Cập nhật biểu đồ Disk
        if (diskChartInstance) {
            diskChartInstance.data.datasets[0].data = [data.disk.used, data.disk.free];
            diskChartInstance.update();
        }

    } catch (error) {
        console.error("Lỗi tải dữ liệu:", error);
    }
    
}

const sidebar = document.getElementById('sidebar');
const toggleBtn = document.getElementById('toggleBtn');

toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
});

const navItems = document.querySelectorAll('.nav-item');

navItems.forEach(item => {
    item.addEventListener('click', function() {
        navItems.forEach(nav => nav.classList.remove('active'));
        this.classList.add('active');
    });
});

// Khởi chạy
initChart();
setInterval(fetchData, 2000);
fetchData();
