<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu Hệ Thống Đề Thi Online</title>
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #dfeffc;
    padding: 30px;
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
}

.container {
    width: 90%;
    max-width: 900px;
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    flex-grow: 1;
}

.header {
    text-align: center;
    font-size: 26px;
    font-weight: bold;
    text-transform: uppercase;
    padding: 15px;
    background-color: #5ba8f5;
    color: white;
    border-radius: 10px;
    margin-bottom: 20px;
}

.section {
    background: #eef6ff;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 15px;
    border-left: 5px solid #5ba8f5;
    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: space-between;
    transition: 0.3s ease-in-out;
}

.section:hover {
    background: #d0e4ff;
    transform: scale(1.02);
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

.section-content {
    width: 60%;
}

.section img {
    width: 50%; /* Tăng từ 35% lên 40% */
    max-width: 400px; /* Tăng max-width từ 350px lên 400px */
    height: auto;
    border-radius: 8px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
}


.section-title {
    font-weight: bold;
    font-size: 22px;
    color: #2a6bbf;
    border-bottom: 2px solid #5ba8f5;
    padding-bottom: 5px;
    display: inline-block;
}

.section p, ul {
    font-size: 18px;
    line-height: 1.6;
    text-align: justify;
}

.footer {
    text-align: center;
    font-size: 16px;
    padding: 20px;
    margin-top: 20px;
    background-color: #f1f1f1;
    border-radius: 8px;
    width: 100%;
}
    </style>
</head>
<body>
    <div class="container">
        <div class="header">HƯỚNG DẪN CÁCH THI VÀ TÍNH ĐIỂM</div>
        <div >
    <a href="<%= request.getContextPath() %>/Home/Index.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
       🏠 Quay lại trang chủ
    </a>
</div>
        <div class="section">
            <div class="section-content">
                <h2 class="section-title">1. Hướng dẫn đăng ký để thi</h2>
                <h3>Bước 1: Đăng ký tài khoản</h3>
                <p>1. Truy cập trang web hệ thống đề thi online.</p>
                <p>2. Chọn <b>Đăng ký</b> và nhập thông tin đầy đủ theo yêu cầu.</p>
                <p>3. Xác nhận email để kích hoạt tài khoản.</p>
            </div>
            <img src="${pageContext.request.contextPath}/images/DN.png" alt="Hướng dẫn đăng ký">
        </div>
        
        <div class="section">
            <div class="section-content">
                <h3>Bước 2: Chọn đề thi</h3>
                <p>1. Đăng nhập vào hệ thống bằng tài khoản đã đăng ký.</p>
                <p>2. Truy cập mục <b>Đề thi</b> để xem danh sách các bài thi.</p>
                <p>3. Chọn bài thi phù hợp với nhu cầu của bạn.</p>
            </div>
             <img src="${pageContext.request.contextPath}/images/DT.png" alt="Hướng dẫn chọn đề thi">
        </div>
        
        <div class="section">
            <div class="section-content">
                <h3>Bước 3: Làm bài thi</h3>
                <p>1. Đọc kỹ câu hỏi, lựa chọn đáp án đúng.</p>
                <p>2. Có thể chuyển đổi giữa các câu hỏi để xem lại.</p>
                <p>3. Sau khi hoàn thành, nhấn <b>Nộp bài</b> để chấm điểm.</p>
            </div>
            <img src="${pageContext.request.contextPath}/images/LB.png" alt="Hướng dẫn làm bài thi">
        </div>
        
        <div class="section">
            <div class="section-content">
                <h2 class="section-title">2. Cách tính điểm</h2>
                <p><b>Công thức:</b> (Số câu đúng / Tổng số câu) × 10</p>
                <p>Hệ thống sẽ tự động tính toán và hiển thị điểm số ngay sau khi nộp bài.</p>
                <p>Bạn có thể xem lại kết quả chi tiết trong phần <b>Lịch sử thi</b>.</p>
            </div>
             <img src="${pageContext.request.contextPath}/images/COLEN.png" alt="Hướng dẫn tính kết quả"  
     style="width: 30%; height:190px; " >

        </div>
    </div>
    <div class="footer">&copy; 2025 Hệ Thống Đề Thi Online. Mọi quyền được bảo lưu.</div>
</body>
</html>
