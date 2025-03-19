<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.MonHoc" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Môn Học</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #E3F2FD, #F8F9FA);
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: auto;
        }
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            border-radius: 5px;
        }
        .table-container {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .btn-action {
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-edit {
            background-color: #ffc107;
            color: black;
        }
        .btn-edit:hover {
            background-color: #e0a800;
            color: white;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-add {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        .btn-add:hover {
            background-color: #218838;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            display: none;
        }
        .form-container h3 {
            text-align: center;
        }
        .form-container label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        .form-container input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            margin-top: 15px;
            border-radius: 5px;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
        .btn-link {
    color: #007bff; /* Màu xanh mặc định */
    text-decoration: none; /* Xóa gạch chân */
    font-size: 16px;
    font-weight: bold;
}

.btn-link:hover {
    color: #ff5722; /* Màu cam khi hover */
    text-decoration: none; /* Vẫn giữ không gạch chân */
}
        
		  
    </style>
    <script>
        function toggleForm() {
            var form = document.getElementById("formContainer");
            form.style.display = (form.style.display === "none" || form.style.display === "") ? "block" : "none";
        }
    </script>
</head>
<body>

<div class="container">
    <div class="header">Hệ Thống Quản Lý Môn Học - Thi Trắc Nghiệm</div>

    <div class="table-container">
        <h2 class="text-center">Danh sách Môn Học</h2>
         <div >
    <a href="<%= request.getContextPath() %>/Home/dashboard.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
       🏠 Quay lại 
    </a>
</div>
        <table class="table table-bordered text-center">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Tên Môn</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <% List<MonHoc> dsMH = (List<MonHoc>) request.getAttribute("danhSachMonHoc");
                   if (dsMH != null) {
                       for (MonHoc mh : dsMH) { %>
                <tr>
                    <td><%= mh.getId() %></td>
                    <td><%= mh.getTenMon() %></td>
                    <td>
                        <a href="monhoc?action=edit&id=<%= mh.getId() %>" class="btn btn-action btn-edit">Chỉnh sửa</a>
                        <a href="monhoc?action=delete&id=<%= mh.getId() %>" 
                           onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                           class="btn btn-action btn-delete">Xóa</a>
                    </td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-3">
        <button class="btn-add" onclick="toggleForm()">+ Thêm Môn Học</button>
    </div>

    <div class="form-container" id="formContainer">
        <h3>Thêm Môn Học</h3>
        <form action="monhoc" method="post">
            <label for="tenMon">Tên Môn:</label>
            <input type="text" name="tenMon" id="tenMon" required/>
            <button type="submit">Thêm</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
