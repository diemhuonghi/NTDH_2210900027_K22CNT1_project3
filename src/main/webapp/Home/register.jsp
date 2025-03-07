<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- register.jsp -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background: #f4f4f4; }
        .container { max-width: 400px; margin: 100px auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        input, button { width: 100%; padding: 10px; margin: 10px 0; }
        button { background: #28a745; color: white; border: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Đăng Ký</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <input type="email" name="email" placeholder="Email" required>
            <button type="submit">Đăng Ký</button>
        </form>
    </div>
</body>
</html>

</html>