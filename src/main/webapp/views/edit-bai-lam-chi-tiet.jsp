<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chỉnh Sửa Bài Làm Chi Tiết</title>
</head>
<body>
    <h2>Chỉnh Sửa Bài Làm Chi Tiết</h2>
    <form action="bailamchitiet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${baiLamChiTiet.id}">
        Bài Làm ID: <input type="text" name="baiLamID" value="${baiLamChiTiet.baiLamID}" required><br>
        Câu Hỏi ID: <input type="text" name="cauHoiID" value="${baiLamChiTiet.cauHoiID}" required><br>
        Đáp Án ID: <input type="text" name="dapAnID" value="${baiLamChiTiet.dapAnID}" required><br>
        <input type="submit" value="Cập Nhật">
    </form>
</body>
</html>
