<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CauHoi" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Câu Hỏi</title>
    <style>
        body {
            background: linear-gradient(to bottom, #EAF2F8, #D6EAF8);
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #5DADE2;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            border-radius: 10px;
            margin: 20px auto;
            width: 80%;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background: linear-gradient(to bottom, #ffffff, #e3f2fd);
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .table th {
            background-color: #5DADE2;
            color: white;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            cursor: pointer;
            display: inline-block;
        }
        .btn-edit {
            background-color: #f0ad4e;
        }
        .btn-edit:hover {
            background-color: #ec971f;
        }
        .btn-delete {
            background-color: #d9534f;
        }
        .btn-delete:hover {
            background-color: #c9302c;
        }
        .form-container {
            margin-top: 20px;
            padding: 20px;
            background: linear-gradient(to bottom, #ffffff, #e3f2fd);
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            display: none;
        }
        .form-container input, .form-container textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            background-color: #5DADE2;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
        }
        .form-container button:hover {
            background-color: #3498db;
        }
        .toggle-btn {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            width: 200px;
            text-align: center;
            margin: 20px auto;
        }
        .toggle-btn:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function toggleForm() {
            var form = document.getElementById("form-container");
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="header">Quản lý Câu Hỏi</div>
    <div class="container">
        <h2>Danh sách Câu Hỏi</h2>
        <div >
    <a href="<%= request.getContextPath() %>/Home/dashboard.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
       🏠 Quay lại
    </a>
</div>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Nội Dung</th>
                <th>Độ Khó</th>
                <th>Đề Thi ID</th>
                <th>Hành Động</th>
            </tr>
            <% List<CauHoi> dsCH = (List<CauHoi>) request.getAttribute("danhSachCauHoi");
               if(dsCH != null) {
                   for(CauHoi ch : dsCH) { %>
            <tr>
                <td><%= ch.getId() %></td>
                <td><%= ch.getNoiDung() %></td>
                <td><%= ch.getDoKho() %></td>
                <td><%= ch.getDeThiID() %></td>
                <td>
                    <a href="cauhoi?action=edit&id=<%= ch.getId() %>" class="btn btn-edit">Chỉnh sửa</a>
                    <a href="cauhoi?action=delete&id=<%= ch.getId() %>" 
                       onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                       class="btn btn-delete">Xóa</a>
                </td>
            </tr>
            <% } } %>
        </table>
        
        <button class="toggle-btn" onclick="toggleForm()">Thêm Câu Hỏi</button>

        <div id="form-container" class="form-container">
            <h2>Thêm Câu Hỏi</h2>
            <form action="cauhoi" method="post">
                <label>Nội Dung:</label>
                <textarea name="noiDung" rows="3" required></textarea>
                <label>Độ Khó (1-10):</label>
                <input type="number" name="doKho" min="1" max="10" required/>
                <label>Đề Thi ID:</label>
                <input type="number" name="deThiID" required/>
                <button type="submit">Thêm</button>
            </form>
        </div>
    </div>
</body>
</html>
