<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Quản lý Đề Thi Trắc Nghiệm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ft.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header class="header">
        <div class="banner">
            <img src="${pageContext.request.contextPath}/images/banner2.png" alt="Banner" width="100%">
        </div>
        <h1>Thi Trắc Nghiệm Lịch Sử</h1>
        <p>Hệ thống quản lý Đề Thi Trắc Nghiệm</p>
    </header>
    
    <nav class="nav-container">
        <ul class="nav-menu">
           <li><a href="${pageContext.request.contextPath}/Home/trangchu.jsp">🏠Trang Chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/Home/gioithieu.jsp">📖Giới Thiệu</a></li>
            <li><a href="${pageContext.request.contextPath}/Home/dethinoibat.jsp">📝Đề Thi Nổi Bật</a></li>
            <li><a href="${pageContext.request.contextPath}/Home/huongdan.jsp">📌Hướng Dẫn</a></li>       
            <li><a href="${pageContext.request.contextPath}/Home/log-log.jsp">🔑 Đăng Nhập / Đăng Ký</a></li>
            
        </ul>
    </nav>

    <div class="container">
        <section class="content-section">
            <h2>📢 Giới thiệu về Thi Online</h2>
            <p>🔹Trong thời đại công nghệ phát triển, thi online đã trở thành một phương pháp đánh giá kiến thức phổ biến và hiệu quả.</p>
            <p>🔹Hệ thống thi trực tuyến giúp học sinh, sinh viên có thể làm bài kiểm tra ở bất kỳ đâu, bất kỳ lúc nào chỉ với một thiết bị có kết nối internet.</p>
        </section>

        <section class="content-section">
            <h2>📢 Lợi ích khi sử dụng hệ thống</h2>
<ul>
    <li>✅ Tiện lợi & linh hoạt: Người thi có thể làm bài ở bất cứ đâu, chỉ cần có kết nối internet.</li>
    <li>✅ Tiết kiệm thời gian & chi phí: Không cần in đề, tổ chức phòng thi hay giám sát trực tiếp.</li>
    <li>✅ Chấm điểm tự động: Kết quả được hiển thị ngay sau khi nộp bài, giúp tiết kiệm thời gian chấm điểm cho giáo viên.</li>
    <li>✅ Kho đề phong phú: Hệ thống có thể lưu trữ nhiều đề thi với độ khó khác nhau, phù hợp với từng đối tượng.</li>
    <li>✅ Kho đề phong phú: Hệ thống có thể lưu trữ nhiều đề thi với độ khó khác nhau, phù hợp với từng đối tượng.</li>
    <li> ✅ Hạn chế gian lận: Có thể áp dụng các biện pháp giám sát như camera, giới hạn thời gian, hoặc random câu hỏi để đảm bảo tính công bằng.</li>
    <li>👉 Với những ưu điểm vượt trội, thi online không chỉ là một xu hướng mà còn là giải pháp tối ưu giúp nâng cao chất lượng giáo dục trong thời đại số! 🚀📚</li>
</ul>
</section>

<section class="content-section">
    <h2>📢 Hướng dẫn cách thi</h2>
    <ol>
        <li>1️⃣ Đăng nhập vào hệ thống bằng tài khoản cá nhân.</li>
        <li>2️⃣ Chọn môn thi & đề thi phù hợp với trình độ của mình.</li>
        <li>3️⃣ Bắt đầu làm bài trong thời gian quy định, đọc kỹ yêu cầu trước khi trả lời.</li>
        <li>4️⃣ Nộp bài và nhận kết quả ngay sau khi hoàn thành.</li>
    </ol>
</section>

<section class="content-section">
    <h2> 📢Phản hồi từ học sinh</h2>
    <blockquote>🔹 Nguyễn Văn A: “Hệ thống rất dễ sử dụng, giúp em ôn tập hiệu quả hơn. Nhờ có kho đề thi phong phú, em có thể luyện tập trước kỳ thi mà không cần tốn quá nhiều thời gian tìm kiếm tài liệu.”</blockquote>
    <blockquote>🔹 Trần Thị B: “Trước đây em thường lo lắng khi đi thi, nhưng nhờ làm bài thi thử trên hệ thống, em đã tự tin hơn rất nhiều. Kết quả kiểm tra cũng được cải thiện rõ rệt.”</blockquote>
    <blockquote>🔹 Lê Minh C: “Em thích nhất là chức năng chấm điểm tự động. Sau khi nộp bài, em có thể biết ngay kết quả và xem lại đáp án đúng để rút kinh nghiệm.”</blockquote>
    <blockquote>🔹 Hoàng Mai D: “Nhờ có hệ thống, em có thể học mọi lúc, mọi nơi. Thậm chí khi đi du lịch, em vẫn có thể làm bài kiểm tra để ôn tập mà không bị gián đoạn.”</blockquote>
    <blockquote>🔹 Phạm Quang E: “Giáo viên của em cũng thích hệ thống này vì có thể dễ dàng theo dõi tiến độ học tập của học sinh, giúp chúng em học tập hiệu quả hơn.”</blockquote>
    
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
    </div>

    <script>
        document.getElementById("openChat").addEventListener("click", function () {
            let chatBox = document.getElementById("chatBox");
            chatBox.classList.toggle("show");
        });

        document.getElementById("closeChat").addEventListener("click", function () {
            let chatBox = document.getElementById("chatBox");
            chatBox.classList.toggle("show");
        });
    </script>

   <footer class="footer">
    <div class="footer-container">
        <div class="contact-info">
            <h2>Liên Hệ Chúng Tôi</h2>
            <h3>Thông Tin Liên Hệ</h3>
            <p><strong>📍 Địa chỉ:</strong> Yên Nghĩa, Hà Đông, Hà Nội</p>
            <p><strong>📞 Điện thoại:</strong> 0123 456 789</p>
            <p><strong>📧 Email:</strong> contact@dethionline.com</p>
            <p><strong>🕒 Giờ làm việc:</strong> 08:00 - 18:00 (Thứ 2 - Thứ 7)</p>
        </div>
        
        <div class="map">
            <h3>Bản Đồ</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.8581755598635!2d105.77034671488326!3d21.038132885993716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab0cb6c6f7d1%3A0x6f55dbf24e5a3b84!2zTmjDoCBUw6JuZyBOZ3V54buFbiBUcuG6oWk!5e0!3m2!1sen!2s!4v1645348959380!5m2!1sen!2s" allowfullscreen></iframe>
        </div>
    </div>
    <p>&copy; 2025 - Thi Trắc Nghiệm Lịch Sử. All rights reserved.</p>
</footer>
</body>
</html>
