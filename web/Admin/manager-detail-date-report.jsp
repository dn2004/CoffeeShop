<%-- 
    Document   : manager-detail-date-report
    Created on : Sep 26, 2024, 3:15:26 PM
    Author     : dat20
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Báo Cáo Ngày</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
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

            .report-info {
                margin-bottom: 20px;
            }

            .report-info p {
                font-size: 16px;
                margin: 5px 0;
            }

            .order-list table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .order-list th, .order-list td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .order-list th {
                background-color: #8b4513;
                color: white;
            }

            .order-list tr:hover {
                background-color: #f4f4f4;
            }

            .search-button {
                padding: 8px 15px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .search-button:hover {
                background-color: #45a049;
            }

            .total-summary {
                font-size: 20px;
                text-align: right;
                font-weight: bold;
                color: #6f4e37;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="manager-navbar.jsp"/>

        <div class="container">
            <h1>Chi tiết Báo cáo Ngày</h1>

            <!-- Thông tin báo cáo -->

            <div class="report-info">
                <p><strong>Ngày báo cáo:</strong> ${requestScope.date}</p>
                <p><strong>Tổng số đơn hàng:</strong> ${requestScope.completedList.size() + requestScope.incompletedList.size()}</p>
                <p><strong>Tổng số đơn hàng hoàn thành:</strong> ${requestScope.completedList.size()}</p>
                <p><strong>Tổng doanh thu:</strong> ${requestScope.dateRevenue} </p>
            </div>

            <!-- Danh sách đơn hàng trong ngày -->
            <div class="order-list">
                <c:if test="${not empty requestScope.completedList}">
                    <h1 style="text-align: center">Đơn hàng Đã hoàn thành</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Số bàn</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.completedList}" var="o">
                                <tr>
                                    <td>${o.getOrderId()}</td>
                                    <td>${o.getCustomerName()}</td>
                                    <td>${o.getTableNumber()}</td>
                                    <td>${o.getCustomerNumber()}</td>
                                    <td>${o.getTotalAmount()}</td>
                                    <td>
                                        <form action="M_ShowOrderDetail" method="post">
                                            <input type="hidden" name="orderID" value="${o.getOrderId()}">
                                            <input type="hidden" name="update" value="no">
                                            <input type="hidden" name="date" value="${requestScope.date}">
                                            <button class="search-button">Tìm kiếm</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- Thêm các dòng đơn hàng khác -->
                        </tbody>
                    </table>
                    <!-- Tổng cộng -->
                    <div class="total-summary">
                        <p>Tổng số tiền: ${requestScope.dateRevenue} VND</p>
                    </div>
                </c:if>
            </div>
            <div class="order-list">
                <c:if test="${not empty requestScope.incompletedList}">
                    <h1 style="text-align: center">Đơn hàng chưa hoàn thành</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Số bàn</th>
                                <th>Số điện thoại</th>
                                <th>Tổng tiền</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.incompletedList}" var="o">
                                <tr>
                                    <td>${o.getOrderId()}</td>
                                    <td>${o.getCustomerName()}</td>
                                    <td>${o.getTableNumber()}</td>
                                    <td>${o.getCustomerNumber()}</td>
                                    <td>${o.getTotalAmount()}</td>
                                    <td>
                                        <form action="M_ShowOrderDetail" method="post">
                                            <input type="hidden" name="orderID" value="${o.getOrderId()}">
                                            <input type="hidden" name="update" value="no">
                                            <input type="hidden" name="date" value="${requestScope.date}">
                                            <button class="search-button">Tìm kiếm</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <!-- Thêm các dòng đơn hàng khác -->
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </body>
</html>
