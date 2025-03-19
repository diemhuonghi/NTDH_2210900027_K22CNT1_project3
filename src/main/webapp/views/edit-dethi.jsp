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

    if (deThi == null) {
%>
        <h2>Lỗi: Không tìm thấy đề thi!</h2>
        <p>Vui lòng kiểm tra lại ID đề thi.</p>
        <a href="dethi">Quay lại danh sách đề thi</a>
<%
        return;
    }

    List<model.GiaoVien> danhSachGiaoVien = giaoVienDAO.getAllGiaoVien();
    List<model.MonHoc> danhSachMonHoc = monHocDAO.getAllMonHoc();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Đề Thi</title>
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

        input, textarea, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            height: 80px;
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
    </div>
</body>
</html>
