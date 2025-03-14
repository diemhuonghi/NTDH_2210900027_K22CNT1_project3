<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Chọn Đăng Nhập - Mùa Xuân</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

body {
    font-family: 'Pacifico', cursive;
    background: linear-gradient(to bottom, #ff0000, #ff9900); /* Màu đỏ cam rực rỡ */
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    overflow: hidden;
    position: relative;
}

/* 🔥 Hiệu ứng pháo hoa 🔥 */
.fireworks {
    position: fixed;
    width: 100%;
    height: 100%;
    background: url('https://media.giphy.com/media/3oriO0OEd9QIDdllqo/giphy.gif') no-repeat center;
    background-size: cover;
    z-index: -1;
    opacity: 0.6;
}

/* 🌸 Hoa đào, hoa mai rơi 🌸 */
.flowers {
    position: fixed;
    width: 100%;
    height: 100%;
    background: url('https://media.giphy.com/media/l0HlP1V5zNqF79D0g/giphy.gif') no-repeat center;
    background-size: cover;
    z-index: -1;
    opacity: 0.3;
}

/* Khung chọn đăng nhập */
.login-selection {
    background: rgba(255, 223, 0, 0.8); /* Màu vàng lấp lánh */
    backdrop-filter: blur(10px);
    border-radius: 20px;
    padding: 40px 60px;
    text-align: center;
    box-shadow: 0 0 30px rgba(255, 223, 0, 0.6);
    animation: fadeIn 1.5s ease-in-out;
}

/* Tiêu đề */
.login-selection h2 {
    font-size: 28px;
    margin-bottom: 20px;
    color: #ff0000;
    text-shadow: 0 0 10px yellow;
}

/* 🎇 Nút đăng nhập 🎇 */
.btn {
    display: block;
    width: 100%;
    margin: 15px 0;
    padding: 15px;
    border-radius: 8px;
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    text-decoration: none;
    color: #fff;
    background: linear-gradient(135deg, #ffcc00, #ff6600);
    border: 2px solid #fff000;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    position: relative;
    box-shadow: 0 0 10px rgba(255, 204, 0, 0.8);
}

/* Hiệu ứng nhấp nháy khi hover */
.btn:hover {
    background: linear-gradient(135deg, #ff6600, #ffcc00);
    transform: scale(1.05);
    box-shadow: 0 0 20px yellow;
}
    </style>
</head>
<body>
    <div class="fireworks"></div> <!-- Hiệu ứng pháo hoa -->
    <div class="flowers"></div>   <!-- Hoa đào, hoa mai bay bay -->

    <div class="login-selection">
        <h2>Chào Xuân Mới! Chọn Đăng Nhập</h2>
        <a href="login-user.jsp" class="btn">🎆 Đăng nhập Học Sinh 🎆</a>
        <a href="login.jsp" class="btn">🎇 Đăng nhập Giáo Viên 🎇</a>
        <a href="register.jsp" class="btn">🎇 Đăng kí Học Sinh🎇</a>
        
    </div>

    <script src="${pageContext.request.contextPath}/js/effects.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        let fireworks = document.querySelector(".fireworks");
        setInterval(() => {
            fireworks.style.opacity = Math.random() * (0.8 - 0.5) + 0.5;
        }, 1000);
    });

    </script> <!-- File hiệu ứng pháo hoa -->
</body>
</html>
