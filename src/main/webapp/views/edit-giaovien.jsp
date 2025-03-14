<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.GiaoVien" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Giáo Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #E3F2FD, #F8F9FA);
            margin: 0;
            padding: 0;
        }
        .container {
            width: 40%;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        h2 {
            text-align: center;
            color: #003366;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #3c8ed9;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Chỉnh sửa Giáo Viên</h2>
        <% 
            GiaoVien gv = (GiaoVien) request.getAttribute("giaoVien");
            if (gv != null) {
        %>
        <form action="giaovien" method="post">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="id" value="<%= gv.getId() %>"/>
            
            Họ Tên: <input type="text" name="hoTen" value="<%= gv.getHoTen() %>" required/>
            Tài Khoản: <input type="text" name="taiKhoan" value="<%= gv.getTaiKhoan() %>" required readonly/>
            Mật Khẩu: <input type="password" name="matKhau" value="<%= gv.getMatKhau() %>" required/>
            Email: <input type="email" name="email" value="<%= gv.getEmail() %>" required/>
            Trạng Thái: <input type="checkbox" name="trangThai" <%= gv.isTrangThai() ? "checked" : "" %>/>
            
            <input type="submit" value="Cập nhật"/>
        </form>
        <a class="back-link" href="giaovien">Quay lại danh sách</a>
        <% } else { %>
        <p style="text-align: center; color: red;">Không tìm thấy giáo viên!</p>
        <% } %>
    </div>
</body>
</html>
