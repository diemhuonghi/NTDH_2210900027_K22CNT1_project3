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
</head>
<body>
    <h2>Đề thi</h2>
    <form action="<%= request.getContextPath() %>/user/NopBaiServlet" method="post">
        <input type="hidden" name="deThiID" value="<%= deThiID %>">
        <%
            for (CauHoi ch : dsCauHoi) {
                List<DapAn> dsDapAn = dapAnDAO.getDapAnByCauHoi(ch.getId());
        %>
        <div>
            <p><strong>Câu <%= ch.getId() %>: <%= ch.getNoiDung() %></strong></p>
            <% for (DapAn da : dsDapAn) { %>
                <input type="radio" name="cauHoi_<%= ch.getId() %>" value="<%= da.getId() %>" required>
                <%= da.getNoiDung() %><br>
            <% } %>
        </div>
        <hr>
        <% } %>
        <button type="submit">Nộp bài</button>
    </form>
</body>
</html>
