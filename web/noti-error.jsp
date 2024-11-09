<%-- 
    Document   : noti-errro
    Created on : Oct 19, 2024, 7:44:22 PM
    Author     : dat20
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #f8d7da;
                color: #721c24;
            }
            .container {
                text-align: center;
                padding: 20px;
                border: 1px solid #f5c6cb;
                background-color: #f5c6cb;
                border-radius: 8px;
            }
            h1 {
                font-size: 4em;
                margin: 0;
            }
            p {
                font-size: 1.5em;
                margin: 10px 0;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                font-size: 1.2em;
                text-decoration: none;
                color: #721c24;
                background-color: #f8d7da;
                border: 1px solid #721c24;
                border-radius: 5px;
            }
            a:hover {
                background-color: #721c24;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Error</h1>
            <p>Oops! Something wrong or the page you are looking for doesn't exist.</p>
            <a href="Welcome">Go Back Home</a>
        </div>
    </body>
</html>
