<%-- 
    Document   : product-managerment
    Created on : Sep 23, 2024, 3:31:20 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Sản phẩm</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1000px;
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

            .filter-bar {
                margin-bottom: 20px;
                text-align: center;
            }

            .filter-bar {
                select, button {
                    padding: 10px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    margin-right: 10px;
                }
                button {
                    padding: 10px 20px;
                    background-color: #8b4513;
                    color: white;
                    transition:  background
                }
                button:hover {
                    background-color: #6f4e37;
                }
            }

            .add-button {
                margin-bottom: 20px;
                text-align: center;
                button {
                    cursor: pointer;
                    padding: 10px 20px;
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }
                button:hover {
                    background-color: #45a049;
                }
            }

            .product-list {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
                th, td {
                    padding: 10px 10px;
                    text-align: left;
                    border-bottom: 1px solid #ddd;
                }
                img {
                    width: 100px;
                }
                th {
                    background-color: #8b4513;
                    color: white;
                }

            }

            .action-buttons {
                button {
                    padding: 8px 15px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                    background-color: #4CAF50;
                    color: white;
                }
                button:hover {
                    background-color: #45a049;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="manager-navbar.jsp"/>
        <div class="container">
            <h1>Quản lý Sản phẩm</h1>
            <div class="filter-bar">
                <form action="M_ShowItem">
                    <select id="category-filter" name="kindID">
                        <option value="0" ${requestScope.kindID == 0 ? 'selected':''}>Tất cả loại</option>
                        <option value="1" ${requestScope.kindID == 1 ? 'selected':''}>Đồ uống</option>
                        <option value="2" ${requestScope.kindID == 2 ? 'selected':''}>Thức ăn</option>
                    </select>

                    <select id="status-filter" name="status">
                        <option value="all">Tất cả trạng thái</option>
                        <option value="true" ${requestScope.status == 'true' ? 'selected':''}>Còn hàng</option>
                        <option value="false" ${requestScope.status == 'false' ? 'selected':''}>Hết hàng</option>
                    </select>
                    <button class="filter-button">Lọc</button>
                </form>
            </div>
            <div class="add-button">
                <button onclick="window.location.href = 'manager-add-item.jsp'">Thêm sản phẩm mới</button>
            </div>
            <span style="font-weight: bold">${requestScope.updateMSG}</span>
            <table class="product-list">
                <thead>
                    <tr>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Loại</th>
                        <th>Trạng thái</th>
                        <th>Hình ảnh</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <c:if test="${not empty requestScope.list}">
                    <tbody>
                        <c:forEach items="${requestScope.list}" var="i">
                            <tr>
                                <td>${i.getId()}</td>
                                <td>${i.getName()}</td>
                                <td>${i.getPrice()}</td>
                                <td>${i.getKind()}</td>
                                <td>${i.getAvailable()}</td>
                                <td><img src="../img/${i.getImage()}" alt="${i.getImage()}"></td>
                                <td class="action-buttons">
                                    <form action="M_CheckUpdateItem" method="post">
                                        <input type="hidden" name="id" value="${i.getId()}">
                                        <button class="update-button">Cập nhật</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </c:if>
            </table>
            <c:if test="${empty requestScope.list}">
                <strong>Không có sản phẩm, bạn cần tạo thêm</strong>
            </c:if>
        </div>
    </body>
</html>
