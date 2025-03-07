<%@ page import="java.util.List, model.GiaoVien" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách Giáo Viên</title>
</head>
<body>
    <h1>Danh sách Giáo Viên</h1>
    <table border="1">
        <tr><th>ID</th><th>Họ Tên</th><th>Email</th><th>Trạng Thái</th><th>Hành động</th></tr>
        <%
            List<GiaoVien> list = (List<GiaoVien>) request.getAttribute("listGiaoVien");
            for (GiaoVien gv : list) {
        %>
        <tr>
            <td><%= gv.getId() %></td>
            <td><%= gv.getHoTen() %></td>
            <td><%= gv.getEmail() %></td>
            <td><%= gv.isTrangThai() ? "Hoạt động" : "Khóa" %></td>
            <td><a href="giaovien?action=delete&id=<%= gv.getId() %>">Xóa</a></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
