<%@ page import="java.util.List" %>
<%@ page import="model.BaiLamChiTiet" %>
<%@ page import="dao.BaiLamChiTietDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Quản lý Bài Làm Chi Tiết</title>
</head>
<body>
    <h1>Danh sách Bài Làm Chi Tiết</h1>
    
    <table border="1">
        <tr><th>ID</th><th>Mã Bài Làm</th><th>Mã Câu Hỏi</th><th>Mã Đáp Án</th><th>Đúng/Sai</th><th>Hành động</th></tr>
        <%
            List<BaiLamChiTiet> list = (List<BaiLamChiTiet>) request.getAttribute("listBaiLamChiTiet");
            for (BaiLamChiTiet blct : list) {
        %>
        <tr>
            <td><%= blct.getMaChiTiet() %></td>
            <td><%= blct.getMaBaiLam() %></td>
            <td><%= blct.getMaCauHoi() %></td>
            <td><%= blct.getMaDapAn() %></td>
            <td><%= blct.isCorrect() ? "Đúng" : "Sai" %></td>
            <td><a href="bailamchitiet?action=delete&maChiTiet=<%= blct.getMaChiTiet() %>">Xóa</a></td>
        </tr>
        <% } %>
    </table>

    <h2>Thêm Bài Làm Chi Tiết</h2>
    <form action="bailamchitiet" method="post">
        <input type="hidden" name="action" value="add">
        <label>Mã Bài Làm:</label>
        <input type="number" name="maBaiLam" required><br>
        <label>Mã Câu Hỏi:</label>
        <input type="number" name="maCauHoi" required><br>
        <label>Mã Đáp Án:</label>
        <input type="number" name="maDapAn" required><br>
        <label>Đúng/Sai:</label>
        <input type="checkbox" name="isCorrect"><br>
        <button type="submit">Thêm</button>
    </form>
</body>
</html>
