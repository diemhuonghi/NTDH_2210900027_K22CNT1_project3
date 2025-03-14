<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CauHoi" %>
<%
    CauHoi cauHoi = (CauHoi) request.getAttribute("cauHoi");
%>
<html>
<head>
    <title>Chỉnh sửa câu hỏi</title>
</head>
<body>
    <h2>Chỉnh sửa câu hỏi</h2>
    <form action="cauhoi" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= cauHoi.getId() %>">

        <label>Nội dung:</label>
        <input type="text" name="noiDung" value="<%= cauHoi.getNoiDung() %>" required><br>

        <label>Độ khó:</label>
        <input type="number" name="doKho" value="<%= cauHoi.getDoKho() %>" required><br>

        <label>Đề thi ID:</label>
        <input type="number" name="deThiID" value="<%= cauHoi.getDeThiID() %>" required><br>

        <button type="submit">Lưu</button>
    </form>
    <a href="cauhoi">Quay lại danh sách</a>
</body>
</html>
