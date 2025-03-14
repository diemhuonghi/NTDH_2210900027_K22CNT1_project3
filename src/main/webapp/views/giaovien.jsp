<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.GiaoVien" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Quản lý Giáo Viên</title>
    <style>
/* Reset CSS */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* Body */
body {
    background-color: #f0f8ff;
    padding: 20px;
}

/* Header */
.header {
    background-color: #0077cc;
    color: white;
    text-align: center;
    padding: 20px;
    font-size: 24px;
    font-weight: bold;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
}

/* Container */
.container {
    width: 90%;
    max-width: 900px;
    margin: 20px auto;
    background: white;
    padding: 20px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #0077cc;
    color: white;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #d4e9f9;
}

/* Form */
form {
    margin-top: 20px;
    padding: 20px;
    background: #f8f8f8;
    border-radius: 8px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

input[type="text"], 
input[type="email"], 
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="checkbox"] {
    margin-top: 10px;
}

input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 12px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.3s;
}

input[type="submit"]:hover {
    background-color: #218838;
}

/* Buttons */
.btn-edit, .btn-delete {
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 5px;
    font-size: 14px;
    display: inline-block;
    transition: 0.3s;
}

.btn-edit {
    background-color: #ffc107;
    color: black;
}

.btn-edit:hover {
    background-color: #e0a800;
}

.btn-delete {
    background-color: #dc3545;
    color: white;
}

.btn-delete:hover {
    background-color: #c82333;
}

/* Footer */
.footer {
    text-align: center;
    padding: 15px;
    background-color: #0077cc;
    color: white;
    border-radius: 10px;
    margin-top: 20px;
}

    </style>
</head>
<body>
    <header class="header">
        <h1>Thi Trắc Nghiệm - Giáo Viên</h1>
        <p>Hệ thống quản lý Đề Thi Trắc Nghiệm</p>
    </header>

    <div class="container">
        <h2>Danh sách Giáo Viên</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Họ Tên</th>
                <th>Tài Khoản</th>
                <th>Email</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<GiaoVien> dsGV = (List<GiaoVien>) request.getAttribute("danhSachGiaoVien");
                if (dsGV != null) {
                    for (GiaoVien gv : dsGV) {
            %>
            <tr>
                <td><%= gv.getId() %></td>
                <td><%= gv.getHoTen() %></td>
                <td><%= gv.getTaiKhoan() %></td>
                <td><%= gv.getEmail() %></td>
                <td><%= gv.isTrangThai() ? "Hoạt động" : "Khoá" %></td>
                <td>
                   <a href="giaovien?action=edit&id=<%= gv.getId() %>" class="btn btn-edit">Chỉnh sửa</a>
                   <a href="giaovien?action=delete&id=<%= gv.getId() %>" 
                           onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                           class="btn btn-delete">Xóa</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <h3>Thêm Giáo Viên</h3>
        <form action="giaovien" method="post">
            Họ Tên: <input type="text" name="hoTen" required/><br/>
            Tài Khoản: <input type="text" name="taiKhoan" required/><br/>
            Mật Khẩu: <input type="password" name="matKhau" required/><br/>
            Email: <input type="email" name="email" required/><br/>
            Trạng Thái: <input type="checkbox" name="trangThai" checked/><br/>
            <input type="submit" value="Thêm"/>
        </form>
    </div>

    <footer class="footer">
        <p>&copy; 2023 - Thi Trắc Nghiệm. All rights reserved.</p>
    </footer>
</body>
</html>
