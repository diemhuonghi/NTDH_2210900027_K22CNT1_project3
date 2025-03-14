<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.DeThi" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý Đề Thi</title>
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
        .form-container {
            margin-top: 20px;
            padding: 20px;
            background: linear-gradient(to bottom, #ffffff, #e3f2fd);
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            display: none; /* Ẩn form khi load trang */
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
    <div class="header">Thi Trắc Nghiệm - Đề Thi</div>
    <div class="container">
        <h2>Danh sách Đề Thi</h2>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Tiêu Đề</th>
                <th>Mô Tả</th>
                <th>Thời Gian Thi (phút)</th>
                <th>Ngày Tạo</th>
                <th>Giáo Viên ID</th>
                <th>Môn Học ID</th>
                 <th>Hành Động</th>
            </tr>
            <% List<DeThi> dsDT = (List<DeThi>) request.getAttribute("danhSachDeThi");
               if(dsDT != null) {
                   for(DeThi dt : dsDT) { %>
            <tr>
                <td><%= dt.getId() %></td>
                <td><%= dt.getTieuDe() %></td>
                <td><%= dt.getMoTa() %></td>
                <td><%= dt.getThoiGianThi() %></td>
                <td><%= dt.getNgayTao() %></td>
                <td><%= dt.getGiaoVienID() %></td>
                <td><%= dt.getMonHocID() %></td>
                 <td>
                           <a href="dethi?action=edit&id=<%= dt.getId() %>" class="btn btn-edit">Chỉnh sửa</a>
                           <a href="dethi?action=delete&id=<%= dt.getId() %>" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa?');" 
                                   class="btn btn-delete">Xóa</a>
                            </td>
            </tr>
            <% } } %>
        </table>
        
        <button class="toggle-btn" onclick="toggleForm()">Thêm Đề Thi</button>

        <div id="form-container" class="form-container">
            <h2>Thêm Đề Thi</h2>
            <form action="dethi" method="post">
                <label>Tiêu Đề:</label>
                <input type="text" name="tieuDe" required/>
                <label>Mô Tả:</label>
                <textarea name="moTa" rows="3" required></textarea>
                <label>Thời Gian Thi (phút):</label>
                <input type="number" name="thoiGianThi" required/>
                <label>Giáo Viên ID:</label>
                <input type="number" name="giaoVienID" required/>
                <label>Môn Học ID:</label>
                <input type="number" name="monHocID" required/>
                <button type="submit">Thêm</button>
            </form>
        </div>
    </div>
</body>
</html>
