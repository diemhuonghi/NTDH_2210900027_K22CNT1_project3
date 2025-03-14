<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.HocSinh" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%
    HocSinh hocSinh = (HocSinh) request.getAttribute("hocSinh");
    if (hocSinh == null) {
        response.sendRedirect("hocsinh");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa học sinh</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Chỉnh sửa học sinh</h2>

        <form action="<%= request.getContextPath() %>/hocsinh" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= hocSinh.getId() %>">

            <label for="hoTen">Họ và tên:</label>
            <input type="text" id="hoTen" name="hoTen" value="<%= hocSinh.getHoTen() %>" required>

            <label for="taiKhoan">Tài khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" value="<%= hocSinh.getTaiKhoan() %>" required>

            <label for="matKhau">Mật khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" value="<%= hocSinh.getMatKhau() %>" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= hocSinh.getEmail() %>" required>

            <label for="lopHoc">Lớp học:</label>
            <input type="text" id="lopHoc" name="lopHoc" value="<%= hocSinh.getLopHoc() %>" required>

            <label for="trangThai">Trạng thái:</label>
            <input type="checkbox" id="trangThai" name="trangThai" <%= hocSinh.isTrangThai() ? "checked" : "" %>>

            <button type="submit">Cập nhật</button>
            <a href="hocsinh">Quay lại</a>
        </form>
    </div>
</body>
</html>
