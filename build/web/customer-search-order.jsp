<%-- 
    Document   : order-search
    Created on : Sep 16, 2024, 3:16:35 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm đơn hàng - Cửa hàng cà phê</title>
    <style>
        /* CSS cho trang tìm kiếm đơn hàng */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            text-align: center;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .container h2 {
            color: #6f4e37;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .container input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .search-button {
            background-color: #8b4513;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-button:hover {
            background-color: #6f4e37;
        }
    </style>
</head>
<body>
    <!-- Bao gồm navbar -->
    <jsp:include page="customer-navbar.jsp" />

    <div class="container">
        <h2>Tìm kiếm đơn hàng</h2>
        <form action="ShowOrderTracking" method="get">
            <input type="text" name="phone" placeholder="Nhập số điện thoại" pattern="0[0-9]{9}" title=" Số điện thoại phải bao gồm 10 chữ số và bắt đầu bằng số 0" required>
            <button type="submit" class="search-button">Tìm kiếm</button>
        </form>
        <br>
        ${requestScope.msg}
    </div>

    <!-- Bao gồm footer -->
    <jsp:include page="customer-footer.jsp" />
</body>
</html>
