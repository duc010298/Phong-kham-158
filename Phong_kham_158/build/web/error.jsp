<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lỗi</title>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <style>
            * {
                padding: 0;
                margin: 0;
            }

            body {
                position: fixed;
                width: 100%;
                height: 100%;
                display: flex;
                background-color: #f0f0f0;
            }

            main {
                margin: auto;
            }

            h1, h2, p {
                text-align: center;
            }

            h1 {
                font-size: 3.125rem;
            }

            span {
                color: red;
                font-size: 6.25rem;
            }

            p {
                font-size: 1.25rem;
            }
        </style>
        <main>
            <c:set var="message" value="${requestScope.content}"/>
            <c:if test="${empty message}">
                <c:set var="message" value="${param.content}"/>
            </c:if>
            <h1><span class="fas fa-exclamation-circle"></span></h1>
            <br>
            <h1>Xin lỗi, ứng dụng gặp lỗi</h1>
            <br>
            <h2>Liên hệ quản trị viên để khắc phục</h2>
            <br>
            <p>Chi tiết lỗi: <c:out value="${message}"/></p>
        </main>
    </body>
</html>