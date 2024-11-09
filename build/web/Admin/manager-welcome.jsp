<%-- 
    Document   : welcome-manager
    Created on : Sep 23, 2024, 3:00:05 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome Manager</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 800px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h1 {
                color: #6f4e37;
                font-size: 32px;
                margin-bottom: 20px;
            }

            p {
                font-size: 18px;
                color: #555;
                margin-bottom: 30px;
            }

            .nav {
                display: flex;
                justify-content: space-around;
                flex-wrap: wrap;
            }

            .nav a {
                display: block;
                width: 23%; 
                padding: 15px;
                margin: 10px;
                background-color: #8b4513;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
                text-align: center;
            }

            .nav a:hover {
                background-color: #6f4e37;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>${requestScope.welcomeUser}!</h1>
            <p>Chọn một trong các tùy chọn dưới đây để quản lý cửa hàng của bạn.</p>
            <div class="nav">
                <a href="Admin/M_ShowOrder?orderStatus=0">Quản lý Đơn hàng</a>
                <a href="Admin/M_ShowItem">Quản lý Sản phẩm</a>
                <a href="Admin/M_ShowReport">Báo cáo</a>
            </div>
        </div>
    </body>
</html>
