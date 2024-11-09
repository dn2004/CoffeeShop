<%-- 
    Document   : welcome
    Created on : Sep 16, 2024, 12:43:10 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ - Cửa hàng cà phê</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                background-color: #f4f4f4;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .hero {
                background-image: url('img/banner.jpg'); /* Đường dẫn tới hình ảnh */
                background-size: cover;
                background-position: center;
                height: 900px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 48px;
                text-shadow: 2px 2px 4px #000;
                margin: 20px 0;
            }
        </style>
    </head>
    <body>
        <!-- Bao gồm navbar -->
        <jsp:include page="customer-navbar.jsp" />

        <!-- Nội dung trang chào mừng -->
        <div class="hero">
        </div>

        <!-- Danh mục Đồ uống -->

        <jsp:include page="customer-show-item.jsp" />

        <!-- Bao gồm footer -->
        <jsp:include page="customer-footer.jsp" />


    </body>
</html>
