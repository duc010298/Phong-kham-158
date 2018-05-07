<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.phongkham.model.nav2Content"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  List<nav2Content> nav2List = (ArrayList<nav2Content>) request.getAttribute("nav2CtList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
        <title>Phòng khám 158</title>
    </head>
    <body>
        <header>
            <div class="nav">
                <div id="btn-kqsa" class="nav-content"><span class="fas fa-angle-down"></span> KẾT QUẢ SIÊU ÂM</div>
                <div id="btn-bcsa" class="nav-content"><span class="far fa-file-excel"></span> BÁO CÁO SIÊU ÂM</div>
            </div>
            <div id="nav-2" class="nav-2">
                <ul>
                    <%  for (nav2Content content : nav2List) {%>
                    <li class="nav-2-content" name="<%=content.getId()%>"><span class="far fa-file-word"></span> <%=content.getName()%></li>
                        <%}%>
                </ul>
            </div>
            <div id="tool" class="tool">
                <div id="btn-print" class="btn-print">
                    <span class="fas fa-print"></span>
                </div>
                <div id="btn-save" class="btn-save">
                    <span class="fas fa-save"></span>
                </div>
                <div id="btn-reload" class="btn-reload">
                    <span class="fas fa-sync-alt"></span>
                </div>
            </div>
            <div id="modal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <p>Bổ sung thông tin trước khi lưu</p>
                    </div>
                    <hr>
                    <div class="modal-body">
                        <p>Ngày sinh dự kiến:</p>
                        <input id="ExpectedDOB" type="text" placeholder="dd/mm/yyyy">
                        <p>Ghi chú:</p>
                        <input id="Note" type="text" placeholder="Nhập ghi chú">
                    </div>
                    <hr>
                    <div class="modal-footer">
                        <div id="btn-acept-save" class="btn-acept-save">Lưu</div>
                        <div class="btn-close">Đóng</div>
                    </div>
                </div>
            </div>
            <div id="error-modal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <p>Lỗi</p>
                    </div>
                    <hr>
                    <div class="modal-body">
                        <h1 id="error-content"></h1>
                    </div>
                    <hr>
                    <div class="modal-footer">
                        <div class="btn-close">Đóng</div>
                    </div>
                </div>
            </div>
        </header>

        <section>
            <div id="spinner" class="spinner">
                <div class="spinner-content">
                    <div class="spin"></div>
                </div>
            </div>
            <div id="container">
                <div class="content-default">
                    <p>Chưa có nội dung để hiển thị</p>
                </div>
            </div>
        </section>

        <footer>
            <div class="footer-content">
                <p>Phát triển bởi: Đỗ Trung Đức</p>
            </div>
        </footer>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <script src="js/printThis.js" type="text/javascript"></script>
    </body>
</html>
