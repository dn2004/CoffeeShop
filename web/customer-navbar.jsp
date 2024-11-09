<%-- 
    Document   : navbar
    Created on : Sep 16, 2024, 1:58:35 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- navbar.jsp -->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            header {
                background-color: #6f4e37;
                color: white;
                padding: 20px 0;
                text-align: center;
                width: 100%;
            }

            nav {
                padding: 10px;
                background-color: #8b4513;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            .nav-left, .nav-right {
                display: flex;
                align-items: center;
            }
            .nav-right  img {
                    width: 30px;
                    height: 30px;
                }

               

            .nav-right    a {
                    color: blue;
                    display: flex;
                    text-decoration: none;
                }

            
            .login-button, .cart-button  {
                padding: 10px;
                transition: background-color 0.3s; /* Thêm thời gian chuyển đổi mượt mà */
            }

            .login-button:hover, .cart-button:hover  {
                background-color: #6f4e37; /* Thay đổi màu nền khi hover */
            }

            .nav-left {

            }

            .nav-center {
                display: flex;
                justify-content: center;
                gap: 15px; /* Khoảng cách giữa các liên kết */
            }

            .nav-center a {
                color: white;
                text-decoration: none;
                font-size: 18px;
            }

            .nav-center a:hover {
                text-decoration: underline;
            }

            .nav-left img, .nav-right img {
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <header>
            <h1>Chào mừng đến với Cửa hàng Cà phê của chúng tôi</h1>
        </header>

        <nav>
            <div class="nav-left">
                <a href="Welcome"><img src="img/JavaLogo.png" width="150px" height="50px" alt="JavaLogo.png"/></a>
            </div>
            <div class="nav-center">
                <a href="ShowItems">Sản phẩm</a>
                <a href="noti-coming-soon.jsp">Giới thiệu</a>
                <a href="noti-coming-soon.jsp">Liên hệ</a>
                <a href="customer-search-order.jsp">Theo dõi đơn hàng</a>
            </div>
            <div class="nav-right">
                <a href="customer-cart.jsp" class="cart-button"><img src="img/cart.png" alt="add-to-cart.png" title="Show Your Wish List"/> <span>${sessionScope.cart.size()}</span></a> 
                <a href="LoginServlet" class="login-button"><img  src="img/login-access.png" alt="login-access.png" title="Login"/></a>
            </div>
        </nav>    
    </body>

</html>