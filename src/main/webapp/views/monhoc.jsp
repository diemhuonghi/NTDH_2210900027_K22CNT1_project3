<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.MonHoc" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Môn Học</title>
    <style>
        body {
            background: linear-gradient(to right, #E3F2FD, #F8F9FA);
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .container {
            width: 90%;
            margin: auto;
        }
        .header {
            background-color: #5DADE2;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            border-radius: 5px;
            width: 100%;
        }
        .table-container {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
            width: 100%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .table th {
            background-color: #5DADE2;
            color: white;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .toggle-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }
        .toggle-button:hover {
            background-color: #28a745;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
            width: 50%;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
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
        }
        .form-container button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            margin-top: 15px;
        }
        .form-container button:hover {
            background-color: #3498db;
        }
    </style>
    <script>
        function toggleForm() {
            var form = document.getElementById("formContainer");
            if (form.style.display === "none" || form.style.display === "") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>
</head>
<body>

<div class="container">
    <div class="header">Hệ Thống Quản Lý Môn Học - Thi Trắc Nghiệm</div>

    <div class="table-container">
        <h2>Danh sách Môn Học</h2>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Tên Môn</th>
                <th>Hành Động</th>
                
            </tr>
            <% List<MonHoc> dsMH = (List<MonHoc>) request.getAttribute("danhSachMonHoc");
               if (dsMH != null) {
                   for (MonHoc mh : dsMH) { %>
            <tr>
                <td><%= mh.getId() %></td>
                <td><%= mh.getTenMon() %></td>
                 <td>
                                <a href="monhoc?action=edit&id=<%= mh.getId() %>" class="btn btn-edit">Chỉnh sửa</a>
                                <a href="monhoc?action=delete&id=<%= mh.getId() %>" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                                   class="btn btn-delete">Xóa</a>
                            </td>
            </tr>
            <% } } %>
        </table>
    </div>

    <div class="button-container">
        <button class="toggle-button" onclick="toggleForm()">Thêm Môn Học</button>
    </div>

    <div class="form-container" id="formContainer">
        <h3>Thêm Môn Học</h3>
        <form action="monhoc" method="post">
            <label for="tenMon">Tên Môn:</label>
            <input type="text" name="tenMon" required/>
            <button type="submit">Thêm</button>
        </form>
    </div>
</div>

</body>
</html>
