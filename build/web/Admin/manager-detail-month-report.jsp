<%-- 
    Document   : manager-detail-month-report
    Created on : Sep 26, 2024, 5:56:45 PM
    Author     : dat20
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Báo Cáo Tháng</title>
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

            .report-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .report-table th, .report-table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .report-table th {
                background-color: #8b4513;
                color: white;
            }

            .report-table tr:hover {
                background-color: #f4f4f4;
            }

            .detail-button {
                padding: 8px 15px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .detail-button:hover {
                background-color: #45a049;
            }

            .back-button {
                padding: 10px 20px;
                background-color: #f44336;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                text-align: center;
                margin: 20px auto;
                display: block;
                width: 150px;
            }

            .back-button:hover {
                background-color: #e31e10;
            }
        </style>
    </head>
    <body>
        <jsp:include page="manager-navbar.jsp"/>
        <div class="container">
            <h1>Chi Tiết Báo Cáo Tháng: Tháng ${requestScope.month}/${requestScope.year}</h1>
            <c:if test="${not empty requestScope.reportList}">
                <table class="report-table">
                    <thead>
                        <tr>
                            <th>Ngày</th>
                            <th>Số đơn hàng</th>
                            <th>Doanh thu</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.reportList}" var="d">

                            <tr>
                                <td>${d.getReportDate()}</td>
                                <td>${d.getOrderQuantity()}</td>
                                <td>${d.getRevenue()} VNĐ</td>
                                <td>
                                    <form action="M_SearchDateReport" method="get">
                                        <input type="hidden" name="date" value="${d.getReportDate()}">
                                        <button class="detail-button">Xem chi tiết</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>
</html>
