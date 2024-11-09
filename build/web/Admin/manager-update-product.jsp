<%-- 
    Document   : manager-update-product
    Created on : Sep 25, 2024, 4:53:45 PM
    Author     : dat20
--%>

<%@page import="Model.DTO.ItemDTO"%>
<%@page import="Model.DAO.ItemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cập nhật Sản phẩm</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #6f4e37;
                font-size: 24px;
                text-align: center;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                font-size: 16px;
                margin-bottom: 5px;
                color: #333;
            }

            input[type="text"], input[type="number"], select {
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
                width: 100%;
                box-sizing: border-box;
            }

            input[type="file"] {
                padding: 10px;
                margin-bottom: 15px;
                border: none;
                font-size: 16px;
            }

            .action-buttons {
                display: flex;
                justify-content: space-between;
                gap: 10px;
            }

            .update-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s;
            }

            .update-button:hover {
                background-color: #45a049;
            }

            .cancel-button {
                background-color: #f44336;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s;
            }

            .cancel-button:hover {
                background-color: #e31e10;
            }
        </style>
    </head>
    <body>
        
        <jsp:include page="manager-navbar.jsp"/>
        <div class="container">
            <h1>Cập nhật Sản phẩm</h1>
            <form action="M_UpdateItemServlet" method="post">
                <label for="itemId">Mã sản phẩm</label>
                <input type="text" id="itemId" name="itemID" value="${requestScope.updatedItem.getId()}" readonly>

                <label for="itemName">Tên sản phẩm</label>
                <input type="text" id="itemName" name="itemName" value="${requestScope.updatedItem.getName()}" required>

                <label for="price">Giá</label>
                <input type="number" id="price" name="price" value="${requestScope.updatedItem.getPrice()}" required step="1000">

                <label for="kindID">Loại</label>
                <select id="kindID" name="kindID" required>
                    <option value="1" selected>Đồ uống</option>
                    <option value="2">Thức ăn</option>
                </select>

                <label for="isAvailable">Trạng thái</label>
                <select id="isAvailable" name="isAvailable" required>
                    <option value="true" ${requestScope.updatedItem.isAvailable() eq true ? 'selected':''}>Còn hàng</option>
                    <option value="false" ${requestScope.updatedItem.isAvailable() eq false ? 'selected':''}>Hết hàng</option>
                </select>

                <label for="image">Hình ảnh sản phẩm</label>
                <input type="file" id="image" name="image" accept="image/*">
                <input type="hidden" name="previousImage" value="${requestScope.updatedItem.getImage()}">
                <img src="../img/${requestScope.updatedItem.getImage()}" alt="${requestScope.updatedItem.getImage()}" width="100" height="100"/>

                <div class="action-buttons">
                    <button type="submit" class="update-button">Cập nhật</button>
                    <button type="button" class="cancel-button" onclick="window.location.href = 'M_ShowItem'">Hủy</button>
                </div>
            </form>
        </div>
    </body>
</html>
