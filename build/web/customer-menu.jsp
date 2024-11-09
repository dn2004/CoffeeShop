<%-- 
    Document   : order
    Created on : Sep 16, 2024, 1:51:42 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt hàng - Cửa hàng cà phê</title>

        <style>
            /* CSS cho trang đặt hàng */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
            }
            
            .search {
                margin-top: 10px; 
            }
            
            .search-bar {
                margin-bottom: 20px;
                text-align: center;
            }

            .search-bar input[type="text"] {
                padding: 10px;
                width: 300px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }

            .search-bar button {
                padding: 10px;
                background-color: #8b4513;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

           
        </style>
    </head>
    <body>
        <!-- Bao gồm navbar -->
        <jsp:include page="customer-navbar.jsp" />

        <div class="container">
            <!-- Thanh tìm kiếm -->
            <div class="search-bar">
                <!-- Chuyển hướng đến trang kết quả tìm kiếm -->
                <form class="search" action="ShowItems" method="get">
                    <input type="text" name="search" value="${requestScope.search}" placeholder="Tìm kiếm sản phẩm...">
                    <button type="submit">Tìm kiếm</button>
                </form>
            </div>

            <jsp:include page="customer-show-item.jsp"/>
            
        </div>

        <!-- Bao gồm footer -->
        <jsp:include page="customer-footer.jsp" />
    </body>
</html>
