<%-- 
    Document   : manager-navbar
    Created on : Oct 13, 2024, 1:54:08 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            nav {
                background-color: #8b4513;
                padding: 15px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            nav .logo {
                font-size: 22px;
                font-weight: bold;
                color: white;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                display: flex;
            }

            nav ul li {
                margin: 0 15px;
            }

            nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                transition: color 0.3s;
            }

            nav ul li a:hover {
                color: #ddd;
            }

            .nav-action-buttons {
                display: flex;
                gap: 10px;
            }

            .nav-action-buttons a {
                padding: 10px 15px;
                background-color: #4CAF50;
                color: white;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            .nav-action-buttons a.logout-button {
                background-color: #f44336;
            }

            .nav-action-buttons a:hover {
                background-color: #45a049;
            }

            .nav-action-buttons a.logout-button:hover {
                background-color: #e31e10;
            }
        </style>
    </head>
    <body>
        <nav>
            <div class="logo">Trang Quản Lý</div>
            <ul>
                <li><a href="../Welcome">Trang chủ</a></li>
                <li><a href="M_ShowItem">Quản lý sản phẩm</a></li>
                <li><a href="M_ShowOrder?orderStatus=0">Đơn hàng</a></li>
                <li><a href="M_ShowReport">Báo cáo</a></li>
            </ul>
            <div class="nav-action-buttons">
                <a href="../M_Logout" class="logout-button">Đăng xuất</a>
            </div>
        </nav>
    </body>
</html>
