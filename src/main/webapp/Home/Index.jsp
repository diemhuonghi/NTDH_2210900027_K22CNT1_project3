<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Quản lý Đề Thi Trắc Nghiệm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_index.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header class="header">
        <div class="banner">
            <img src="${pageContext.request.contextPath}/images/banner.png" alt="Banner" width="100%">
        </div>
        <h1>Thi Trắc Nghiệm Lịch Sử</h1>
        <p>Hệ thống quản lý Đề Thi Trắc Nghiệm</p>
    </header>
    
    <nav class="nav-container">
    <ul class="nav-menu">
        <li class="dropdown">
            <a href="#">👨‍🏫 Giáo Viên ▼</a>
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/giaovien">Danh sách giáo viên</a></li>
                <li><a href="#">Thêm giáo viên</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#">🎓 Học Sinh ▼</a>
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/hocsinh">Danh sách học sinh</a></li>
                <li><a href="#">Thêm học sinh</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#">📚 Môn Học ▼</a>
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/monhoc">Danh sách môn học</a></li>
                <li><a href="#">Thêm môn học</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/dethi">📝 Đề Thi</a></li>
        <li><a href="${pageContext.request.contextPath}/cauhoi">❓ Câu Hỏi</a></li>
        <li><a href="${pageContext.request.contextPath}/dapan">✔️ Đáp Án</a></li>
        <li><a href="${pageContext.request.contextPath}/bailam">📄 Bài Làm</a></li>
        <li><a href="${pageContext.request.contextPath}/bailamchitiet">📑 Chi Tiết Bài Làm</a></li>
        <li><a href="${pageContext.request.contextPath}/Home/log-log.jsp">🔑 Đăng nhập / Đăng ký</a></li>
        
    </ul>
</nav>

    
    <div class="container">
        <section class="content-section">
            <h2>Giới thiệu về Thi Online</h2>
            <p>Thi trắc nghiệm trực tuyến giúp học sinh ôn tập và kiểm tra kiến thức dễ dàng với hệ thống đa dạng môn học.</p>
        </section>

        <section class="content-section">
            <h2>Lợi ích khi sử dụng hệ thống</h2>
            <ul>
                <li>Học tập mọi lúc, mọi nơi</li>
                <li>Kết quả nhanh chóng, chính xác</li>
                <li>Kho đề thi đa dạng, phong phú</li>
                <li>Hỗ trợ giáo viên theo dõi tiến độ học sinh</li>
            </ul>
        </section>

        <section class="content-section">
            <h2>Hướng dẫn cách thi</h2>
            <ol>
                <li>Đăng nhập vào hệ thống</li>
                <li>Chọn môn học và đề thi phù hợp</li>
                <li>Hoàn thành bài thi trong thời gian quy định</li>
                <li>Nhận kết quả ngay sau khi nộp bài</li>
            </ol>
        </section>

        <section class="content-section">
            <h2>Phản hồi từ học sinh</h2>
            <blockquote>“Hệ thống rất dễ sử dụng, giúp em ôn tập hiệu quả hơn!” - Nguyễn Văn A</blockquote>
            <blockquote>“Nhờ thi thử trên hệ thống mà điểm kiểm tra của em tăng lên đáng kể.” - Trần Thị B</blockquote>
        </section>
    </div>
    <!-- Bong bóng chat -->
	<div class="chat-bubble" id="chatBubble">💬</div>
	
	<!-- Nút mở chat -->
<button class="open-chat-btn" id="openChat">💬 Chat với chúng tôi</button>

<!-- Cửa sổ chat -->
<div class="chat-box hidden" id="chatBox">
    <div class="chat-header">
        <span>🎧 Hỗ trợ khách hàng</span>
        <button class="close-chat" id="closeChat">&times;</button>
    </div>
    <div class="chat-content">
        <p>Xin chào! Bạn cần hỗ trợ gì không? 😊</p>
    </div>
    <div class="chat-footer">
        <input type="text" id="chatInput" placeholder="Nhập tin nhắn...">
        <button id="sendChat">Gửi</button>
    </div>
    <script>
    document.getElementById("openChat").addEventListener("click", function () {
        let chatBox = document.getElementById("chatBox");
        chatBox.classList.toggle("show"); // Toggle class thay vì add/remove
    });

    document.getElementById("closeChat").addEventListener("click", function () {
        let chatBox = document.getElementById("chatBox");
        chatBox.classList.toggle("show"); // Ấn vào đóng lại nhưng không mất luôn
    });

</script>
</div>

    <footer class="footer">
        <p>&copy; 2025 - Thi Trắc Nghiệm Lịch Sử. All rights reserved.</p>
    </footer>
</body>
</html>
