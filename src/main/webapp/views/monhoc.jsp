<%@ page import="java.util.List" %>
<%@ page import="model.MonHoc" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách môn học</title>
</head>
<body>
    <h2>Danh sách môn học</h2>
    <a href="MonHoc?action=add">Thêm môn học</a>
    <table border="1">
        <tr>
            <th>Mã MH</th>
            <th>Tên MH</th>
            <th>Trạng Thái</th>
            <th>Hành động</th>
        </tr>
        <%
            List<MonHoc> list = (List<MonHoc>) request.getAttribute("ListMonHoc");
            if (list != null) {
                for (MonHoc mh : list) {
        %>
        <tr>
            <td><%= mh.getMaMH() %></td>
            <td><%= mh.getTenMH() %></td>
            <td><%= mh.isTrangThai() ? "Hoạt động" : "Không hoạt động" %></td>
            <td>
                <a href="MonHoc?action=edit&id=<%= mh.getMaMH() %>">Sửa</a> |
                <a href="MonHoc?action=delete&id=<%= mh.getMaMH() %>" onclick="return confirm('Xóa môn học này?')">Xóa</a>
            </td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr><td colspan="4">Không có dữ liệu</td></tr>
        <% } %>
    </table>
</body>
</html>
