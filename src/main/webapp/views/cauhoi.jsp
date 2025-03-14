<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CauHoi" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Câu Hỏi</title>
    <style>
        /* Nền trang xanh nhạt giống ảnh */
        body {
            background-color: #e9f2fa; 
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Khung container trắng, bo góc, bóng đổ */
        .container {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        }
        table th {
            background-color: #5da2d5; /* Xanh đậm cho tiêu đề */
            color: white;
            padding: 10px;
        }
        table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }
        /* Hàng chẵn màu xanh rất nhạt */
        tr:nth-child(even) {
            background-color: #f2f8fd;
        }
        /* Hover row (tùy chọn) */
        tr:hover {
            background-color: #d0e4f5;
        }

        /* Nút xanh lá #28a745 */
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
        }
        .btn-green:hover {
            background-color: #218838;
        }

        /* Form ẩn ban đầu, bo góc, bóng đổ */
        .hidden-form {
            display: none;
            padding: 20px;
            border-radius: 10px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        /* Ô nhập liệu */
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        /* Nút submit */
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
    </style>
    <script>
        /* Ẩn/hiện form thêm câu hỏi */
        function toggleForm() {
            var form = document.getElementById("formCauHoi");
            form.style.display = (form.style.display === "none") ? "block" : "none";
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Danh sách Câu Hỏi</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nội Dung</th>
                <th>Độ Khó</th>
                <th>Đề Thi ID</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<CauHoi> dsCH = (List<CauHoi>) request.getAttribute("danhSachCauHoi");
                if(dsCH != null) {
                    for(CauHoi ch : dsCH) {
            %>
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
            <%
                    }
                }
            %>
        </table>

        <!-- Nút bấm hiển thị form thêm -->
        <button class="btn-green" onclick="toggleForm()">Thêm Câu Hỏi</button>

        <!-- Form thêm (mặc định ẩn) -->
        <div id="formCauHoi" class="hidden-form">
            <h3>Thêm Câu Hỏi</h3>
            <form action="cauhoi" method="post">
                Nội Dung: <textarea name="noiDung" rows="3" required></textarea><br/>
                Độ Khó (1-10): <input type="number" name="doKho" min="1" max="10" required/><br/>
                Đề Thi ID: <input type="number" name="deThiID" required/><br/>
                <input type="submit" value="Thêm"/>
            </form>
        </div>
    </div>
</body>
</html>
