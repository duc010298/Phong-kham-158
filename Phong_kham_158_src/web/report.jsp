<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .autoComplete {
        display: none;
    }
    
    .autoComplete table {
        position: absolute;
        width: 235px;
        border: 1px solid #F5E8E8;
        border-collapse: collapse;
    }

    .autoComplete td {
        background-color: #FFF;
        border: 1px solid #F5E8E8;
    }

    .autoComplete td:hover {
        background-color: #E5E5E5;
        cursor: pointer;
    }

    .autoComplete-active {
        background-color: DodgerBlue !important;
        color: #FFF;
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
            <div id="inputName">
                <input type="text" placeholder="Nhập họ và tên" name="inputName">
                <div class="autoComplete"></div>
            </div>
            <div id="inputAge">
                <input type="text" placeholder="Nhập tuổi" name="inputAge">
                <div class="autoComplete"></div>
            </div>
            <div id="inputAddress">
                <input type="text" placeholder="Nhập địa chỉ" name="inputAddress">
                <div class="autoComplete"></div>
            </div>
            <div id="inputDayVisit">
                <input type="text" placeholder="dd/MM/yyy" name="inputDayVisit">
                <div class="autoComplete"></div>
            </div>
            <div id="inputNote">
                <input type="text" placeholder="Nhập ghi chú" name="inputNote">
                <div class="autoComplete"></div>
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
    //ajax here
    $("#display-result").load(window.location.href + "resultOfSearch.jsp");
    
    $("*").click(function () {
        $(".autoComplete").removeAttr("style");
    });
    
    $(".search-body input").keydown(function () {
        $(".autoComplete").removeAttr("style");
        var thisName = $(this).attr("name");
        var thisAutoComplete = $("#" + thisName + " .autoComplete");
        thisAutoComplete.attr("style", "display: block");
        //ajax here
        thisAutoComplete.load(window.location.href + "autoComplete.jsp"); 
    });
</script>