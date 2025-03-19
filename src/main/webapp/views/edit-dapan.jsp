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

        select, input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-check {
            text-align: left;
            margin-top: 10px;
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
        <h2>Chỉnh sửa đáp án</h2>
        <form action="dapan" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= dapAn.getId() %>">

            <label for="cauHoiID">Câu hỏi</label>
            <select class="form-select" name="cauHoiID" id="cauHoiID" required>
                <% for (CauHoi ch : danhSachCauHoi) { %>
                    <option value="<%= ch.getId() %>" <%= (ch.getId() == dapAn.getCauHoiID()) ? "selected" : "" %>>
                        <%= ch.getNoiDung() %>
                    </option>
                <% } %>
            </select>

            <label for="noiDung">Nội dung đáp án</label>
            <input type="text" class="form-control" id="noiDung" name="noiDung" 
                value="<%= dapAn.getNoiDung() %>" required>

            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="dapAnDung" name="dapAnDung" 
                    <%= dapAn.isDapAnDung() ? "checked" : "" %>>
                <label class="form-check-label" for="dapAnDung">Là đáp án đúng</label>
            </div>

            <button type="submit">Cập nhật</button>
            <a href="dapan">Hủy</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
