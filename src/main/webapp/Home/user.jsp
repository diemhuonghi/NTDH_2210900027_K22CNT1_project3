<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.HocSinh, model.DeThi, java.util.List" %>
<%@ page import="dao.DeThiDAO" %>

<%
    HocSinh user = (HocSinh) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login-user.jsp");
        return;
    }

    // Lấy danh sách đề thi
    List<DeThi> danhSachDeThi = new DeThiDAO().getAllDeThi();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>🍂 Trang Người Dùng - Mùa Thu 🍂</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
</head>
<body>

    <!-- 🎃 Hiệu ứng lá rơi -->
    <div class="leaf"></div>
    <div class="leaf"></div>
    <div class="leaf"></div>
    <div class="leaf"></div>
    <div class="leaf"></div>
    <div class="leaf"></div>

    <h2>🍁 Chào, <%= user.getHoTen() %>! 🍁</h2>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Lớp học:</strong> <%= user.getLopHoc() %></p>

    <h3>📜 Danh sách đề thi</h3>
    <ul>
        <% for (DeThi deThi : danhSachDeThi) { %>
            <li>
                <strong><%= deThi.getTieuDe() %></strong> - 
                <%= deThi.getThoiGianThi() %> phút 
               <a href="<%= request.getContextPath() %>/user/lam-bai.jsp?deThiID=<%= deThi.getId() %>" class="btn btn-primary">📝 Làm bài</a>
            </li>
        <% } %>
    </ul>

    <h3>📊 Xem kết quả bài làm</h3>
    <a href="${pageContext.request.contextPath}/user/xem-diem.jsp">📝 Đề Thi</a>

    <form action="<%= request.getContextPath() %>/hocsinh?action=logout" method="post">
        <button type="submit" class="btn btn-danger">🚪 Đăng xuất</button>
    </form>
</body>
</html>
