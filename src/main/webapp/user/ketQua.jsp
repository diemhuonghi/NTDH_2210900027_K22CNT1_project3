<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.BaiLamDAO, model.BaiLam" %>
<%@ page import="java.util.*" %>

<%
    int baiLamID = Integer.parseInt(request.getParameter("baiLamID"));
    BaiLamDAO baiLamDAO = new BaiLamDAO();
    BaiLam baiLam = baiLamDAO.getBaiLamById(baiLamID);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Kết Quả Bài Thi</title>
</head>
<body>
    <h1>Kết Quả Bài Thi</h1>
    <p>Học sinh ID: <%= baiLam.getHocSinhID() %></p>
    <p>Đề thi ID: <%= baiLam.getDeThiID() %></p>
    <p>Điểm số: <strong><%= baiLam.getDiem() %></strong></p>
    <a href="user.jsp">Quay lại</a>
</body>
</html>
