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

    Float diem = (Float) session2.getAttribute("diem"); // Lấy điểm từ session
    if (diem == null) {
        diem = 0.0f; // Nếu null thì gán mặc định 0 điểm
    }
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
	    background: linear-gradient(to right, #e8f0fe, #d6e4fc); /* Gradient xanh nhạt */
	    padding: 50px;
	}

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            width: 50%;
            margin: auto;
        }

        h2 {
            color: #2C3E50;
            font-size: 28px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }

        p {
            font-size: 20px;
            color: #333;
            margin: 10px 0;
        }

        strong {
            color: #e74c3c;
            font-size: 22px;
        }

        .score {
            font-size: 24px;
            font-weight: bold;
            color: #27ae60;
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
    <div class="container">
        <h2>Kết Quả Bài Thi</h2>
        <p>Học sinh: <strong><%= user.getHoTen() %></strong></p>
        <p>Điểm số: <span class="score"><%= diem %></span></p> <!-- In ra điểm từ session -->
        <a href="${pageContext.request.contextPath}/Home/user.jsp">Quay Lại Trang Chủ</a>
    </div>
</body>
</html>
