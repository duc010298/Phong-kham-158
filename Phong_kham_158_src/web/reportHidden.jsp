<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css"/>
        <title>Quản lí phòng khám</title>
    </head>
    <body>
        <header>
            <div class="nav">
                <div class="nav-content">QUẢN LÍ PHÒNG KHÁM</div>
            </div>
            <div id="notify-modal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <p id="notify-header"></p>
                    </div>
                    <hr>
                    <div class="modal-body">
                        <h1 id="notify-content"></h1>
                    </div>
                    <hr>
                    <div class="modal-footer">
                        <div class="btn-close">Đóng</div>
                    </div>
                </div>
            </div>
        </header>
        <style>
            .searchHidden {
                width: 100%;
                height: 8rem;
                background-color: #FFFFFF;
                border: 1px solid rgba(64, 64, 64, 0.5);
                border-radius: 0.1875rem;
            }

            .searchHidden hr {
                margin: 0.9375rem 0;
                border-top: 1px solid #E5E5E5;
                border-left: none;
                border-right: none;
                border-bottom: none;
            }

            .searchHidden-body h2 {
                margin: 0.9375rem 0 0 0.9375rem;
                float: left;
            }

            .searchHidden-body input {
                margin: 0.9375rem 0 0 0.9375rem;
                padding: 0.375rem 0.75rem;
                width: 85%;
                font-size: 1rem;
                border: 0.125rem solid #E5E5E5;
                border-radius: 0.3125rem;
                outline: 0;
            }

            .searchHidden-body input:focus {
                border-color: #66afe9;
            }

            .btn-searchHidden, .btn-reload-searchHidden {
                float: right;
                width: 8rem;
                padding: 0.5rem 0;
                margin: 0px 0.9375rem 0.9375rem 0px;
                font-size: 1.25rem;
                text-align: center;
                color: #fff;
                border-radius: 0.3125rem;
                -webkit-user-select: none;
            }

            .btn-searchHidden:hover, .btn-reload-searchHidden:hover {
                cursor: pointer;
            }

            .btn-searchHidden {
                background-color: #337ab7;
            }

            .btn-searchHidden:hover {
                background-color: #286090;
            }

            .btn-reload-searchHidden {
                background-color: #d9534f;
            }

            .btn-reload-searchHidden:hover {
                background-color: #c9302c;
            }

            @media(max-width: 1000px) {
                .searchHidden {
                    height: 11rem;
                }           
                html {
                    font-size: 200%;
                }
            }

            @media(max-width: 1206px) {
                .searchHidden {
                    height: 11rem;
                }           
            }

        </style>

        <main>
            <div class="searchHidden">
                <div class="searchHidden-body">
                    <h2>Nhập ngày</h2>
                    <input type="text" id="inputDayVisitHidden" placeholder="dd/MM/yyy" name="inputDayVisit">
                </div>
                <hr>
                <div class="searchHidden-footer">
                    <div class="btn-reload-searchHidden" id="btn-reload-searchHidden"><span class="fas fa-sync-alt"></span> Nhập lại</div>
                    <div class="btn-searchHidden" id="btn-searchHidden"><span class="fas fa-search"></span> Tìm kiếm</div>
                </div>
            </div>
            <div id="display-resultHidden">

            </div>
        </main>

        <footer>
            <div class="footer-content">
                <p>Phát triển bởi: Đỗ Trung Đức</p>
            </div>
        </footer>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script>
            $("#btn-reload-searchHidden").click(function () {
                $(".searchHidden-body input").val("");
            });

            $("#btn-searchHidden").click(function () {
                var dayVisit = $("#inputDayVisitHidden").val();
                $.ajax({
                    url: "http://localhost:8080/Phong_kham_158_src/customer?tasks=searchHidden",
                    type: 'POST',
                    dataType: 'html',
                    data: {
                        dayVisit: dayVisit
                    }
                }).done(function (result) {
                    $("#display-resultHidden").html(result);
                });
            });
        </script>
    </body>
</html>
