<%-- 
    Document   : manager-order-detail
    Created on : Sep 26, 2024, 11:29:37 AM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết Đơn hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 800px;
                margin: 30px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #6f4e37;
                font-size: 28px;
                text-align: center;
                margin-bottom: 20px;
            }

            .order-info, .order-items {
                margin-bottom: 20px;
            }

            .order-info p, .order-items p {
                font-size: 16px;
                margin: 5px 0;
            }

            .order-items table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .order-items th, .order-items td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .order-items th {
                background-color: #8b4513;
                color: white;
            }


            .status-update {
                margin-bottom: 20px;
            }

            .status-update label {
                font-size: 16px;
                margin-right: 10px;
            }

            .status-update select {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .action-buttons {
                text-align: center;

            }

            .action-buttons button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin: 0 10px;
                color: white;
            }

            .save-button {
                background-color: #4CAF50;
            }

            .save-button:hover {
                background-color: #45a049;
            }


        </style>
    </head>
    <body>
        <jsp:include page="manager-navbar.jsp"/>
        <div class="container">

            <h1>Chi tiết Đơn hàng</h1>

            <!-- Thông tin đơn hàng -->

            <div class="order-info">
                <p><strong>Mã đơn:</strong> ${requestScope.orderInfo.getOrderId()}</p>
                <p><strong>Tên khách hàng:</strong> ${requestScope.orderInfo.getCustomerName()}</p>
                <p><strong>Số điện thoại:</strong> ${requestScope.orderInfo.getCustomerNumber()}</p>
                <p><strong>Số bàn:</strong> ${requestScope.orderInfo.getTableNumber()}</p>
                <p><strong>Thời gian đặt:</strong> ${requestScope.orderInfo.getOrderDatetime()}</p>
                <p><strong>Tổng số tiền:</strong> ${requestScope.orderInfo.getTotalAmount()}</p>
                <p><strong>Trạng thái hiện tại:</strong> ${requestScope.status}</p>
            </div>

            <!-- Danh sách sản phẩm trong đơn hàng -->
            <div class="order-items">
                <h1>Sản phẩm trong đơn hàng</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Ghi chú</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.detailList}" var="o">
                            <tr>
                                <td>${o.getProductName()}</td>
                                <td>${o.getNote()}</td>
                                <td>${o.getQuantity()}</td>
                                <td>${o.getPrice()}</td>
                            </tr>
                        </c:forEach>

                        <!-- Thêm các sản phẩm khác -->
                    </tbody>
                </table>
            </div>
            <c:if test="${empty requestScope.detailList}">
                <h3 style="text-align: center">Không có sản phẩm</h3>
            </c:if>

            <!-- Cập nhật trạng thái đơn hàng -->
            <c:if test="${requestScope.update == 'yes'}">
                <div class="status-update">
                    <form action="M_UpdateOrderStatus">
                        <div class="action-buttons">
                            <span>Cập nhật trạng thái đơn hàng:</span>
                            <input type="hidden" name="orderID" value="${requestScope.orderInfo.getOrderId()}">
                            <input type="hidden" name="status" value="${requestScope.statusID + 1}">
                            <button type="submit" class="save-button">${requestScope.nextStatus}</button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </body>
</html>
