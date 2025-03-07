<%@ page import="java.util.List" %>
<%@ page import="model.BaiLam" %>
<%@ page import="dao.BaiLamDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Quản lý Bài Làm</title>
</head>
<body>
    <h1>Danh sách Bài Làm</h1>
    
    <table border="1">
        <tr><th>ID</th><th>Mã HS</th><th>Mã Đề</th><th>Thời Gian Nộp</th><th>Điểm</th><th>Hành động</th></tr>
        <%
            List<BaiLam> list = (List<BaiLam>) request.getAttribute("listBaiLam");
            for (BaiLam bl : list) {
        %>
        <tr>
            <td><%= bl.getMaBaiLam() %></td>
            <td><%= bl.getMaHS() %></td>
            <td><%= bl.getMaDe() %></td>
            <td><%= bl.getThoiGianNop() %></td>
            <td><%= bl.getDiem() %></td>
            <td><a href="bailam?action=delete&maBaiLam=<%= bl.getMaBaiLam() %>">Xóa</a></td>
        </tr>
        <% } %>
    </table>

    <h2>Thêm Bài Làm</h2>
    <form action="bailam" method="post">
        <input type="hidden" name="action" value="add">
        <label>Mã Học Sinh:</label>
        <input type="number" name="maHS" required><br>
        <label>Mã Đề:</label>
        <input type="number" name="maDe" required><br>
        <label>Thời Gian Nộp:</label>
        <input type="datetime-local" name="thoiGianNop" required><br>
        <label>Điểm:</label>
        <input type="number" step="0.1" name="diem" required><br>
        <button type="submit">Thêm</button>
    </form>
</body>
</html>
