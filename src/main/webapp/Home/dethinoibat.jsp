<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Kiểm tra xem người dùng đã đăng nhập chưa
    String username = (String) session.getAttribute("username");
    boolean isLoggedIn = (username != null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách Đề thi Lịch sử</title>
<style>
    /* Reset CSS */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Thiết lập chung */
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #e3f2fd, #bbdefb);
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    /* Khung chính */
    .container {
        width: 900px;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
        border-left: 8px solid #42a5f5;
        transition: 0.3s ease-in-out;
    }

    .container:hover {
        transform: translateY(-5px);
    }

    /* Tiêu đề */
    h2 {
        text-align: center;
        color: #1a237e;
        font-size: 26px;
        text-transform: uppercase;
        margin-bottom: 20px;
        padding-bottom: 8px;
        border-bottom: 3px solid #42a5f5;
    }

    /* Danh sách đề thi */
    .exam-list {
        list-style: none;
        padding: 0;
    }

    .exam-item {
        background: rgba(100, 181, 246, 0.15);
        margin: 12px 0;
        padding: 18px;
        border-radius: 10px;
        transition: 0.3s;
        border-left: 6px solid #42a5f5;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .exam-item:hover {
        background: rgba(100, 181, 246, 0.3);
        transform: scale(1.03);
        box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.15);
    }

    /* Tiêu đề đề thi */
    .exam-title {
        font-size: 20px;
        font-weight: bold;
        color: #0d47a1;
        margin-bottom: 6px;
    }

    /* Mô tả đề thi */
    .exam-description {
        font-size: 16px;
        color: #444;
        line-height: 1.5;
    }

    /* Nút bắt đầu làm bài */
    .start-btn {
        display: inline-block;
        margin-top: 12px;
        padding: 10px 18px;
        background: #1e88e5;
        color: white;
        font-size: 16px;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        transition: 0.3s;
    }

    .start-btn:hover {
        background: #1565c0;
        transform: scale(1.05);
    }
</style>
<script>
    function checkLogin(isLoggedIn) {
        console.log("Trạng thái đăng nhập: ", isLoggedIn); // Debug
        if (isLoggedIn === "true") {
            window.location.href = 'LamBai.jsp';
        } else {
            alert("Bạn cần đăng nhập để làm bài thi!");
            window.location.href = 'http://localhost:8080/QLDeThi_NTDH_project3_2210900027/Home/log-log.jsp';
        }
    }
</script>
</head>
<body>
    <div class="container">
        <h2>📝 Danh sách Đề thi Lịch sử Nổi bật</h2>
       <div>
           <a href="<%= request.getContextPath() %>/Home/Index.jsp" 
              style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
              🏠 Quay lại trang chủ
           </a>
       </div>

        <ul class="exam-list">
            <li class="exam-item">
                <div class="exam-title">Đề thi Lịch sử lớp 12 - Kỳ thi THPT Quốc gia</div>
                <div class="exam-description">Bộ đề tổng hợp các câu hỏi quan trọng trong chương trình lịch sử lớp 12.</div>
                <a href="#" class="start-btn" onclick="checkLogin('<%= isLoggedIn ? "true" : "false" %>')">Bắt đầu làm bài</a>
            </li>
            <li class="exam-item">
                <div class="exam-title">Đề kiểm tra 1 tiết - Lịch sử lớp 10</div>
                <div class="exam-description">Bài kiểm tra bao gồm các sự kiện lịch sử tiêu biểu từ cổ đại đến cận đại.</div>
                <a href="#" class="start-btn" onclick="checkLogin('<%= isLoggedIn ? "true" : "false" %>')">Bắt đầu làm bài</a>
            </li>
            <li class="exam-item">
                <div class="exam-title">Đề ôn tập lịch sử Việt Nam</div>
                <div class="exam-description">Những sự kiện quan trọng trong lịch sử Việt Nam từ thời dựng nước đến hiện đại.</div>
                <a href="#" class="start-btn" onclick="checkLogin('<%= isLoggedIn ? "true" : "false" %>')">Bắt đầu làm bài</a>
            </li>
             <li class="exam-item">
                <div class="exam-title">Đề kiểm tra 1 tiếtx - Lịch sử lớp 10</div>
                <div class="exam-description">Bài kiểm tra bao gồm các sự kiện xlịch sử tiêu biểu từ cổ đại đến cận đại.</div>
                <a href="#" class="start-btn" onclick="checkLogin('<%= isLoggedIn ? "true" : "false" %>')">Bắt đầu làm bài</a>
            </li>
            <li class="exam-item">
                <div class="exam-title">Đề ôn tập lịch sửx Việt Nam</div>
                <div class="exam-description">Những sự kiện quan trọng trong lịch xsử Việt Nam từ thời dựng nước đến hiện đại.</div>
                <a href="#" class="start-btn" onclick="checkLogin('<%= isLoggedIn ? "true" : "false" %>')">Bắt đầu làm bài</a>
            </li>
            <li class="exam-item">
                <div class="exam-title">Đề thi Lịch sử lớp 12 - Kỳ thi THPT Quốc gia</div>
                <div class="exam-description">Bộ đề tổng hợp các câu hỏi quan trọng trong chương trình lịch sử lớp 12.</div>
                <a href="#" class="start-btn" onclick="checkLogin('<%= isLoggedIn ? "true" : "false" %>')">Bắt đầu làm bài</a>
            </li>
        </ul>
    </div>
</body>
</html>
