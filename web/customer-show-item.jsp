<%-- 
    Document   : show-item
    Created on : Sep 29, 2024, 12:47:56 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .section {
                margin-bottom: 40px;
            }

            .section h2 {
                color: #6f4e37;
                font-size: 28px;
                margin-bottom: 20px;
                text-align: center;
            }

            .product-list {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }

            .product-item {
                background-color: white;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                width: 250px;
                text-align: center;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .product-item img {
                max-width: 100%;
                height: auto;
                border-radius: 10px;
            }

            .product-item h3 {
                color: #333;
                font-size: 20px;
                margin: 10px 0;
            }

            .product-item p {
                color: #666;
                font-size: 16px;
                margin-bottom: 15px;
            }

            .product-item button {
                background-color: #8b4513;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .product-item button:hover {
                background-color: #6f4e37;
            }
        </style>
    </head>
    <body>
        <!-- Danh mục Đồ uống -->
        <c:if test="${null ne requestScope.drinks}">
            <div class="section">
                <h2>Đồ uống</h2>
                <div class="product-list">
                    <!-- Hiển thị tất cả sản phẩm đồ uống -->
                    <c:if test="${not empty requestScope.drinks}">
                        <c:forEach items="${requestScope.drinks}" var="d">
                            <div class="product-item">
                                <img src="img/${d.getImage()}" alt="${d.getImage()}">
                                <h3>${d.getName()}</h3>
                                <p>${d.getPrice()} VNĐ</p>
                                <div>
                                    <form action="AddToWishlist" method="post">
                                        <input type="hidden" name="itemid" value="${d.getId()}">
                                        <button>Thêm vào wishlist</button>
                                    </form>
                                    <form action="AddToCart" method="post">
                                        <input type="hidden" name="id" value="${d.getId()}">
                                        <input type="hidden" name="search" value="${requestScope.search}">
                                        <button>Thêm vào giỏ hàng</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty requestScope.drinks}">
                        <strong>Không có sản phẩm</strong>
                    </c:if>
                </div>
            </div>
        </c:if>
        <!-- Danh mục Thức ăn -->
        <c:if test="${requestScope.foods ne null}">
            <div class="section">
                <h2>Món ăn</h2>
                <div class="product-list">
                    <!-- Hiển thị tất cả sản phẩm Món ăn -->
                    <c:if test="${not empty requestScope.foods}">
                        <c:forEach items="${requestScope.foods}" var="d">
                            <div class="product-item">
                                <img src="img/${d.getImage()}" alt="${d.getImage()}">
                                <h3>${d.getName()}</h3>
                                <p>${d.getPrice()} VNĐ</p>
                                <form action="AddToCart" method="post">
                                    <input type="hidden" name="id" value="${d.getId()}">
                                    <input type="hidden" name="price" value="${d.getPrice()}">
                                    <input type="hidden" name="search" value="${requestScope.search}">
                                    <div>
                                        <button type="button" onclick="window.location.href = 'AddToWishlist?itemid=${d.getId()}'">Thêm vào wishlist</button>
                                        <button type="submit">Thêm vào giỏ hàng</button>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty requestScope.foods}">
                        <strong>Không có sản phẩm</strong>
                    </c:if>
                </div>
            </div>
        </c:if>


        <!-- Danh mục WishList -->
        <c:if test="${requestScope.wishlist ne null and requestScope.wishlist.size() ge 0}">
            <div class="section">
                <h2>Wishlist</h2>
                <c:if test="${not empty requestScope.wishlist}">
                    <div class="product-list">
                        <c:forEach items="${requestScope.wishlist}" var="d">
                            <div class="product-item">
                                <img src="img/${d.getImage()}" alt="${d.getImage()}">
                                <h3>${d.getName()}</h3>
                                <p>${d.getPrice()} VNĐ</p>
                                <form action="RemoveFromWishList" method="get">
                                    <input type="hidden" name="itemid" value="${d.getId()}">
                                    <button>Xóa khỏi wishlist</button>
                                </form>
                                <form action="AddToCart" method="post">
                                    <input type="hidden" name="id" value="${d.getId()}">
                                    <input type="hidden" name="price" value="${d.getPrice()}">
                                    <input type="hidden" name="page" value="Welcome">
                                    <button type="submit">Thêm vào giỏ hàng</button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${empty requestScope.wishlist}">
                    <p style="text-align: center">
                        <strong>Không có sản phẩm</strong>
                    </p>
                </c:if>
            </div>
        </c:if>
    </body>
</html>
