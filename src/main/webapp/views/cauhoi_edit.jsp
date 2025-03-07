<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.CauHoi" %>
<%@ page import="model.DeThi" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.DeThiDAO" %>
<jsp:useBean id="deThiDAO" class="dao.DeThiDAO" scope="page"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Câu Hỏi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center">Chỉnh Sửa Câu Hỏi</h2>
        
        <%
            CauHoi cauHoi = (CauHoi) request.getAttribute("cauHoi");
        %>

        <form action="CauHoiServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="maCauHoi" value="<%= cauHoi.getMaCauHoi() %>">

            <div class="mb-3">
                <label for="noiDung" class="form-label">Nội Dung Câu Hỏi:</label>
                <textarea class="form-control" id="noiDung" name="noiDung" required><%= cauHoi.getNoiDung() %></textarea>
            </div>

            <div class="mb-3">
                <label for="maDe" class="form-label">Thuộc Đề Thi:</label>
			  <select class="form-select" id="maDe" name="maDe">
			    <%
			        List<DeThi> danhSachDeThi = deThiDAO.getAllDeThi();
			        int maDeHienTai = (cauHoi != null) ? cauHoi.getMaDe() : -1; // Nếu cauHoi null, set giá trị mặc định là -1
			        for (DeThi de : danhSachDeThi) {
			    %>
			        <option value="<%= de.getMaDe() %>" <% if (de.getMaDe() == maDeHienTai) { %> selected <% } %>><%= de.getTenDe() %></option>
			    <% } %>
			</select>

            </div>

            <div class="mb-3">
                <label for="doKho" class="form-label">Độ Khó (1-5):</label>
                <input type="number" class="form-control" id="doKho" name="doKho" value="<%= cauHoi.getDoKho() %>" min="1" max="5" required>
            </div>

            <button type="submit" class="btn btn-success">Cập Nhật</button>
            <a href="cauhoi.jsp" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</body>
</html>
