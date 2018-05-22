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
            <p>Tuổi</p>
            <p>Địa chỉ</p>
            <p>Ngày đến khám</p>
            <p>Ghi chú</p>
            <div class="inputNameArea">
                <input type="text" id="inputName" placeholder="Nhập họ và tên" name="inputName">
                <div id="auto-inputName" class="autoInput">
                    <div id="input-item-0" class="input-item">Nguyễn Văn A</div>
                    <div id="input-item-1" class="input-item">Nguyễn Văn B</div>
                    <div id="input-item-2" class="input-item">Nguyễn Văn C</div>
                    <div id="input-item-3" class="input-item">Nguyễn Văn D</div>
                    <div id="input-item-4" class="input-item">Nguyễn Văn E</div>
                </div>
            </div>
            <div class="inputAgeArea">
                <input type="text" id="inputAge" placeholder="Nhập tuổi" name="inputAge">
                <div id="auto-inputAge" class="autoInput">
                    <div id="input-item-0" class="input-item">Nguyễn Văn A</div>
                    <div id="input-item-1" class="input-item">Nguyễn Văn B</div>
                    <div id="input-item-2" class="input-item">Nguyễn Văn C</div>
                    <div id="input-item-3" class="input-item">Nguyễn Văn D</div>
                    <div id="input-item-4" class="input-item">Nguyễn Văn E</div>
                </div>
            </div>
            <div class="inputAdressArea">
                <input type="text" id="inputAddress" placeholder="Nhập địa chỉ" name="inputAddress">
                <div id="auto-inputAddress" class="autoInput">
                    <div id="input-item-0" class="input-item">Nguyễn Văn A</div>
                    <div id="input-item-1" class="input-item">Nguyễn Văn B</div>
                    <div id="input-item-2" class="input-item">Nguyễn Văn C</div>
                    <div id="input-item-3" class="input-item">Nguyễn Văn D</div>
                    <div id="input-item-4" class="input-item">Nguyễn Văn E</div>
                </div>
            </div>
            <div class="inputDayVisitArea">
                <input type="text" id="inputDayVisit" placeholder="dd/MM/yyy" name="inputDayVisit">
                <div id="auto-inputDayVisit" class="autoInput">
                    <div id="input-item-0" class="input-item">Nguyễn Văn A</div>
                    <div id="input-item-1" class="input-item">Nguyễn Văn B</div>
                    <div id="input-item-2" class="input-item">Nguyễn Văn C</div>
                    <div id="input-item-3" class="input-item">Nguyễn Văn D</div>
                    <div id="input-item-4" class="input-item">Nguyễn Văn E</div>
                </div>
            </div>
            <div class="inputNoteArea">
                <input type="text" id="inputNote" placeholder="Nhập ghi chú" name="inputNote">
                <div id="auto-inputNote" class="autoInput">
                    <div id="input-item-0" class="input-item">Nguyễn Văn A</div>
                    <div id="input-item-1" class="input-item">Nguyễn Văn B</div>
                    <div id="input-item-2" class="input-item">Nguyễn Văn C</div>
                    <div id="input-item-3" class="input-item">Nguyễn Văn D</div>
                    <div id="input-item-4" class="input-item">Nguyễn Văn E</div>
                </div>
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

    $(".search-body input").on('input', function () {
        var thisId = $(this).attr("id");
        var autoId = "#auto-" + thisId;
        var value = $(this).val();
        console.log(value);
        //ajax here

        var autoItemLength = $(autoId + " div").length;
        for (var i = 0; i < autoItemLength; i++) {
            $(autoId + " #input-item-" + i).attr("class", "input-item");
        }
        $(autoId + " #input-item-0").attr("class", "input-item input-item-active");
        $(autoId).attr("style", "display: block");
    });

    $(".search-body input").keydown(function (event) {
        var thisId = $(this).attr("id");
        var autoId = "#auto-" + thisId;
        var autoItemLength = $(autoId + " div").length;
        if (event.which == 40) {
            for (var i = 0; i < autoItemLength; i++) {
                var classCurr = $(autoId + " #input-item-" + i).attr("class");
                if (classCurr == "input-item input-item-active") {
                    $(autoId + " #input-item-" + i).attr("class", "input-item");
                    var j = i + 1;
                    if (j == autoItemLength) {
                        $(autoId + " #input-item-0").attr("class", "input-item input-item-active");
                        break;
                    }
                    $(autoId + " #input-item-" + j).attr("class", "input-item input-item-active");
                    break;
                }
            }
        }
        if (event.which == 38) {
            for (var i = 0; i < autoItemLength; i++) {
                var classCurr = $(autoId + " #input-item-" + i).attr("class");
                if (classCurr == "input-item input-item-active") {
                    $(autoId + " #input-item-" + i).attr("class", "input-item");
                    var j = i - 1;
                    if (j < 0) {
                        var temp = autoItemLength - 1;
                        $(autoId + " #input-item-" + temp).attr("class", "input-item input-item-active");
                        break;
                    }
                    $(autoId + " #input-item-" + j).attr("class", "input-item input-item-active");
                    break;
                }
            }
        }
        if (event.which == 13) {
            for (var i = 0; i < autoItemLength; i++) {
                var classCurr = $(autoId + " #input-item-" + i).attr("class");
                if (classCurr == "input-item input-item-active") {
                    var value = $(autoId + " #input-item-" + i).html();
                    $("#" + thisId).val(value);
                    break;
                }
            }
            $(".autoInput").removeAttr("style");
        }
    });

    $(".input-item").click(function () {
        var parentId = $(this).parent().attr("id");
        var value = $(this).html();
        var inpId = parentId.substring(5, parentId.length);
        $("#"+inpId).val(value);
    });
</script>