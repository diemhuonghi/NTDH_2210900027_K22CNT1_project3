<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CauHoi" %>
<%@ page import="model.DapAn" %>
<%@ page import="dao.CauHoiDAO" %>
<%@ page import="dao.DapAnDAO" %>
<%@ page import="model.HocSinh" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Kiểm tra đăng nhập
    HttpSession session1 = request.getSession();
    HocSinh user = (HocSinh) session1.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login-user.jsp");
        return;
    }

    // Lấy tham số deThiID
    String deThiID_raw = request.getParameter("deThiID");
    int deThiID = 0;
    List<CauHoi> dsCauHoi = null;

    if (deThiID_raw != null && !deThiID_raw.isEmpty()) {
        try {
            deThiID = Integer.parseInt(deThiID_raw);
            dsCauHoi = new CauHoiDAO().getCauHoiByDethi(deThiID);

            if (dsCauHoi == null || dsCauHoi.isEmpty()) {
                out.println("<h3 style='color:red;'>Lỗi: Không có câu hỏi nào trong đề thi này!</h3>");
                return;
            }
        } catch (NumberFormatException e) {
            out.println("<h3 style='color:red;'>Lỗi: deThiID không hợp lệ!</h3>");
            return;
        }
    } else {
        out.println("<h3 style='color:red;'>Lỗi: Thiếu tham số deThiID!</h3>");
        return;
    }
    
    DapAnDAO dapAnDAO = new DapAnDAO();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Làm bài thi</title>
    <style>
        /* Nền trang gradient xanh nhạt */
        body {
            background: linear-gradient(to right, #EAF2F8, #D6EAF8);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Container chính */
        .container {
            width: 60%;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* Tiêu đề */
 h2 {
    text-align: center;
    color: #2C3E50;
    font-size: 28px; /* Tăng kích thước chữ */
    font-weight: bold; /* Làm đậm */
    text-transform: uppercase; /* Viết hoa toàn bộ */
    letter-spacing: 2px; /* Tăng khoảng cách giữa các chữ */
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* Thêm bóng chữ */
}

        /* Câu hỏi */
        .question {
            margin-bottom: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .question p {
            font-size: 18px;
            font-weight: bold;
            color: #34495E;
        }

        /* Đáp án */
        .answers {
            margin-left: 20px;
        }

        .answers label {
            display: block;
            padding: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .answers input {
            margin-right: 10px;
            transform: scale(1.2);
        }

        /* Nút nộp bài */
        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .submit-btn:hover {
            background: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Đề thi</h2>
        <form action="<%= request.getContextPath() %>/user/NopBaiServlet" method="post">
            <input type="hidden" name="deThiID" value="<%= deThiID %>">
            <%
                for (CauHoi ch : dsCauHoi) {
                    List<DapAn> dsDapAn = dapAnDAO.getDapAnByCauHoi(ch.getId());
            %>
            <div class="question">
                <p>Câu <%= ch.getId() %>: <%= ch.getNoiDung() %></p>
                <div class="answers">
                    <% for (DapAn da : dsDapAn) { %>
                        <label>
                            <input type="radio" name="cauHoi_<%= ch.getId() %>" value="<%= da.getId() %>" required>
                            <%= da.getNoiDung() %>
                        </label>
                    <% } %>
                </div>
            </div>
            <hr>
            <% } %>
            <button type="submit" class="submit-btn">Nộp bài</button>
        </form>
    </div>
</body>
</html>
