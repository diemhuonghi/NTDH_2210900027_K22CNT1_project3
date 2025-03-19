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
    <meta charset="UTF-8">
    <title>Kết Quả Bài Thi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            padding: 50px;
        }

        h1 {
            color: #2C3E50;
            font-size: 32px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        p {
            font-size: 20px;
            color: #333;
        }

        strong {
            color: #e74c3c;
            font-size: 24px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            font-size: 18px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Kết Quả Bài Thi</h1>
    <p>Học sinh ID: <%= baiLam.getHocSinhID() %></p>
    <p>Đề thi ID: <%= baiLam.getDeThiID() %></p>
    <p>Điểm số: <strong><%= baiLam.getDiem() %></strong></p>
    <a href="user.jsp">Quay lại</a>
</body>
</html>
