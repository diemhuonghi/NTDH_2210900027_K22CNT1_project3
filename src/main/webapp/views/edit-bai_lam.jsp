<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.BaiLam" %>
<%@ page import="java.sql.Timestamp" %>
<%
    BaiLam baiLam = (BaiLam) request.getAttribute("baiLam");
    if (baiLam == null) {
        response.sendRedirect("bailam?error=notfound");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa bài làm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Chỉnh sửa bài làm</h2>
        
        <form action="bailam" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= baiLam.getId() %>">

            <!-- Nhập ID Học Sinh -->
            <div class="mb-3">
                <label for="hocSinhID" class="form-label">ID Học Sinh:</label>
                <input type="number" class="form-control" id="hocSinhID" name="hocSinhID" value="<%= baiLam.getHocSinhID() %>" required>
            </div>

            <!-- Nhập ID Đề Thi -->
            <div class="mb-3">
                <label for="deThiID" class="form-label">ID Đề Thi:</label>
                <input type="number" class="form-control" id="deThiID" name="deThiID" value="<%= baiLam.getDeThiID() %>" required>
            </div>

            <!-- Nhập Điểm -->
            <div class="mb-3">
                <label for="diem" class="form-label">Điểm:</label>
                <input type="number" step="0.1" class="form-control" id="diem" name="diem" value="<%= baiLam.getDiem() %>" required>
            </div>

            <!-- Hiển thị Thời Gian Nộp (Không cho chỉnh sửa) -->
            <div class="mb-3">
                <label class="form-label">Thời gian nộp:</label>
                <input type="text" class="form-control" value="<%= baiLam.getThoiGianNop() %>" readonly>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                <a href="bailam" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
