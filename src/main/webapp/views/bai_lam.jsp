<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.BaiLam" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Bài Làm</title>
    <style>
        /* Nền trang gradient xanh nhạt */
        body {
            background: linear-gradient(to right, #EAF2F8, #D6EAF8);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        /* Container chứa nội dung */
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        /* Tiêu đề */
        h2, h3 {
            text-align: center;
            color: #333;
        }
        /* Bảng danh sách */
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
        /* Header bảng có gradient xanh đậm dần */
        table th {
            background: linear-gradient(to right, #5DADE2, #3498db);
            color: white;
        }
        /* Hàng chẵn màu xanh rất nhạt */
        tr:nth-child(even) {
            background-color: #f2f8fd;
        }
        /* Hover row */
        tr:hover {
            background-color: #d0e4f5;
        }
        /* Form thêm bài làm */
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Bài Làm</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Học Sinh ID</th>
                <th>Đề Thi ID</th>
                <th>Điểm</th>
                <th>Thời Gian Nộp</th>
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
                           <a href="bailam?action=edit&id=<%= bl.getId() %>" class="btn btn-edit">Chỉnh sửa</a>
                           <a href="bailam?action=delete&id=<%= bl.getId() %>" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                                   class="btn btn-delete">Xóa</a>
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
