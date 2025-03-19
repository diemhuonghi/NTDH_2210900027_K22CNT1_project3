<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.DapAn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Đáp Án</title>
    <style>
        body {
            background-color: #e9f2fa; 
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2, h3 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
        }
        table th {
            background-color: #5da2d5;
            color: white;
            padding: 10px;
        }
        table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f8fd;
        }
        tr:hover {
            background-color: #d0e4f5;
        }
        .btn-green {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
            text-align: center;
        }
        .btn-green:hover {
            background-color: #218838;
        }
        .hidden-form {
            display: none;
            padding: 20px;
            border-radius: 10px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .btn-edit {
            display: inline-block;
            padding: 8px 12px;
            background-color: #e6a23c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
            text-decoration: none;
        }
        .btn-edit:hover {
            background-color: #cf8a2e;
        }
        .btn-delete {
            display: inline-block;
            padding: 8px 12px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
            text-decoration: none;
        }
        .btn-delete:hover {
            background-color: #c9302c;
        }
    </style>
    <script>
        function toggleForm() {
            var form = document.getElementById("formDapAn");
            form.style.display = (form.style.display === "none") ? "block" : "none";
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Danh sách Đáp Án</h2>
         <div >
    <a href="<%= request.getContextPath() %>/Home/dashboard.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
       🏠 Quay lại
    </a>
</div>
        <table>
            <tr>
                <th>ID</th>
                <th>Câu Hỏi ID</th>
                <th>Nội Dung</th>
                <th>Đáp Án Đúng</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<DapAn> dsDA = (List<DapAn>) request.getAttribute("danhSachDapAn");
                if(dsDA != null) {
                    for(DapAn da : dsDA) {
            %>
            <tr>
                <td><%= da.getId() %></td>
                <td><%= da.getCauHoiID() %></td>
                <td><%= da.getNoiDung() %></td>
                <td><%= da.isDapAnDung() ? "Đúng" : "Sai" %></td>
                <td>
                    <a href="dapan?action=edit&id=<%= da.getId() %>" class="btn-edit">Chỉnh sửa</a>
                    <a href="dapan?action=delete&id=<%= da.getId() %>" 
                        onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                        class="btn-delete">Xóa</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <button class="btn-green" onclick="toggleForm()">Thêm Đáp Án</button>
        <div id="formDapAn" class="hidden-form">
            <h3>Thêm Đáp Án</h3>
            <form action="dapan" method="post">
                Câu Hỏi ID: <input type="number" name="cauHoiID" required/><br/>
                Nội Dung: <textarea name="noiDung" rows="2"></textarea><br/><br/>
                Đáp Án Đúng: <input type="checkbox" name="dapAnDung"/><br/><br/>
                <input type="submit" value="Thêm"/>
            </form>
        </div>
    </div>
</body>
</html>