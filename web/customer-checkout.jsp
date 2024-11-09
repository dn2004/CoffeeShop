<%-- 
    Document   : checkout
    Created on : Sep 16, 2024, 2:29:12 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hoàn tất giao dịch - Cửa hàng cà phê</title>
        <style>
            /* CSS cho trang checkout */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f4f4;
                text-align: center;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
            }
            
            .view-button {
                background-color: #8b4513;
                color: white;
                border: none;
                padding: 15px 30px;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s;
            }

            .section {
                margin-bottom: 40px;
            }

            .section h2 {
                color: #6f4e37;
                font-size: 28px;
                margin-bottom: 20px;
            }

            .message {
                background-color: #dff0d8;
                color: #3c763d;
                border: 1px solid #d6e9c6;
                padding: 20px;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            .total-price {
                font-size: 18px;
                color: #333;
                margin-top: 20px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <!-- Bao gồm navbar -->
        <jsp:include page="customer-navbar.jsp" />

        <div class="container">
            <div class="section">
                <h2>Hoàn tất giao dịch</h2>



                <!-- Hiển thị thông báo hoàn tất giao dịch -->
                <div class="message">
                    <p>Cảm ơn bạn đã mua hàng tại Cửa hàng cà phê của chúng tôi!</p>
                    <p>Chúng tôi sẽ liên hệ với bạn sớm để xác nhận đơn hàng.</p>
                </div>

                <!-- Hiển thị tổng giá trị đơn hàng -->
                <div class="total-price">
                    Tổng giá trị đơn hàng của bạn là: ${requestScope.total} VND
                </div>
            </div>
        </div>
        <form action="ShowOrderDetails" method="post">
            <input type="hidden" name="orderID" value="${requestScope.orderID}">
            <button class="view-button">Xem hóa đơn</button>
        </form>
        <!-- Bao gồm footer -->
        <jsp:include page="customer-footer.jsp" />
    </body>
</html>
