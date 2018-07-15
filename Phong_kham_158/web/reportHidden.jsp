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
        </header>
        <style>
            @media(max-width: 1000px) {
                .searchHidden {
                    height: 11rem;
                }           
                html {
                    font-size: 200%;
                }
                .reportHidden {
                    padding: 0;
                }
            }

            @media(max-width: 1314px) {
                .searchHidden {
                    height: 11rem;
                }           
            }
        </style>

        <main>
            <div class="reportHidden">
                <div class="searchHidden">
                    <div class="searchHidden-body">
                        <h2>Nhập ngày</h2>
                        <input type="text" id="inputDayVisitHidden" placeholder="dd/MM/yyy" name="inputDayVisit">
                        <h5 class="alert"></h5>
                    </div>
                    <hr>
                    <div class="searchHidden-footer">
                        <div class="btn-reload-searchHidden" id="btn-reload-searchHidden"><span class="fas fa-sync-alt"></span> Nhập lại</div>
                        <div class="btn-searchHidden" id="btn-searchHidden"><span class="fas fa-search"></span> Tìm kiếm</div>
                    </div>
                </div>
                <div class="display-result" id="display-resultHidden">

                </div>
            </div>
        </main>

        <footer>
            <div class="footer-content">
                <p>Phát triển bởi: Đỗ Trung Đức</p>
            </div>
        </footer>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <script>
            $("#btn-reload-searchHidden").click(function () {
                $(".searchHidden-body input").val("");
            });

            $("#btn-searchHidden").click(function () {
                var dayVisit = $("#inputDayVisitHidden").val();
                if (dayVisit == "") {
                    $(".alert").html("Chú ý: Không được bỏ trống ô nhập ngày");
                    if ($(window).width() <= 1314) {
                        $(".searchHidden").attr("style", "height: 13rem;");
                    } else {
                        $(".searchHidden").attr("style", "height: 10rem;");
                    }
                    $(".alert").fadeIn();
                    return;
                }
                if (!validateDate(dayVisit) && dayVisit != "") {
                    $(".alert").html("Chú ý: Ngày chưa được nhập chính xác");
                    if ($(window).width() <= 1314) {
                        $(".searchHidden").attr("style", "height: 13rem;");
                    } else {
                        $(".searchHidden").attr("style", "height: 10rem;");
                    }
                    $(".alert").fadeIn();
                    return;
                }
                $.ajax({
                    url: "http://" + window.location.host + "/Phong_kham_158/customer?tasks=searchHidden",
                    type: 'POST',
                    dataType: 'html',
                    data: {
                        dayVisit: dayVisit
                    }
                }).done(function (result) {
                    $("#display-resultHidden").html(result);
                });
                $(".alert").fadeOut();
                $(".searchHidden").removeAttr("style");
                $("footer").fadeOut();
            });

            $("#inputDayVisitHidden").keydown(function (e) {
                if (e.which === 13) {
                    $("#btn-searchHidden").click();
                }
            });
        </script>
    </body>
</html>
