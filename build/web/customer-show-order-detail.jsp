<%-- 
    Document   : show-order-detail
    Created on : Sep 21, 2024, 7:56:16 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết đơn hàng - Cửa hàng cà phê</title>
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

            .order-info, .customer-info {
                margin-bottom: 20px;
            }

            .order-info h2, .customer-info h2 {
                font-size: 20px;
                color: #333;
                border-bottom: 2px solid #ddd;
                padding-bottom: 5px;
                margin-bottom: 10px;
            }

            .order-info p, .customer-info p {
                margin: 5px 0;
                font-size: 16px;
                color: #555;
            }

            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .total-price {
                text-align: right;
                font-size: 18px;
                font-weight: bold;
                margin-top: 20px;
                color: #333;
            }

            .order-status {
                font-size: 16px;
                font-weight: bold;
                color: #8b4513;
            }

            .back-button {
                display: block;
                text-align: center;
                margin-top: 30px;
            }

            .back-button button {
                background-color: #8b4513;
                color: white;
                padding: 10px 20px;
                border-radius: 10px;
                text-decoration: none;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .back-button button:hover {
                background-color: #6f4e37;
            }
            /* CSS cho bảng */
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


        </style>
    </head>
    <body>
        <div class="container">
            <h1>Chi tiết đơn hàng</h1>

            <!-- Thông tin đơn hàng -->
            <div class="order-info">
                <h2>Thông tin đơn hàng</h2>
                <p>Mã đơn hàng: <strong>${requestScope.orderInfo.getOrderId()}</strong></p>
                <p>Ngày đặt hàng: <strong>${requestScope.orderInfo.getOrderDatetime()}</strong></p>
                <p>Trạng thái: <span class="order-status">${requestScope.orderInfo.getStatus()}</span></p>
            </div>

            <!-- Thông tin khách hàng -->
            <div class="customer-info">
                <h2>Thông tin khách hàng</h2>
                <p>Họ tên: <strong>${requestScope.orderInfo.getCustomerName()}</strong></p>
                <p>Số điện thoại: <strong>${requestScope.orderInfo.getCustomerNumber()}</strong></p>
                <p>Số bàn: <strong>${requestScope.orderInfo.getTableNumber()}</strong></p>
            </div>

            <!-- Danh sách sản phẩm -->
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

            <!-- Tổng giá trị đơn hàng -->
            <div class="total-price">
                Tổng giá trị: ${requestScope.orderInfo.getTotalAmount()}
            </div>

            <!-- Nút quay lại -->
            <div class="back-button">
                <form action="Welcome">
                    <button>Quay về trang chủ</button>
                </form>
            </div>
        </div>
    </body>
</html>
