
<%-- 
    Document   : wishlist
    Created on : Sep 16, 2024, 2:23:17 PM
    Author     : dat20
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Model.DTO.ItemDTO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng - Cửa hàng cà phê</title>
        <style>
            /* CSS cho trang wishlist */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 1000px;
                margin: 0 auto;
                display: flex;
                gap: 20px;
            }

            .column {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                width: 100%;
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

            .cart-item {
                border: 1px solid #ddd;
                padding: 10px;
                margin-bottom: 15px;
                border-radius: 5px;
                display: flex;
                align-items: end;
                justify-content: space-between;
                background-color: #f9f9f9;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .cart-item form p {
                margin-bottom: 6px;
            }

            .cart-item p {
                margin: 0;
                font-size: 16px;
                color: #333;
            }

            .cart-item {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .remove-button {
                margin-top: 10px; 
            }

            .update-button, .remove-button {
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s;
            }
            .update-button {
                background-color: #4CAF50;
            }
            .update-button:hover {
                background-color: #45a049;
            }
            .remove-button {
                background-color: #f44336;
            }
            .remove-button:hover {
                background-color: #e31e10;
            }

            .cart-item span {
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }

            .cart-item .quantity {
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 5px;
                width: 40px;
                text-align: center;
                background-color: white;
                margin: 0 10px;
            }


            .total-price {
                text-align: right;
                margin-top: 20px;
                font-size: 18px;
                color: #333;
                font-weight: bold;
            }

            .customer-info {
                text-align: left;
            }

            .customer-info label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            .customer-info input {
                width: calc(100% - 22px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }

            .submit-button {
                background-color: #8b4513;
                color: white;
                border: none;
                padding: 15px 30px;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
                margin-top: 20px;
                display: block;
                width: 100%;
                text-align: center;
                transition: background-color 0.3s;
            }

            .submit-button:hover {
                background-color: #6f4e37;
            }
            .item-full-price {
                text-align: right;
                font-size: 16px;
                font-weight: bold;
            }
        </style>

        <script>
            function warning() {
                var ans = window.confirm("Đồ ăn sẽ không còn trong giỏ hảng. Bạn có chắc chắn muốn xóa?");
                if (ans)
                    return true;
                return false;
            }
            function warning2() {
                var ans = window.confirm("Bạn có chắc mình đã cập nhật đầy đủ đơn hàng? Nếu có, nhấn OK để mua hàng");
                if (ans)
                    return true;
                return false;
            }
        </script>
    </head>
    <body>
        <!-- Bao gồm navbar -->
        <jsp:include page="customer-navbar.jsp" />

        <c:set var="total" value="0"></c:set>
        <c:if test="${sessionScope.cart eq null or (empty sessionScope.cart.keySet())}">
            <h3 style="text-align: center">Giỏ hàng của bạn đang trống</h3>
        </c:if>
        <c:if test="${(sessionScope.cart ne null) and (not empty sessionScope.cart.keySet())}">
            <div class="container">

                <!-- Cột 1: Hiển thị Wishlist và Tổng giá trị đơn hàng -->
                <div class="column">
                    <div class="section">
                        <h2>Giỏ hàng của bạn</h2>

                        <c:forEach items="${sessionScope.cart.keySet()}" var="key" varStatus="s">

                            <div class="cart-item">
                                <div>
                                    <form action="EditCart" method="post">
                                        <input type="hidden" name="itemId" value="${key.getId()}">  
                                        <p><strong>${key.getName()}</strong></p>
                                        
                                        <p><span>Số lượng:</span>
                                            <input name="quantity" type="number" value="${sessionScope.cart.get(key).getQuantity()}" min="1" class="quantity" required=""></p>
                                        <p><span>Ghi chú: </span><input type="text" name="note" value="${sessionScope.cart.get(key).getNote()}" maxlength="25" title="Tối đa 25 kí tự" ></p>
                                        <p class="action-button">
                                            <button name="btn" value="update" class="update-button">update</button>
                                            <button  name="btn" value="remove" class="remove-button" onclick="return warning()">remove</button>
                                        </p>
                                    </form>
                                </div>
                                <p class="item-full-price">${key.getPrice() * sessionScope.cart.get(key).getQuantity()}</p>
                            </div>
                            <c:set var="total" value="${total + (key.getPrice() * sessionScope.cart.get(key).getQuantity())}"></c:set>
                        </c:forEach>
                        <div class="total-price">
                            <strong>Tổng hóa đơn: ${total}</strong>
                        </div>
                        <!-- Hiển thị tổng giá trị đơn hàng -->
                    </div>
                </div>

                <!-- Cột 2: Nhập Thông tin Khách hàng -->
                <div class="column">
                    <div class="section">
                        <h2>Thông tin khách hàng</h2>
                        <div class="customer-info">
                            <form action="SaveCart" method="post">
                                <input type="hidden" name="total"" value="${total}">
                                <label for="tableNumber">Số bàn:</label>
                                <input type="number" id="tableNumber" name="tableNumber" min="1" max="10" placeholder="Nhập số bàn" required>

                                <label for="customerName">Họ tên khách hàng:</label>
                                <input type="text" id="customerName" name="customerName" placeholder="Nhập họ tên" required>

                                <label for="customerPhone">Số điện thoại khách hàng:</label>
                                <input type="text" id="customerPhone" name="customerPhone" placeholder="Nhập số điện thoại" pattern="0[0-9]{9}" title=" Số điện thoại phải bao gồm 10 chữ số và bắt đầu bằng số 0" required>
                                <button type="submit" class="submit-button" onclick="return warning2()">Mua ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>

        <!-- Bao gồm footer -->
        <jsp:include page="customer-footer.jsp" />
    </body>
</html>
