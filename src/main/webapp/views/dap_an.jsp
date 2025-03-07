<%@ page import="java.util.List" %>
<%@ page import="model.DapAn" %>
<%@ page import="dao.DapAnDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Quản lý Đáp Án</title>
</head>
<body>
    <h1>Danh sách Đáp Án</h1>
    
    <table border="1">
        <tr><th>ID</th><th>Mã Câu Hỏi</th><th>Nội Dung</th><th>Đúng/Sai</th><th>Hành động</th></tr>
        <%
            List<DapAn> list = (List<DapAn>) request.getAttribute("listDapAn");
            for (DapAn da : list) {
        %>
        <tr>
            <td><%= da.getMaDA() %></td>
            <td><%= da.getMaCH() %></td>
            <td><%= da.getNoiDung() %></td>
            <td><%= da.isLaDapAnDung() ? "Đúng" : "Sai" %></td>
            <td><a href="dapan?action=delete&maDA=<%= da.getMaDA() %>">Xóa</a></td>
        </tr>
        <% } %>
    </table>

    <h2>Thêm Đáp Án</h2>
    <form action="dapan" method="post">
        <input type="hidden" name="action" value="add">
        <label>Mã Câu Hỏi:</label>
        <input type="number" name="maCH" required><br>
        <label>Nội Dung:</label>
        <input type="text" name="noiDung" required><br>
        <label>Đáp Án Đúng:</label>
        <input type="checkbox" name="laDapAnDung" value="true"><br>
        <button type="submit">Thêm</button>
    </form>
</body>
</html>
