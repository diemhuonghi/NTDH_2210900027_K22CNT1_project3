<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Bài Làm Chi Tiết</title>
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
        <h2>Chỉnh Sửa Bài Làm Chi Tiết</h2>
        <form action="bailamchitiet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${baiLamChiTiet.id}">

            <label for="baiLamID">Bài Làm ID:</label>
            <input type="text" id="baiLamID" name="baiLamID" value="${baiLamChiTiet.baiLamID}" required>

            <label for="cauHoiID">Câu Hỏi ID:</label>
            <input type="text" id="cauHoiID" name="cauHoiID" value="${baiLamChiTiet.cauHoiID}" required>

            <label for="dapAnID">Đáp Án ID:</label>
            <input type="text" id="dapAnID" name="dapAnID" value="${baiLamChiTiet.dapAnID}" required>

            <button type="submit">Cập Nhật</button>
            <a href="bailamchitiet">Hủy</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
