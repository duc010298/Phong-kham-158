<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            }
            
            main {
                margin: auto;
            }

            h1, h2, p {
                text-align: center;
            }
            
            h1 {
                font-size: 50px;
            }
            
            span {
                color: red;
                font-size: 100px;
            }
            
            p {
                font-size: 20px;
            }
        </style>
        <main>
            <%  String content = (String) request.getAttribute("content"); 
                if(content == null) {
                    content = (String) request.getParameter("content"); 
                }
            %>
            <h1><span class="fas fa-exclamation-circle"></span></h1>
            <br>
            <h1>Xin lỗi, ứng dụng gặp lỗi</h1>
            <br>
            <h2>Liên hệ quản trị viên để khắc phục</h2>
            <br>
            <p>Chi tiết lỗi: <%=content%></p>
        </main>
    </body>
</html>