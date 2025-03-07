<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách học sinh</title>
</head>
<body>
    <h2>Danh sách học sinh</h2>
    <table border="1">
        <tr>
            <th>Mã HS</th>
            <th>Họ Tên</th>
            <th>Tài Khoản</th>
            <th>Email</th>
            <th>Trạng Thái</th>
            <th>Ngày Tạo</th>
            <th>Hành Động</th>
        </tr>
        <c:forEach var="hs" items="${listHocSinh}">
            <tr>
                <td>${hs.maHS}</td>
                <td>${hs.hoTen}</td>
                <td>${hs.taiKhoan}</td>
                <td>${hs.email}</td>
                <td>${hs.trangThai ? "Hoạt động" : "Ngừng hoạt động"}</td>
                <td>${hs.ngayTao}</td>
                <td>
                   <td>
				    <a href="hocsinh?action=edit&maHS=${hs.maHS}">Sửa</a> |
				    <a href="hocsinh?action=delete&maHS=${hs.maHS}" onclick="return confirm('Xác nhận xóa?');">Xóa</a>
				</td>
				 </td>
            </tr>
        </c:forEach>
    </table>
    <a href="hocsinh?action=add">Thêm học sinh</a>
</body>
</html>
