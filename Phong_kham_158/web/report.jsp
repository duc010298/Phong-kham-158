<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="ultrasonic-report">
    <div class="search">
        <div class="search-header">
            <h2>Tìm kiếm</h2>
        </div>
        <hr>
        <div class="search-body">
            <p>Họ và tên</p>
            <p>Năm sinh / Tuổi</p>
            <p>Địa chỉ</p>
            <p>Tìm theo ngày</p>
            <div class="inputNameArea">
                <input type="text" id="inputName" placeholder="Nhập họ và tên" name="inputName">
                <div id="auto-inputName" class="autoInput"></div>
            </div>
            <div class="inputAgeArea">
                <input type="text" id="inputAge" placeholder="Nhập tuổi" name="inputAge">
                <div id="auto-inputAge" class="autoInput"></div>
            </div>
            <div class="inputAdressArea">
                <input type="text" id="inputAddress" placeholder="Nhập địa chỉ" name="inputAddress">
                <div id="auto-inputAddress" class="autoInput"></div>
            </div>
            <div class="inputDayVisitArea">
                <input type="text" id="inputDayVisit" placeholder="dd/MM/yyy" name="inputDayVisit">
                <div id="auto-inputDayVisit" class="autoInput"></div>
            </div>
        </div>
        <hr>
        <div class="search-footer">
            <div class="btn-reload-search" id="btn-reload-search"><span class="fas fa-sync-alt"></span> Nhập lại</div>
            <div class="btn-search" id="btn-search"><span class="fas fa-search"></span> Tìm kiếm</div>
        </div>
    </div>
    <div class="display-result" id="display-result">

    </div>
</div>
<script>
    document.addEventListener("click", function () {
        $(".autoInput").removeAttr("style");
    });

    function removeSign(str) {
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
        str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
        str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
        str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
        str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
        str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
        str = str.replace(/Đ/g, "D");
        return str;
    }

    function importIntoAuto(json, value, autoId) {
        var length = json.content.length;
        value = value.toLowerCase();
        value = removeSign(value);
        var count = 0;
        var str = "";
        while (true) {
            if (count == length || count == 15) {
                break;
            }
            var jsonContent = json.content[count];
            var strTemp = jsonContent.toLowerCase();
            strTemp = removeSign(strTemp);
            var indexStart = strTemp.indexOf(value);
            var indexEnd = indexStart + value.length;
            str += "<div id=\"input-item-";
            str += count;
            str += "\" class=\"input-item\" name=\"";
            str += jsonContent;
            str += "\">";
            str += jsonContent.substring(0, indexStart);
            str += "<strong>";
            str += jsonContent.substring(indexStart, indexEnd);
            str += "</strong>";
            str += jsonContent.substring(indexEnd);
            str += "</div>";
            count++;
        }
        $(autoId).html(str);
        $(".input-item").click(function () {
            var parentId = $(this).parent().attr("id");
            var value = $(this).attr("name");
            var inpId = parentId.substring(5, parentId.length);
            $("#" + inpId).val(value);
        });
    }

    $(".search-body input").on('input', function () {
        var thisId = $(this).attr("id");
        var autoId = "#auto-" + thisId;
        var value = $(this).val();
        $.ajax({
            url: window.location.href + "customer?tasks=searchContent",
            type: 'POST',
            dataType: 'json',
            data: {
                search: thisId,
                value: value
            }
        }).done(function (result) {
            importIntoAuto(result, value, autoId);
        });
        $(autoId).attr("style", "display: block");
    });

    $(".search-body input").keydown(function (event) {
        var thisId = $(this).attr("id");
        var autoId = "#auto-" + thisId;
        var autoItemLength = $(autoId + " div").length;
        if (event.which == 40) {
            var isActive = false;
            for (var i = 0; i < autoItemLength; i++) {
                var classCurr = $(autoId + " #input-item-" + i).attr("class");
                if (classCurr == "input-item input-item-active") {
                    isActive = true;
                    var j = i + 1;
                    if (j == autoItemLength) {
                        break;
                    }
                    $(autoId + " #input-item-" + i).attr("class", "input-item");
                    $(autoId + " #input-item-" + j).attr("class", "input-item input-item-active");
                    break;
                }
            }
            if (!isActive) {
                $(autoId + " #input-item-0").attr("class", "input-item input-item-active");
            }
        }
        if (event.which == 38) {
            for (var i = 0; i < autoItemLength; i++) {
                var classCurr = $(autoId + " #input-item-" + i).attr("class");
                if (classCurr == "input-item input-item-active") {
                    var j = i - 1;
                    if (j < 0) {
                        break;
                    }
                    $(autoId + " #input-item-" + i).attr("class", "input-item");
                    $(autoId + " #input-item-" + j).attr("class", "input-item input-item-active");
                    break;
                }
            }
        }
        if (event.which == 13) {
            for (var i = 0; i < autoItemLength; i++) {
                var classCurr = $(autoId + " #input-item-" + i).attr("class");
                if (classCurr == "input-item input-item-active") {
                    var value = $(autoId + " #input-item-" + i).attr("name");
                    $("#" + thisId).val(value);
                    break;
                }
            }
            $(".autoInput").removeAttr("style");
        }
    });

    $("#btn-reload-search").click(function () {
        $(".search-body input").val("");
    });

    $("#btn-search").click(function () {
        var name = $("#inputName").val();
        var age = $("#inputAge").val();
        var address = $("#inputAddress").val();
        var dayVisit = $("#inputDayVisit").val();
        $.ajax({
            url: window.location.href + "customer?tasks=search",
            type: 'POST',
            dataType: 'html',
            data: {
                name: name,
                age: age,
                address: address,
                dayVisit: dayVisit
            }
        }).done(function (result) {
            $("#display-result").html(result);
        });
    });
</script>