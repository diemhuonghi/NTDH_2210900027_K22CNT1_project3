<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.HocSinh" %>
<%
    HttpSession session2 = request.getSession();
    HocSinh user = (HocSinh) session2.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login-user.jsp");
        return;
    }
    
    float diem = (request.getParameter("diem") != null) ? Float.parseFloat(request.getParameter("diem")) : 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết quả bài thi</title>
</head>
<body>
    <h2>Kết quả bài thi</h2>
    <p>Học sinh: <strong><%= user.getHoTen() %></strong></p>
    <p>Điểm số: <b><%= request.getAttribute("diem") %></b></p>
    <a href="${pageContext.request.contextPath}/Home/user.jsp">Quay Lại Trang Chủ</a>
</body>
</html>
