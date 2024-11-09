<%-- 
    Document   : manager-add-item
    Created on : Sep 28, 2024, 10:43:14 AM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <!--
            Trang này sẽ tạo thêm sản phẩm
            Những giá trị đưa vào servlet: các input thuộc form 
            Servlet tới M_ShowItem
        -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm Sản Phẩm Mới</title>
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

            .add-button {
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

            .add-button:hover {
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
            <h1>Thêm Sản Phẩm Mới</h1>
            <form action="M_AddNewItem" method="get">
                <label for="productName">Tên sản phẩm</label>
                <input type="text" id="productName" name="productName" required>

                <label for="price">Giá</label>
                <input type="number" id="price" name="price" required step="1000">

                <label for="category">Loại</label>
                <select id="category" name="kindID" required>
                    <option value="1">Đồ uống</option>
                    <option value="2">Thức ăn</option>
                </select>

                <label for="status">Trạng thái</label>
                <select id="status" name="isAvailable" required>
                    <option value="true">Còn hàng</option>
                    <option value="false">Hết hàng</option>
                </select>

                <label for="image">Hình ảnh sản phẩm</label>
                <input type="file" id="image" name="image" accept="image/*" required>

                <div class="action-buttons">
                    <button type="submit" class="add-button">Thêm sản phẩm</button>
                    <button type="button" class="cancel-button" onclick="window.location.href = 'M_ShowItem'">Hủy</button>
                </div>
            </form>
        </div>
    </body>
</html>
