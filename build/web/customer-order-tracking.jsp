<%-- 
Document   : ordertracking
Created on : Sep 16, 2024, 3:09:03 PM
Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Theo dõi đơn hàng - Cửa hàng cà phê</title>
        <style>
            /* CSS cho trang theo dõi đơn hàng */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 1000px;
                margin: 0 auto;
            }

            .section {
                margin-bottom: 40px;
            }

            .section h2 {
                color: #6f4e37;
                font-size: 28px;
                margin-bottom: 20px;
                text-align: center;
            }

            .order-list {
                border: 1px solid #ddd;
                border-radius: 10px;
                overflow: hidden;
                background-color: #fff;
            }

            .order-item {
                padding: 20px;
                border-bottom: 1px solid #ddd;
            }

            .order-item:last-child {
                border-bottom: none;
            }

            .order-item h3 {
                margin: 0;
                font-size: 20px;
                color: #333;
            }

            .order-item p {
                margin: 5px 0;
                color: #666;
            }

            .order-item .order-status {
                font-weight: bold;
                color: #8b4513;
            }

            .order-item .order-total {
                font-size: 18px;
                font-weight: bold;
                color: #333;
                margin-top: 10px;
            }

            .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .track-button {
                background-color: #8b4513;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .track-button:hover {
                background-color: #6f4e37;
            }
        </style>
    </head>
    <body>
        <!-- Bao gồm navbar -->
        <jsp:include page="customer-navbar.jsp" />

        <div class="container">
            <div class="section">
                <h2>Theo dõi đơn hàng của bạn</h2>
                <c:if test="${not empty requestScope.list}">
                    <div class="order-list">
                        <c:forEach items="${requestScope.list}" var="o">
                            <div class="order-item">
                                <h3>Đơn hàng #: ${o.getOrderId()}</h3>
                                <p>Khách hàng: ${o.getCustomerName()}</p>
                                <p>Ngày đặt: ${o.getOrderDatetime()}</p>
                                <p>Trạng thái: <span class="order-status">${o.getStatus()}</span></p>
                                <p class="order-total">Tổng giá trị: ${o.getTotalAmount()} VND</p>
                                <div class="button-container">
                                    <form action="ShowOrderDetails" method="post">
                                        <input type="hidden" name="orderID" value="${o.getOrderId()}">
                                        <input type="hidden" name="detail" value="true">
                                        <button class="track-button">Chi tiết đơn hàng</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${empty requestScope.list}">
                    <p>Bạn chưa có đơn hàng nào</p>
                </c:if>
            </div>
        </div>

        <!-- Bao gồm footer -->
        <jsp:include page="customer-footer.jsp" />
    </body>
</html>
