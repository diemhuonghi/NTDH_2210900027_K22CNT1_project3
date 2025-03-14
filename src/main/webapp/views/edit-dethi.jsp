<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.DeThi" %>
<%@ page import="dao.DeThiDAO" %>
<%@ page import="dao.GiaoVienDAO" %>
<%@ page import="dao.MonHocDAO" %>
<%@ page import="java.util.List" %>

<%
    DeThi deThi = (DeThi) request.getAttribute("deThi");
    GiaoVienDAO giaoVienDAO = new GiaoVienDAO();
    MonHocDAO monHocDAO = new MonHocDAO();

    // Debug kiểm tra nếu deThi bị null
    if (deThi == null) {
%>
        <h2>Lỗi: Không tìm thấy đề thi!</h2>
        <p>Vui lòng kiểm tra lại ID đề thi.</p>
        <a href="dethi">Quay lại danh sách đề thi</a>
<%
        return; // Dừng trang nếu không có đề thi
    }

    List<model.GiaoVien> danhSachGiaoVien = giaoVienDAO.getAllGiaoVien();
    List<model.MonHoc> danhSachMonHoc = monHocDAO.getAllMonHoc();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Đề Thi</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Chỉnh Sửa Đề Thi</h2>
    <form action="dethi" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= deThi.getId() %>">

        <label for="tieuDe">Tiêu Đề:</label>
        <input type="text" id="tieuDe" name="tieuDe" value="<%= deThi.getTieuDe() %>" required>  

        <label for="moTa">Mô Tả:</label>
        <textarea id="moTa" name="moTa" required><%= deThi.getMoTa() %></textarea>

        <label for="thoiGianThi">Thời Gian Thi (phút):</label>
        <input type="number" id="thoiGianThi" name="thoiGianThi" value="<%= deThi.getThoiGianThi() %>" required>

        <label for="giaoVienID">Giáo Viên:</label>
        <select id="giaoVienID" name="giaoVienID" required>
            <%
                if (danhSachGiaoVien != null && !danhSachGiaoVien.isEmpty()) {
                    for (model.GiaoVien gv : danhSachGiaoVien) {
                        String selected = (gv.getId() == deThi.getGiaoVienID()) ? "selected" : "";
            %>
                <option value="<%= gv.getId() %>" <%= selected %>><%= gv.getHoTen() %></option>
            <% 
                    }
                } else { 
            %>
                <option value="">Không có giáo viên</option>
            <% } %>
        </select>

        <label for="monHocID">Môn Học:</label>
        <select id="monHocID" name="monHocID" required>
            <%
                if (danhSachMonHoc != null && !danhSachMonHoc.isEmpty()) {
                    for (model.MonHoc mh : danhSachMonHoc) {
                        String selected = (mh.getId() == deThi.getMonHocID()) ? "selected" : "";
            %>
                <option value="<%= mh.getId() %>" <%= selected %>><%= mh.getTenMon() %></option>
            <%
                    }
                } else {
            %>
                <option value="">Không có môn học</option>
            <% } %>
        </select>

        <button type="submit">Cập Nhật</button>
        <a href="dethi">Hủy</a>
    </form>
</body>
</html>
