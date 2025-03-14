<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Đăng Ký Học Sinh</title>
    <style>
    /* Định nghĩa font chữ mùa hè */
@import url('https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;600&display=swap');

body {
    background: linear-gradient(to bottom, #6dd5fa, #ffffff);
    background-attachment: fixed;
    font-family: 'Poppins', sans-serif;
    color: #2c3e50;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-image: url('https://www.transparenttextures.com/patterns/green-dust-and-scratches.png');
}

/* Container chính */
.container {
    background: rgba(255, 255, 255, 0.9);
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    text-align: center;
    max-width: 400px;
    position: relative;
    overflow: hidden;
}

/* Hiệu ứng lá rơi */
.container::before {
    content: "";
    position: absolute;
    top: -50px;
    left: -50px;
    width: 100px;
    height: 100px;
    background-image: url('https://cdn-icons-png.flaticon.com/512/414/414927.png');
    background-size: cover;
    opacity: 0.5;
    animation: leaf-fall 5s infinite linear;
}

@keyframes leaf-fall {
    0% { transform: translateY(0) rotate(0deg); }
    100% { transform: translateY(200px) rotate(360deg); }
}

/* Tiêu đề */
h2 {
    font-family: 'Pacifico', cursive;
    color: #ff8c00;
    margin-bottom: 20px;
}

/* Input và nút */
input, button {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 5px;
    border: none;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    font-size: 16px;
}

input {
    background: rgba(255, 255, 255, 0.8);
}

button {
    background: linear-gradient(to right, #ff7e5f, #feb47b);
    color: white;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    transform: scale(1.05);
    background: linear-gradient(to right, #ff512f, #dd2476);
}

/* Link đăng nhập */
p a {
    color: #ff8c00;
    text-decoration: none;
    font-weight: bold;
}

p a:hover {
    text-decoration: underline;
}
    </style>
</head>
<body>
    <div class="container">
        <h2>Đăng Ký Tài Khoản Học Sinh</h2>
        <form action="<%= request.getContextPath() %>/hocsinh" method="post">
            <input type="hidden" name="action" value="register">
            <input type="text" name="hoTen" placeholder="Họ và Tên" required>
            <input type="text" name="taiKhoan" placeholder="Tài Khoản" required>
            <input type="password" name="matKhau" placeholder="Mật Khẩu" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="lopHoc" placeholder="Lớp Học" required>
            <button type="submit">Đăng Ký</button>
        </form>
        <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/Home/login-user.jsp">Đăng nhập</a></p>
    </div>
</body>
</html>
