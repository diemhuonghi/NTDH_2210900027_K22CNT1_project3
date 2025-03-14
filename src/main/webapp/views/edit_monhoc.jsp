<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Môn Học</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="container">
        <h2>Chỉnh Sửa Môn Học</h2>
        <form action="${pageContext.request.contextPath}/monhoc" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${monHoc.id}">
            
            <label for="tenMon">Tên Môn Học:</label>
            <input type="text" id="tenMon" name="tenMon" value="${monHoc.tenMon}" required>

            <button type="submit">Cập Nhật</button>
            <a href="${pageContext.request.contextPath}/monhoc" class="btn-cancel">Hủy</a>
        </form>
    </div>
      <script>
        $(document).ready(function() {
            $(".menu-link").click(function(event) {
                event.preventDefault(); // Ngăn chuyển trang
                var pageUrl = $(this).attr("href");
                $("#content-area").load(pageUrl);
            });
        });
    </script>
</body>
</html>
