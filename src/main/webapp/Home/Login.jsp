<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 != null && session1.getAttribute("user") != null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/form.css">


</head>
<body>
    <div class="login-container">
        <h2>Đăng nhập</h2>
        <% if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>
        <form action="<%= request.getContextPath() %>/giaovien" method="post">
            <input type="hidden" name="action" value="login">
            <label for="taiKhoan">Tài khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" required>
            <label for="matKhau">Mật khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" required>
            <button type="submit">Đăng nhập</button>
        </form>
    </div>
</body>
</html>
