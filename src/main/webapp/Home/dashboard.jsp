<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.GiaoVien" %>
<%
    HttpSession session2 = request.getSession(false);
    GiaoVien user = (GiaoVien) session2.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Thi Trắc Nghiệm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="nav-link">Chào, <b><%= user.getTaiKhoan() %></b></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/giaovien?action=logout">Đăng xuất</a>
                </li>
            </ul>
        </nav>

        <!-- Sidebar -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="#" class="brand-link text-center">
                <span class="brand-text font-weight-light">Quản Lý Thi Trắc Nghiệm</span>
            </a>
            <div class="sidebar">
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" role="menu">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/giaovien" class="nav-link menu-link"><i class="fas fa-chalkboard-teacher"></i> Giáo Viên</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/hocsinh" class="nav-link menu-link"><i class="fas fa-user-graduate"></i> Học Sinh</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/monhoc" class="nav-link menu-link"><i class="fas fa-book"></i> Môn Học</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/dethi" class="nav-link menu-link"><i class="fas fa-file-alt"></i> Đề Thi</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/cauhoi" class="nav-link menu-link"><i class="fas fa-question-circle"></i> Câu Hỏi</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/dapan" class="nav-link menu-link"><i class="fas fa-check-circle"></i> Đáp Án</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/bailam" class="nav-link menu-link"><i class="fas fa-file"></i> Bài Làm</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/bailamchitiet" class="nav-link menu-link"><i class="fas fa-file-contract"></i> Chi Tiết Bài Làm</a></li>
                    </ul>
                </nav>
            </div>
        </aside>

        <!-- Content Wrapper -->
        <div class="content-wrapper p-4" id="content-area">
            <h2>Giới thiệu về Thi Trắc Nghiệm</h2>
            <p>Thi trắc nghiệm trực tuyến giúp học sinh ôn tập và kiểm tra kiến thức dễ dàng với hệ thống đa dạng môn học.</p>
        </div>
    </div>

  

</body>
</html>
