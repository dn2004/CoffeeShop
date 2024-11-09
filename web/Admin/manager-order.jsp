<%-- 
    Document   : manager-order
    Created on : Sep 25, 2024, 7:44:36 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Đơn hàng</title>
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

            .search-bar {
                margin-bottom: 20px;
                text-align: center;
            }

            .search-bar form {
                display: inline-block;
                text-align: left;
                padding: 15px;
            }

            .search-bar label {
                font-size: 16px;
                margin-right: 10px;
            }

            .search-bar select {
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
                margin-right: 10px;
                width: 200px;
                box-sizing: border-box;
            }

            .search-bar button {
                padding: 10px 20px;
                background-color: #8b4513;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .search-bar button:hover {
                background-color: #6f4e37;
            }


            .search-bar button:hover {
                background-color: #6f4e37;
            }

            .order-list {
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

            .action-buttons {
                padding: auto;
                margin: auto;
                display: flex;
                gap: 10px;
            }

            .action-buttons button {
                padding: 8px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .view-button {
                background-color: #4CAF50;
                color: white;
            }

            .view-button:hover {
                background-color: #45a049;
            }


        </style>
    </head>
    <body>
        <jsp:include page="manager-navbar.jsp"/>

        <div class="container">
            <h1>Quản lý Đơn hàng</h1>

            <div class="search-bar">
                <form action="M_ShowOrder" method="get">
                    <label for="status">Trạng thái:</label>
                    <select id="status-filter" name="orderStatus">
                        <option value="0">All Status</option>
                        <c:forEach items="${requestScope.statusList}" var="s" varStatus="i">
                            <c:if test="${i.index ne 3}">
                                <option value="${i.getIndex() + 1}" ${requestScope.status == (i.getIndex() + 1) ? 'selected':''} >${s.getStatusName()}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <button type="submit">Lọc</button>
                </form>
            </div>
            <c:if test="${empty requestScope.list}">
                <h1>Bạn chưa có đơn hàng nào</h1>
            </c:if>
            <strong>${requestScope.message}</strong>
            <c:if test="${not empty requestScope.list}">

                <table class="order-list">
                    <thead>
                        <tr>
                            <th>Mã đơn</th>
                            <th>Tên khách hàng</th>
                            <th>Số điện thoại</th>
                            <th>Số bàn</th>
                            <th>Thời gian đặt</th>
                            <th>Tổng số tiền</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.list}" var="o">
                            <tr>
                                <td>${o.getOrderId()}</td>
                                <td>${o.getCustomerName()}</td>
                                <td>${o.getCustomerNumber()}</td>
                                <td>${o.getTableNumber()}</td>
                                <td>${o.getOrderDatetime()}</td>
                                <td>${o.getTotalAmount()}</td>
                                <td>${o.getStatus()}</td>
                                <td class="action-buttons">
                                    <form action="M_ShowOrderDetail" method="post">
                                        <input type="hidden" name="orderID" value="${o.getOrderId()}">
                                        <input type="hidden" name="update" value="yes">
                                        <button class="view-button">Xem chi tiết</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- Thêm nhiều đơn hàng khác ở đây -->
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>
</html>
