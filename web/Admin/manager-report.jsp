<%-- 
    Document   : manager-report
    Created on : Sep 26, 2024, 1:03:51 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Báo cáo Quản lý</title>
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

            .report-section {
                margin-bottom: 40px;
            }

            .report-section h2 {
                color: #6f4e37;
                font-size: 24px;
                margin-bottom: 15px;
            }

            .filter-section {
                margin-bottom: 20px;
                text-align: center;
            }

            .filter-section input, .filter-section select {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-right: 10px;
                font-size: 16px;
            }

            .filter-section button {
                padding: 10px 20px;
                background-color: #8b4513;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .filter-section button:hover {
                background-color: #6f4e37;
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

            .action-buttons {
                text-align: center;
                margin-top: 20px;
            }

            .action-buttons button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                margin: 0 10px;
            }



            .back-button {
                background-color: #f44336;
                color: white;
            }

            .back-button:hover {
                background-color: #e31e10;
            }
        </style>
    </head>
    <body>
        <jsp:include page="manager-navbar.jsp"/>
        <div class="container">
            <h1>Báo cáo Quản lý</h1>

            <!-- Báo cáo Đơn hàng theo Ngày -->
            <div class="report-section">

                <h2>Đơn hàng theo Ngày</h2>
                <c:if test="${not empty requestScope.dateReportList}">
                    <form class="filter-section" action="M_SearchDateReport" method="get">
                        <input type="date" id="filter-date" name="date" required="">
                        <button>Lọc theo ngày</button>
                    </form>
                    <table class="report-table">
                        <thead>
                            <tr>
                                <th>Ngày</th>
                                <th>Số đơn hàng hoàn thành</th>
                                <th>Doanh thu</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.dateReportList}" var="d">
                                <tr>
                                    <td>${d.getReportDate()}</td>
                                    <td>${d.getOrderQuantity()}</td>
                                    <td>${d.getRevenue()} VNĐ</td>
                                    <td>
                                        <form action="M_SearchDateReport" method="get">
                                            <input type="hidden" name="date" value="${d.getReportDate()}"/>
                                            <button class="detail-button">Xem chi tiết</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- Thêm các dòng báo cáo đơn hàng theo ngày khác -->
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty requestScope.dateReportList}">
                    <h1>Ban cần phải có hóa đơn</h1>
                </c:if>
            </div>

            <!-- Báo cáo Đơn hàng theo Tháng -->
            <div class="report-section">
                <h2>Đơn hàng theo Tháng</h2>

                <c:if test="${not empty requestScope.monthReportList}">
                    <div class="filter-section">
                        <form action="M_SearchMonthReport" method="get">
                            <select id="filter-month" name="month" required="">
                                <c:forEach  begin="1" end="12" varStatus="i">
                                    <option value="${i.index}">Tháng ${i.index}</option>
                                </c:forEach>
                            </select>
                            <input type="number" id="filter-year" name="year" placeholder="Năm" min="2000" max="2100" required="">
                            <button>Lọc theo tháng</button>
                        </form>
                    </div>
                    <table class="report-table">
                        <thead>
                            <tr>
                                <th>Tháng</th>
                                <th>Số đơn hàng hoàn thành</th>
                                <th>Doanh thu</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.monthReportList}" var="m">
                                <tr>
                                    <td>Tháng ${m.getMonth()}/${m.getYear()}</td>
                                    <td>${m.getQuantity()}</td>
                                    <td>${m.getRevenue()} VND</td>
                                    <td>
                                        <form action="M_SearchMonthReport" method="get">
                                            <input type="hidden" name="month" value="${m.getMonth()}">
                                            <input type="hidden" name="year" value="${m.getYear()}">
                                            <button class="detail-button">Xem chi tiết</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty requestScope.monthReportList}">
                    <h1>Bạn cần phải có hóa đơn</h1>
                </c:if>
            </div>
        </div>
    </body>
</html>
