<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giới Thiệu Hệ Thống Đề Thi Online</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Thiết lập nền và font chữ */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #bbdefb); /* Gradient xanh nhạt */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 30px;
        }

        /* Khung tổng */
        .container {
            max-width: 1000px;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
            border-left: 10px solid #42a5f5; /* Xanh nhạt */
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        /* Tiêu đề chính */
        h1 {
            text-align: center;
            font-size: 32px;
            color: #fff;
            background: linear-gradient(to right, #64b5f6, #1976d2); /* Hiệu ứng màu */
            padding: 18px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-weight: bold;
            text-transform: uppercase;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            letter-spacing: 1.5px;
        }

        /* Khung từng mục */
        .section {
            background: rgba(100, 181, 246, 0.15); /* Màu nền nhẹ nhàng */
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            border-left: 6px solid #42a5f5;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .section:hover {
            background: rgba(100, 181, 246, 0.3);
            transform: scale(1.02);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.15);
        }

        /* Tiêu đề phụ */
        h2 {
            font-size: 24px;
            color: #0d47a1;
            margin-bottom: 12px;
            padding-bottom: 5px;
            border-bottom: 3px solid #42a5f5;
            letter-spacing: 1px;
        }

        /* Nội dung */
        p {
            font-size: 18px;
            line-height: 1.8;
            text-align: justify;
            margin-bottom: 12px;
            color: #444;
        }

        /* Danh sách */
        ul, ol {
            padding-left: 30px;
            margin-top: 10px;
        }

        ul li, ol li {
            margin-bottom: 12px;
            font-size: 18px;
            color: #333;
            line-height: 1.8;
            position: relative;
            padding-left: 10px;
        }

        ul li::before {
            content: "✔";
            color: #42a5f5;
            font-weight: bold;
            position: absolute;
            left: -20px;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #666;
            padding-top: 10px;
            border-top: 2px solid #bbb;
        }
    </style>

</head>
<body>
    <div class="container">
        <h1>GIỚI THIỆU HỆ THỐNG ĐỀ THI ONLINE</h1>
<div >
    <a href="<%= request.getContextPath() %>/Home/Index.jsp" 
       style="color: #d32f2f; font-weight: bold; text-decoration: none; transition: color 0.3s ease-in-out; font-size: 18px;">
       🏠 Quay lại trang chủ
    </a>
</div>
        <div class="section">
            <h2>1. Đề Thi Online là gì?</h2>
            <p>
                Đề thi online là một hệ thống kiểm tra trực tuyến giúp học sinh và giáo viên có thể thực hiện các bài kiểm tra dưới dạng trắc nghiệm dễ dàng và hiệu quả.</p> 
                
            </p>
            <p>
               Thay vì sử dụng đề thi giấy truyền thống, học sinh có thể làm bài ngay trên nền tảng trực tuyến, hệ thống sẽ tự động ghi nhận câu trả lời, chấm điểm và hiển thị kết quả ngay sau khi nộp bài.
            </p>
        </div>

        <div class="section">
            <h2>2. Lợi ích của Đề Thi Online</h2>
            <ul>
                <li>✅ <b>Tiện lợi</b> – Học sinh có thể làm bài ở bất kỳ đâu, chỉ cần có internet.</li>
                <li>✅ <b>Nhanh chóng</b> – Hệ thống tự động chấm điểm, tiết kiệm thời gian.</li>
                <li>✅ <b>Chính xác</b> – không sai sót trong việc tính điểm và đánh giá bài làm.</li>
                <li>✅ <b>Đa dạng</b> – câu hỏi phong phú, có thể tạo nhiều đề thi khác nhau.</li>
               
            </ul>
        </div>

        <div class="section">
            <h2>3. Cách thức hoạt động</h2>
            <ol>
                <li>🔹 <b>Bước 1:</b> Giáo viên tạo đề thi .</li>
                <li>🔹 <b>Bước 2:</b> Học sinh đăng nhập vào hệ thống,chọn đề thi.</li>
                <li>🔹 <b>Bước 3:</b> Học sinh làm bài, sau đó nộp bài.</li>
                <li>🔹 <b>Bước 4:</b> Hệ thống tự động chấm điểm và hiển thị kết quả ngay lập tức.</li>
                <li>🔹 <b>Bước 5:</b> Giáo viên có thể theo dõi tiến độ và phân tích kết quả của học sinh.</li>
            </ol>
        </div>

        <div class="section">
            <h2>4. Ứng dụng thực tế của hệ thống</h2>
            <ul>
                <li>🔹 <b>Kiểm tra kiến thức</b> – Sử dụng trong các kỳ thi hoặc bài kiểm tra.</li>
                <li>🔹 <b>Thi thử đại học</b> – Giúp học sinh có cơ hội rèn luyện và làm quen với cấu trúc đề thi thật.</li>
                <li>🔹 <b>Ôn tập và luyện đề</b> – Học sinh có thể tự luyện tập bằng nhiều dạng đề thi khác nhau.</li>
                <li>🔹 <b>Thi chứng chỉ</b> – Hệ thống có thể áp dụng cho các kỳ thi chứng chỉ quốc tế .</li>
            </ul>
        </div>

        <div class="footer">
            &copy; 2025 - Hệ Thống Đề Thi Online
        </div>
    </div>
</body>
</html>
