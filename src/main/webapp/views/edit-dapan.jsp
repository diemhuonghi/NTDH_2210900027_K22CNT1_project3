<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.DapAn" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.DapAnDAO" %>
<%@ page import="dao.CauHoiDAO" %>
<%@ page import="model.CauHoi" %>
<%
    DapAn dapAn = (DapAn) request.getAttribute("dapAn");
    CauHoiDAO cauHoiDAO = new CauHoiDAO();
    List<CauHoi> danhSachCauHoi = cauHoiDAO.getAllCauHoi();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa đáp án</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Chỉnh sửa đáp án</h2>

        <form action="dapan" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= dapAn.getId() %>">

            <!-- Chọn câu hỏi -->
            <div class="mb-3">
                <label for="cauHoiID" class="form-label">Câu hỏi</label>
                <select class="form-select" name="cauHoiID" id="cauHoiID" required>
                    <% for (CauHoi ch : danhSachCauHoi) { %>
                        <option value="<%= ch.getId() %>" <%= (ch.getId() == dapAn.getCauHoiID()) ? "selected" : "" %>>
                            <%= ch.getNoiDung() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <!-- Nội dung đáp án -->
            <div class="mb-3">
                <label for="noiDung" class="form-label">Nội dung đáp án</label>
                <input type="text" class="form-control" id="noiDung" name="noiDung" 
                    value="<%= dapAn.getNoiDung() %>" required>
            </div>

            <!-- Đáp án đúng -->
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="dapAnDung" name="dapAnDung" 
                    <%= dapAn.isDapAnDung() ? "checked" : "" %>>
                <label class="form-check-label" for="dapAnDung">Là đáp án đúng</label>
            </div>

            <!-- Nút Submit -->
            <button type="submit" class="btn btn-primary mt-3">Cập nhật</button>
            <a href="dapan" class="btn btn-secondary mt-3">Hủy</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
