<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CauHoi" %>
<%@ page import="dao.CauHoiDAO" %>
<%@ page import="dao.DeThiDAO" %>
<%@ page import="model.DeThi" %>
<jsp:useBean id="cauHoiDAO" class="dao.CauHoiDAO" scope="page"/>
<jsp:useBean id="deThiDAO" class="dao.DeThiDAO" scope="page"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Câu Hỏi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Quản Lý Câu Hỏi</h2>

        <!-- Form Thêm Mới -->
        <form action="CauHoiServlet" method="post" class="mb-4">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="noiDung" class="form-label">Nội Dung Câu Hỏi:</label>
                <textarea class="form-control" id="noiDung" name="noiDung" required></textarea>
            </div>
            <div class="mb-3">
                <label for="maDe" class="form-label">Thuộc Đề Thi:</label>
                <select class="form-select" id="maDe" name="maDe" required>
                    <%
                        List<DeThi> danhSachDeThi = deThiDAO.getAllDeThi();
                        for (DeThi de : danhSachDeThi) {
                    %>
                        <option value="<%= de.getMaDe() %>"><%= de.getTenDe() %></option>
                    <% } %>
                </select>
            </div>
            <div class="mb-3">
                <label for="doKho" class="form-label">Độ Khó (1-5):</label>
                <input type="number" class="form-control" id="doKho" name="doKho" min="1" max="5" required>
            </div>
            <button type="submit" class="btn btn-primary">Thêm Câu Hỏi</button>
        </form>

        <!-- Bảng Danh Sách Câu Hỏi -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Mã Câu Hỏi</th>
                    <th>Nội Dung</th>
                    <th>Đề Thi</th>
                    <th>Độ Khó</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CauHoi> danhSachCauHoi = cauHoiDAO.getAllCauHoi();
                    for (CauHoi ch : danhSachCauHoi) {
                %>
                <tr>
                    <td><%= ch.getMaCauHoi() %></td>
                    <td><%= ch.getNoiDung() %></td>
                    <td><%= ch.getMaDe() %></td>
                    <td><%= ch.getDoKho() %></td>
                    <td>
                        <a href="CauHoiServlet?action=edit&maCauHoi=<%= ch.getMaCauHoi() %>" class="btn btn-warning btn-sm">Sửa</a>
                        <a href="CauHoiServlet?action=delete&maCauHoi=<%= ch.getMaCauHoi() %>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
