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

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .readonly {
            background: #e9ecef;
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
        <h2>Chỉnh sửa bài làm</h2>
        <div class="card-footer text-center">
            <a href="<%= request.getContextPath() %>/views/bai_lam.jsp" class="btn btn-link">Quay lại trang chủ</a>
        </div>
        <form action="bailam" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= baiLam.getId() %>">

            <label for="hocSinhID">ID Học Sinh:</label>
            <input type="number" class="form-control" id="hocSinhID" name="hocSinhID" value="<%= baiLam.getHocSinhID() %>" required>

            <label for="deThiID">ID Đề Thi:</label>
            <input type="number" class="form-control" id="deThiID" name="deThiID" value="<%= baiLam.getDeThiID() %>" required>

            <label for="diem">Điểm:</label>
            <input type="number" step="0.1" class="form-control" id="diem" name="diem" value="<%= baiLam.getDiem() %>" required>

            <label>Thời gian nộp:</label>
            <input type="text" class="form-control readonly" value="<%= baiLam.getThoiGianNop() %>" readonly>

            <button type="submit">Lưu thay đổi</button>
            <a href="bailam">Hủy</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
