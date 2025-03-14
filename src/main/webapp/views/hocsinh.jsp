<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.HocSinh" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Học Sinh</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #E3F2FD, #F8F9FA);
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        h2, h3 {
            text-align: center;
            color: #003366;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 8px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #5daeff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f1f7ff;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-edit {
            background-color: #ffc107;
            color: white;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .btn:hover {
            opacity: 0.8;
        }
        form {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        input, select {
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
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Học Sinh</h2>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>

        <table>
            <tr>
                <th>ID</th>
                <th>Họ Tên</th>
                <th>Tài Khoản</th>
                <th>Email</th>
                <th>Lớp</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
            <% 
                List<HocSinh> dsHS = (List<HocSinh>) request.getAttribute("danhSachHocSinh");
                if (dsHS != null && !dsHS.isEmpty()) {
                    for (HocSinh hs : dsHS) { %>
                        <tr>
                            <td><%= hs.getId() %></td>
                            <td><%= hs.getHoTen() %></td>
                            <td><%= hs.getTaiKhoan() %></td>
                            <td><%= hs.getEmail() %></td>
                            <td><%= hs.getLopHoc() %></td>
                            <td><%= hs.isTrangThai() ? "Hoạt động" : "Khoá" %></td>
                            <td>
                                <a href="hocsinh?action=edit&id=<%= hs.getId() %>" class="btn btn-edit">Chỉnh sửa</a>
                                <a href="hocsinh?action=delete&id=<%= hs.getId() %>" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                                   class="btn btn-delete">Xóa</a>
                            </td>
                        </tr>
            <%      } 
                } else { %>
                    <tr><td colspan="7">Không có học sinh nào!</td></tr>
            <% } %>
        </table>
	
        <h3>Thêm Học Sinh</h3>
        <form action="hocsinh" method="post">
            <input type="hidden" name="action" value="add">
            Họ Tên: <input type="text" name="hoTen" required>
            Tài Khoản: <input type="text" name="taiKhoan" required>
            Mật Khẩu: <input type="password" name="matKhau" required>
            Email: <input type="email" name="email" required>
            Lớp: <input type="text" name="lopHoc">
            Trạng Thái: <input type="checkbox" name="trangThai" checked>
            <input type="submit" value="Thêm Học Sinh">
        </form>
        
    </div>
</body>
</html>
