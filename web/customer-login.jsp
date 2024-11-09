<%-- 
    Document   : login
    Created on : Sep 16, 2024, 1:42:10 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập - Cửa hàng cà phê</title>
        <!-- Bao gồm footer -->

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
                flex-direction: column;
            }

            .login-container {
                width: 350px;
                padding: 30px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                text-align: center;
            }

            .login-container h2 {
                margin-bottom: 20px;
                color: #6f4e37;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .login-container button {
                width: 100%;
                padding: 10px;
                background-color: #8b4513;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .login-container button:hover {
                background-color: #6f4e37;
            }

            .login-container a {
                display: block;
                margin-top: 10px;
                color: #8b4513;
                text-decoration: none;
                font-size: 14px;
            }

            .login-container a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <!-- Bao gồm navbar -->

        <!-- Form Đăng nhập -->
        <div class="login-container">
            <h2>Đăng nhập</h2>
            <form action="LoginServlet" method="post">
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
                <input type="password" name="password" placeholder="Mật khẩu" required>
                <button type="submit">Đăng nhập</button>
            </form>
            <a href="#">Quên mật khẩu?</a>
            ${requestScope.errorLoginMsg}
        </div>
    </body>
</html>
