<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.HocSinh" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%
    HocSinh hocSinh = (HocSinh) request.getAttribute("hocSinh");
    if (hocSinh == null) { 
        response.sendRedirect("hocsinh");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa học sinh</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #e3f2fd, #bbdefb);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 350px;
           
        }

        h2 {
            margin-bottom: 15px;
            color: #1976D2;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="checkbox"] {
            width: auto;
            margin-left: 10px;
        }

        button {
            background: #1976D2;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
        }

        button:hover {
            background: #1565C0;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #1976D2;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Chỉnh sửa học sinh</h2>

        <form action="<%= request.getContextPath() %>/hocsinh" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= hocSinh.getId() %>">

            <label for="hoTen">Họ và tên:</label>
            <input type="text" id="hoTen" name="hoTen" value="<%= hocSinh.getHoTen() %>" required>

            <label for="taiKhoan">Tài khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" value="<%= hocSinh.getTaiKhoan() %>" required>

            <label for="matKhau">Mật khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" value="<%= hocSinh.getMatKhau() %>" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= hocSinh.getEmail() %>" required>

            <label for="lopHoc">Lớp học:</label>
            <input type="text" id="lopHoc" name="lopHoc" value="<%= hocSinh.getLopHoc() %>" required>

            <label for="trangThai">Trạng thái:</label>
            <input type="checkbox" id="trangThai" name="trangThai" <%= hocSinh.isTrangThai() ? "checked" : "" %>>

            <button type="submit">Cập nhật</button>
            <a href="hocsinh">Quay lại</a>
        </form>
    </div>
</body>
</html>
