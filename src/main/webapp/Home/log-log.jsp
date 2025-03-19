<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Chọn Đăng Nhập</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(to bottom, #e0f7fa, #b2ebf2); /* Màu nền nhẹ nhàng */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    /* Khung chọn đăng nhập */
    .login-selection {
        background: white;
        border-radius: 10px;
        padding: 40px;
        text-align: center;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        width: 400px;
    }

    /* Tiêu đề */
    .login-selection h2 {
        font-size: 24px;
        margin-bottom: 20px;
        color: #222;
    }

    /* Nút đăng nhập */
    .btn {
        display: block;
        width: 100%;
        margin: 10px 0;
        padding: 12px;
        border-radius: 8px;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        text-decoration: none;
        color: white;
        background: #4dd0e1; /* Xanh nhạt */
        border: none;
        cursor: pointer;
        transition: 0.3s;
    }

    /* Hiệu ứng hover */
    .btn:hover {
        background: #26c6da;
    }
    </style>
</head>
<body>
    <div class="login-selection">
        <h2>Chọn Đăng Nhập</h2>
        <a href="login-user.jsp" class="btn">Đăng nhập Học Sinh</a>
        <a href="login.jsp" class="btn">Đăng nhập Giáo Viên</a>
        <a href="register.jsp" class="btn">Đăng ký Học Sinh</a>
       <div >
    <a href="<%= request.getContextPath() %>/Home/Index.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
        🏠 Quay lại 
    </a>
</div>
    </div>
    
</body>
</html>
