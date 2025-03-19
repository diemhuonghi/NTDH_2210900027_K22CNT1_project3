<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CauHoi" %>
<%
    CauHoi cauHoi = (CauHoi) request.getAttribute("cauHoi");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa câu hỏi</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to bottom, #e3f2fd, #bbdefb);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 15px;
            color: #1976D2;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background: #1976D2;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
        }

        button:hover {
            background: #1565C0;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #1976D2;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Chỉnh sửa câu hỏi</h2>
        <form action="cauhoi" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= cauHoi.getId() %>">

            <label for="noiDung">Nội dung:</label>
            <input type="text" id="noiDung" name="noiDung" value="<%= cauHoi.getNoiDung() %>" required>

            <label for="doKho">Độ khó:</label>
            <input type="number" id="doKho" name="doKho" value="<%= cauHoi.getDoKho() %>" required>

            <label for="deThiID">Đề thi ID:</label>
            <input type="number" id="deThiID" name="deThiID" value="<%= cauHoi.getDeThiID() %>" required>

            <button type="submit">Lưu</button>
            <a href="cauhoi">Quay lại danh sách</a>
        </form>
    </div>
</body>
</html>
