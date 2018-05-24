<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .autoInput {
        position: absolute;
        display: none;
        font-family: Arial;
        background-color: #FFFFFF;
        width: 235px;
        border: 1px solid #d4d4d4;
        border-radius: 5px;
    }

    .input-item {
        padding: 5px;
        border-bottom: 1px solid #d4d4d4;
        cursor: pointer;
        -webkit-user-select: none;
    }

    .input-item:hover {
        background-color: #e9e9e9;
    }

    .input-item-active {
        background-color: #1E90FF;
        color: #fff;
    }

    .input-item-active:hover {
        background-color: #1E90FF;
        color: #fff;
    }
</style>
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
            <p>Ngày đến khám</p>
            <p>Ghi chú</p>
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
            <div class="inputNoteArea">
                <input type="text" id="inputNote" placeholder="Nhập ghi chú" name="inputNote">
                <div id="auto-inputNote" class="autoInput"></div>
            </div>
        </div>
        <hr>
        <div class="search-footer">
            <div class="btn-reload-search"><span class="fas fa-sync-alt"></span> Nhập lại</div>
            <div class="btn-search"><span class="fas fa-search"></span> Tìm kiếm</div>
        </div>
    </div>
    <div class="display-result" id="display-result">

    </div>
</div>
<script>
    document.addEventListener("click", function () {
        $(".autoInput").removeAttr("style");
    });

    function importIntoAuto(json, value, autoId) {
        var length = json.content.length;
        if (length == 0) {
            return;
        }
        value = value.toLowerCase();
        var count = 0;
        var str = "";
        while (true) {
            if (count == length || count == 15) {
                break;
            }
            var jsonContent = json.content[count];
            var indexStart = jsonContent.toLowerCase().indexOf(value);
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
</script>