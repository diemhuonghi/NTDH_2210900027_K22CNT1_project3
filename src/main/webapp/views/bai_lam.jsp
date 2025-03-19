<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.BaiLam" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Bài Làm</title>
    <style>
        body {
            background: linear-gradient(to right, #EAF2F8, #D6EAF8);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
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
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        table th {
            background: linear-gradient(to right, #5DADE2, #3498db);
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f8fd;
        }
        tr:hover {
            background-color: #d0e4f5;
        }
        form {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background: linear-gradient(to bottom, #ffffff, #e3f2fd);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        form input[type="number"],
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        form input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }
        form input[type="submit"]:hover {
            background-color: #218838;
        }
        /* Nút chỉnh sửa (màu cam) */
        .btn-edit {
            background-color: #E7A33E;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            display: inline-block;
            transition: 0.3s;
        }
        .btn-edit:hover {
            background-color: #D48C2A;
        }
        /* Nút xóa (màu đỏ đậm) */
        .btn-delete {
            background-color: #D9534F;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            display: inline-block;
            transition: 0.3s;
        }
        .btn-delete:hover {
            background-color: #C9302C;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Bài Làm</h2>
         <div >
    <a href="<%= request.getContextPath() %>/Home/dashboard.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
       🏠 Quay lại
    </a>
</div>
        <table>
            <tr>
                <th>ID</th>
                <th>Học Sinh ID</th>
                <th>Đề Thi ID</th>
                <th>Điểm</th>
                <th>Thời Gian Nộp</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<BaiLam> dsBL = (List<BaiLam>) request.getAttribute("danhSachBaiLam");
                if(dsBL != null) {
                    for(BaiLam bl : dsBL) {
            %>
            <tr>
                <td><%= bl.getId() %></td>
                <td><%= bl.getHocSinhID() %></td>
                <td><%= bl.getDeThiID() %></td>
                <td><%= bl.getDiem() %></td>
                <td><%= bl.getThoiGianNop() %></td>
                <td>
                    <a href="bailam?action=edit&id=<%= bl.getId() %>" class="btn-edit">Chỉnh sửa</a>
                    <a href="bailam?action=delete&id=<%= bl.getId() %>" 
                       onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                       class="btn-delete">Xóa</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <h3>Thêm Bài Làm</h3>
        <form action="bailam" method="post">
            Học Sinh ID: <input type="number" name="hocSinhID" required/><br/>
            Đề Thi ID: <input type="number" name="deThiID" required/><br/>
            Điểm: <input type="number" step="0.1" name="diem" required/><br/>
            <input type="submit" value="Thêm"/>
        </form>
    </div>
</body>
</html>
