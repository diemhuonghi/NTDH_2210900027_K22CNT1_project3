<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.DeThi" %>
<%@ page import="dao.DeThiDAO" %>

<%
    DeThiDAO deThiDAO = new DeThiDAO();
    List<DeThi> listDeThi = deThiDAO.getAllDeThi();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Đề Thi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Quản lý Đề Thi</h2>

        <!-- Form thêm mới đề thi -->
        <form action="DeThiServlet" method="post" class="mb-4">
            <input type="hidden" name="action" value="add">
            <div class="row">
                <div class="col-md-3">
                    <input type="text" class="form-control" name="tenDe" placeholder="Tên đề thi" required>
                </div>
                <div class="col-md-2">
                    <input type="number" class="form-control" name="maMH" placeholder="Mã môn học" required>
                </div>
                <div class="col-md-2">
                    <input type="number" class="form-control" name="thoiGian" placeholder="Thời gian (phút)" required>
                </div>
                <div class="col-md-2">
                    <select class="form-control" name="trangThai">
                        <option value="true">Kích hoạt</option>
                        <option value="false">Tắt</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">Thêm Đề Thi</button>
                </div>
            </div>
        </form>

        <!-- Bảng danh sách đề thi -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Mã Đề</th>
                    <th>Tên Đề</th>
                    <th>Mã Môn Học</th>
                    <th>Thời Gian</th>
                    <th>Trạng Thái</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <% for (DeThi dt : listDeThi) { %>
                    <tr>
                        <td><%= dt.getMaDe() %></td>
                        <td><%= dt.getTenDe() %></td>
                        <td><%= dt.getMaMH() %></td>
                        <td><%= dt.isTrangThai() ? "Kích hoạt" : "Tắt" %></td>
                        <td>
                            <a href="DeThiServlet?action=edit&maDe=<%= dt.getMaDe() %>" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="DeThiServlet?action=delete&maDe=<%= dt.getMaDe() %>" class="btn btn-danger btn-sm" onclick="return confirm('Xác nhận xóa?')">Xóa</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
